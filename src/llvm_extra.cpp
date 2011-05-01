/*
Copyright (C) 2011, Parrot Foundation.

=head1 NAME

src/llvm_extra.c - Extra functions to extend LLVM C API.

=head1 DESCRIPTION

*/

#include "parrot/parrot.h"

#include <llvm/Support/raw_ostream.h>
#include <llvm/Module.h>
#include <llvm/TypeSymbolTable.h>

#include <llvm-c/Core.h>

/*

=head2 Functions

=over 4

=cut

*/


/* Helper method for LLVMDumpXXXToString() methods. */
template <typename T, typename O>
void do_print(T ptr, O &buf)
{
    ptr->print(buf);
}

template <typename O>
void do_print(llvm::Module *ptr, O &buf)
{
    ptr->print(buf, NULL);
}


template <typename Type>
STRING *dump_to_string(PARROT_INTERP, Type obj)
{
    std::string s;
    llvm::raw_string_ostream buf(s);
    do_print(llvm::unwrap(obj), buf);
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

Extract declared types from Module as Hash (name -> type)

*/

PARROT_EXPORT
PMC*
Parrot_LLVMGetTypeNames(PARROT_INTERP, LLVMModuleRef M) {
    llvm::TypeSymbolTable &TST = llvm::unwrap(M)->getTypeSymbolTable();
    PMC *res = Parrot_pmc_new(interp, enum_class_Hash);

    llvm::TypeSymbolTable::iterator I = TST.begin();
    while (I != TST.end()) {
        STRING *name  = Parrot_str_new_init(interp, I->first.c_str(), I->first.length(),
                                        Parrot_binary_encoding_ptr, 0);
        /* Better to create LLVM::Type here */
        PMC    *value = Parrot_pmc_new(interp, enum_class_UnManagedStruct);
        VTABLE_set_pointer(interp, value, (void*)I->second);

        VTABLE_set_pmc_keyed_str(interp, res, name, value);

        ++I;
    }

    return res;
}



/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
