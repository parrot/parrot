/*
Copyright (C) 2001-2008, Parrot Foundation.
$Id$

=head1 NAME

src/inter_misc.c - Parrot Interpreter miscellaneous functions

=head1 DESCRIPTION

NCI function setup, compiler registration, C<interpinfo>, and C<sysinfo> opcodes.

=head2 Functions

=over 4

=cut

*/


#include "parrot/parrot.h"
#include "inter_misc.str"
#include "../compilers/imcc/imc.h"

#include "parrot/has_header.h"

#ifdef PARROT_HAS_HEADER_SYSUTSNAME
#  include <sys/utsname.h>
#endif

/* HEADERIZER HFILE: include/parrot/interpreter.h */

/*

=item C<void register_nci_method(PARROT_INTERP, const int type, void *func,
const char *name, const char *proto)>

Create an entry in the C<nci_method_table> for the given NCI method of PMC
class C<type>.

=cut

*/

PARROT_EXPORT
void
register_nci_method(PARROT_INTERP, const int type, ARGIN(void *func),
                    ARGIN(const char *name), ARGIN(const char *proto))
{
    ASSERT_ARGS(register_nci_method)
    PMC    * const method      = pmc_new(interp, enum_class_NCI);
    STRING * const method_name = string_make(interp, name, strlen(name),
        NULL, PObj_constant_FLAG|PObj_external_FLAG);

    /* create call func */
    VTABLE_set_pointer_keyed_str(interp, method,
            string_make(interp, proto, strlen(proto), NULL,
                PObj_constant_FLAG|PObj_external_FLAG),
            func);

    /* insert it into namespace */
    VTABLE_set_pmc_keyed_str(interp, interp->vtables[type]->_namespace,
            method_name, method);
}

/*

=item C<void register_raw_nci_method_in_ns(PARROT_INTERP, const int type, void
*func, const char *name)>

Create an entry in the C<nci_method_table> for the given raw NCI method
of PMC class C<type>.

=cut

*/

PARROT_EXPORT
void
register_raw_nci_method_in_ns(PARROT_INTERP, const int type, ARGIN(void *func),
        ARGIN(const char *name))
{
    ASSERT_ARGS(register_raw_nci_method_in_ns)
    PMC    * const method      = pmc_new(interp, enum_class_NCI);
    STRING * const method_name = string_make(interp, name, strlen(name),
        NULL, PObj_constant_FLAG|PObj_external_FLAG);

    /* setup call func */
    VTABLE_set_pointer(interp, method, func);

    /* insert it into namespace */
    VTABLE_set_pmc_keyed_str(interp, interp->vtables[type]->_namespace,
            method_name, method);
}

/*

=item C<void Parrot_mark_method_writes(PARROT_INTERP, int type, const char
*name)>

Mark the method C<name> on PMC type C<type> as one that modifies the PMC.

=cut

*/

PARROT_EXPORT
void
Parrot_mark_method_writes(PARROT_INTERP, int type, ARGIN(const char *name))
{
    ASSERT_ARGS(Parrot_mark_method_writes)
    STRING *const str_name = Parrot_str_new_constant(interp, name);
    PMC    *const pmc_true = pmc_new(interp, enum_class_Integer);
    PMC    *const method   = VTABLE_get_pmc_keyed_str(
        interp, interp->vtables[type]->_namespace, str_name);
    VTABLE_set_integer_native(interp, pmc_true, 1);
    VTABLE_setprop(interp, method, CONST_STRING(interp, "write"), pmc_true);
}

/*

=item C<void Parrot_compreg(PARROT_INTERP, STRING *type, Parrot_compiler_func_t
func)>

Register a parser/compiler function.

=cut

*/

PARROT_EXPORT
void
Parrot_compreg(PARROT_INTERP, ARGIN(STRING *type),
                    NOTNULL(Parrot_compiler_func_t func))
{
    ASSERT_ARGS(Parrot_compreg)
    PMC* const iglobals = interp->iglobals;
    PMC        *nci     = pmc_new(interp, enum_class_NCI);
    STRING     *sc      = CONST_STRING(interp, "PJt");
    PMC        *hash    = VTABLE_get_pmc_keyed_int(interp, interp->iglobals,
                              IGLOBALS_COMPREG_HASH);

    if (!hash) {
        hash = pmc_new_noinit(interp, enum_class_Hash);
        VTABLE_init(interp, hash);
        VTABLE_set_pmc_keyed_int(interp, iglobals,
                (INTVAL)IGLOBALS_COMPREG_HASH, hash);
    }

    VTABLE_set_pmc_keyed_str(interp, hash, type, nci);

    /* build native call interface for the C sub in "func" */
    VTABLE_set_pointer_keyed_str(interp, nci, sc, (void*)func);
}

/*

=item C<void * Parrot_compile_file(PARROT_INTERP, const char *fullname, STRING
**error)>

Compile code file.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
void *
Parrot_compile_file(PARROT_INTERP, ARGIN(const char *fullname), ARGOUT(STRING **error))
{
    ASSERT_ARGS(Parrot_compile_file)
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

=item C<INTVAL interpinfo(PARROT_INTERP, INTVAL what)>

C<what> specifies the type of information you want about the
interpreter.

=cut

*/

PARROT_EXPORT
INTVAL
interpinfo(PARROT_INTERP, INTVAL what)
{
    ASSERT_ARGS(interpinfo)
    INTVAL ret = 0;
    int j;
    Arenas *arena_base = interp->arena_base;

    switch (what) {
        case TOTAL_MEM_ALLOC:
#ifdef GC_IS_MALLOC
#  if 0
            interp->memory_allocated = mallinfo().uordblks;
#  endif
#endif
            ret = arena_base->memory_allocated;
            break;
        case GC_MARK_RUNS:
            ret = arena_base->gc_mark_runs;
            break;
        case GC_LAZY_MARK_RUNS:
            ret = arena_base->gc_lazy_mark_runs;
            break;
        case GC_COLLECT_RUNS:
            ret = arena_base->gc_collect_runs;
            break;
        case ACTIVE_PMCS:
            ret = arena_base->pmc_pool->total_objects -
                arena_base->pmc_pool->num_free_objects;
            break;
        case ACTIVE_BUFFERS:
            ret = 0;
            for (j = 0; j < (INTVAL)arena_base->num_sized; j++) {
                Small_Object_Pool * const header_pool =
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
                Small_Object_Pool * const header_pool =
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
            ret = arena_base->num_early_gc_PMCs;
            break;
        case EXTENDED_PMCS:
            ret = arena_base->num_extended_PMCs;
            break;
        case CURRENT_RUNCORE:
            ret = interp->run_core;
            break;
        default:        /* or a warning only? */
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
                "illegal argument in interpinfo");
    }
    return ret;
}

/*

=item C<PMC* interpinfo_p(PARROT_INTERP, INTVAL what)>

C<what> specifies the type of information you want about the
interpreter.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC*
interpinfo_p(PARROT_INTERP, INTVAL what)
{
    ASSERT_ARGS(interpinfo_p)
    switch (what) {
        case CURRENT_SUB:
            return CONTEXT(interp)->current_sub;
        case CURRENT_CONT:
            {
            PMC * const cont = CONTEXT(interp)->current_cont;
            if (!PMC_IS_NULL(cont) && cont->vtable->base_type ==
                    enum_class_RetContinuation)
                return VTABLE_clone(interp, cont);
            return cont;
            }
        case CURRENT_OBJECT:
            return CONTEXT(interp)->current_object;
        case CURRENT_LEXPAD:
            return CONTEXT(interp)->lex_pad;
        default:        /* or a warning only? */
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
                "illegal argument in interpinfo");
    }
}

/*

=item C<STRING* interpinfo_s(PARROT_INTERP, INTVAL what)>

Takes an interpreter name and an information type as arguments.
Returns corresponding information strings about the interpreter:
the full pathname, executable name, or the file stem,
(or throws an error exception, if the type is not recognised).
Valid types are EXECUTABLE_FULLNAME, EXECUTABLE_BASENAME,
and RUNTIME_PREFIX.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING*
interpinfo_s(PARROT_INTERP, INTVAL what)
{
    ASSERT_ARGS(interpinfo_s)
    switch (what) {
        case EXECUTABLE_FULLNAME:
        {
            PMC *exe_name = VTABLE_get_pmc_keyed_int(interp, interp->iglobals,
                    IGLOBALS_EXECUTABLE);
            if (PMC_IS_NULL(exe_name))
                return string_from_literal(interp, "");
            return VTABLE_get_string(interp, exe_name);
        }
        case EXECUTABLE_BASENAME:
        {
            STRING *basename;
            PMC    *exe_name = VTABLE_get_pmc_keyed_int(interp,
                                interp->iglobals, IGLOBALS_EXECUTABLE);

            if (PMC_IS_NULL(exe_name))
                return string_from_literal(interp, "");

            else {
                /* Need to strip back to what follows the final / or \. */
                STRING *fullname   = VTABLE_get_string(interp, exe_name);
                char   *fullname_c = Parrot_str_to_cstring(interp, fullname);
                int     pos        = strlen(fullname_c) - 1;

                while (pos              >  0
                &&     fullname_c[pos] != '/'
                &&     fullname_c[pos] != '\\')
                    pos--;

                if (pos > 0)
                    pos++;

                basename = Parrot_str_new(interp, fullname_c + pos, 0);
                mem_sys_free(fullname_c);

                return basename;
            }
        }
        case RUNTIME_PREFIX:
            return Parrot_get_runtime_path(interp);
        default:
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
                "illegal argument in interpinfo");
    }
}

/*

=item C<INTVAL sysinfo_i(PARROT_INTERP, INTVAL info_wanted)>

Returns the system info.

C<info_wanted> is one of:

    PARROT_INTSIZE
    PARROT_FLOATSIZE
    PARROT_POINTERSIZE
    PARROT_INTMAX
    PARROT_INTMIN

In unknown info is requested then -1 is returned.

=cut

*/

PARROT_WARN_UNUSED_RESULT
INTVAL
sysinfo_i(SHIM_INTERP, INTVAL info_wanted)
{
    ASSERT_ARGS(sysinfo_i)
    switch (info_wanted) {
        case PARROT_INTSIZE:
            return sizeof (INTVAL);
        case PARROT_FLOATSIZE:
            return sizeof (FLOATVAL);
        case PARROT_POINTERSIZE:
            return sizeof (void *);
        case PARROT_INTMIN:
            return PARROT_INTVAL_MIN;
        case PARROT_INTMAX:
            return PARROT_INTVAL_MAX;
        default:
            return -1;
    }
}

/*

=item C<STRING * sysinfo_s(PARROT_INTERP, INTVAL info_wanted)>

Returns the system info string.

C<info_wanted> is one of:

    PARROT_OS
    PARROT_OS_VERSION
    PARROT_OS_VERSION_NUMBER
    CPU_ARCH
    CPU_TYPE

If unknown info is requested then an empty string is returned.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING *
sysinfo_s(PARROT_INTERP, INTVAL info_wanted)
{
    ASSERT_ARGS(sysinfo_s)
    switch (info_wanted) {
        case PARROT_OS:
            return Parrot_str_new_constant(interp, BUILD_OS_NAME);
        case PARROT_OS_VERSION:
#ifdef PARROT_HAS_HEADER_SYSUTSNAME
            {
                struct utsname info;
                if (uname(&info) == 0) {
                    return string_make(interp, info.version, strlen(info.version), "ascii", 0);
                }
            }
#endif
            break;
        case PARROT_OS_VERSION_NUMBER:
#ifdef PARROT_HAS_HEADER_SYSUTSNAME
            {
                struct utsname info;
                if (uname(&info) == 0) {
                    return string_make(interp, info.release, strlen(info.version), "ascii", 0);
                }
            }
#endif
            break;
        case CPU_ARCH:
            return string_make(interp, PARROT_CPU_ARCH, sizeof (PARROT_CPU_ARCH) - 1, "ascii", 0);
        case CPU_TYPE:
        default:
            break;
    }
    return string_from_literal(interp, "");
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
