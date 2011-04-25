/*
Copyright (C) 2011, Parrot Foundation.

=head1 NAME

src/llvm_extra.c - Extra functions to extend LLVM C API.

=head1 DESCRIPTION

*/

#include "parrot/parrot.h"

#include <llvm/Support/raw_ostream.h>
#include <llvm/Module.h>

#include <llvm-c/Core.h>

/*

=head2 Functions

=over 4

=cut

*/


/* Helper method for LLVMDumpXXXToString() methods. */
template <typename W>
STRING *do_print(PARROT_INTERP, W obj)
{
    std::string s;
    llvm::raw_string_ostream buf(s);
    llvm::unwrap(obj)->print(buf);
    return Parrot_str_from_platform_cstring(interp, s.c_str());
}

PARROT_EXPORT
STRING *Parrot_LLVMDumpModuleToString(PARROT_INTERP, LLVMModuleRef module)
{
    // Unfortunatelly Module.print requires additional
    // llvm::AssemblyAnnotationWriter* without defaulting it to NULL.
    // return do_print(interp, module);
    std::string s;
    llvm::raw_string_ostream buf(s);
    llvm::unwrap(module)->print(buf, NULL);
    return Parrot_str_from_platform_cstring(interp, s.c_str());
}

PARROT_EXPORT
STRING *Parrot_LLVMDumpTypeToString(PARROT_INTERP, LLVMTypeRef type)
{
    return do_print(interp, type);
}

PARROT_EXPORT
STRING *Parrot_LLVMDumpValueToString(PARROT_INTERP, LLVMValueRef value)
{
    return do_print(interp, value);
}


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
