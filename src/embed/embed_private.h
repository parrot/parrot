
#ifndef PARROT_EMBED_PRIVATE_H
#define PARROT_EMBED_PRIVATE_H

#include "pmc/pmc_parrotinterpreter.h"

#define GET_RAW_INTERP(p) ((Parrot_ParrotInterpreter_attributes*)(p)->data)->interp;
#define GET_INTERP(p) PMC_IS_NULL(p) ? NULL : GET_RAW_INTERP(p);

#define EMBED_API_CALLIN(p, i)                   \
    void * _oldtop;                              \
    Parrot_jump_buff env;                        \
    Interp * const (i) = GET_INTERP(p);          \
    _oldtop = (i)->lo_var_ptr;                   \
    if (_oldtop == NULL)                         \
        (i)->lo_var_ptr = &_oldtop;              \
    (i)->api_jmp_buf = &env;                     \
    if (setjmp(env)) {                           \
        Interp * const __interp = GET_INTERP(p); \
        __interp->api_jmp_buf = NULL;            \
        return !__interp->exit_code;             \
    } else {                                     \
        {

#define EMBED_API_CALLOUT(p, i)                                    \
        }                                                          \
        (i)->api_jmp_buf = NULL;                                   \
        if (!_oldtop) {                                            \
            PARROT_ASSERT((i)->lo_var_ptr == &_oldtop);            \
            (i)->lo_var_ptr = NULL;                                \
        }                                                          \
        return 1;                                                  \
    }

#endif /* PARROT_EMBED_PRIVATE_H */
