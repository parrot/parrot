# This file contains code relating to field translation.

.HLL '_dotnet', ''

# This gets field info from a field token.
.sub field_info_from_token
    .param pmc assembly
    .param int token
    .local pmc field, memberrefs, memberref, class, ex, typerefs
    .local int test, field_id, sig, class_type, class_id
    .local string ns, tmp

    # Check whether it's internal or external.
    test = band token, 0x8000000
    if test goto EXTERNAL

    # If we're here, it's an internal field. Get field name and signature.
    field_id = band token, 0x1FFFFFF
    field = assembly.get_field(field_id)
    sig = field.get_signature()
    class = field.get_class()
    ns = class.get_fullname()
    goto DONE

    # If we get here, it's an external field. Get member semantics PMC.
EXTERNAL:
    field_id = band token, 0x1FFFFFF
    dec field_id
    memberrefs = assembly.get_memberrefs()
    memberref = memberrefs[field_id]
    class_type = memberref.get_class_type()
    class_id = memberref.get_class_id()
    dec class_id
    if class_type == 1 goto TYPEREF
    ex = new .Exception
    ex["message"] = "Unsupported member reference type for field"
    throw ex

    # If we have a typeref, get it.
TYPEREF:
    typerefs = assembly.get_typerefs()
    class = typerefs[class_id]
    tmp = class.get_namespace()
    ns = clone tmp
    if ns == "" goto NO_DOT
    ns = concat "."
NO_DOT:
    tmp = class
    ns = concat tmp
    field = memberref
    sig = memberref.get_signature()

    # Return stuff.
DONE:
    .return(field, sig, ns)
.end

