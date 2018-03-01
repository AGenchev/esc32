
/*
 * File:        sscanf.c
 * Purpose:     The standard C library routine sscanf()
 * Original Author: ?
 * bugs: yes,   many :-)
 * Preliminary Floating point support added by Angel Genchev.
 */

#include "atof.h"
#include "stdlib.h" // memset() there
#include <ctype.h>
#include <stdio.h>
//#include <stdbool.h>
//#include <stddef.h>
//#include "math.h"
#include "stdint.h"
#include "sscanf.h"
#include <stdarg.h>
#include <string.h>


extern uintmax_t strntoumax(const char *nptr, char **endptr, int base, size_t n);
extern double atof(const char *str);
/********************************************************************/

// check type sizes here http://www.keil.com/support/man/docs/armcc/armcc_chr1359125009502.htm
#undef CHAR_BIT
#define CHAR_BIT 8*sizeof(char)

#define SIGNED_MAX(x) (~(-1 << (sizeof(x) * 8 - 1)))
// compiler warnings: #define UNSIGNED_MAX(x) (~(1 << (sizeof(x) * 8 )))
//#define UNSIGNED_MAX(x) (  ((~(1 <<  (sizeof(x) * 8-1 )))<<1) | 1 )
#define UNSIGNED_MAX(x) (  (SIGNED_MAX(x)<<1) | 1 ) // use SIGNED_MAX

#define INT_MAX   SIGNED_MAX(int)
#define UINT_MAX  UNSIGNED_MAX(unsigned int) // 4294967295



int sscanf(const char *str, const char *format, ...)
{
	va_list ap;
	int rv;

	va_start(ap, format);
	rv = vsscanf(str, format, ap);
	va_end(ap);

	return rv;
}

#ifndef LONG_BIT
#define LONG_BIT (CHAR_BIT*sizeof(long))
#endif

enum flags
{
	FL_SPLAT = 0x01, /* Drop the value, do not assign */
	FL_INV   = 0x02, /* Character-set with inverse */
	FL_WIDTH = 0x04, /* Field width specified */
	FL_MINUS = 0x08, /* Negative number */
};

enum ranks
{
	rank_char = -2,
	rank_short = -1,
	rank_int = 0,
	rank_long = 1,
	rank_longlong = 2,
	rank_ptr = INT_MAX /* Special value used for pointers */
};

#define MIN_RANK	rank_char
#define MAX_RANK	rank_longlong

#define INTMAX_RANK	rank_longlong
#define SIZE_T_RANK	rank_long
#define PTRDIFF_T_RANK	rank_long

enum bail
{
	bail_none = 0, /* No error condition */
	bail_eof, /* Hit EOF */
	bail_err /* Conversion mismatch */
};

static inline const char *skipspace(const char *p)
{
	while (isspace((unsigned char) *p))
		p++;
	return p;
}

#undef set_bit
static inline void set_bit(unsigned long *bitmap, unsigned int bit)
{
	bitmap[bit / LONG_BIT] |= 1UL << (bit % LONG_BIT);
}

#undef test_bit
static inline int test_bit(unsigned long *bitmap, unsigned int bit)
{
	return (int) (bitmap[bit / LONG_BIT] >> (bit % LONG_BIT)) & 1;
}

int vsscanf(const char *buffer, const char *format, va_list ap)
{
	const char *p = format;
	char ch;
	unsigned char uc;
	const char *q = buffer;
	const char *qq;
	uintmax_t val = 0;
	int rank = rank_int; /* Default rank */
	unsigned int width = UINT_MAX;
	int base;
	enum flags flags = 0;
	enum
	{
		st_normal, /* Ground state */
		st_flags, /* Special flags */
		st_width, /* Field width */
		st_modifiers, /* Length or conversion modifiers */
		st_match_init, /* Initial state of %[ sequence */
		st_match, /* Main state of %[ sequence */
		st_match_range, /* After - in a %[ sequence */
	} state = st_normal;
	char *sarg = NULL; /* %s %c or %[ string argument */
	enum bail bail = bail_none;
	int sign;
	int converted = 0; /* Successful conversions */
	unsigned long matchmap[((1 << CHAR_BIT) + (LONG_BIT - 1)) / LONG_BIT];
	int matchinv = 0; /* Is match map inverted? */
	unsigned char range_start = 0;
	(void) sign;
	#ifdef SSCANF_INCLUDES_FLOAT
	char flBuf[64];
	char * fbPtr;
	uint32_t fbDigits;
    #endif
	while ((ch = *p++) && !bail) // TODO fix possible buffer overflow
	{
		switch (state)
		{
		case st_normal:
			if (ch == '%')
			{
				state = st_flags;
				flags = 0;
				rank = rank_int;
				width = UINT_MAX;
			}
			else if (isspace((unsigned char) ch))
			{
				q = skipspace(q);
			}
			else
			{
				if (*q == ch)
					q++;
				else
					bail = bail_err; /* Match failure */
			}
			break;

		case st_flags:
			switch (ch)
			{
			case '*':
				flags |= FL_SPLAT;
				break;
			case '0' ... '9':
				width = (ch - '0');
				state = st_width;
				flags |= FL_WIDTH;
				break;
			default:
				state = st_modifiers;
				p--; /* Process this character again */
				break;
			}
			break;

		case st_width:
			if (ch >= '0' && ch <= '9')
			{
				width = width * 10 + (ch - '0');
			}
			else
			{
				state = st_modifiers;
				p--; /* Process this character again */
			}
			break;

		case st_modifiers:
			switch (ch)
			{
			/* Length modifiers - nonterminal sequences */
			case 'h':
				rank--; /* Shorter rank */
				break;
			case 'l':
				rank++; /* Longer rank */
				break;
			case 'j':
				rank = INTMAX_RANK;
				break;
			case 'z':
				rank = SIZE_T_RANK;
				break;
			case 't':
				rank = PTRDIFF_T_RANK;
				break;
			case 'L':
			case 'q':
				rank = rank_longlong; /* long double/long long */
				break;
				/*
            case 'f':
                rank = rank_ptr; // preliminary floats support
                break;*/
			default:
				/* Output modifiers - terminal sequences */
				/* Next state will be normal */
				state = st_normal;

				/* Canonicalize rank */
				if (rank < MIN_RANK)
					rank = MIN_RANK;
				else if (rank > MAX_RANK)
					rank = MAX_RANK;

				switch (ch)
				{
				case 'P': /* Upper case pointer */
				case 'p': /* Pointer */
					rank = rank_ptr;
					base = 0;
					sign = 0;
					goto scan_int;

				case 'i': /* Base-independent integer */
					base = 0;
					sign = 1;
					goto scan_int;

				case 'd': /* Decimal integer */
					base = 10;
					sign = 1;
					goto scan_int;

				case 'o': /* Octal integer */
					base = 8;
					sign = 0;
					goto scan_int;

				case 'u': /* Unsigned decimal integer */
					base = 10;
					sign = 0;
					goto scan_int;

				case 'x': /* Hexadecimal integer */
				case 'X':
					base = 16;
					sign = 0;
					goto scan_int;
#ifdef SSCANF_INCLUDES_FLOAT
                case 'f':
                    fbPtr=&flBuf[0]; // begin new float
                    fbDigits=0;
                    // scan_float:
                    q = skipspace(q);
                    if (!*q)
					{	bail = bail_eof;
						break;
					}
					if(*q =='+') ++q;
					else if(*q=='-') {*fbPtr++ = *q++;}
					while ( (fbPtr < &flBuf[63]) && ( (*q >= '0' && *q <= '9')
							 | (*q=='.') 	// decimal point
#ifdef   SSCANF_SUPPORTS_SCIENTIFIC_EXP_FLOATS //this enables exponential form float "8.3E-7" style
							 | (*q=='E') | (*q=='e') | (*q=='+') | (*q=='-') // we permit additional chars
#endif    //SSCANF_SUPPORTS_SCIENTIFIC_EXP_FLOATS //this enables exponential form float "8.3E-7" style
						) ) // isdigit() and decimal separator ?
                    { *fbPtr++ = *q++;fbDigits++;}
                        *fbPtr = '\0';
                    if(fbDigits>0)
                    {*va_arg(ap, float *) = atof(&flBuf[0]);
                     converted++;
                    }
                    break;
#endif     // SSCANF_INCLUDES_FLOAT
				case 'n': /* # of characters consumed */
					val = (q - buffer);
					goto set_integer;

					scan_int: q = skipspace(q);
					if (!*q)
					{
						bail = bail_eof;
						break;
					}
					val = strntoumax(q, (char **) &qq, base, width);
					if (qq == q)
					{
						bail = bail_err;
						break;
					}
					q = qq;
					if (!(flags & FL_SPLAT))
						converted++;
					/* fall through */

					set_integer: if (!(flags & FL_SPLAT))
					{
						switch (rank)
						{
						case rank_char:
							*va_arg(ap, unsigned char *) = val;
							break;
						case rank_short:
							*va_arg(ap, unsigned short *) = val;
							break;
						case rank_int:
							*va_arg(ap, unsigned int *) = val;
							break;
						case rank_long:
							*va_arg(ap, unsigned long *) = val;
							break;
						case rank_longlong:
							*va_arg(ap, unsigned long
							long *) = val;
							break;
						case rank_ptr:
							*va_arg(ap, void **) = (void *) (uintptr_t) val;
							break;
						}
					}
					break;

				case 'c': /* Character */
					/* Default width == 1 */
					width = (flags & FL_WIDTH) ? width : 1;
					if (flags & FL_SPLAT)
					{
						while (width--)
						{
							if (!*q)
							{
								bail = bail_eof;
								break;
							}
						}
					}
					else
					{
						sarg = va_arg(ap, char *);
						while (width--)
						{
							if (!*q)
							{
								bail = bail_eof;
								break;
							}
							*sarg++ = *q++;
						}
						if (!bail)
							converted++;
					}
					break;

				case 's': /* String */
					uc = 1; // Anything nonzero
                    if (' ' == *q) // space
                        { q = skipspace(q);
                        }
					if (flags & FL_SPLAT)
					{
						while (width-- && (uc = *q) && (uc!=' ')) // !isspace(uc)
						{
							q++;
						}
					}
					else
					{
						char *sp;
						sp = sarg = va_arg(ap, char *);
						while (width-- && (uc = *q) && !isspace(uc))
						{
							*sp++ = uc;
							q++;
						}
						if (sarg != sp)
						{
							/* Terminate output */
							*sp = '\0';
							converted++;
						}
					}
					if (!uc)
						bail = bail_eof;
					break;

				case '[': /* Character range */
					sarg = (flags & FL_SPLAT) ? NULL : va_arg(ap, char *);
					state = st_match_init;
					matchinv = 0;
					memset(matchmap, 0, sizeof matchmap);
					break;

				case '%': /* %% sequence */
					if (*q == '%')
						q++;
					else
						bail = bail_err;
					break;

				default: /* Anything else */
					/* Unknown sequence */
					bail = bail_err;
					break;
				}
			}
			break;

		case st_match_init: /* Initial state for %[ match */
			if (ch == '^' && !(flags & FL_INV))
			{
				matchinv = 1;
			}
			else
			{
				set_bit(matchmap, (unsigned char) ch);
				state = st_match;
			}
			break;

		case st_match: /* Main state for %[ match */
			if (ch == ']')
			{
				goto match_run;
			}
			else if (ch == '-')
			{
				range_start = (unsigned char) ch;
				state = st_match_range;
			}
			else
			{
				set_bit(matchmap, (unsigned char) ch);
			}
			break;

		case st_match_range: /* %[ match after - */
			if (ch == ']')
			{
				/* - was last character */
				set_bit(matchmap, (unsigned char) '-');
				goto match_run;
			}
			else
			{
				int i;
				for (i = range_start; i < (unsigned char) ch; i++)
					set_bit(matchmap, i);
				state = st_match;
			}
			break;

			match_run: /* Match expression finished */
			qq = q;
			uc = 1; /* Anything nonzero */
			while (width && (uc = *q) && test_bit(matchmap, uc) ^ matchinv)
			{
				if (sarg)
					*sarg++ = uc;
				q++;
			}
			if (q != qq && sarg)
			{
				*sarg = '\0';
				converted++;
			}
			else
			{
				bail = bail_err;
			}
			if (!uc)
				bail = bail_eof;
			break;
		}
	}

	if (bail == bail_eof && !converted)
		converted = -1; /* Return EOF (-1) */

	return converted;
}

/******************************************************************************
 * END OF FILE
 ******************************************************************************/
