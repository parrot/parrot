# This file contains code relating to method translation.

.HLL '_dotnet', ''

# This is the starting point for translating a method.
.sub trans_method
	.param pmc assembly
	.param pmc class
	.param pmc meth
	.param int real_method
    .param int trace
	.local pmc rettype, ptypes, ltypes, ex
	.local string pir_output, name, pir_params, pir_multi, pir_locals, pir_body, ns
    .local int flags, impl_flags, static_check, abstract_check, runtime_check

    # Check if method is static, abstract and/or runtime provided.
    flags = meth.get_flags()
    impl_flags = meth.get_impl_flags()
    static_check = band flags, 0x10
    abstract_check = band flags, 0x0400
    runtime_check = band impl_flags, 0x1002 # Internal or runtime

    # Get details of parameter info and multi-method dispatch markup.
    ns = class.get_fullname()
	(rettype, ptypes, pir_params, pir_multi) = trans_method_params(assembly, meth, ns)
    
	# Emit top of method.
	pir_output = ".sub \""
	name = meth
	pir_output = concat name
	pir_output = concat "\""
	if real_method == 0 goto ISMETHOD
    if static_check == 0 goto ISMETHOD
    goto ENDTOPSTUB
ISMETHOD:
	pir_output = concat " :method"
ENDTOPSTUB:
    pir_output = concat " :multi("
    pir_output = concat pir_multi
	pir_output = concat ")\n"

    # Emit trace message.
    unless trace goto NOTRACE
    printerr "  Method "
    printerr name
    printerr "\n"
NOTRACE:

    # If it is runtime provided, try to get body and add it, then go to end.
    if runtime_check == 0 goto NOT_RUNTIME
    pir_body = internal_method_body(class, meth)
    pir_output = concat pir_body
    goto METHOD_END
NOT_RUNTIME:

    # Add in parameters.
	pir_output = concat pir_params

    # If it's an abstract method, need to throw an exception if it's called
    # then not bother with locals, the instruction translator etc.
    if abstract_check == 0 goto NOT_ABSTRACT
    pir_output = concat <<"PIR"
$P0 = new .Exception
$P0["_message"] = "Ooh, naughty! A non-abstract class didn't implement an abstract method!"
throw $P0
PIR
    goto METHOD_END
NOT_ABSTRACT:

	# Locals.
	(ltypes, pir_locals) = trans_method_locals(assembly, meth)
	pir_output = concat pir_locals

    # Need to set arg0 = self if it's an instance method.
    if static_check != 0 goto NOSELF
    pir_output = concat ".local pmc arg0\narg0 = self\n"
NOSELF:

	# Body.
	pir_body = trans_instructions(assembly, class, meth, ptypes, ltypes, rettype, trace)
	pir_output = concat pir_body

	# Emit end of method.
METHOD_END:
	pir_output = concat ".end\n\n"
	
	# Return generated string.
	.return (pir_output)
.end


# This translates the method parameters signature.
.sub trans_method_params
	.param pmc assembly
	.param pmc meth
    .param string self_ns
    .param int no_pir :optional
	.local int sig_pos, sig_type
	.local string sig_data
	.local pmc signature, classes, class, ex
	.local int flags, param_count, i, static_check, this_offset, type, token
    .local int class_type, class_id, explicit_check, vararg_check
	.local string pir_output, pir_multi, pir_mmdunbox, param_reg_type, tmp
	.local pmc rettype, ptypes, ptype

	# Get signature.
	sig_pos = meth.get_signature()
	sig_data = assembly.get_blob(sig_pos)
	sig_type = find_type "DotNetSignature"
	signature = new sig_type
	signature = sig_data

	# Get flags.
	flags = signature.read_uint8()
    
    # Check if it's a static method, has this specified explicitly or is
    # var arg.
    static_check = band flags, 0x20
    explicit_check = band flags, 0x40
    vararg_check = band flags, 0x7

	# Get number of parameters.
	param_count = signature.read_compressed()

	# Return type.
	rettype = get_signature_RetType_or_Param(signature)
	annotate_reg_type(rettype)

	# Create parameter types array.
	ptypes = new .ResizablePMCArray

    # If it's an instance method and explicit not set, add "this" to the list.
    this_offset = 0
    pir_multi = ""
    if static_check == 0 goto NOSELF
    if explicit_check != 0 goto NOSELF
	ptype = new Hash
	ptype["type"] = 0x1C
	ptype["byref"] = 0
	annotate_reg_type(ptype)
	push ptypes, ptype
    this_offset = 1

    # Also generate MMD entry.
    self_ns = namespace_to_key(self_ns)
    pir_multi = concat self_ns
NOSELF:

	# Loop over parameters and produce list.
	i = 0
	pir_output = ""
    pir_mmdunbox = ""
PARAM:
	if i >= param_count goto ENDPARAM
	
	# Emit first bit of PIR.
	pir_output = concat "    .param "
	
	# Parameter type.
	ptype = get_signature_RetType_or_Param(signature)
	annotate_reg_type(ptype)
	push ptypes, ptype
	param_reg_type = ptype["reg_type_long"]
	pir_output = concat param_reg_type

	# Emit argument name.
	pir_output = concat " arg"
	$I0 = i + this_offset
	$S0 = $I0
	pir_output = concat $S0
	pir_output = concat "\n"

    # Emit MMD info.
    if pir_multi == "" goto NOCOMMA
    pir_multi = concat ", "
NOCOMMA:
    type = ptype["type"]
    if type == 0x12 goto MMD_CLASS
    if type == 0x4 goto MMD_I1
    if type == 0x5 goto MMD_U1
    if type == 0x6 goto MMD_I2
    if type == 0x7 goto MMD_U2
    if type == 0x9 goto MMD_U4
    if type == 0xC goto MMD_R4
    pir_multi = concat param_reg_type
    goto MMD_DONE
MMD_CLASS:
    token = ptype["token"]
    class_type = band token, 0x3
    class_id = token >> 2
    dec class_id
    if class_type == 0 goto MMD_CLASS_DEF
    if class_type == 1 goto MMD_CLASS_REF
    ex = new .Exception
    ex["_message"] = "Unknown class type to build MMD signature for."
    throw ex
MMD_CLASS_DEF:
    classes = assembly.get_classes()
    dec class_id
    class = classes[class_id]
    tmp = class.get_fullname()
    tmp = namespace_to_key(tmp)
    pir_multi = concat tmp
    goto MMD_DONE
MMD_CLASS_REF:
    classes = assembly.get_typerefs()
    class = classes[class_id]
    tmp = class
    tmp = namespace_to_key(tmp)
    pir_multi = concat tmp
    goto MMD_DONE
MMD_I1:
    pir_multi = concat "\"@@DOTNET_MMDBOX_I1\""
    goto MMD_DONE
MMD_U1:
    pir_multi = concat "\"@@DOTNET_MMDBOX_U1\""
    goto MMD_DONE
MMD_I2:
    pir_multi = concat "\"@@DOTNET_MMDBOX_I2\""
    goto MMD_DONE
MMD_U2:
    pir_multi = concat "\"@@DOTNET_MMDBOX_U2\""
    goto MMD_DONE
MMD_U4:
    pir_multi = concat "\"@@DOTNET_MMDBOX_U4\""
    goto MMD_DONE
MMD_R4:
    pir_multi = concat "\"@@DOTNET_MMDBOX_R4\""
    goto MMD_DONE
MMD_DONE:
	
	# Loop.
	inc i
	goto PARAM
ENDPARAM:

    # If it's var arg, add slurply parameter too.
    if vararg_check != 5 goto NOT_VARARG
    pir_output = concat ".param pmc varargs :slurpy\n"
NOT_VARARG:

	# Return stuff.
    pir_output = concat pir_mmdunbox
	.return(rettype, ptypes, pir_output, pir_multi)
.end


# This translates the method's locals signature.
.sub trans_method_locals
	.param pmc assembly
	.param pmc meth
	.local int sig_pos, sig_type
	.local string sig_data
	.local pmc bc, signature, ex
	.local int sig_type, count, i, type
	.local string pir_output :unique_reg
    .local string param_reg_type
	.local pmc ltypes, ltype

	pir_output = ""
	ltypes = new .ResizablePMCArray

	# Get signature.
	bc = meth.get_bytecode()
	sig_pos = bc.get_locals_sig()
	if sig_pos == 0 goto EXIT
	sig_data = assembly.get_blob(sig_pos)
	sig_type = find_type "DotNetSignature"
	signature = new sig_type
	signature = sig_data

	# Ensure it's a local sig. XXX Right thing to do when it's not?
	sig_type = signature.read_uint8()
	if sig_type == 0x7 goto SIG_OK
    ex = new .Exception
    ex["_message"] = "Locals signature is not a locals signature."
    throw ex
SIG_OK:

	# Read locals count.
	count = signature.read_compressed()

	# Loop over local variabless.
	i = 0
LOCAL:
	if i == count goto EXIT

	# Emit first bit of PIR.
	pir_output = concat "    .local "
	
	# Parameter type.
	ltype = get_signature_Local(signature)
	annotate_reg_type(ltype)
	push ltypes, ltype
	param_reg_type = ltype["reg_type_long"]
	pir_output = concat param_reg_type

	# Emit argument name.
	pir_output = concat " local"
	$S0 = i
	pir_output = concat $S0
	pir_output = concat "\n"

    # If it's a value type, need to instantiate it.
    type = ltype["type"]
    if type != 0x11 goto NOT_VT
    type = ltype["token"]
    pir_output = concat "local"
	pir_output = concat $S0
	pir_output = concat " = new "
    ($P0, $S0) = class_info_from_sig(assembly, type)
    $S0 = namespace_to_key($S0)
    pir_output = concat $S0
    pir_output = concat "\n"
NOT_VT:
	
	# Loop.
	inc i
	goto LOCAL

	# Return.
EXIT:
	.return (ltypes, pir_output)
.end


# This gets method info from a method token.
.sub method_info_from_token
    .param pmc assembly
    .param int token
    .local pmc class, meth, memberrefs, memberref, rettype, ptypes
    .local pmc typerefs, ex
    .local int test, meth_id, class_type, class_id
    .local string ns, tmp

    # Check whether it's internal or external.
    test = band token, 0x8000000
    if test goto EXTERNAL

    # If we're here, it's an internal method. Get method PMC, namespace, parse
    # its sig etc.
    meth_id = band token, 0x1FFFFFF
    meth = assembly.get_method(meth_id)
    class = meth.get_class()
    ns = class.get_fullname()
    (rettype, ptypes, tmp) = trans_method_params(assembly, meth, ns)
    goto DONE

    # If we get here, it's an external method. Get member semantics PMC.
EXTERNAL:
    meth_id = band token, 0x1FFFFFF
    dec meth_id
    memberrefs = assembly.get_memberrefs()
    memberref = memberrefs[meth_id]
    class_type = memberref.get_class_type()
    class_id = memberref.get_class_id()
    dec class_id
    if class_type == 1 goto TYPEREF
    if class_type == 3 goto METHODDEF
    ex = new .Exception
    ex["message"] = "Unsupported member reference type for method"
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
    (rettype, ptypes, tmp) = trans_method_params(assembly, memberref, ns)
    meth = memberref
    goto DONE

    # If we have a methoddef, grab it.
METHODDEF:
    meth = assembly.get_method(class_id)
    class = meth.get_class()
    ns = class.get_fullname()
    (rettype, ptypes, tmp) = trans_method_params(assembly, meth, ns)
    goto DONE

    # Return stuff.
DONE:
    .return(meth, ns, rettype, ptypes, class)
.end


# This generates code to box up primitive types for MMD dispatch.
.sub method_call_mmd_box
    .param pmc assembly
    .param pmc ptypes
    .param pmc params
    .local pmc ptype
    .local string pir_output, box_name, tmp, reg_name
    .local int i, num_params, type

    # Loop over parameters.
    pir_output = ""
    i = 0
    num_params = elements params
PLOOP:
    if i == num_params goto PLOOP_END

    # Get parameter type and see if it's one that needs boxing, and if so
    # what the box is called.
    ptype = ptypes[i]
    type = ptype["type"]
    if type == 0x4 goto MMD_I1
    if type == 0x5 goto MMD_U1
    if type == 0x6 goto MMD_I2
    if type == 0x7 goto MMD_U2
    if type == 0x9 goto MMD_U4
    if type == 0xC goto MMD_R4
    goto NO_MMD
MMD_I1:
    box_name = "@@DOTNET_MMDBOX_I1"
    goto DO_MMD
MMD_U1:
    box_name = "@@DOTNET_MMDBOX_U1"
    goto DO_MMD
MMD_I2:
    box_name = "@@DOTNET_MMDBOX_I2"
    goto DO_MMD
MMD_U2:
    box_name = "@@DOTNET_MMDBOX_U2"
    goto DO_MMD
MMD_U4:
    box_name = "@@DOTNET_MMDBOX_U4"
    goto DO_MMD
MMD_R4:
    box_name = "@@DOTNET_MMDBOX_R4"
    goto DO_MMD

    # Now generate box instruction and rename parameter.
DO_MMD:
    reg_name = "$P200000"
    tmp = i
    reg_name = concat tmp
    pir_output = concat reg_name
    pir_output = concat " = new \""
    pir_output = concat box_name
    pir_output = concat "\"\n"
    pir_output = concat reg_name
    pir_output = concat " = "
    tmp = params[i]
    pir_output = concat tmp
    pir_output = concat "\n"
    params[i] = reg_name

    # Go to next parameter.
NO_MMD:
    inc i
    goto PLOOP
PLOOP_END:

    # Return generated PIR.
    .return(pir_output)
.end


# This gets info from a type def or ref in a signature.
.sub class_info_from_sig
    .param pmc assembly
    .param int token
    .local pmc ex, classes, pclass
    .local string pclass_ns, tmp
    .local int class_type, class_id

    # Get class type and class id.
    class_id = token >> 2
    class_type = band token, 3

    # Find out what type of class we have.
    dec class_id
    if class_type == 0 goto DEF
    if class_type == 1 goto REF
    ex = new .Exception
    ex["_message"] = "Unknown class type."
    throw ex

    # A type in this file.
DEF:
    dec class_id # Because row 2 = element 0 here, thanks to the global class
    classes = assembly.get_classes()
    pclass = classes[class_id]
    pclass_ns = pclass.get_fullname()
    goto DONE

    # A type in another file.
REF:
    classes = assembly.get_typerefs()
    pclass = classes[class_id]
    pclass_ns = pclass.get_namespace()
    pclass_ns = clone pclass_ns
    if pclass_ns == "" goto NO_NS
    pclass_ns = concat "."
NO_NS:
    tmp = pclass
    pclass_ns = concat tmp
    
    # Return class and its namespace.
DONE:
    .return (pclass, pclass_ns)
.end
