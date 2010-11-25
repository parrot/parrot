
#ifndef PARROT_EMBED_PRIVATE_H
#define PARROT_EMBED_PRIVATE_H

#include "pmc/pmc_parrotinterpreter.h"

#define GET_RAW_INTERP(p) ((Parrot_ParrotInterpreter_attributes*)(p)->data)->interp;
#define EMBED_API_CALLIN(p, i) \
    Parrot_Interp (i) = PMC_IS_NULL(p) ? NULL : GET_RAW_INTERP(p); \
    void * const _oldtop = (i)->lo_var_ptr; \
    if (_oldtop == NULL) \
        (i)->lo_var_ptr = &_oldtop; \
    (i)->final_error = NULL; \
    if (setjmp((i)->api_jmp_buf)) { \
        return 0; \
    } else { \
        {
#define EMBED_API_CALLOUT(p, i) \
        } \
        if (!_oldtop) {\
            PARROT_ASSERT((i)->lo_var_ptr == &_oldtop);\
            (i)->lo_var_ptr = NULL;\
        }\
        return 1; \
    }

#endif /* PARROT_EMBED_PRIVATE_H */
