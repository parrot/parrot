/* op.h
 *  Copyright: (When this is determined...it will go here)
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
  PARROT_ARG_OP,

  PARROT_ARG_IC,
  PARROT_ARG_NC,
  PARROT_ARG_PC,
  PARROT_ARG_SC,

  PARROT_ARG_I,
  PARROT_ARG_N,
  PARROT_ARG_P,
  PARROT_ARG_S
} arg_type_t;

#define PARROT_ARG_OP 0

/* NOTE: Sure wish we could put the types here... */

typedef opcode_t *(*op_func_t)();
typedef void **(*prederef_op_func_t)();


/*
** op_info_t
**
** Collects all the information we know about an op, except for
** its op function (since we may not be using op functions).
*/

typedef struct {
    op_type_t  type;
    char *     name;
    char *     full_name;
    char *     func_name;
    char *     body;
    INTVAL     arg_count; /* Includes opcode as one arg */
    arg_type_t types[PARROT_MAX_ARGS];
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
