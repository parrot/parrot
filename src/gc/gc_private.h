/*
Copyright (C) 2001-2009, The Perl Foundation.
$Id$

=head1 NAME

src/gc/gc_private.h - private header file for the GC subsystem

=head1 DESCRIPTION

This is a private header file for the GC subsystem. It contains definitions
that are only for use in the GC and don't need to be included in the rest of
Parrot.
*/

#ifndef PARROT_GC_PRIVATE_H_GUARD
#define PARROT_GC_PRIVATE_H_GUARD

#include "parrot/settings.h"

#if ! DISABLE_GC_DEBUG
/* Set when walking the system stack. Defined in src/gc/system.c */
extern int CONSERVATIVE_POINTER_CHASING;
#endif

#ifdef __ia64__

#  include <ucontext.h>
extern void *flush_reg_store(void);
#  define BACKING_STORE_BASE 0x80000fff80000000

#endif

/* We're using this here to add an additional pointer to a PObj without
   having to actually add an entire pointer to every PObj-alike structure
   in Parrot. Astute observers may notice that if the PObj is comprised of
   only an INTVAL, then there are some systems where sizeof(void*) can be
   larger then sizeof(PObj), thus creating overflow. However PObjs are never
   used by themselves, things like PMCs and STRINGs are cast to PObj in the
   GC, so we should have plenty of space. */ 
typedef union GC_MS_PObj_Wrapper {
    PObj obj;
    void *next_ptr;
} GC_MS_PObj_Wrapper;

/* HEADERIZER BEGIN: src/gc/system.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void trace_mem_block(PARROT_INTERP, size_t lo_var_ptr, size_t hi_var_ptr)
        __attribute__nonnull__(1);

void trace_system_areas(PARROT_INTERP)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_trace_mem_block __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_trace_system_areas __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/gc/system.c */

#endif /* PARROT_GC_PRIVATE_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
