/* api.h
 *  Copyright (C) 2001-2011, Parrot Foundation.
 *  Overview:
 *     Parrot embed API's private macros
 */

#ifndef PARROT_EMBED_PRIVATE_H_GUARD
#define PARROT_EMBED_PRIVATE_H_GUARD

#include "pmc/pmc_parrotinterpreter.h"

/* Don't add ';' at the end of these macros.
 * they are expressions, not statements */
#define GET_RAW_INTERP(p) (((Parrot_ParrotInterpreter_attributes*)(p)->data)->interp)
#define GET_INTERP(p) (PMC_IS_NULL(p) ? NULL : GET_RAW_INTERP(p))

#define EMBED_API_CALLIN(p, i)                   \
    Parrot_jump_buff env;                        \
    if (setjmp(env)) {                           \
        Interp * const __interp = GET_INTERP(p); \
        __interp->api_jmp_buf = NULL;            \
        return !__interp->exit_code;             \
    }                                            \
    else {                                       \
        Interp * const (i) = GET_INTERP(p);      \
        void * _oldtop = (i)->lo_var_ptr;        \
        if (_oldtop == NULL)                     \
            (i)->lo_var_ptr = &_oldtop;          \
        (i)->api_jmp_buf = &env;                 \
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

#endif /* PARROT_EMBED_PRIVATE_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
