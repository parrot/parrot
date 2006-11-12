/*
Copyright (C) 2001-2006, The Perl Foundation.
$Id$

=head1 NAME

src/inter_misc.c - Parrot Interpreter - Misc functions

=head1 DESCRIPTION

NCI function setup, C<interpinfo>, and C<sysinfo> opcodes.

=head2 Functions

=over 4

=cut

*/


#include <assert.h>
#include "parrot/parrot.h"
#include "inter_misc.str"

/*

=item C<void
enter_nci_method(Parrot_Interp interp, int type,
        void *func, const char *name, const char *proto)>

Create an entry in the C<nci_method_table> for the given NCI method of PMC
class C<type>.

=cut

*/

void
enter_nci_method(Parrot_Interp interp, int type,
        void *func, const char *name, const char *proto)
{
    PMC * const method = pmc_new(interp, enum_class_NCI);
    /* create call func */
    VTABLE_set_pointer_keyed_str(interp, method,
            string_make(interp, proto, strlen(proto),
                NULL, PObj_constant_FLAG|PObj_external_FLAG),
            func);
    /* insert it into namespace */
    VTABLE_set_pmc_keyed_str(interp,
        interp->vtables[type]->_namespace,
            string_make(interp, name,
                strlen(name), NULL,
                PObj_constant_FLAG|PObj_external_FLAG),
            method);
}

/*

=item C<void
Parrot_mark_method_writes(Parrot_Interp interp,
                          int type, const char *name)>

Mark the method C<name> on PMC type C<type> as one that modifies the PMC.

=cut

*/

void Parrot_mark_method_writes(Parrot_Interp interp,
                               int type, const char *name) {
    STRING *const str_name = const_string(interp, name);
    PMC *const pmc_true = pmc_new(interp, enum_class_Integer);
    PMC *const method = VTABLE_get_pmc_keyed_str(
        interp, interp->vtables[type]->_namespace, str_name);
    VTABLE_set_integer_native(interp, pmc_true, 1);
    VTABLE_setprop(interp, method, const_string(interp, "write"),
                   pmc_true);
}

/*

=item C<void
Parrot_compreg(Parrot_Interp interp, STRING *type,
               Parrot_compiler_func_t func);>

Register a parser/compiler function.

=cut

*/

void Parrot_compreg(Parrot_Interp interp, STRING *type,
                    Parrot_compiler_func_t func)
{
    PMC *hash, *nci;
    PMC* iglobals = interp->iglobals;
    STRING *sc;

    hash = VTABLE_get_pmc_keyed_int(interp, interp->iglobals,
            IGLOBALS_COMPREG_HASH);
    if (!hash) {
        hash = pmc_new_noinit(interp, enum_class_Hash);
        VTABLE_init(interp, hash);
        VTABLE_set_pmc_keyed_int(interp, iglobals,
                (INTVAL)IGLOBALS_COMPREG_HASH, hash);
    }
    nci = pmc_new(interp, enum_class_Compiler);
    VTABLE_set_pmc_keyed_str(interp, hash, type, nci);
    /* build native call interface fir the C sub in "func" */
    sc = CONST_STRING(interp, "PJt");
    VTABLE_set_pointer_keyed_str(interp, nci, sc, (void*)func);
}

/*

=item C<PMC *
Parrot_compile_string(Parrot_Interp interp, STRING *type,
                      char *code, String **error)>

Compile code string.

=cut

*/

PMC *
Parrot_compile_string(Parrot_Interp interp, STRING *type,
                      char *code, STRING **error)
{
    if (!string_compare(interp, const_string(interp, "PIR"),
        type)) {
        return IMCC_compile_pir_s(interp, code, error);
    }
    else if (!string_compare(interp,const_string(interp,
        "PASM"), type)) {
        return IMCC_compile_pasm_s(interp, code, error);
    }
    else {
        *error=const_string(interp, "Invalid interpreter type");
        return NULL;
    }
}

/*

=item C<void
Parrot_compile_file(Parrot_Interp interp, const char *fullname,
                    String **error)>

Compile code file.

=cut

*/

void *
Parrot_compile_file(Parrot_Interp interp, char *fullname,
                    String **error)
{
    return IMCC_compile_file_s(interp, fullname, error);
}

#ifdef GC_IS_MALLOC
#  if 0
struct mallinfo {
    int arena;                  /* non-mmapped space allocated from system */
    int ordblks;                /* number of free chunks */
    int smblks;                 /* number of fastbin blocks */
    int hblks;                  /* number of mmapped regions */
    int hblkhd;                 /* space in mmapped regions */
    int usmblks;                /* maximum total allocated space */
    int fsmblks;                /* space available in freed fastbin blocks */
    int uordblks;               /* total allocated space */
    int fordblks;               /* total free space */
    int keepcost;               /* top-most, releasable (via malloc_trim)
                                 * space */
};
#  endif
extern struct mallinfo mallinfo(void);
#endif /* GC_IS_MALLOC */

/*

=item C<INTVAL
interpinfo(Interp *interp, INTVAL what)>

=item C<PMC*
interpinfo_p(Interp *interp, INTVAL what)>

C<what> specifies the type of information you want about the
interpreter.

=cut

*/

INTVAL
interpinfo(Interp *interp, INTVAL what)
{
    INTVAL ret = 0;
    int j;
    struct Arenas *arena_base = interp->arena_base;

    switch (what) {
        case TOTAL_MEM_ALLOC:
#ifdef GC_IS_MALLOC
#if 0
            interp->memory_allocated = mallinfo().uordblks;
#endif
#endif
            ret = arena_base->memory_allocated;
            break;
        case DOD_RUNS:
            ret = arena_base->dod_runs;
            break;
        case LAZY_DOD_RUNS:
            ret = arena_base->lazy_dod_runs;
            break;
        case COLLECT_RUNS:
            ret = arena_base->collect_runs;
            break;
        case ACTIVE_PMCS:
            ret = arena_base->pmc_pool->total_objects -
                arena_base->pmc_pool->num_free_objects;
            break;
        case ACTIVE_BUFFERS:
            ret = 0;
            for (j = 0; j < (INTVAL)arena_base->num_sized; j++) {
                struct Small_Object_Pool * const header_pool =
                    arena_base->sized_header_pools[j];
                if (header_pool)
                    ret += header_pool->total_objects -
                        header_pool->num_free_objects;
            }
            break;
        case TOTAL_PMCS:
            ret = arena_base->pmc_pool->total_objects;
            break;
        case TOTAL_BUFFERS:
            ret = 0;
            for (j = 0; j < (INTVAL)arena_base->num_sized; j++) {
                struct Small_Object_Pool * const header_pool =
                    arena_base->sized_header_pools[j];
                if (header_pool)
                    ret += header_pool->total_objects;
            }
            break;
        case HEADER_ALLOCS_SINCE_COLLECT:
            ret = arena_base->header_allocs_since_last_collect;
            break;
        case MEM_ALLOCS_SINCE_COLLECT:
            ret = arena_base->mem_allocs_since_last_collect;
            break;
        case TOTAL_COPIED:
            ret = arena_base->memory_collected;
            break;
        case IMPATIENT_PMCS:
            ret = arena_base->num_early_DOD_PMCs;
            break;
        case EXTENDED_PMCS:
            ret = arena_base->num_extended_PMCs;
            break;
        default:        /* or a warning only? */
            internal_exception(UNIMPLEMENTED,
                    "illegal argument in interpinfo");
    }
    return ret;
}

PMC*
interpinfo_p(Interp *interp, INTVAL what)
{
    switch (what) {
        case CURRENT_SUB:
            return CONTEXT(interp->ctx)->current_sub;
        case CURRENT_CONT:
            {
            PMC * const cont = CONTEXT(interp->ctx)->current_cont;
            if (!PMC_IS_NULL(cont) && cont->vtable->base_type ==
                    enum_class_RetContinuation)
                return VTABLE_clone(interp, cont);
            return cont;
            }
        case CURRENT_OBJECT:
            return CONTEXT(interp->ctx)->current_object;
        case NAMESPACE_ROOT:
            return interp->root_namespace;
        case CURRENT_LEXPAD:
            return CONTEXT(interp->ctx)->lex_pad;
        default:        /* or a warning only? */
            internal_exception(UNIMPLEMENTED,
                    "illegal argument in interpinfo");
    }
    return PMCNULL;
}

STRING*
interpinfo_s(Interp *interp, INTVAL what)
{
    switch (what) {
        case CURRENT_METHOD:
            return CONTEXT(interp->ctx)->current_method;
        default:        /* or a warning only? */
            internal_exception(UNIMPLEMENTED,
                    "illegal argument in interpinfo");
    }
    return NULL;
}

/*

=item C<INTVAL
sysinfo_i(Parrot_Interp interp, INTVAL info_wanted)>

Returns the system info.

C<info_wanted> is one of:

    PARROT_INTSIZE
    PARROT_FLOATSIZE
    PARROT_POINTERSIZE

In unknown info is requested then -1 is returned.

=cut

*/

INTVAL
sysinfo_i(Parrot_Interp interp, INTVAL info_wanted)
{
    switch (info_wanted) {
    case PARROT_INTSIZE:
        return sizeof(INTVAL);
    case PARROT_FLOATSIZE:
        return sizeof(FLOATVAL);
    case PARROT_POINTERSIZE:
        return sizeof(void *);
    default:
        return -1;
    }
}

/*

=item C<STRING *
sysinfo_s(Parrot_Interp interp, INTVAL info_wanted)>

Returns the system info string.

C<info_wanted> is one of:

    PARROT_OS
    PARROT_OS_VERSION
    PARROT_OS_VERSION_NUMBER
    CPU_ARCH
    CPU_TYPE

If unknown info is requested then and empty string is returned.

=cut

*/

STRING *
sysinfo_s(Parrot_Interp interp, INTVAL info_wanted)
{
    switch (info_wanted) {
    case PARROT_OS:
        return string_from_cstring(interp, BUILD_OS_NAME, 0);
    case PARROT_OS_VERSION:
    case PARROT_OS_VERSION_NUMBER:
    case CPU_ARCH:
    case CPU_TYPE:
    default:
        return CONST_STRING(interp, "");
    }
}
/*

=back

=head1 SEE ALSO

F<include/parrot/interpreter.h>.

=cut

*/



/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
