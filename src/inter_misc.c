/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
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
enter_nci_method(Parrot_Interp interpreter, int type,
		 void *func, const char *name, const char *proto)>

Create an entry in the C<nci_method_table> for the given NCI method of PMC
class C<type>.

=cut

*/

void
enter_nci_method(Parrot_Interp interpreter, int type,
		 void *func, const char *name, const char *proto)
{
#if 0
    PMC *method, *method_table, **table;
    int i;

    if (type >= (int)interpreter->nci_method_table_size) {
        if (!interpreter->nci_method_table_size) {
            table = interpreter->nci_method_table =
                mem_sys_allocate_zeroed((enum_class_max) * sizeof(PMC*));
            for (i = 0; i < enum_class_max; ++i)
                SET_NULL_P(table[i], PMC*);
            interpreter->nci_method_table_size = enum_class_max;
        }
        else {
            table = interpreter->nci_method_table =
                mem_sys_realloc(interpreter->nci_method_table,
                        (type + 1) * sizeof(PMC*));
            for (i = interpreter->nci_method_table_size; i < type + 1; ++i)
                table[i] = NULL;
            interpreter->nci_method_table_size = type + 1;
        }
    }
    else
        table = interpreter->nci_method_table;
    if (!table[type])
        table[type] = pmc_new(interpreter, enum_class_Hash);
    method_table = table[type];

    method = pmc_new(interpreter, enum_class_NCI);
    VTABLE_set_pointer_keyed_str(interpreter, method,
            string_make(interpreter, proto, strlen(proto),
                "iso-8859-1", PObj_constant_FLAG|PObj_external_FLAG),
            func);
    VTABLE_set_pmc_keyed_str(interpreter, method_table,
            string_make(interpreter, name,
                strlen(name), "iso-8859-1",
                PObj_constant_FLAG|PObj_external_FLAG),
            method);
#else
    PMC *method;
    method = pmc_new(interpreter, enum_class_NCI);
    VTABLE_set_pointer_keyed_str(interpreter, method,
            string_make(interpreter, proto, strlen(proto),
                "iso-8859-1", PObj_constant_FLAG|PObj_external_FLAG),
            func);
    Parrot_store_global(interpreter,
        Parrot_base_vtables[type]->whoami,
            string_make(interpreter, name,
                strlen(name), "iso-8859-1",
                PObj_constant_FLAG|PObj_external_FLAG),
            method);

#endif
}

/*

=item C<void
Parrot_compreg(Parrot_Interp interpreter, STRING *type, Parrot_compiler_func_t func);

Register a parser/compiler function.

=cut

*/

void
Parrot_compreg(Parrot_Interp interpreter, STRING *type, Parrot_compiler_func_t func)
{
    PMC *hash, *nci;
    PMC* iglobals = interpreter->iglobals;
    STRING *sc;

    hash = VTABLE_get_pmc_keyed_int(interpreter, interpreter->iglobals,
            IGLOBALS_COMPREG_HASH);
    if (!hash) {
        hash = pmc_new_noinit(interpreter, enum_class_Hash);
        VTABLE_init(interpreter, hash);
        VTABLE_set_pmc_keyed_int(interpreter, iglobals,
                (INTVAL)IGLOBALS_COMPREG_HASH, hash);
    }
    nci = pmc_new(interpreter, enum_class_Compiler);
    VTABLE_set_pmc_keyed_str(interpreter, hash, type, nci);
    /* build native call interface fir the C sub in "func" */
    sc = CONST_STRING(interpreter, "PIt");
    VTABLE_set_pointer_keyed_str(interpreter, nci, sc, func);
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
interpinfo(Interp *interpreter, INTVAL what)>

=item C<PMC*
interpinfo_p(Interp *interpreter, INTVAL what)>

C<what> specifies the type of information you want about the
interpreter.

=cut

*/

INTVAL
interpinfo(Interp *interpreter, INTVAL what)
{
    INTVAL ret = 0;
    struct Small_Object_Pool *header_pool;
    int j;
    struct Arenas *arena_base = interpreter->arena_base;

    switch (what) {
        case TOTAL_MEM_ALLOC:
#ifdef GC_IS_MALLOC
#if 0
            interpreter->memory_allocated = mallinfo().uordblks;
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
                header_pool = arena_base->sized_header_pools[j];
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
                header_pool = arena_base->sized_header_pools[j];
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
interpinfo_p(Interp *interpreter, INTVAL what)
{
    PMC *cont;
    switch (what) {
        case CURRENT_SUB:
            return interpreter->ctx.current_sub;
        case CURRENT_CONT:
            cont = interpreter->ctx.current_cont;
            if (!PMC_IS_NULL(cont) && cont->vtable->base_type ==
                    enum_class_RetContinuation)
                return VTABLE_clone(interpreter, cont);
            return cont;
        case CURRENT_OBJECT:
            return interpreter->ctx.current_object;
        case CURRENT_NAMESPACE_ROOT: /* XXX */
            return interpreter->globals->stash_hash;
        case CURRENT_LEXPAD:
            return scratchpad_get_current(interpreter);
        default:        /* or a warning only? */
            internal_exception(UNIMPLEMENTED,
                    "illegal argument in interpinfo");
    }
    return PMCNULL;
}

/*

=item C<INTVAL
sysinfo_i(Parrot_Interp interpreter, INTVAL info_wanted)>

Returns the system info.

C<info_wanted> is one of:

    PARROT_INTSIZE
    PARROT_FLOATSIZE
    PARROT_POINTERSIZE

In unknown info is requested then -1 is returned.

=cut

*/

INTVAL
sysinfo_i(Parrot_Interp interpreter, INTVAL info_wanted)
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
sysinfo_s(Parrot_Interp interpreter, INTVAL info_wanted)>

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
sysinfo_s(Parrot_Interp interpreter, INTVAL info_wanted)
{
    switch (info_wanted) {
    case PARROT_OS:
        return string_from_cstring(interpreter, BUILD_OS_NAME, 0);
    case PARROT_OS_VERSION:
    case PARROT_OS_VERSION_NUMBER:
    case CPU_ARCH:
    case CPU_TYPE:
    default:
        return CONST_STRING(interpreter, "");
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
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
