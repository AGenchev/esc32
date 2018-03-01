//#include <stdio.h>
//#include <stdlib.h>
#include <string.h> // NULL defined there
#include "stdint.h"
#include "atof.h"

// Source/author: open source. License: LGPL
// Note: it's 32-bit float precision, artificially converted to double
// formats supported: 1.0E-5, -1.0E6, 0.75, -.12, +1.00000e+00, 1.23456e+06
// skips empty spaces
double atof(const char *s)
{
	uint8_t negflag = 0, expnegflag = 0;
	uint32_t c = 0;
	int32_t p = 0;
	char * q = (char *) s;

	float f = 0, d = 0;
	float y = 10;
	float val;
//printf("inside");

	if (s == NULL)
		return 0;

	while (*q == ' ')
		q++;

	if (*q == '-')
	{
		negflag = 1;
		q++;
	}
	while (*q != '.' && *q != '\0')
	{
		if (*q == '+')
		{
			q++;
			continue;
		}

		f = f * 10 + ((int) *q - '0');
		//printf("\ninteger %f",f);
		q++;
	}
	if(*q == '.')q++;
	if (*q != 'e' && *q != 'E')
	{
		while (*q != 'e' && *q != 'E' && *q != '\0')
		{
			d = d + (((int) *q - '0') / y);
			y = y * 10;
			//printf("\ndecimal %f\n",d);
			q++;
		}
	}
	if (*q == 'e' || *q == 'E')
	{
		q++;
		if (*q == '-')
		{
			expnegflag = 1;
			q++;
		}
		else if (*q == '+')
		{
			q++; // JUST SKIP
		}
		if (*q == '\0')
			p = 0;

	}
	while (*q != '\0')
	{
		p = (p * 10) + ((int) *q - '0');
		q++;
	}

	val = f + d;
	if (expnegflag)
	{

		while (c < p)
		{
			val = val / 10;
			c++;
		}

	}
	else
	{
		while (c < p)
		{
			val = val * 10;
			c++;
		}
	}

	if (negflag)
		val = -val;
	return val;
}

