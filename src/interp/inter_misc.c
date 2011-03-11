/*
Copyright (C) 2001-2009, Parrot Foundation.

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
#include "parrot/runcore_api.h"
#include "pmc/pmc_callcontext.h"
#include "pmc/pmc_parrotinterpreter.h"
#include "parrot/has_header.h"
#include "imcc/embed.h"

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
    STRING * const method_name = Parrot_str_new_init(interp, name, strlen(name),
        Parrot_default_encoding_ptr, PObj_constant_FLAG|PObj_external_FLAG);

    /* create call func */
    VTABLE_set_pointer_keyed_str(interp, method,
            Parrot_str_new_init(interp, proto, strlen(proto),
                Parrot_default_encoding_ptr, PObj_constant_FLAG|PObj_external_FLAG),
            func);

    /* insert it into namespace */
    VTABLE_set_pmc_keyed_str(interp, interp->vtables[type]->_namespace,
            method_name, method);
}

/*

=item C<void register_native_pcc_method_in_ns(PARROT_INTERP, const int type,
void *func, STRING *name, STRING *signature)>

Create an entry in the C<nci_method_table> for the given raw NCI method
of PMC class C<type>.

=cut

*/

PARROT_EXPORT
void
register_native_pcc_method_in_ns(PARROT_INTERP, const int type, ARGIN(void *func),
        ARGIN(STRING *name), ARGIN(STRING *signature))
{
    ASSERT_ARGS(register_native_pcc_method_in_ns)
    PMC * method = Parrot_pmc_new(interp, enum_class_NativePCCMethod);

    /* setup call func */
    VTABLE_set_pointer_keyed_str(interp, method, signature, func);

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
    STRING * const sc       = CONST_STRING(interp, "PJS");
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

=item C<PMC * Parrot_get_compiler(PARROT_INTERP, STRING *type)>

Get a compiler PMC.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_get_compiler(PARROT_INTERP, ARGIN(STRING *type))
{
    ASSERT_ARGS(Parrot_get_compiler)
    PMC * const  hash = VTABLE_get_pmc_keyed_int(interp, interp->iglobals, IGLOBALS_COMPREG_HASH);

    if (PMC_IS_NULL(hash)) {
        /* No compiler has been registered yet */
        return PMCNULL;
    }

    /* Fetch the compiler */
    return VTABLE_get_pmc_keyed_str(interp, hash, type);
}

/*

=item C<void Parrot_set_compiler(PARROT_INTERP, STRING *type, PMC *compiler)>

Register a parser/compiler PMC.

=cut

*/

PARROT_EXPORT
void
Parrot_set_compiler(PARROT_INTERP, ARGIN(STRING *type), ARGIN(PMC *compiler))
{
    ASSERT_ARGS(Parrot_set_compiler)
    PMC    * const iglobals = interp->iglobals;
    PMC    * hash           = VTABLE_get_pmc_keyed_int(interp, interp->iglobals,
                              IGLOBALS_COMPREG_HASH);

    if (PMC_IS_NULL(hash)) {
        hash = Parrot_pmc_new_noinit(interp, enum_class_Hash);
        VTABLE_init(interp, hash);
        VTABLE_set_pmc_keyed_int(interp, iglobals,
                (INTVAL)IGLOBALS_COMPREG_HASH, hash);
    }

    VTABLE_set_pmc_keyed_str(interp, hash, type, compiler);
}

/*

=item C<PackFile_ByteCode * Parrot_compile_file(PARROT_INTERP, STRING *fullname,
INTVAL is_pasm, STRING **error)>

Compile code file.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PackFile_ByteCode *
Parrot_compile_file(PARROT_INTERP, ARGIN(STRING *fullname), INTVAL is_pasm,
        ARGOUT(STRING **error))
{
    ASSERT_ARGS(Parrot_compile_file)
    PMC *result = NULL;
    UINTVAL regs_used[4] = {3, 3, 3, 3};
    PMC * const newcontext = Parrot_push_context(interp, regs_used);
    STRING * compiler_s = is_pasm ? CONST_STRING(interp, "PASM") : CONST_STRING(interp, "PIR");
    PMC * compiler = Parrot_get_compiler(interp, compiler_s);
    imc_info_t *imcc = (imc_info_t *) VTABLE_get_pointer(interp, compiler);
    PackFile * pf = NULL;

    Parrot_block_GC_mark(interp);
    Parrot_pcc_set_HLL(interp, newcontext, 0);
    Parrot_pcc_set_sub(interp, newcontext, 0);

    imcc_reset(imcc);
    result = imcc_compile_file(imcc, fullname, is_pasm);
    if (PMC_IS_NULL(result)) {
        STRING * const msg = imcc_last_error_message(imcc);
        INTVAL code = imcc_last_error_code(imcc);
        Parrot_ex_throw_from_c_args(interp, NULL, code, "%Ss", msg);
    }
    pf = (PackFile *) VTABLE_get_pointer(interp, result);

    Parrot_pop_context(interp);
    Parrot_unblock_GC_mark(interp);

    return pf->cur_cs;
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
      case TOTAL_MEM_USED:
        ret = Parrot_gc_total_memory_used(interp);
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
        ret = interp->run_core->id;
        break;
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
(or throws an error exception, if the type is not recognized).
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
                STRING * const fullname = VTABLE_get_string(interp, exe_name);
                const int      len      = STRING_length(fullname);
                int            pos;

                for (pos = len - 1; pos > 0; --pos) {
                    const INTVAL c = STRING_ord(interp, fullname, pos);

                    if (c == '/' || c == '\\') {
                        ++pos;
                        break;
                    }
                }

                return Parrot_str_substr(interp, fullname, pos, len - pos);
            }
        }
        case RUNTIME_PREFIX:
            return Parrot_get_runtime_path(interp);
        case GC_SYS_NAME: {
            STRING * name = Parrot_gc_sys_name(interp);
            Parrot_warn_experimental(interp, "GC_SYS_NAME option is experimental");
            return name;
        }
      default:
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
                "illegal argument in interpinfo");
    }
}

/*

=item C<Interp * Parrot_int_get_interp_from_pmc(PMC * interp_pmc)>

C<interp_pmc> is a ParrotInterpreter PMC. Extract the raw C<Interp*> from it
without needing an existing C<Interp *> reference.

Do not use with any other type of PMC.

=cut

*/

PARROT_EXPORT
Interp *
Parrot_int_get_interp_from_pmc(ARGIN(PMC * interp_pmc))
{
    ASSERT_ARGS(Parrot_int_get_interp_from_pmc)
    PARROT_ASSERT(interp_pmc->vtable->base_type == enum_class_ParrotInterpreter);
    return ((Parrot_ParrotInterpreter_attributes*)interp_pmc->data)->interp;
}


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
