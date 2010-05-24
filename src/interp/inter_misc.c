/*
Copyright (C) 2001-2009, Parrot Foundation.
$Id$

=head1 NAME

src/interp/inter_misc.c - Parrot Interpreter miscellaneous functions

=head1 DESCRIPTION

NCI function setup, compiler registration, C<interpinfo>, and C<sysinfo> opcodes.

=head2 Functions

=over 4

=cut

*/


#include "parrot/parrot.h"
#include "inter_misc.str"
#include "../compilers/imcc/imc.h"
#include "parrot/runcore_api.h"
#include "pmc/pmc_callcontext.h"

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
    PMC    * const method      = Parrot_pmc_new(interp, enum_class_NCI);
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
*func, STRING *name)>

Create an entry in the C<nci_method_table> for the given raw NCI method
of PMC class C<type>.

=cut

*/

PARROT_EXPORT
void
register_raw_nci_method_in_ns(PARROT_INTERP, const int type, ARGIN(void *func),
        ARGIN(STRING *name))
{
    ASSERT_ARGS(register_raw_nci_method_in_ns)
    PMC    * const method      = Parrot_pmc_new(interp, enum_class_NCI);

    /* setup call func */
    VTABLE_set_pointer(interp, method, func);

    /* insert it into namespace */
    VTABLE_set_pmc_keyed_str(interp, interp->vtables[type]->_namespace,
            name, method);
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
    PMC    *const pmc_true = Parrot_pmc_new_init_int(interp, enum_class_Integer, 1);
    PMC    *const method   = VTABLE_get_pmc_keyed_str(
        interp, interp->vtables[type]->_namespace, str_name);
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
Parrot_compreg(PARROT_INTERP, ARGIN(STRING *type), ARGIN(Parrot_compiler_func_t func))
{
    ASSERT_ARGS(Parrot_compreg)
    PMC    * const iglobals = interp->iglobals;
    PMC    * const nci      = Parrot_pmc_new(interp, enum_class_NCI);
    STRING * const sc       = CONST_STRING(interp, "PJt");
    PMC    * hash           = VTABLE_get_pmc_keyed_int(interp, interp->iglobals,
                              IGLOBALS_COMPREG_HASH);

    if (PMC_IS_NULL(hash)) {
        hash = Parrot_pmc_new_noinit(interp, enum_class_Hash);
        VTABLE_init(interp, hash);
        VTABLE_set_pmc_keyed_int(interp, iglobals,
                (INTVAL)IGLOBALS_COMPREG_HASH, hash);
    }

    VTABLE_set_pmc_keyed_str(interp, hash, type, nci);

    /* build native call interface for the C sub in "func" */
    VTABLE_set_pointer_keyed_str(interp, nci, sc, (void *)func);
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

/*

=item C<INTVAL interpinfo(PARROT_INTERP, INTVAL what)>

C<what> specifies the type of information you want about the interpreter.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
interpinfo(PARROT_INTERP, INTVAL what)
{
    ASSERT_ARGS(interpinfo)
    INTVAL ret;

    switch (what) {
      case TOTAL_MEM_ALLOC:
        ret = Parrot_gc_total_memory_allocated(interp);
        break;
      case GC_MARK_RUNS:
        ret = Parrot_gc_count_mark_runs(interp);
        break;
      case GC_LAZY_MARK_RUNS:
        ret = Parrot_gc_count_lazy_mark_runs(interp);
        break;
      case GC_COLLECT_RUNS:
        ret = Parrot_gc_count_collect_runs(interp);
        break;
      case ACTIVE_PMCS:
        ret = Parrot_gc_active_pmcs(interp);
        break;
      case ACTIVE_BUFFERS:
        ret = Parrot_gc_active_sized_buffers(interp);
        break;
      case TOTAL_PMCS:
        ret = Parrot_gc_total_pmcs(interp);
        break;
      case TOTAL_BUFFERS:
        ret = Parrot_gc_total_sized_buffers(interp);
        break;
      case HEADER_ALLOCS_SINCE_COLLECT:
        ret = Parrot_gc_headers_alloc_since_last_collect(interp);
        break;
      case MEM_ALLOCS_SINCE_COLLECT:
        ret = Parrot_gc_mem_alloc_since_last_collect(interp);
        break;
      case TOTAL_COPIED:
        ret = Parrot_gc_total_copied(interp);
        break;
      case IMPATIENT_PMCS:
        ret = Parrot_gc_impatient_pmcs(interp);
        break;
      case CURRENT_RUNCORE:
        {
            STRING *name = interp->run_core->name;

            if (Parrot_str_equal(interp, name, CONST_STRING(interp, "slow")))
                return PARROT_SLOW_CORE;
            else if (Parrot_str_equal(interp, name, CONST_STRING(interp, "fast")))
                return PARROT_FAST_CORE;
            else if (Parrot_str_equal(interp, name, CONST_STRING(interp, "switch")))
                return PARROT_EXEC_CORE;
            else if (Parrot_str_equal(interp, name, CONST_STRING(interp, "gc_debug")))
                return PARROT_GC_DEBUG_CORE;
            else if (Parrot_str_equal(interp, name, CONST_STRING(interp, "debugger")))
                return PARROT_DEBUGGER_CORE;
            else if (Parrot_str_equal(interp, name, CONST_STRING(interp, "profiling")))
                return PARROT_PROFILING_CORE;
        }
      default:        /* or a warning only? */
        ret = -1;
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
PARROT_CANNOT_RETURN_NULL
PMC*
interpinfo_p(PARROT_INTERP, INTVAL what)
{
    ASSERT_ARGS(interpinfo_p)

    PMC *result;
    switch (what) {
      case CURRENT_SUB:
        result = Parrot_pcc_get_sub(interp, CURRENT_CONTEXT(interp));
        break;
      case CURRENT_CONT:
        result = Parrot_pcc_get_continuation(interp, CURRENT_CONTEXT(interp));
        break;
      case CURRENT_OBJECT:
        result = Parrot_pcc_get_object(interp, CURRENT_CONTEXT(interp));
        break;
      case CURRENT_LEXPAD:
        result = Parrot_pcc_get_lex_pad(interp, CURRENT_CONTEXT(interp));
        break;
      default:        /* or a warning only? */
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
                "illegal argument in interpinfo");
    }

    /* Don't send NULL values to P registers */
    return result ? result : PMCNULL;
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
        case EXECUTABLE_FULLNAME: {
            PMC * const exe_name = VTABLE_get_pmc_keyed_int(interp, interp->iglobals,
                    IGLOBALS_EXECUTABLE);
            if (PMC_IS_NULL(exe_name))
                return CONST_STRING(interp, "");
            return VTABLE_get_string(interp, exe_name);
        }
        case EXECUTABLE_BASENAME: {
            PMC    * const exe_name = VTABLE_get_pmc_keyed_int(interp,
                                interp->iglobals, IGLOBALS_EXECUTABLE);

            if (PMC_IS_NULL(exe_name))
                return CONST_STRING(interp, "");

            else {
                /* Need to strip back to what follows the final / or \. */
                STRING * const fullname   = VTABLE_get_string(interp, exe_name);
                char   * const fullname_c = Parrot_str_to_cstring(interp, fullname);
                int            pos        = strlen(fullname_c) - 1;
                STRING *basename;

                while (pos              >  0
                &&     fullname_c[pos] != '/'
                &&     fullname_c[pos] != '\\')
                    --pos;

                if (pos > 0)
                    ++pos;

                basename = Parrot_str_new(interp, fullname_c + pos, 0);
                Parrot_str_free_cstring(fullname_c);

                return basename;
            }
        }
        case RUNTIME_PREFIX:
            return Parrot_get_runtime_path(interp);
        case GC_SYS_NAME: {
            STRING * name = Parrot_gc_sys_name(interp);
            return name;
        }
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
PARROT_CONST_FUNCTION
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
    return CONST_STRING(interp, "");
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
