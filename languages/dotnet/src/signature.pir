# This file contains code relating to signatures.

# Read a CustomMod.
.sub get_signature_CustomMod
	.param pmc signature
    .param int opt_req
	.local int type_def_or_ref
	
	# Read optional or required flag. Turn it to 1 if it's required, 0 if
	# optional.
	if opt_req == 0x20 goto OPTIONAL
	opt_req = 1
	goto GETDEFREF
OPTIONAL:
	opt_req = 0
GETDEFREF:

	# Read type def or ref.
	type_def_or_ref = signature.read_compressed()
	
	# Return stuff.
	.return (opt_req, type_def_or_ref)
.end


# Read a RetType or a Param
.sub get_signature_RetType_or_Param
	.param pmc signature
	.local int cmod_req, cmod_type_def_or_ref, t1, t2, token, type
	.local pmc ex, ret, elems

	# We return a hash with details of the return type or parameter in it.
	ret = new .Hash

    # Read type token.
	t1 = signature.read_compressed()

	# First see if we have a custom modifier.
    if t1 == 0x1F goto CMOD
    if t1 == 0x20 goto CMOD
    goto NO_CMOD
CMOD:
	(cmod_req, cmod_type_def_or_ref) = get_signature_CustomMod(signature, t1)
    t1 = signature.read_compressed()
NO_CMOD:

	# If it's byref, we've got another one to read.
	if t1 != 0x10 goto NORMALTYPE
	t2 = signature.read_compressed()
	ret["type"] = t2
	ret["byref"] = 1
	goto TYPEREAD
NORMALTYPE:
	ret["type"] = t1
	ret["byref"] = 0
TYPEREAD:

	# For some types we must now read a token.
	type = ret["type"]
	if type < 0x0F goto NOTOKEN
	if type > 0x12 goto NOTOKEN
	token = signature.read_compressed()
	ret["token"] = token
NOTOKEN:

    # For SZ arrays, read their type. Do with a recursive call to this
    # routine.
    if type != 0x1D goto NOSZARRAY
    elems = get_signature_RetType_or_Param(signature)
    annotate_reg_type(elems)
    ret["elements"] = elems
NOSZARRAY:

	# For some we must read a load of array stuff. XXX TO DO
	if type != 0x14 goto NOARRAY
	ex = new .Exception
	ex["_message"] = "Array types not yet implemented."
	throw ex
NOARRAY:

	# For some we must read an entire method signature. XXX TO DO
	if type != 0x1B goto NOFP
	ex = new .Exception
	ex["_message"] = "Function pointer types not yet implemented for arguments."
	throw ex
NOFP:

	# Return generated hash.
	.return (ret)
.end


# Read a Field
.sub get_signature_Field
	.param pmc signature
	.local int cmod_req, cmod_type_def_or_ref, t1, token, type
	.local pmc ex, ret, elems

	# We return a hash with details of the return type or parameter in it.
	ret = new .Hash

	# First need to read a custom modifier.
	#(cmod_req, cmod_type_def_or_ref) = get_signature_CustomMod(signature)
	# XXX We need to do stuff with these. Maybe.

    # First token is always 6.
    t1 = signature.read_compressed()
    if t1 == 6 goto NORMAL
    ex = new .Exception
	ex["_message"] = "Expected a field signature, got something else."
	throw ex
NORMAL:
	
	# Read type token.
	t1 = signature.read_compressed()
	ret["type"] = t1
	ret["byref"] = 0

	# For some types we must now read a token.
	type = ret["type"]
	if type < 0x0F goto NOTOKEN
	if type > 0x12 goto NOTOKEN
	token = signature.read_compressed()
	ret["token"] = token
NOTOKEN:

    # For SZ arrays, read their type.
    if type != 0x1D goto NOSZARRAY
    elems = get_signature_Local(signature) # XXX Slight hack?
    annotate_reg_type(elems)
    ret["elements"] = elems
NOSZARRAY:

	# For some we must read a load of array stuff. XXX TO DO
	if type != 0x14 goto NOARRAY
	ex = new .Exception
	ex["_message"] = "Array types not yet implemented."
	throw ex
NOARRAY:

	# For some we must read an entire method signature. XXX TO DO
	if type != 0x1B goto NOFP
	ex = new .Exception
	ex["_message"] = "Function pointer types not yet implemented."
	throw ex
NOFP:

	# Return generated hash.
	.return (ret)
.end


# Read the part of the signature that specifies the type on an individual
# local variable.
.sub get_signature_Local
	.param pmc signature
	.local int t1, t2, token, type
	.local pmc ex, ret, elems

	# We return a hash with details of the return type or parameter in it.
	ret = new .Hash
	
	# Read type token.
	t1 = signature.read_compressed()
	
	# There's a chance this won't be a type token, but rather a constraint.
	# It can only be the pinned constraint.
	if t1 != 0x45 goto NOTPINNED
	ret["pinned"] = 1
	t1 = signature.read_compressed()
NOTPINNED:

	# If it's byref, we've got another one to read.
	if t1 != 0x10 goto NORMALTYPE
	t2 = signature.read_compressed()
	ret["type"] = t2
	ret["byref"] = 1
	goto TYPEREAD
NORMALTYPE:
	ret["type"] = t1
	ret["byref"] = 0
TYPEREAD:

	# For some types we must now read a token.
	type = ret["type"]
	if type < 0x0F goto NOTOKEN
	if type > 0x12 goto NOTOKEN
	token = signature.read_compressed()
	ret["token"] = token
NOTOKEN:

    # For SZ arrays, read their type.
    if type != 0x1D goto NOSZARRAY
    elems = get_signature_Local(signature)
    annotate_reg_type(elems)
    ret["elements"] = elems
NOSZARRAY:

	# For some we must read a load of array stuff. XXX TO DO
	if type != 0x14 goto NOARRAY
	ex = new .Exception
	ex["_message"] = "Array types not yet implemented."
	throw ex
NOARRAY:

	# For some we must read an entire method signature. XXX TO DO
	if type != 0x1B goto NOFP
	ex = new .Exception
	ex["_message"] = "Function pointer types not yet implemented for locals."
	throw ex
NOFP:

	# Return generated hash.
	.return (ret)
.end


# This routine takes a type and annotates it with the single letter (I, N, S, 
# P)and long # name of the register type that holds it (int, num, string, pmc).
.sub annotate_reg_type
	.param pmc type
	.local int type_num, byref

	# Grab info.
	type_num = type["type"]
	byref = type["byref"]

	# If it's byref, always going to be a reference PMC. Hide type away so the
    # translator sees the reference that it wants to.
	if byref != 1 goto STRING_TYPE
	type["reg_type_short"] = "P"
	type["reg_type_long"] = "pmc"
    type["reg_type_pmc"] = "Undef"
    type["token"] = type_num
    type["type"] = 0x0F
	goto EXIT

	# String type maps to string register.
STRING_TYPE:
	if type_num != 0x0E goto NUM_TYPE
	type["reg_type_short"] = "P"
	type["reg_type_long"] = "pmc"
    type["reg_type_pmc"] = "Undef"
	goto EXIT

	# Number types map to N register.
NUM_TYPE:
	if type_num == 0x0C goto IS_NUM_TYPE
	if type_num == 0x0D goto IS_NUM_TYPE
	goto INT_TYPE
IS_NUM_TYPE:
	type["reg_type_short"] = "N"
	type["reg_type_long"] = "num"
    type["reg_type_pmc"] = "Float"
	goto EXIT

	# Integer types map to I register.
INT_TYPE:
	if type_num < 0x02 goto PMC_TYPE
    if type_num == 0x18 goto IS_INT_TYPE
    if type_num == 0x19 goto IS_INT_TYPE
	if type_num > 0x09 goto PMC_TYPE
IS_INT_TYPE:
	type["reg_type_short"] = "I"
	type["reg_type_long"] = "int"
    type["reg_type_pmc"] = "Integer"
	goto EXIT

	# If we get here, it's a PMC type.
PMC_TYPE:
	type["reg_type_short"] = "P"
	type["reg_type_long"] = "pmc"
    type["reg_type_pmc"] = "Undef"
	
EXIT:
.end

