# This file contains some of the code that drives the .NET EXE/DLL to PIR
# translation process.

.HLL '_dotnet', ''

# This sub is the way translation from .NET to PIR is started.
.sub dotnet_to_pir
    .param string filename
    .param int continue
    .param int standalone
    .param int trace
    .local string pir_output, src, summary, tmp, emsg
    .local pmc assembly, classes, class_order, type, e, entry_meth, entry_class
    .local int is_dll, i, max_class, class_id, total_types, done_types

    # Instantiate a new assembly class.
    loadlib $P0, "dotnet"
    find_type $I0, "DotNetAssembly"
    assembly = new $I0

    # Set filename and attempt to load.
    assembly = filename
    assembly.load()

    # Load the escaper library, which we will be using.
    load_bytecode "library/Data/Escape.pir"

    # Initialize PIR output string.
    pir_output = ""

    # Output HLL directive.
    pir_output = concat ".HLL 'dotnet', ''\n"

    # Put in ops loader code.
    pir_output = concat <<"PIR"
.loadlib "dotnet_ops"
.sub __LOAD_DOTNET_OPS :load
    loadlib $P0, "dotnet_runtime"
.end
PIR

    # If standalone flag is set, jump over adding import code.
    if standalone == 1 goto NO_IMPORTS
    src = assembly_imports_sub(assembly)
    pir_output = concat src
NO_IMPORTS:

    # Insert code to make call-boxing classes used to make MMD work on the
    # non-reference types Parrot doesn't recognize.
    pir_output = concat <<"PIR"
.sub __CREATE_DOTNET_MMDBOXES :load
    $P0 = getclass "Integer"
    $I0 = find_type "@@DOTNET_MMDBOX_I1"
    if $I0 goto EXISTS_I1
    subclass $P1, $P0, "@@DOTNET_MMDBOX_I1"
EXISTS_I1:
    $I0 = find_type "@@DOTNET_MMDBOX_I2"
    if $I0 goto EXISTS_I2
    subclass $P1, $P0, "@@DOTNET_MMDBOX_I2"
EXISTS_I2:
    $I0 = find_type "@@DOTNET_MMDBOX_U1"
    if $I0 goto EXISTS_U1
    subclass $P1, $P0, "@@DOTNET_MMDBOX_U1"
EXISTS_U1:
    $I0 = find_type "@@DOTNET_MMDBOX_U2"
    if $I0 goto EXISTS_U2
    subclass $P1, $P0, "@@DOTNET_MMDBOX_U2"
EXISTS_U2:
    $I0 = find_type "@@DOTNET_MMDBOX_U4"
    if $I0 goto EXISTS_U4
    subclass $P1, $P0, "@@DOTNET_MMDBOX_U4"
EXISTS_U4:
    $P0 = getclass "Float"
    $I0 = find_type "@@DOTNET_MMDBOX_R4"
    if $I0 goto EXISTS_R4
    subclass $P1, $P0, "@@DOTNET_MMDBOX_R4"
EXISTS_R4:
.end
PIR

    # We'll only put fake System.Object in when we're in standalone mode.
    if standalone == 0 goto NO_STANDALONE_CLASSES
    pir_output = concat <<"PIR"
.namespace [ "System"; "Object" ]
.sub __FAKE_SYSTEM_OBJECT :load
    $I0 = find_type [ "System" ; "Object" ]
    if $I0 goto EXISTS
    $P0 = newclass [ "System" ; "Object" ]
EXISTS:
.end
.sub ".ctor" :method
.end
PIR
NO_STANDALONE_CLASSES:

    # Put in fake temporary System.Exception and System.String.
    pir_output = concat <<"PIR"
.namespace [ "System" ; "Exception" ]
.sub __FAKE_SYSTEM_EXCEPTION :load
    $I0 = find_type [ "System" ; "Exception" ]
    if $I0 goto EXISTS
    $P0 = newclass [ "System" ; "Exception" ]
EXISTS:
.end
.sub ".ctor" :method
.end
.namespace [ "System" ; "String" ]
.sub __FAKE_SYSTEM_STRING :load
    $I0 = find_type [ "System" ; "String" ]
    if $I0 goto EXISTS
    $P0 = newclass [ "System" ; "String" ]
    addattribute $P0, "Chars"
EXISTS:
.end
.sub ".ctor" :method :multi("System.String", string)
    .param string s
    $P0 = new .String
    $P0 = s
    setattribute self, "Chars", $P0
.end
.sub __get_string :method
    $P0 = getattribute self, "Chars"
    $S0 = $P0
    .return($S0)
.end
.namespace [ "System" ; "ValueType" ]
.sub __FAKE_SYSTEM_VALUETYPE :load
    $I0 = find_type [ "System" ; "ValueType" ]
    if $I0 goto EXISTS
    $P0 = newclass [ "System" ; "ValueType" ]
EXISTS:
.end
.namespace [ "System" ; "Enum" ]
.sub __FAKE_SYSTEM_ENUM :load
    $I0 = find_type [ "System" ; "Enum" ]
    if $I0 goto EXISTS
    $P0 = newclass [ "System" ; "Enum" ]
EXISTS:
.end
PIR

    # Translate global stuff.
    # XXX TODO: Translate globals.

    # Translate each class according to the ordering.
    classes = assembly.get_classes()
    class_order = assembly.get_class_order()
    max_class = elements classes
    i = 0
    total_types = 0
    done_types = 0
CLOOP:
    if i >= max_class goto CEND
    inc total_types
    class_id = class_order[i]
    type = classes[class_id]
    if continue == 0 goto NO_EH
    push_eh trans_failure_handler
NO_EH:
    src = trans_class(assembly, type, trace)
    pir_output = concat src
    inc done_types
    if continue == 0 goto RESUME
    clear_eh
RESUME:
    inc i
    goto CLOOP
trans_failure_handler:
    .get_results (e, emsg)
    # Emit trace message.
    unless trace goto NOTRACE
    printerr "  **FAILED** ("
    printerr emsg
    emsg = ""
    printerr ")\n"
NOTRACE:
    goto RESUME
CEND:

    # If it's an EXE, do entry point stuff.
    is_dll = assembly."is_dll"()
    if is_dll > 0 goto ISEXE
    src = pir_output
    entry_meth = assembly.get_entry_method()
    entry_class = entry_meth.get_class()
    pir_output = ".sub __ENTRY_POINT\n__DO_IMPORTS()\n$P0 = get_hll_global \""
    tmp = entry_class.get_fullname()
    pir_output = concat tmp
    pir_output = concat "\", \""
    tmp = entry_meth
    pir_output = concat tmp
    pir_output = concat "\"\n$P0()\n.end\n"
    pir_output = concat src
ISEXE:

    # Generate summary.
    summary = "Translated "
    tmp = done_types
    summary = concat tmp
    summary = concat " types out of "
    tmp = total_types
    summary = concat tmp
    summary = concat " from "
    summary = concat filename
    summary = concat "\n"

    # Return output.
    .return (pir_output, summary)
.end


# This produces a sub that loads libraries that we need to import for this one
# to work.
.sub assembly_imports_sub
    .param pmc assembly
    .local pmc assrefs, assref
    .local int assref_count, i
    .local string name, pir_output

    # Emit start of load sub.
    pir_output = ".sub __DO_IMPORTS :load\n"

    # Loop over assembly refs.
    assrefs = assembly.get_assemblyrefs()
    assref_count = elements assrefs
    i = 0
AR_LOOP:
    if i == assref_count goto AR_LOOP_END
    assref = assrefs[i]
    inc i

    # Get name and emit load code.
    name = assref
    pir_output = concat "load_bytecode \""
    pir_output = concat name
    pir_output = concat ".pbc\"\n"
AR_LOOP_END:

    # Do end and return.
    pir_output = concat ".end\n"
    .return(pir_output)
.end


# This sub translates an individual class.
.sub trans_class
    .param pmc assembly
    .param pmc class
    .param int trace
    .local string pir_output, name, namespace, internal_name, tmp, p_name, name_key
    .local pmc fields, field, methods, meth, ex, int_types, int_ids
    .local int i, max_field, max_method, parent_id, parent_type
    .local int flags, is_interface, is_abstract, num_interfaces, done_init

    done_init = 0
    
    # Get class name and namespace and build combo of them.
    name = class
    namespace = class.get_namespace()
    internal_name = class.get_fullname()

    # Emit trace message.
    unless trace goto NOTRACE
    printerr "Type "
    printerr internal_name
    printerr "\n"
NOTRACE:

    # Emit a namespace directive.
    name_key = namespace_to_key(internal_name)
    pir_output = concat ".namespace "
    pir_output = concat name_key
    pir_output = concat "\n\n"

    # Emit start of on load type setup.
    pir_output = concat ".sub \"__onload\" :load\n"
    pir_output = concat "    .local pmc type, parent\n"
    pir_output = concat "     push_eh FAILED\n" # XXX Ignoring missing parents
    pir_output = concat "    type = newclass "
    pir_output = concat name_key
    pir_output = concat "\n"

    # Add any interfaces that this class implements.
    int_types = class.get_interface_types()
    int_ids = class.get_interface_ids()
    num_interfaces = elements int_types
    i = 0
INT_LOOP:
    if i == num_interfaces goto END_INT_LOOP
    parent_type = int_types[i]
    parent_id = int_ids[i]
    dec parent_id
    (tmp, p_name) = add_parent(assembly, parent_type, parent_id)
    pir_output = concat tmp
    inc i
END_INT_LOOP:

    # Inherit the parent class. Note System.Object has ID 0, and jump over this stuff.
    parent_id = class.get_parent_id()
    if parent_id == 0 goto NO_PARENT
    dec parent_id
    parent_type = class.get_parent_type()
    (tmp, p_name) = add_parent(assembly, parent_type, parent_id)
    pir_output = concat tmp
NO_PARENT:

    # Emit field list.
    fields = class.get_fields()
    max_field = elements fields
    i = 0
FLOOP:
    if i >= max_field goto FEND
    field = fields[i]
    tmp = trans_field(assembly, class, field)
    pir_output = concat tmp
    inc i
    goto FLOOP
FEND:

    # Add code to run constructor.
    pir_output = concat "push_eh FAILED\n"
    pir_output = concat "$P0 = get_hll_global "
    tmp = namespace_to_key(internal_name)
    pir_output = concat tmp
    pir_output = concat ", \".cctor\"\n$P0()\n"

    # This is the end of the on load type setup sub.
    pir_output = concat "FAILED:\n.end\n\n"

    # If it's an interface, emit code to prevent it being instantiated.
    flags = class.get_flags()
    is_interface = band flags, 0x20
    if is_interface == 0 goto NOT_INTERFACE
    pir_output = concat <<"PIR"
.sub __init :method
    $P0 = class self
    $S0 = classname $P0
PIR
    pir_output = concat "    if $S0 != \""
    pir_output = concat internal_name
    pir_output = concat "\" goto INIT_OK\n"
    pir_output = concat <<"PIR"
    $P1 = new .Exception
    $P1["_message"] = "You can not instantiate an interface"
    throw $P1
INIT_OK:
.end
PIR
    done_init = 1
    goto NOT_ABSTRACT
NOT_INTERFACE:

    # If it's an abstract class, emit code to prevent it being instantiated.
    is_abstract = band flags, 0x80
    if is_abstract == 0 goto NOT_ABSTRACT
    pir_output = concat <<"PIR"
.sub __init :method
    $P0 = class self
    $S0 = classname $P0
PIR
    pir_output = concat "    if $S0 != \""
    pir_output = concat internal_name
    pir_output = concat "\" goto INIT_OK\n"
    pir_output = concat <<"PIR"
    $P1 = new .Exception
    $P1["_message"] = "You can not instantiate an abstract class"
    throw $P1
INIT_OK:
.end
PIR
    done_init = 1
NOT_ABSTRACT:

    # If it is a value type, add the __init and __clone v-table methods.
    if p_name == "[ \"System\" ; \"ValueType\" ]" goto VAL_TYPE
    if p_name == "[ \"System\" ; \"Enum\" ]" goto VAL_TYPE
    goto NOT_VAL_TYPE
VAL_TYPE:
    tmp = value_type_methods(assembly, class, p_name)
    pir_output = concat tmp
    done_init = 1
NOT_VAL_TYPE:

    # Emit methods.
    methods = class.get_methods()
    max_method = elements methods
    i = 0
MLOOP:
    if i >= max_method goto MEND
    meth = methods[i]
    tmp = trans_method(assembly, class, meth, 1, trace)
    pir_output = concat tmp
    inc i
    goto MLOOP
MEND:

    # Return PIR that was generated.
    .return (pir_output)
.end


# This emits the code to add a parent to a class.
.sub add_parent
    .param pmc assembly
    .param int parent_type
    .param int parent_id
    .local pmc ex, classes, pclass
    .local string pclass_ns, pir_output, tmp

    # Find out what type of parent we have.
    pir_output = "    parent = getclass "
    if parent_type == 0 goto PARENT_DEF
    if parent_type == 1 goto PARENT_REF
    ex = new .Exception
    ex["_message"] = "Can not subclass a TypeSpec parent."
    throw ex

    # Parent may be a type in this file.
PARENT_DEF:
    dec parent_id # Because row 2 = element 0 here, thanks to the global class
    classes = assembly.get_classes()
    pclass = classes[parent_id]
    pclass_ns = pclass.get_fullname()
    pclass_ns = namespace_to_key(pclass_ns)
    pir_output = concat pclass_ns
    goto PARENT_DONE

    # Parent may be a type in another file.
PARENT_REF:
    classes = assembly.get_typerefs()
    pclass = classes[parent_id]
    pclass_ns = pclass.get_namespace()
    pclass_ns = clone pclass_ns
    if pclass_ns == "" goto PARENT_NO_NS
    pclass_ns = concat "."
PARENT_NO_NS:
    tmp = pclass
    pclass_ns = concat tmp
    pclass_ns = namespace_to_key(pclass_ns)
    pir_output = concat pclass_ns
    
    # Finally, do code to add parent to the class and return.
PARENT_DONE:
    pir_output = concat "\n    addparent type, parent\n"
    .return (pir_output, pclass_ns)
.end


# This translates a field into an addattribute op.
.sub trans_field
    .param pmc assembly
    .param pmc class
    .param pmc field
    .local int flags, static
    .local string pir_output, name

    # Check it's an instance field.
    flags = field.get_flags()
    static = band flags, 0x10
    if static != 0 goto STATIC

    # Generate add attribute instruction provided it's an instance field.
    name = field
    pir_output = "    addattribute type, \""
    pir_output = concat name
    pir_output = concat "\"\n"
    
    # Return generated string.
STATIC:
    .return (pir_output)
.end


# Generate the special __init and __clone v-table methods for value types.
.sub value_type_methods
    .param pmc assembly
    .param pmc class
    .param string parent
    .local pmc fields, field, sig, sig_info
    .local int i, sig_id, type, flags, static
    .local string pir_output, init_body, clone_body, name, sig_data
    .const int ELEMENT_TYPE_I1 = 0x04
    .const int ELEMENT_TYPE_U1 = 0x05
    .const int ELEMENT_TYPE_I2 = 0x06
    .const int ELEMENT_TYPE_U2 = 0x07
    .const int ELEMENT_TYPE_I4 = 0x08
    .const int ELEMENT_TYPE_U4 = 0x09
    .const int ELEMENT_TYPE_R4 = 0x0C
    .const int ELEMENT_TYPE_R8 = 0x0D
    .const int ELEMENT_TYPE_I = 0x18
    .const int ELEMENT_TYPE_U = 0x19
    .const int ELEMENT_TYPE_VALUETYPE = 0x11

    # The __init method needs to zero or null out any attributes.
    # The __clone method needs to clone each attribute.
    fields = class.get_fields()
    i = elements fields
    init_body = ""
    clone_body = ""
ILOOP:
    if i == 0 goto ILOOP_END
    dec i
    field = fields[i]
    
    # Skip if field is static.
    flags = field.get_flags()
    static = band flags, 0x10
    if static != 0 goto ILOOP
    
    # For clone, emit code to just copy the attribute.
    name = field
    clone_body = concat "$P0 = getattribute self, \""
    clone_body = concat name
    clone_body = concat "\"\n$P0 = clone $P0\nsetattribute cpy, \""
    clone_body = concat name
    clone_body = concat "\", $P0\n"
    
    # Need to look at signature to initialize attributes by type.
    sig_id = field.get_signature()
    sig_data = assembly.get_blob(sig_id)
    sig = new "DotNetSignature"
    sig = sig_data
    sig_info = get_signature_Field(sig)
    type = sig_info["type"]
    if type == ELEMENT_TYPE_I4 goto INT_TYPE
    if type == ELEMENT_TYPE_U4 goto INT_TYPE
    if type == ELEMENT_TYPE_I2 goto INT_TYPE
    if type == ELEMENT_TYPE_U2 goto INT_TYPE
    if type == ELEMENT_TYPE_I1 goto INT_TYPE
    if type == ELEMENT_TYPE_U1 goto INT_TYPE
    if type == ELEMENT_TYPE_I goto INT_TYPE
    if type == ELEMENT_TYPE_U goto INT_TYPE
    if type == ELEMENT_TYPE_R4 goto FLOAT_TYPE
    if type == ELEMENT_TYPE_R8 goto FLOAT_TYPE
    if type == ELEMENT_TYPE_VALUETYPE goto VALUE_TYPE
    goto OBJ_TYPE

INT_TYPE:
    init_body = concat "$P0 = new .Integer\n$P0 = 0\nsetattribute self, \""
    init_body = concat name
    init_body = concat "\", $P0\n"
    goto DONE_INIT

FLOAT_TYPE:
    init_body = concat "$P0 = new .Float\n$P0 = 0.0\nsetattribute self, \""
    init_body = concat name
    init_body = concat "\", $P0\n"
    goto DONE_INIT

OBJ_TYPE:
    init_body = concat "$P0 = null\nsetattribute self, \""
    init_body = concat name
    init_body = concat "\", $P0\n"
    goto DONE_INIT

VALUE_TYPE:
    $P0 = new .Exception
    $P0["_message"] = "Not doing nested value types yet!"
    throw $P0
    goto DONE_INIT

    # Next.
DONE_INIT:
    goto ILOOP
ILOOP_END:

    # Build the code.
    pir_output = ".sub __init :method\n"
    pir_output = concat init_body
    pir_output = concat <<"PIR"
.end
.sub __clone :method
.local pmc cpy
$P0 = class self
$P1 = classname $P0
cpy = new $P1
PIR
    pir_output = concat clone_body
    pir_output = concat ".return(cpy)\n.end\n"

    # If we have an enum, provide get and set integer and float v-table
    # methods to provide or hand back first field. This is for supporting
    # enums.
    if parent != "[ \"System\" ; \"Enum\" ]" goto NOT_ENUM
    pir_output = concat <<"PIR"
.sub __get_integer
    .param pmc s
    $P0 = getattribute s, "value__"
    $I0 = $P0
    .return($I0)
.end
.sub __set_integer_native
    .param pmc s
    .param int i
    $P0 = new Integer
    $P0 = i
    setattribute s, "value__", $P0
.end
.sub __get_number
    .param pmc s
    $P0 = getattribute s, "value__"
    $N0 = $P0
    .return($N0)
.end
.sub __set_number_native
    .param pmc s
    .param float i
    $P0 = new Float
    $P0 = i
    setattribute s, "value__", $P0
.end
PIR
NOT_ENUM:

    # Return generated code.
    .return(pir_output)
.end


# Takes a .Net namespace separated by dots and makes a Parrot namespace key.
.sub namespace_to_key
    .param string in_ns
    .local string ns_key, tmp
    .local pmc keys
    .local int i, max

    # Initial bracket of key.
    ns_key = "[ "

    # Split up and make key sequence.
    keys = split ".", in_ns
    max = elements keys
    i = 0
LOOP:
    if i == max goto LOOP_END
    if i == 0 goto NO_SC
    ns_key = concat "; "
NO_SC:
    tmp = keys[i]
    ns_key = concat "\""
    ns_key = concat tmp
    ns_key = concat "\" "
    inc i
    goto LOOP
LOOP_END:

    # End and return key.
    ns_key = concat "]"
    .return(ns_key)
.end
