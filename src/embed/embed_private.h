
#ifndef PARROT_EMBED_PRIVATE_H
#define PARROT_EMBED_PRIVATE_H

#include "pmc/pmc_parrotinterpreter.h"

#define GET_RAW_INTERP(p) ((Parrot_ParrotInterpreter_attributes*)(p)->data)->interp;
#define EMBED_API_CALLIN(p, i)                                     \
    int exit_code;                                                 \
    void * _oldtop;                                                \
    Parrot_jump_buff env;                                          \
    Parrot_Interp (i) = PMC_IS_NULL(p) ? NULL : GET_RAW_INTERP(p); \
    _oldtop = (i)->lo_var_ptr;                                     \
    if (_oldtop == NULL)                                           \
        (i)->lo_var_ptr = &_oldtop;                                \
        (i)->final_error = NULL;                                   \
        (i)->api_jmp_buf = &env;                                   \
    if ((exit_code = setjmp(env))) {                               \
        /* exit code is incremented in 1 since                     \
         * longjmp can't return 0                                  \
         * exit_code = 1 -> normal exit                            \
         * exit_code > 1 -> error                                  \
         */                                                        \
        exit_code--;                                               \
        return !exit_code;                                         \
    } else {                                                       \
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
