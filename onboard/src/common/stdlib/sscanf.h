
/*
+=============================================================================+
| global declarations
+=============================================================================+
*/
#ifndef SSCANF_H_INCLUDED
#define SSCANF_H_INCLUDED

#ifdef __cplusplus
extern "C" {
#endif

#include <stdarg.h>
/*
+=============================================================================+
| options
+=============================================================================+
*/
#define SSCANF_INCLUDES_FLOAT  // this enables float
#define SSCANF_SUPPORTS_SCIENTIFIC_EXP_FLOATS //this enables exponential form float "8.3E-7" style

extern int sscanf(const char *str, const char *format, ...);
extern int vsscanf(const char *buffer, const char *format, va_list ap);

#ifdef __cplusplus
} // closing brace for extern "C"
#endif



#endif // SSCANF_H_INCLUDED
/******************************************************************************
 * END OF FILE
 ******************************************************************************/
