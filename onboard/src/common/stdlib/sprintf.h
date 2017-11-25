/*
+=============================================================================+
| options
+=============================================================================+
*/
#define SPRINTF_INCLUDES_FLOAT  // this enables float in sprintf() and costs you about 1.7kByte ROM

/*
+=============================================================================+
| global declarations
+=============================================================================+
*/
#ifndef SPRINTF_H_INCLUDED
#define SPRINTF_H_INCLUDED

#ifdef __cplusplus
extern "C" {
#endif


extern int sprintf(char *s, const char *fmt, ...);


#ifdef __cplusplus
} // closing brace for extern "C"
#endif



#endif // SPRINTF_H_INCLUDED
/******************************************************************************
 * END OF FILE
 ******************************************************************************/
