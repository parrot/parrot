/*
 * $Id$
 * Copyright (C) 2008, The Perl Foundation.
 */

#include "bcgen.h"

/* private bits of the bytecode generator */

typedef enum bc_const_types {
    BC_INT_CONST_TYPE,
    BC_NUM_CONST_TYPE,
    BC_STR_CONST_TYPE,
    BC_PMC_CONST_TYPE

} bc_type;

typedef union const_value {
    INTVAL  ival;
    NUMVAL  nval;
    STRING *sval;
    PMC    *pval;

} const_value;

typedef struct bc_const {
    bc_type           type;  /* type of constant */
    int               index; /* index into constant table */
    const_value       value; /* this constant's value */

    struct bc_const * next;  /* linked list */

} bc_const;


/* Note that typedef of struct bytecode is already done in the header file */

struct bytecode {
    int          num_constants;
    bc_const    *constants;

};


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
