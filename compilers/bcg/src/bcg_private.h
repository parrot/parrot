#ifndef PARROT_BCG_PRIVATE_H_GUARD
#define PARROT_BCG_PRIVATE_H_GUARD

#include "parrot/parrot.h"
#include "bcg.h"
#include "bcg_utils.h"

#define BCG_INFO_PRIV(bcg) ((bcg_info_private*)(bcg->private_info))

typedef enum bcg_state_t {
    BCG_STATE_INIT = 0,
    BCG_STATE_IN_CODEGEN = 1 << 0,
    BCG_STATE_IN_SUB = 1 << 1,
    BCG_STATE_IN_OP = 1 << 2,
    BCG_STATE_IN_CALL = 1 << 3
} bcg_state;

typedef enum bcg_op_argtype_t {
    BCG_OP_ARG_TYPE_CONST_INT = 1,
    BCG_OP_ARG_TYPE_CONST_NUM = 2,
    BCG_OP_ARG_TYPE_CONST_STR = 3,
    BCG_OP_ARG_TYPE_CONST_PMC = 4,
    BCG_OP_ARG_TYPE_VAR_INT = 10,
    BCG_OP_ARG_TYPE_VAR_NUM = 20,
    BCG_OP_ARG_TYPE_VAR_STR = 30,
    BCG_OP_ARG_TYPE_VAR_PMC = 40
} bcg_op_arg_type;

typedef enum bcg_unit_pragma_t {
    BCG_UNIT_PRAGMA_NONE = 0,
    BCG_UNIT_PRAGMA_MAIN = 1,
    BCG_UNIT_PRAGMA_IMMEDIATE = 2,
    BCG_UNIT_PRAGMA_LOAD = 3,
    BCG_UNIT_PRAGMA_INIT = 4
} bcg_unit_pragma;

typedef struct bcg_op_arg_t {
    int type;
    char *name;
} bcg_op_arg;

typedef struct bcg_op_t {
    char *name;
    int op_code;
    char *full_name;
    int op_arg_count;
    bcg_op_arg *op_args[0];
    struct bcg_op_t *prev;
    struct bcg_op_t *next;
} bcg_op;

typedef struct bcg_unit_t {
    char *name;
    int pragma;
    bcg_hash *symbol_table;
    bcg_op *first_op;
    bcg_op *last_op;
    struct bcg_unit_t *prev;
    struct bcg_unit_t *next;
} bcg_unit;

typedef struct bcg_info_private_t {
    int state;
    bcg_hash *const_table;
    bcg_unit *first_unit;
    bcg_unit *last_unit;
} bcg_info_private;

/* Functions for Op Arguments. */
bcg_op_arg *bcg_op_arg_create(BCG_info * bcg_info, char *name,
                              bcg_op_arg_type type);
void bcg_op_arg_destroy(BCG_info * bcg_info, bcg_op_arg * op_arg);

/* Functions for Ops. */
bcg_op *bcg_op_create(BCG_info * bcg_info, char *name);
void bcg_op_destroy(BCG_info * bcg_info, bcg_op * op);
void bcg_add_op_arg(BCG_info * bcg_info, bcg_op * op, bcg_op_arg * op_arg);

/* Function for Byte Code Generation unit. */
bcg_unit *bcg_unit_create(BCG_info * bcg_info, char *name, char *pragma);
void bcg_unit_destroy(BCG_info * bcg_info, bcg_unit * unit);
void bcg_unit_add_op(BCG_info * bcg_info, bcg_unit * unit, bcg_op * op);

/* Functions for bcg_info_private*/
bcg_info_private *bcg_info_private_create(BCG_info * bcg_info);
void bcg_info_private_destroy(BCG_info * bcg_info,
                              bcg_info_private * bcg_info_priv);
void bcg_info_add_unit(BCG_info * bcg_info, bcg_unit * unit);

bcg_unit *bcg_info_current_unit(BCG_info * bcg_info);
bcg_op *bcg_info_current_op(BCG_info * bcg_info);

#endif /* PARROT_BCG_PRIVATE_H_GUARD */
