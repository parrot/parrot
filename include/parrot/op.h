/* op.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Header file for op functions.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_OP_H_GUARD)
#define PARROT_OP_H_GUARD

#include "parrot/config.h"

#define PARROT_MAX_ARGS 10

typedef enum {
    PARROT_INLINE_OP,
    PARROT_FUNCTION_OP
} op_type_t;

typedef enum {
    PARROT_ARG_OP = 0,

    PARROT_ARG_IC,
    PARROT_ARG_NC,
    PARROT_ARG_PC,
    PARROT_ARG_SC,
    PARROT_ARG_KC,
    PARROT_ARG_KIC,

    PARROT_ARG_I,
    PARROT_ARG_N,
    PARROT_ARG_P,
    PARROT_ARG_S,
    PARROT_ARG_K,
    PARROT_ARG_KI
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
    PARROT_JUMP_ADDRESS = 2,
    PARROT_JUMP_POP = 4,
    PARROT_JUMP_ENEXT = 8,
    PARROT_JUMP_GNEXT = 16,
    PARROT_JUMP_UNPREDICTABLE = 32,
    PARROT_JUMP_RESTART = 64
} op_jump_t;

/* NOTE: Sure wish we could put the types here... */

struct Parrot_Interp;

typedef opcode_t *(*op_func_t)(opcode_t *, struct Parrot_Interp *);
typedef void **(*op_func_prederef_t)(void **, struct Parrot_Interp *);


/*
** op_info_t
**
** Collects all the information we know about an op, except for
** its op function (since we may not be using op functions).
*/

typedef struct {
    /* op_type_t type; unused */
    const char *name;
    const char *full_name;
    const char *func_name;
    /* const char *body; unused */
    unsigned short jump;           /* s. above */
    short arg_count;               /* Includes opcode as one arg */
    char types[PARROT_MAX_ARGS];   /* arg_type_t, 0 = op */
    char dirs[PARROT_MAX_ARGS];    /* arg_dir_t   0 = op */
    char labels[PARROT_MAX_ARGS];  /* 0/1         0 = op */
    unsigned int flags;
} op_info_t;


#endif

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
