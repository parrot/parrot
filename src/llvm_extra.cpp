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
template <typename Type>
STRING *dump_to_string(PARROT_INTERP, Type obj)
{
    std::string s;
    llvm::raw_string_ostream buf(s);
    llvm::unwrap(obj)->print(buf);
    return Parrot_str_from_platform_cstring(interp, s.c_str());
}

template <>
STRING *dump_to_string(PARROT_INTERP, LLVMModuleRef obj)
{
    std::string s;
    llvm::raw_string_ostream buf(s);
    llvm::unwrap(obj)->print(buf, NULL);
    return Parrot_str_from_platform_cstring(interp, s.c_str());
}

PARROT_EXPORT
STRING *Parrot_LLVMDumpModuleToString(PARROT_INTERP, LLVMModuleRef module)
{
    return dump_to_string(interp, module);
}

PARROT_EXPORT
STRING *Parrot_LLVMDumpTypeToString(PARROT_INTERP, LLVMTypeRef type)
{
    return dump_to_string(interp, type);
}

PARROT_EXPORT
STRING *Parrot_LLVMDumpValueToString(PARROT_INTERP, LLVMValueRef value)
{
    return dump_to_string(interp, value);
}


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
