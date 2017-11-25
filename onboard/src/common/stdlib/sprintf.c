/*
 * File:        sprintf.c
 * Purpose:     The standard C library routine printf()
 */
// TODO: check if Mario Viara's library can do this with less generated code: https://github.com/MarioViara/xprintfc

 //#include "common.h"
#include "stdio.h"
#include <stdarg.h>
#include <stdbool.h>
#include "stdlib.h"
#include "math.h"
#include "stdint.h"
#include "sprintf.h"
/********************************************************************/

typedef struct
{
	char dest;
	void (*func)(char);
	char *loc;
} PRINTK_INFO;

int printk(PRINTK_INFO *, const char *, va_list);

#if 0
#ifdef   SPRINTF_INCLUDES_FLOAT
typedef union fp_union
{
	/*! \brief Double data type. */
	double DOUBLE;
	/*! \brief Long data type. */
	unsigned int LONG[2];
	/*! \brief Byte data type. */
	unsigned char BYTE[8];
} FP_UNION, *FP_UNION_PTR;
#endif   // SPRINTF_INCLUDES_FLOAT
#endif //0

/********************************************************************/
#define _PTR_    *
#define NDIG 154
/******************************************************************/
#define EXP_MASK        (0x7ff00000L)
#define FEXP_MASK       (0x7f800000L)

#define SIGN_MASK       (0x80000000L)

#define MAXEXP_MASK     (0x000007ffL)
#define FMAXEXP_MASK    (0x000000ffL)

#define MANT_MASK       (0x000fffffL)
#define FMANT_MASK      (0x007fffffL)

#define HIDDEN_MASK     (0x00100000L)
#define FHIDDEN_MASK    (0x00800000L)
#define EXPOF(a)        (((a)[1] & EXP_MASK) >> 20)
#define FEXPOF(a)       (((a) & FEXP_MASK) >> 23)

#define SIGNOF(a)       (((a)[1] & SIGN_MASK) != 0)
#define FSIGNOF(a)      (((a) & SIGN_MASK) != 0)

#define ISZERO(a)       ( !( ((a)[1] & ~SIGN_MASK) | ((a)[0])) )
#define FISZERO(a)      (((a) & 0x7fffffffL) == 0)

#define MANTZERO(a)     ( !( ((a)[1] &  MANT_MASK) | ((a)[0])) )
#define FMANTZERO(a)    (((a) &  FMANT_MASK) == 0)

#define ISINFINITY(a)   ((EXPOF(a) == MAXEXP_MASK) &&  MANTZERO(a))
#define FISINFINITY(a)  ((FEXPOF(a) == FMAXEXP_MASK) &&  FMANTZERO(a))

#define ISNAN(a)        ((EXPOF(a) == MAXEXP_MASK) && !(MANTZERO(a)))
#define FISNAN(a)       ((FEXPOF(a) == FMAXEXP_MASK) && !(FMANTZERO(a)))

#define BYTES_PER_DOUBLE  (8)
#define MANT_BITS         (52)
#define NON_MANT_BITS     (12)
#define EXP_BIAS          (1023)
/******************************************************************/
#define DEST_STRING     (0)
#define DEST_CONSOLE    (1)


#define FLAGS_MINUS     (0x01)
#define FLAGS_PLUS      (0x02)
#define FLAGS_SPACE     (0x04)
#define FLAGS_ZERO      (0x08)
#define FLAGS_POUND     (0x10)

#define IS_FLAG_MINUS(a)    (a & FLAGS_MINUS)
#define IS_FLAG_PLUS(a)     (a & FLAGS_PLUS)
#define IS_FLAG_SPACE(a)    (a & FLAGS_SPACE)
#define IS_FLAG_ZERO(a)     (a & FLAGS_ZERO)
#define IS_FLAG_POUND(a)    (a & FLAGS_POUND)

#define LENMOD_h        (0x01)
#define LENMOD_l        (0x02)
#define LENMOD_L        (0x04)

#define IS_LENMOD_h(a)  (a & LENMOD_h)
#define IS_LENMOD_l(a)  (a & LENMOD_l)
#define IS_LENMOD_L(a)  (a & LENMOD_L)

#define FMT_d   (0x0001)
#define FMT_o   (0x0002)
#define FMT_x   (0x0004)
#define FMT_X   (0x0008)
#define FMT_u   (0x0010)
#define FMT_c   (0x0020)
#define FMT_s   (0x0040)
#define FMT_p   (0x0080)
#define FMT_n   (0x0100)

#define IS_FMT_d(a)     (a & FMT_d)
#define IS_FMT_o(a)     (a & FMT_o)
#define IS_FMT_x(a)     (a & FMT_x)
#define IS_FMT_X(a)     (a & FMT_X)
#define IS_FMT_u(a)     (a & FMT_u)
#define IS_FMT_c(a)     (a & FMT_c)
#define IS_FMT_s(a)     (a & FMT_s)
#define IS_FMT_p(a)     (a & FMT_p)
#define IS_FMT_n(a)     (a & FMT_n)

/********************************************************************/
static void printk_putc(int c, int *count, PRINTK_INFO *info)
{
	switch (info->dest)
	{
	case DEST_STRING:
		*(info->loc) = (unsigned char) c;
		++(info->loc);
		break;
	case DEST_CONSOLE:
		info->func((char) c);
		break;
	default:
		break;
	}
	*count += 1;
}

/********************************************************************/
static int printk_mknumstr(char *numstr, void *nump, int neg, int radix)
{
	int a, b, c;
	unsigned int ua, ub, uc;

	int nlen;
	char *nstrp;

	nlen = 0;
	nstrp = numstr;
	*nstrp++ = '\0';

	if (neg)
	{
		a = *(int *) nump;
		if (a == 0)
		{
			*nstrp = '0';
			++nlen;
			goto done;
		}
		while (a != 0)
		{
			b = (int) a / (int) radix;
			c = (int) a - ((int) b * (int) radix);
			if (c < 0)
			{
				c = ~c + 1 + '0';
			}
			else
			{
				c = c + '0';
			}
			a = b;
			*nstrp++ = (char) c;
			++nlen;
		}
	}
	else
	{
		ua = *(unsigned int *) nump;
		if (ua == 0)
		{
			*nstrp = '0';
			++nlen;
			goto done;
		}
		while (ua != 0)
		{
			ub = (unsigned int) ua / (unsigned int) radix;
			uc = (unsigned int) ua - ((unsigned int) ub * (unsigned int) radix);
			if (uc < 10)
			{
				uc = uc + '0';
			}
			else
			{
				uc = uc - 10 + 'A';
			}
			ua = ub;
			*nstrp++ = (char) uc;
			++nlen;
		}
	}
	done: return nlen;
}

#ifdef   SPRINTF_INCLUDES_FLOAT

#if 0 // 0 - we use the library implementation to save a few bytes code space - depends on the implementation!
static const unsigned char _io_modf_masktable[9] = { 0x00, 0x80, 0xc0, 0xe0, 0xf0, 0xf8, 0xfc, 0xfe, 0xff };
double modf(double input_dbl, double _PTR_ intpart_ptr)
{
	FP_UNION num;
	FP_UNION intpart;
	int i;
	int exponent;
	int numbits;
	int numbytes;

	intpart.DOUBLE = input_dbl;
	num.DOUBLE = input_dbl;

	//----------------------------------------------------------------
	// exponent will have number of bits of the mantissa we want to
	// save.  if less than zero save none, greater than total
	// number of bits of mantissa then save it all.
	//----------------------------------------------------------------

	exponent = EXPOF(num.LONG);
	exponent = exponent - EXP_BIAS;
	if (exponent < 0)
	{
		*intpart_ptr = 0;
		return (input_dbl);
	}
	else if (exponent >= MANT_BITS)
	{
		*intpart_ptr = input_dbl;
		return (0);
	} // Endif

	exponent += NON_MANT_BITS;
	numbytes = exponent / 8;
	numbits = exponent - (numbytes * 8);
	for (i = 0; i < (BYTES_PER_DOUBLE - 1) - numbytes; i++)
	{
		intpart.BYTE[i] = 0;
	} // Endfor
	// i has the index to the byte with some significant mantissa
	intpart.BYTE[i] = intpart.BYTE[i] & _io_modf_masktable[numbits];

	num.DOUBLE = num.DOUBLE - intpart.DOUBLE;
	*intpart_ptr = intpart.DOUBLE;

	return (num.DOUBLE);

} // Endbody
#endif


char * _io_cvt(double arg, int ndigits, int * decpt, char eflag, char _PTR_ buf, char type)
{
	register int r2;
	double intpart;
	double tmpintpart;
	//  double      fracpart;
	register char _PTR_ p;
	register char _PTR_ p1;
	unsigned int i;
	int tmp = 0;

	if (ndigits < 0)
	{
		ndigits = 0;
	} // Endif
	if (ndigits >= NDIG - 1)
	{
		ndigits = NDIG - 2;
	} // Endif
	r2 = 0;
	p = &buf[0];
	if (ISZERO((unsigned long * )((void * )&arg)))
	{
		if ((type == 'e') || (type == 'E'))
		{
			*decpt = 1; // avoid e_or_E type create string 0.000e-1
		}
		else
		{
			*decpt = 0;
		}
		for (i = 0; i < (unsigned int)ndigits; i++)
		{
			buf[i] = '0';
		}
		buf[ndigits] = '\0';
		return (buf);
	}

	// modf returns fractional part and set integer part
	arg = modf(arg, (double _PTR_) (&intpart));

	 //
	 // arg has decimal part, intpart has integer part.
	 // take the inparts digits one by one and stick them into the end
	 // of the buffer then move them to the beginning of it.
	 //
	if (intpart != 0)
	{
		p1 = &buf[NDIG];
		while (intpart != 0)
		{
//
//			 * It's possible that inaccuracy will cause the division
//			 * by 10 to come out a little bit low.  In C, conversions
//			 * from floating point to integer are done by truncation.
//			 * We add in .03 so that temp will be rounded up when it
//			 * is converted to the nearest number of tenths, as done
//			 * by the call to modf and the assignment to i.
			tmpintpart = (intpart / 10) + 0.03;
			tmpintpart = modf(tmpintpart, (double _PTR_) (&intpart));
			tmpintpart = tmpintpart * 10.0;
			*--p1 = (char) ((unsigned int) tmpintpart + '0');
			r2++;
		} // Endwhile
		while (p1 < &buf[NDIG]) // fill int part & check for buffer overflow
		{
			*p++ = *p1++;
		}
	}
	else
	{ // intpart == 0
//		 * if the intpart was zero, then get the decimal part so that it
//		 * does not have any zero directly to the right of the decimal
//		 * point.  with each shift left of the decimal number adjust the
//		 * exponent.

		if (arg > 0)
		{
			double temp;
			while (1 > (temp = arg * 10))
			{
				arg = temp;
				r2--;
			} // Endwhile
		} // Endif

	} // Endif

	p1 = &buf[ndigits];
	if (eflag == 0)
	{
		tmp = r2;

//		 * Loop around adjusting the pointer up or down in the buffer.
//		 * We must be careful not to move the pointer out of the range
//		 * of the buffer.  If the pointer goes outside that range and
//		 * the buffer is in very low or very high memory, the pointer
//		 * value could "wrap" and cause later pointer comparisons to fail.

		if (tmp > 0)
		{
			while (tmp && p1 < &buf[NDIG - 1])
			{
				p1++;
				tmp--;
			} // Endwhile
		}
		else
		{
			while (tmp && p1 > buf)
			{
				p1--;
				tmp++;
			} // Endwhile
			if (tmp < 0)
			{ // pointer would have underflowed buffer
				for (i = 0; i < (unsigned int)ndigits; i++)
				{
					buf[i] = '0';
				}
				*decpt = 0;
				buf[ndigits] = '\0';

//				 * This indicates that the number is
//				 * smaller than the precision they've
//				 * given us.  The result will be 0.0....
				return (buf);
			} // Endif
		} // Endif
	} // Endif
	*decpt = r2;


//	 * we now stick the fractional part in digit by digit regardless
//	 * of whether there was a non-zero integer part

	while (p <= p1)
	{
		tmpintpart = arg * 10;
		tmpintpart = modf(tmpintpart, (double _PTR_) (&intpart));
		arg = tmpintpart;
		*p++ = (char) ((int) intpart + '0'); // convert int -> char in ascii codepage
	} // Endwhile
	if (!eflag && tmp)
	{
		// precision is too large.
		// return with what we have.
		buf[NDIG - 1] = '0';
		return (buf);
	} // Endif


	 //round the number

	p = p1;
	*p1 += 5;
	while (*p1 > '9')
	{
		*p1 = '0';
		if (p1 > buf)
		{
			p1--;
			*p1 += 1;
		}
		else
		{
			*p1 = '1';
			(*decpt)++;
			if (eflag == 0)
			{
				if (p > buf)
				{
					*p = '0';
				} // Endif
				p++;
			} // Endif eflag == 0
		} // Endif
	} // Endwhile
	*p = '\0';

	return (buf);

} // Endbody




// return: length of string.
// great articles: http://www.cygnus-software.com/papers/comparingfloats/Comparing%20floating%20point%20numbers.htm
// scientific notation not implemented - just converted to decimal
static int _io_dtofX(char * buf, double arg, unsigned char width, unsigned  char precision, char f_or_F)
{
	int decpt, offset; // offset is offset from the origin
	uint32_t is_negative;
	uint32_t len;
	char * numstr;
	char * bp = buf;   // byte pointer
	char cvtbuf[NDIG]; // note: +154bytes stack used !!
	uint16_t* pa16 = (uint16_t*)&arg; pa16+=3; // trick to work with double's sign

    if(0==precision) {precision=6;} // default
    //
    // real implementation: if(arg<0){is_negative=1;arg=-arg;}else is_negative=0;
    // "failed" optimization w/o branches: is_negative= *pa16 >> 15; *pa16 &= (1U<<15);
    if(*pa16 & 0x8000) { is_negative=1;*pa16 = *pa16 & 0x7FFF; } else is_negative=0; // smaller code
    //
	numstr = _io_cvt(arg, precision, &decpt, 0, cvtbuf, f_or_F);
	// we should output right-aligned within "width" (if possible). We need total length
	len=strlen(numstr); // w/o decimal point
	offset=width-len-1-is_negative; // For example if we have 447 and dec.pt=1 (for 4.47), width=10, we have 4 symbols. offset = 10-4 = 6
	if (decpt <= 0)offset=offset-1+decpt;	// compensate for leading zeroes before and after '.'
	if(offset<0)offset=0;
	while(--offset>=0)
	{*bp++ =' '; // leading spaces
	}
	if(is_negative)*bp++ = '-'; // add the sign
	if (decpt <= 0)
	{// add leading zero
		*bp++ = '0';
		*bp++ = '.';
		while (decpt++ < 0)
		{ // add leading zeros after decpt
			*bp++ = '0';
		}
		while ((*bp++ = *numstr++) != 0)
		{;}
		--bp; // bump bp back to point to the null
	 }
	else
	{ // no leading zero
		while ( (decpt-- != 0) && (*numstr != '\0') )
		{
			*bp++ = *numstr++;
		}
		if ((*numstr != '\0'))
		{ // has more digits, time to add decimal point:
			*bp++ = '.';
		  // has more digits, output'em:
		  while ((*bp++ = *numstr++) != 0)
			{;}
		  --bp; // bump bp back to point to the null
		}
		/*
		else
		{ *bp = '\0'; }
		*/
	} // Endif

	return (int) (bp - buf); // same as strlen(buf)

} // End _dtofX

#endif // SPRINTF_INCLUDES_FLOAT

/********************************************************************/
static void printk_pad_zero(int curlen, int field_width, int *count,
		PRINTK_INFO *info)
{
	int i;

	for (i = curlen; i < field_width; i++)
	{
		printk_putc('0', count, info);
	}
}

/********************************************************************/
static void printk_pad_space(uint32_t curlen, uint32_t field_width, int *count, PRINTK_INFO *info)
{
	uint32_t i;
	for (i = curlen; i < field_width; i++)
	{
		printk_putc(' ', count, info);
	}
}

/********************************************************************/
int printk(PRINTK_INFO *info, const char *fmt, va_list ap)
{
	// va_list ap;
	char *p;
	int c;	// + 20 bytes code if I make this unsigned

	char vstr[33];
	char *vstrp;
	int vlen;

	bool done;
	int count = 0;

	int flags_used;
	int field_width;
//#if 0
	//int precision_used;
	int precision_width=0; // initial
	// int length_modifier;
//#endif

	int ival;
	int schar, dschar;
	int *ivalp;
	char *sval;
	int cval;
	unsigned int uval;
	double fval;
	/*
	 * Start parsing apart the format string and display appropriate
	 * formats and data.
	 */
	for (p = (char *) fmt; (c = *p) != 0; p++)
	{
		/*
		 * All formats begin with a '%' marker.  Special chars like
		 * '\n' or '\t' are normally converted to the appropriate
		 * character by the __compiler__.  Thus, no need for this
		 * routine to account for the '\' character.
		 */
		if (c != '%')
		{
			/*
			 * This needs to be replaced with something like
			 * 'out_char()' or call an OS routine.
			 */
            printk_putc(c, &count, info);
			/*
			 * By using 'continue', the next iteration of the loop
			 * is used, skipping the parsing code that follows.
			 */
			continue;
		}

		/*
		 * First check for specification modifier flags.
		 */
		flags_used = 0;
		done = false;
		while (!done)
		{
			switch (/* c = */*++p)
			{
			case '-':
				flags_used |= FLAGS_MINUS;
				break;
			case '+':
				flags_used |= FLAGS_PLUS;
				break;
			case ' ':
				flags_used |= FLAGS_SPACE;
				break;
			case '0':
				flags_used |= FLAGS_ZERO;
				break;
			case '#':
				flags_used |= FLAGS_POUND;
				break;
			default:
				// we've gone one char too far, restore pointer
				--p;
				done = true;
				break;
			}
		}

		/*
		 * Next check for minimum field width.
		 */
		field_width = 0;
		done = false;
		while (!done)
		{
			switch (c = *++p)
			{
			case '0':
			case '1':
			case '2':
			case '3':
			case '4':
			case '5':
			case '6':
			case '7':
			case '8':
			case '9':
				field_width = (field_width * 10) + (c - '0'); // (c - '0') is direct conversion of ascii digit to numeric digit
				break;
			default:
				// we've gone one char ahead , restore pointer
				--p;
				done = true;
				break;
			}
		}

		/*
		 * Next check for the width and precision fields separator - '.'
		 * fmt syntax: https://www.tutorialspoint.com/c_standard_library/c_function_sprintf.htm
		 */
		if (*++p == '.')
		{

			/*
			 * Must get precision field width, if present.
			 */
			precision_width = 0;
			done = false;
			while (!done)
			{
//				switch (/* c = uncomment if used below */*++p)
				switch ( c = *++p )
				{
				case '0':
				case '1':
				case '2':
				case '3':
				case '4':
				case '5':
				case '6':
				case '7':
				case '8':
				case '9':
// format= %.1f: You will obtain a floating-point number with just a single digit displayed after the decimal point. For example: 5.5
					precision_width = (precision_width * 10) +(c - '0');
					break;
				default:
					// we've gone one char ahead, restore pointer
					--p;
					done = true;
					break;
				}
			}
		}
		else
		{
			/* we've gone one char too far */
			--p;
#if 0
			precision_used = false;
			precision_width = 0;
#endif
		}

		/*
		 * Check for the length modifier.
		 */
		switch (*++p)
		{
		case 'h':
			break;
		case 'l':
			break;
		case 'L':
			break;
		default:
			// we've gone one char too far , restore pointer
			--p;
			break;
		}

		/*
		 * Now we're ready to examine the format.
		 */
		switch (c = *++p)
		{
		case 'd':
		case 'i':
			ival = (int) va_arg(ap, int);
			vlen = printk_mknumstr(vstr, &ival, true, 10);
			vstrp = &vstr[vlen];

			if (ival < 0)
			{
				schar = '-';
				++vlen;
			}
			else
			{
				if (IS_FLAG_PLUS(flags_used))
				{
					schar = '+';
					++vlen;
				}
				else
				{
					if (IS_FLAG_SPACE(flags_used))
					{
						schar = ' ';
						++vlen;
					}
					else
					{
						schar = 0;
					}
				}
			}
			dschar = false;

			/*
			 * do the ZERO pad.
			 */
			if (IS_FLAG_ZERO(flags_used))
			{
				if (schar)
					printk_putc(schar, &count, info);
				dschar = true;

				printk_pad_zero(vlen, field_width, &count, info);
				vlen = field_width;
			}
			else
			{
				if (!IS_FLAG_MINUS(flags_used))
				{
					printk_pad_space(vlen, field_width, &count, info);

					if (schar)
						printk_putc(schar, &count, info);
					dschar = true;
				}
			}

			/* the string was built in reverse order, now display in */
			/* correct order */
			if (!dschar && schar)
			{
				printk_putc(schar, &count, info);
			}
			goto cont_xd;

		case 'x':
		case 'X':
			uval = (unsigned int) va_arg(ap, unsigned int);
			vlen = printk_mknumstr(vstr, &uval, false, 16);
			vstrp = &vstr[vlen];

			dschar = false;
			if (IS_FLAG_ZERO(flags_used))
			{
				if (IS_FLAG_POUND(flags_used))
				{
					printk_putc('0', &count, info);
					printk_putc('x', &count, info);
					/*vlen += 2;*/
					dschar = true;
				}
				printk_pad_zero(vlen, field_width, &count, info);
				vlen = field_width;
			}
			else
			{
				if (!IS_FLAG_MINUS(flags_used))
				{
					if (IS_FLAG_POUND(flags_used))
					{
						vlen += 2;
					}
					printk_pad_space(vlen, field_width, &count, info);
					if (IS_FLAG_POUND(flags_used))
					{
						printk_putc('0', &count, info);
						printk_putc('x', &count, info);
						dschar = true;
					}
				}
			}

			if ((IS_FLAG_POUND(flags_used)) && !dschar)
			{
				printk_putc('0', &count, info);
				printk_putc('x', &count, info);
				vlen += 2;
			}
			goto cont_xd;

		case 'o':
			uval = (unsigned int) va_arg(ap, unsigned int);
			vlen = printk_mknumstr(vstr, &uval, false, 8);
			goto cont_u;
		case 'b':
			uval = (unsigned int) va_arg(ap, unsigned int);
			vlen = printk_mknumstr(vstr, &uval, false, 2);
			goto cont_u;
		case 'p':
			uval = (unsigned int) va_arg(ap, void *);
			vlen = printk_mknumstr(vstr, &uval, false, 16);
			goto cont_u;
		case 'u':
			uval = (unsigned int) va_arg(ap, unsigned int);
			vlen = printk_mknumstr(vstr, &uval, false, 10);

			cont_u: vstrp = &vstr[vlen];

			if (IS_FLAG_ZERO(flags_used))
			{
				printk_pad_zero(vlen, field_width, &count, info);
				vlen = field_width;
			}
			else
			{
				if (!IS_FLAG_MINUS(flags_used))
				{
					printk_pad_space(vlen, field_width, &count, info);
				}
			}

			cont_xd: while (*vstrp)
				printk_putc(*vstrp--, &count, info);

			if (IS_FLAG_MINUS(flags_used))
			{
				printk_pad_space(vlen, field_width, &count, info);
			}
			break;

		case 'c':
			cval = (char) va_arg(ap, unsigned int);
			printk_putc(cval, &count, info);
			break;
		case 's':
			sval = (char *) va_arg(ap, char *);
			if (sval)
			{
				vlen = strlen(sval);
				if (!IS_FLAG_MINUS(flags_used))
				{
					printk_pad_space(vlen, field_width, &count, info);
				}
				while (*sval)
					printk_putc(*sval++, &count, info);
				if (IS_FLAG_MINUS(flags_used))
				{
					printk_pad_space(vlen, field_width, &count, info);
				}
			}
			break;
		case 'n':
			ivalp = (int *) va_arg(ap, int *);
			*ivalp = count;
			break;

#ifdef   SPRINTF_INCLUDES_FLOAT
		case 'f':
		case 'F':
		case 'E': // scientific notation not implemented !
		case 'e':
			fval = va_arg(ap, double); // extract double
			// we should use max precision_width many digits after the point.
			// we should output right-aligned.
			vlen = _io_dtofX(vstr, fval, field_width, precision_width, (char) c); // vlen = length of string
			sval = vstr;

			while (*sval)
			{
				printk_putc((int) *sval++, &count, info);
			}
			field_width = 0; // reset
			break;
#endif   // SPRINTF_INCLUDES_FLOAT
		default:
			printk_putc(c, &count, info);
			break;
		}
	}
	return count;
}

/********************************************************************/

/*
 int printf(const char *fmt, ...)
 {
 va_list ap;
 int rvalue;
 PRINTK_INFO info;

 info.dest = DEST_CONSOLE;
 info.func = &out_char;
 //  Initialize the pointer to the variable length argument list.

 va_start(ap, fmt);
 rvalue = printk(&info, fmt, ap);
 //Cleanup the variable length argument list.
 va_end(ap);
 return rvalue;
 }
 */

/********************************************************************/
int sprintf(char *s, const char *fmt, ...)
{
	va_list ap;
	int rvalue = 0;
	PRINTK_INFO info;

	/*
	 * Initialize the pointer to the variable length argument list.
	 */
	if (s != 0)
	{
		info.dest = DEST_STRING;
		info.loc = s;
		va_start(ap, fmt);
		rvalue = printk(&info, fmt, ap);
		*info.loc = '\0'; // z-terminate
		va_end(ap);
	}
	return rvalue;
}

/******************************************************************************
 * END OF FILE
 ******************************************************************************/
