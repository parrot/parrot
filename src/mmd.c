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
typedef void (*pmc_mmd_f)(struct Parrot_Interp *, PMC *, PMC *, PMC *);
typedef STRING *(*string_mmd_f)(struct Parrot_Interp *, PMC *, PMC *);
typedef INTVAL (*intval_mmd_f)(struct Parrot_Interp *, PMC *, PMC *);
typedef FLOATVAL (*floatval_mmd_f)(struct Parrot_Interp *, PMC *, PMC *);

void
mmd_dispatch_pmc(struct Parrot_Interp *interpreter,
		 PMC *left, PMC *right, PMC *dest, INTVAL function)
{
    pmc_mmd_f real_function;
    UINTVAL left_type, right_type;
    UINTVAL offset;
    left_type = VTABLE_type(interpreter, left);
    right_type = VTABLE_type(interpreter, right);
    if ((left_type > interpreter->binop_mmd_funcs->x[function]) ||
        (right_type > interpreter->binop_mmd_funcs->y[function])) {
        real_function = (pmc_mmd_f)interpreter->binop_mmd_funcs->default_func[
            function];
    } else {
        offset = interpreter->binop_mmd_funcs->x[function] *
            right_type + left_type;
        real_function = (pmc_mmd_f)*(interpreter->binop_mmd_funcs->mmd_funcs[function] + offset);
    }
    (*real_function)(interpreter, left, right, dest);
}

STRING *
mmd_dispatch_string(struct Parrot_Interp *interpreter,
		 PMC *left, PMC *right, INTVAL function)
{
    string_mmd_f real_function;
    UINTVAL left_type, right_type;
    UINTVAL offset;
    left_type = VTABLE_type(interpreter, left);
    right_type = VTABLE_type(interpreter, right);
    if ((left_type > interpreter->binop_mmd_funcs->x[function]) ||
        (right_type > interpreter->binop_mmd_funcs->y[function])) {
        real_function = (string_mmd_f)interpreter->binop_mmd_funcs->default_func[
            function];
    } else {
        offset = interpreter->binop_mmd_funcs->x[function] * right_type + left_type;
        real_function = (string_mmd_f)D2FPTR((interpreter->binop_mmd_funcs->mmd_funcs[function] + offset));
    }
    return (*real_function)(interpreter, left, right);
}

INTVAL
mmd_dispatch_intval(struct Parrot_Interp *interpreter,
		 PMC *left, PMC *right, INTVAL function)
{
    intval_mmd_f real_function;
    UINTVAL left_type, right_type;
    UINTVAL offset;
    left_type = VTABLE_type(interpreter, left);
    right_type = VTABLE_type(interpreter, right);
    if ((left_type > interpreter->binop_mmd_funcs->x[function]) ||
        (right_type > interpreter->binop_mmd_funcs->y[function])) {
        real_function = (intval_mmd_f)interpreter->binop_mmd_funcs->default_func[
            function];
    } else {
        offset = interpreter->binop_mmd_funcs->x[function] * right_type + left_type;
        real_function = (intval_mmd_f)D2FPTR((interpreter->binop_mmd_funcs->mmd_funcs[function] + offset));
    }
    return (*real_function)(interpreter, left, right);
}

FLOATVAL
mmd_dispatch_floatval(struct Parrot_Interp *interpreter,
		 PMC *left, PMC *right, INTVAL function)
{

    floatval_mmd_f real_function;
    UINTVAL left_type, right_type;
    UINTVAL offset;
    left_type = VTABLE_type(interpreter, left);
    right_type = VTABLE_type(interpreter, right);
    if ((left_type > interpreter->binop_mmd_funcs->x[function]) ||
        (right_type > interpreter->binop_mmd_funcs->y[function])) {
        real_function = (floatval_mmd_f)interpreter->binop_mmd_funcs->default_func[
            function];
    } else {
        offset = interpreter->binop_mmd_funcs->x[function] * right_type + left_type;
        real_function = (floatval_mmd_f)D2FPTR((interpreter->binop_mmd_funcs->mmd_funcs[function] + offset));
    }
    return (*real_function)(interpreter, left, right);
}

/* Add a new binary MMD function to the table */
void
mmd_add_function(struct Parrot_Interp *interpreter,
        INTVAL funcnum, funcptr_t function)
{
    UINTVAL func_count = funcnum + 1;
    UINTVAL cur_func_count = interpreter->binop_mmd_funcs->tables;

    /*    printf("Default for %i is %p\n", funcnum, function);*/

    /* Is the new function past where we have expanded to? If so, make
       all the tables bigger
    */
    if (func_count > cur_func_count) {
        UINTVAL *new_x;
        UINTVAL *new_y;
        funcptr_t *new_default;
        UINTVAL *new_func_count;
        funcptr_t **new_functable;

        /* All this stuff should be checked to make sure it succeeds. */
        new_x = mem_sys_allocate_zeroed(sizeof(UINTVAL) * func_count);
        new_y = mem_sys_allocate_zeroed(sizeof(UINTVAL) * func_count);
        new_func_count = mem_sys_allocate_zeroed(sizeof(UINTVAL) * func_count);
        new_default = mem_sys_allocate_zeroed(sizeof(funcptr_t) * func_count);
        new_functable = mem_sys_allocate_zeroed(sizeof(funcptr_t) * func_count);

        /* Now copy the data over */
        memcpy(new_x, interpreter->binop_mmd_funcs->x,
                sizeof(UINTVAL) * cur_func_count);
        memcpy(new_y, interpreter->binop_mmd_funcs->y,
                sizeof(UINTVAL) * cur_func_count);
        memcpy(new_func_count, interpreter->binop_mmd_funcs->funcs_in_table,
                sizeof(UINTVAL) * cur_func_count);
        memcpy(new_default, interpreter->binop_mmd_funcs->default_func,
                sizeof(funcptr_t) * cur_func_count);
        memcpy(new_functable, interpreter->binop_mmd_funcs->mmd_funcs,
                sizeof(funcptr_t) * cur_func_count);

        /* And set the values */
        interpreter->binop_mmd_funcs->x = new_x;
        interpreter->binop_mmd_funcs->y = new_y;
        interpreter->binop_mmd_funcs->default_func = new_default;
        interpreter->binop_mmd_funcs->funcs_in_table = new_func_count;
        interpreter->binop_mmd_funcs->mmd_funcs = new_functable;
        interpreter->binop_mmd_funcs->tables = func_count;

    }
    /* We mark the new function by adding in the default function
       pointer */
    interpreter->binop_mmd_funcs->default_func[funcnum] = function;

}

/* The table needs to get bigger in the X direction. Do so. */
static void
mmd_expand_x(struct Parrot_Interp *interpreter, INTVAL function, INTVAL new_x)
{
    funcptr_t *new_table;
    UINTVAL x;
    UINTVAL y;
    funcptr_t default_func;
    UINTVAL i;

    /* Is the Y 0? If so, nothing to expand, so just set the X for
       later use */
    if (interpreter->binop_mmd_funcs->y[function] == 0) {
        interpreter->binop_mmd_funcs->x[function] = new_x;
        return;
    }

    /* The Y is not zero. Bleah. This means we have to expand the
       table in an unpleasant way. */

    x = interpreter->binop_mmd_funcs->x[function];
    y = interpreter->binop_mmd_funcs->y[function];
    default_func = interpreter->binop_mmd_funcs->default_func[function];

    /* First, fill in the whole new table with the default function
       pointer. We only really need to do the new part, but... */
    new_table = mem_sys_allocate(sizeof(funcptr_t) * (y+1) * (new_x+1));
    for (i = 0; i <= new_x * y; i++) {
        new_table[i] = default_func;
    }

    /* Then copy the old table over. We have to do this row by row,
       because the rows in the old and new tables are different
       lengths */
    for (i = 0; i <= y; i++) {
        INTVAL newoffset, oldoffset;
        newoffset = i * (new_x+1);
        oldoffset = i * (x+1);
        memcpy(new_table + newoffset,
               interpreter->binop_mmd_funcs->mmd_funcs[function] + oldoffset,
               sizeof(funcptr_t) * (x+1));
    }
    if (interpreter->binop_mmd_funcs->mmd_funcs[function])
        mem_sys_free(interpreter->binop_mmd_funcs->mmd_funcs[function]);
    /* Set the old table to point to the new table */
    interpreter->binop_mmd_funcs->mmd_funcs[function] = new_table;
}

static void
mmd_expand_y(struct Parrot_Interp *interpreter, INTVAL function, INTVAL new_y)
{
    funcptr_t *new_table;
    UINTVAL x;
    UINTVAL y;
    funcptr_t default_func;
    UINTVAL i;

    /* Is the X 0? If so, nothing to expand, so just set the Y for
       later use */
    if (interpreter->binop_mmd_funcs->x[function] == 0) {
        interpreter->binop_mmd_funcs->y[function] = new_y;
        return;
    }

    x = interpreter->binop_mmd_funcs->x[function];
    y = interpreter->binop_mmd_funcs->y[function];
    default_func = interpreter->binop_mmd_funcs->default_func[function];

    /* First, fill in the whole new table with the default function
       pointer. We only really need to do the new part, but... */
    new_table = mem_sys_allocate(sizeof(funcptr_t) * (x+1) * (new_y+1));
    for (i = 0; i < ((x+1) * (new_y+1)); i++) {
        new_table[i] = default_func;
    }

    /* Then copy the old table over, if it existed in the first place. */
    if (x && y) {
        memcpy(new_table, interpreter->binop_mmd_funcs->mmd_funcs[function],
               sizeof(funcptr_t) * (x+1) * (y+1));
    }
    if (interpreter->binop_mmd_funcs->mmd_funcs[function])
        mem_sys_free(interpreter->binop_mmd_funcs->mmd_funcs[function]);
    interpreter->binop_mmd_funcs->y[function] = new_y;
    interpreter->binop_mmd_funcs->mmd_funcs[function] = new_table;

}

/* Add a function to the MMD table by class name, rather than class
 * number. Handles the case where the named class isn't loaded yet.
 */
void
mmd_add_by_class(struct Parrot_Interp *interpreter,
             INTVAL functype,
             STRING *left_class, STRING *right_class,
             funcptr_t funcptr)
{
    INTVAL left_type = pmc_type(interpreter, left_class);
    INTVAL right_type = pmc_type(interpreter, right_class);

    if (left_type == enum_type_undef) {
        left_type = pmc_register(interpreter, left_class);
    }
    if (right_type == enum_type_undef) {
        right_type = pmc_register(interpreter, right_class);
    }

    mmd_register(interpreter, functype, left_type, right_type, funcptr);

}

/*
 * Add a new function to the table. This can be interestingly
 * non-trivial, so we get to be tricky.
 *
 * If the left or right types are larger than anything we've seen so
 * far, it means that we have to expand the table. Making Y larger is
 * simple--just realloc with some more rows. Making X larger is less
 * simple. In either case, we punt to other functions.
 */

void
mmd_register(struct Parrot_Interp *interpreter,
             INTVAL type,
             INTVAL left_type, INTVAL right_type,
             funcptr_t funcptr)
{

    INTVAL cur_x, cur_y;
    INTVAL offset;
    cur_x = interpreter->binop_mmd_funcs->x[type];
    cur_y = interpreter->binop_mmd_funcs->y[type];
    if (cur_x < left_type) {
        mmd_expand_x(interpreter, type, left_type);
    }

    if (cur_y < right_type) {
        mmd_expand_y(interpreter, type, right_type);
    }

    offset = interpreter->binop_mmd_funcs->x[type] * right_type + left_type;
    *(interpreter->binop_mmd_funcs->mmd_funcs[type] + offset) = funcptr;
}

void
mmd_destroy(Parrot_Interp interpreter)
{
    if (interpreter->binop_mmd_funcs->tables) {
        UINTVAL i;
        for (i = 0; i <interpreter->binop_mmd_funcs->tables; ++i) {
            if (interpreter->binop_mmd_funcs->mmd_funcs[i])
                mem_sys_free(interpreter->binop_mmd_funcs->mmd_funcs[i]);
        }
        mem_sys_free(interpreter->binop_mmd_funcs->mmd_funcs);

        mem_sys_free(interpreter->binop_mmd_funcs->x);
        mem_sys_free(interpreter->binop_mmd_funcs->y);
        mem_sys_free(interpreter->binop_mmd_funcs->default_func);
        mem_sys_free(interpreter->binop_mmd_funcs->funcs_in_table);
    }
    mem_sys_free(interpreter->binop_mmd_funcs);
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
