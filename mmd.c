/* mmd.c
 *  Copyright: 2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Multimethod dispatch handling for parrot
 *  Data Structure and Algorithms:
 *     
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"

PMC *
mmd_dispatch_pmc(struct Parrot_Interp *interpreter,
		 PMC *left, PMC *right, INTVAL function) {
    PMC *(*real_function)(PMC *, PMC *);
    INTVAL left_type, right_type;
    UINTVAL offset;
    left_type = VTABLE_type(interpreter, left);
    right_type = VTABLE_type(interpreter, right);
    offset = interpreter->binop_mmd_funcs->x[FLOAT_OFFSET] * right_type + left_type;
    real_function = interpreter->binop_mmd_funcs->mmd_funcs[FLOAT_OFFSET] + offset;
    return ((*real_function)(left, right));
}

STRING *
mmd_dispatch_string(struct Parrot_Interp *interpreter,
		 PMC *left, PMC *right, INTVAL function) {
    STRING *(*real_function)(PMC *, PMC *);
    INTVAL left_type, right_type;
    UINTVAL offset;
    left_type = VTABLE_type(interpreter, left);
    right_type = VTABLE_type(interpreter, right);
    offset = interpreter->binop_mmd_funcs->x[FLOAT_OFFSET] * right_type + left_type;
    real_function = interpreter->binop_mmd_funcs->mmd_funcs[FLOAT_OFFSET] + offset;
    return ((*real_function)(left, right));
}

INTVAL
mmd_dispatch_intval(struct Parrot_Interp *interpreter,
		 PMC *left, PMC *right, INTVAL function) {
    INTVAL (*real_function)(PMC *, PMC *);
    INTVAL left_type, right_type;
    UINTVAL offset;
    left_type = VTABLE_type(interpreter, left);
    right_type = VTABLE_type(interpreter, right);
    offset = interpreter->binop_mmd_funcs->x[FLOAT_OFFSET] * right_type + left_type;
    real_function = interpreter->binop_mmd_funcs->mmd_funcs[FLOAT_OFFSET] + offset;
    return ((*real_function)(left, right));
}

FLOATVAL
mmd_dispatch_numval(struct Parrot_Interp *interpreter,
		 PMC *left, PMC *right, INTVAL function) {
  
    FLOATVAL (*real_function)(PMC *, PMC *);
    INTVAL left_type, right_type;
    UINTVAL offset;
    left_type = VTABLE_type(interpreter, left);
    right_type = VTABLE_type(interpreter, right);
    offset = interpreter->binop_mmd_funcs->x[FLOAT_OFFSET] * right_type + left_type;
    real_function = interpreter->binop_mmd_funcs->mmd_funcs[FLOAT_OFFSET] + offset;
    return ((*real_function)(left, right));
}

/*

*/
void
mmd_register(struct Parrot_Interp *interpreter,
             INTVAL type, INTVAL func_num,
             INTVAL left_type, INTVAL right_type,
             funcptr_t funcptr) {
    
}


/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
