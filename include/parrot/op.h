/* op.h
 *  Copyright (C) 2001-2007, Parrot Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     Header file for op functions.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_OP_H_GUARD
#define PARROT_OP_H_GUARD

#include "parrot/config.h"

#define PARROT_MAX_ARGS 16

typedef enum {
    PARROT_INLINE_OP,
    PARROT_FUNCTION_OP
} op_type_t;

typedef enum {
    PARROT_ARG_IC      = PARROT_ARG_INTVAL   | PARROT_ARG_CONSTANT,
    PARROT_ARG_NC      = PARROT_ARG_FLOATVAL | PARROT_ARG_CONSTANT,
    PARROT_ARG_PC      = PARROT_ARG_PMC      | PARROT_ARG_CONSTANT,
    PARROT_ARG_SC      = PARROT_ARG_STRING   | PARROT_ARG_CONSTANT,
    PARROT_ARG_NAME_SC = PARROT_ARG_NAME     | PARROT_ARG_STRING   | PARROT_ARG_CONSTANT,

    PARROT_ARG_KEYED   = 0x20,
    PARROT_ARG_KC      = PARROT_ARG_PC       | PARROT_ARG_KEYED,
    PARROT_ARG_KIC     = PARROT_ARG_IC       | PARROT_ARG_KEYED,

    PARROT_ARG_I       = PARROT_ARG_INTVAL,
    PARROT_ARG_N       = PARROT_ARG_FLOATVAL,
    PARROT_ARG_P       = PARROT_ARG_PMC,
    PARROT_ARG_S       = PARROT_ARG_STRING,
    PARROT_ARG_K       = PARROT_ARG_P         | PARROT_ARG_KEYED,
    PARROT_ARG_KI      = PARROT_ARG_I         | PARROT_ARG_KEYED
} arg_type_t;

typedef enum {
    PARROT_ARGDIR_IGNORED,

    PARROT_ARGDIR_IN,
    PARROT_ARGDIR_OUT,
    PARROT_ARGDIR_INOUT
} arg_dir_t;

/* See lib/Parrot/OpsFile.pm if the names of these values change */
typedef enum {
    PARROT_JUMP_RELATIVE = 1,
    PARROT_JUMP_ADDRESS  = 2,
    PARROT_JUMP_ENEXT    = 4
} op_jump_t;

/* NOTE: Sure wish we could put the types here... */

typedef opcode_t *(*op_func_t)(opcode_t *, PARROT_INTERP);
typedef void **(*op_func_prederef_t)(void **, PARROT_INTERP);


/*
** op_info_t
**
** Collects all the information we know about an op, except for
** its op function (since we may not be using op functions).
*/

typedef struct op_info_t {
    const char    *name;
    const char    *full_name;
    const char    *func_name;
    unsigned short jump;
    short          op_count;                /* Includes opcode as one arg */
    arg_type_t     types[PARROT_MAX_ARGS];  /* arg_type_t, 0 = 1st arg */
    arg_dir_t      dirs[PARROT_MAX_ARGS];   /* arg_dir_t   0 = 1st arg */
    char           labels[PARROT_MAX_ARGS]; /* 0/1         0 = 1st arg */
    unsigned int   flags;
} op_info_t;


#endif /* PARROT_OP_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
