/* method_util.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Utility functions to handle Parrot calling conventions, lookup
 *     methods, etc.
 *  Data Structure and Algorithms:
 *  History:
 *     Initial revision by Sean, 2002/08/04
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"
#include "parrot/method_util.h"

/*
 * Create a new native sub.
 */
PMC *
Parrot_new_csub(struct Parrot_Interp * interp, Parrot_csub_t func) {
    PMC * ret = pmc_new(interp, enum_class_CSub);
    ret->cache.struct_val = (DPOINTER*)func;
    return ret;
}

/*
 * Push non-prototyped arguments.
 */
void
Parrot_push_argv(struct Parrot_Interp * interp, INTVAL argc, PMC * argv[]) {
    interp->ctx.int_reg.registers[0] = 0; /* no prototype */
    interp->ctx.int_reg.registers[1] = argc;
    while (argc--) {
        stack_push(interp, &(interp->ctx.user_stack), argv[argc],
                   STACK_ENTRY_PMC, STACK_CLEANUP_NULL);
    }
}

/*
 * Pop non-prototyped arguments.
 */
INTVAL
Parrot_pop_argv(struct Parrot_Interp * interp, PMC *** argv) {
    INTVAL i;
    INTVAL nret = interp->ctx.int_reg.registers[1];
    /* NOTE: not using GC'd memory -- free this yourself. */
    *argv = (PMC **)mem_sys_allocate(nret * sizeof(PMC *));

    for (i = 0; i < nret; i++) {
        stack_pop(interp, &(interp->ctx.user_stack), &((*argv)[i]),
                  STACK_ENTRY_PMC);
    }
    return nret;
}

/* XXX: blech, blech, blech.  This is ugly. */
#define push_these(npush, interp, regs, argc, arg, arg2, stacktype) { \
    int i; \
    int nthings = (argc) < 27 ? (argc) : 27; \
    for (i = 0; i < nthings; i++) { \
        (regs)[i + 5] = (arg); \
    } \
    for (i = nthings; i < (argc); i++) { \
        stack_push((interp), &((interp)->ctx.user_stack), (void*)(arg2), \
                   (stacktype), STACK_CLEANUP_NULL); \
    } \
    npush += (i < 27 ? 0 : i - 27); \
}

/*
 * Push prototyped arguments.
 */
void
Parrot_push_proto(struct Parrot_Interp * interp,
                  INTVAL intc, INTVAL * intv,
                  INTVAL numc, FLOATVAL * numv,
                  INTVAL strc, STRING ** strv,
                  INTVAL pmcc, PMC ** pmcv) {
    int npush;                  /* overflow params */
    interp->ctx.int_reg.registers[0] = 1; /* with proto */
    npush = 0;
    push_these(npush, interp, interp->ctx.int_reg.registers, intc, intv[i],
               &(intv[i]), STACK_ENTRY_INT);
    push_these(npush, interp, interp->ctx.num_reg.registers, numc, numv[i],
               &(numv[i]), STACK_ENTRY_FLOAT);
    push_these(npush, interp, interp->ctx.string_reg.registers, strc,
               strv[i], strv[i], STACK_ENTRY_STRING);
    push_these(npush, interp, interp->ctx.pmc_reg.registers, pmcc,
               pmcv[i], pmcv[i], STACK_ENTRY_PMC);

    interp->ctx.int_reg.registers[1] = npush;
}

/*
 * Initialize a method stash.
 */
void
Parrot_init_stash(struct Parrot_Interp * interp, struct method_rec_t * recp,
                  struct Stash * stash) {
    KEY k;
    PMC * hash = stash->stash_hash;

    if (hash != NULL)
        return;

    stash->stash_hash = hash = pmc_new(interp, enum_class_PerlHash);
    while (recp->name != NULL) {
        PMC * csub = Parrot_new_csub(interp, recp->sub);
        STRING * name = string_make(interp, recp->name, strlen(recp->name),
                                    NULL, 0, NULL);
        MAKE_KEY_STRING(k, name);
        hash->vtable->set_pmc_keyed(interp, hash, NULL, csub, &k);
        ++recp;
    }
}

/*
 * Lookup a method in a method stash.
 */
PMC *
Parrot_find_method(struct Parrot_Interp * interp, struct Stash * stash,
                   KEY * key) {
    while (stash) {
        PMC * meth = stash->stash_hash->vtable
            ->get_pmc_keyed(interp, stash->stash_hash, key);
        if (meth)
            return meth;
        stash = stash->parent_stash;
    }
    return NULL;
}

/*
 * Mark entries in a stack structure during GC.
 */
PMC *
mark_stack(Stack_Chunk_t * cur_stack, PMC * end_of_used_list) {
    Stack_Entry_t *entry;
    size_t i;

    while (cur_stack) {
        if(cur_stack->buffer){
            buffer_lives(cur_stack->buffer);
            entry = (Stack_Entry_t *)(cur_stack->buffer->bufstart);
            for (i = 0; i < cur_stack->used; i++) {
                if (STACK_ENTRY_PMC == entry[i].entry_type &&
                    entry[i].entry.pmc_val) {
                    end_of_used_list = mark_used(entry[i].entry.pmc_val,
                                                 end_of_used_list);
                } else if (STACK_ENTRY_STRING == entry[i].entry_type &&
                           entry[i].entry.string_val) {
                    buffer_lives((Buffer *)entry[i].entry.string_val);
                }
            }
        }
        cur_stack = cur_stack->prev;
    }
    return end_of_used_list;
}
