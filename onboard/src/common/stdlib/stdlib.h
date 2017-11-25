/*
 * File:        stdlib.h
 * Purpose:     Function prototypes for standard library functions
 *
 * Notes:
 */

#ifndef _STDLIB_H
#define _STDLIB_H

#include <stddef.h>



/********************************************************************
 * Standard library functions
 ********************************************************************/

int isspace(int);

int isalnum(int);

int isdigit(int);

int isupper (int);

int strcasecmp (const char *, const char *);

int strncasecmp (const char *, const char *, size_t);

unsigned long strtoul (char *, char **, int);

size_t strlen (const char *);

char * strcat (char *, const char *);

char * strncat (char *, const char *, size_t);

char * strcpy (char *, const char *);

extern char * strncpy (char *, const char *, size_t);

extern int strcmp (const char *, const char *);

extern int strncmp (const char *, const char *, size_t);

extern void *bsearch(const void *key, const void *base, size_t nmemb, size_t size,	int (*cmp)(const void *, const void *));

extern void * memcpy (void *, const void *, unsigned);

extern void * memset (void *, int, unsigned);

void free (void *);
 
void * malloc (unsigned);

/********************************************************************/

#endif
