#if !defined(PARROT_MISC_H_GUARD)
#define PARROT_MISC_H_GUARD

#include "parrot/parrot.h"
#include <stdarg.h>

STRING* Parrot_vsprintf_s(struct Parrot_Interp *, STRING* pat, va_list *);

STRING* Parrot_vsprintf_c(struct Parrot_Interp *, char * pat, va_list *);

void Parrot_vsprintf(struct Parrot_Interp *, char *targ, char *pat, va_list *);

void Parrot_vsnprintf(struct Parrot_Interp *, char *targ, UINTVAL len, char *pat, va_list *);

STRING* Parrot_sprintf_s(struct Parrot_Interp *, STRING* pat, ...);

STRING* Parrot_sprintf_c(struct Parrot_Interp *, char * pat, ...);

void Parrot_sprintf(struct Parrot_Interp *, char *targ, char *pat, ...);

void Parrot_snprintf(struct Parrot_Interp *, char *targ, UINTVAL len, char *pat, ...);


#endif
