/* pxs.c
 *  A poke at the extension interface for Parrot.
 *  By no means is this the official design, but something to
 *  to start from is better than discussion threads.
 */
#include "parrot/parrot.h"
#include "parrot/pxs.h"

int
PXS_initargs(Parrot_Interp_t interp) {
    INTVAL numargs;
    stack_pop(interp, &interp->user_stack, &numargs, STACK_ENTRY_INT);
    return numargs;
}

void
PXS_reti(Parrot_Interp_t interp, INTVAL i) {
    stack_push(interp, &interp->user_stack, &i, STACK_ENTRY_INT,
               STACK_CLEANUP_NULL);
}

void 
PXS_retn(Parrot_Interp_t interp, FLOATVAL f) {
    stack_push(interp, &interp->user_stack, &f, STACK_ENTRY_FLOAT,
               STACK_CLEANUP_NULL);
}

void
PXS_rets(Parrot_Interp_t interp, STRING * s) {
    stack_push(interp, &interp->user_stack, s, STACK_ENTRY_STRING,
               STACK_CLEANUP_NULL);
}

void
PXS_retp(Parrot_Interp_t interp, PMC * p) {
    stack_push(interp, &interp->user_stack, p, STACK_ENTRY_PMC, 
               STACK_CLEANUP_NULL);
}

INTVAL
PXS_shifti(Parrot_Interp_t interp) {
    INTVAL i;
    stack_pop(interp, &interp->user_stack, &i, STACK_ENTRY_INT);
    return i;
}

FLOATVAL
PXS_shiftn(Parrot_Interp_t interp) {
    FLOATVAL f;
    stack_pop(interp, &interp->user_stack, &f, STACK_ENTRY_FLOAT);
    return f;
}

STRING *
PXS_shifts(Parrot_Interp_t interp) {
    STRING * s;
    stack_pop(interp, &interp->user_stack, &s, STACK_ENTRY_STRING);
    return s;
}

char * PXS_shiftcs(Parrot_Interp_t interp) {
    STRING * s;
    stack_pop(interp, &interp->user_stack, &s, STACK_ENTRY_STRING);
    return string_to_cstring(interp, s);
} 

PMC *
PXS_shiftp(Parrot_Interp_t interp) {
    PMC * p;
    stack_pop(interp, &interp->user_stack, &p, STACK_ENTRY_PMC);
    return p;
}

INTVAL PXS_findop(Parrot_Interp_t interp, const char * opname) {
    int op = interp->op_lib->op_code(opname);
    return op;
}

PMC * PXS_pointer(Parrot_Interp_t interp, void * object) {
    PMC * p = new_pmc_header(interp);
    p->data = object;
    p->vtable = YOU_LOSE_VTABLE;
    return p;
}

void * PXS_api[] = {
    PXS_initargs, 
    PXS_reti, 
    PXS_retn, 
    PXS_rets, 
    PXS_retp, 
    PXS_shifti,
    PXS_shiftn,
    PXS_shifts,
    PXS_shiftp,
    PXS_findop
};

/*
void ** PXS_api(void)
{
    return &_PXS_api[0];
}
*/


/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil 
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
