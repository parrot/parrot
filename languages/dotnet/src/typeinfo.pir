# This file contains code relating to transforming stack type state info as it
# is being tracked.

.HLL '_dotnet', ''

# This migrates the type of an argument being stored to the argument itself.
.sub typeinfo_starg
    .param pmc ptypes
    .param pmc stypes
    .param int i
    .local pmc new_type
    .local int s
    
    # Get type describing hash to store.
    s = elements stypes
    dec s
    new_type = stypes[s]
    
    # Set updated type info in place.
    ptypes[i] = new_type
.end

# This migrates the type of a local being stored to the local itself.
.sub typeinfo_stloc
    .param pmc ltypes
    .param pmc stypes
    .param int i
    .local pmc new_type, old_type, ex
    .local int s, ot, nt
    
    # Get type describing hash to store.
    s = elements stypes
    dec s
    new_type = stypes[s]

    # Set updated type info in place.
    #ltypes[i] = new_type
.end

# This sets the destination type for a binary arithmetic or logical op.
.sub typeinfo_bin_num_op
    .param pmc stypes
    .param pmc dtypes
    .local int i, type
    .local pmc in_a, in_b
    .local string rtype
    .const int ELEMENT_TYPE_I8 = 0x0A
	.const int ELEMENT_TYPE_U8 = 0x0B
	.const int ELEMENT_TYPE_I = 0x18
	.const int ELEMENT_TYPE_U = 0x19
    .const int ELEMENT_TYPE_CLASS = 0x12

    # Get type hashes for inputs.
    i = elements stypes
    dec i
    in_a = stypes[i]
    dec i
    in_b = stypes[i]

    # If either operand is a native value, the result is native. If it's a
    # value type, it's an integer (XXX should it be?) Otherwise, it's just
    # what one of the operands is.
    type = in_a["type"]
    if type == ELEMENT_TYPE_I goto NATIVE_a
    if type == ELEMENT_TYPE_U goto NATIVE_a
    if type == ELEMENT_TYPE_CLASS goto NATIVE_a
    if type == ELEMENT_TYPE_I8 goto NATIVE_a
    if type == ELEMENT_TYPE_U8 goto NATIVE_a
    rtype = in_a["reg_type_short"]
    if rtype == "P" goto ENUM_TYPE
    type = in_b["type"]
    if type == ELEMENT_TYPE_I goto NATIVE_b
    if type == ELEMENT_TYPE_U goto NATIVE_b
    rtype = in_b["reg_type_short"]
    if rtype == "P" goto ENUM_TYPE
    dtypes[0] = in_a
    goto END
NATIVE_a:
    dtypes[0] = in_a
    goto END
NATIVE_b:
    dtypes[0] = in_b
    goto END
ENUM_TYPE:
    $P0 = new .Hash
    $P0["type"] = ELEMENT_TYPE_I
    $P0["byref"] = 0
    annotate_reg_type($P0)
    dtypes[0] = $P0
END:
.end

# This handles the case where we're doing a binary op that expects two integer
# or number operands, but one is a valuetype (and thus almost certainly an
# enum).
.sub fix_enum_operands
    .param pmc stypes
    .param string stack0
    .param string stack1
    .local string pir_output, rt1, rt2
    .local pmc t1, t2
    .local int i, tt1, tt2
    .const int ELEMENT_TYPE_VALUETYPE = 0x11

    # See what types we have.
    i = elements stypes
    dec i
    t1 = stypes[i]
    tt1 = t1["type"]
    rt1 = t1["reg_type_short"]
    dec i
    t2 = stypes[i]
    tt2 = t2["type"]
    rt2 = t2["reg_type_short"]

    # Handle various cases where we'd need to fix things up.

    # Integer, Enum
    if rt1 != "I" goto RULE2
    if rt2 != "P" goto RULE2
#    if tt2 != ELEMENT_TYPE_VALUETYPE goto RULE2
    pir_output = "$I1000000 = "
    pir_output = concat stack1
    pir_output = concat "\n"
    stack1 = "$I1000000"
    goto DONE

    # Enum, Integer
RULE2:
    if rt1 != "P" goto RULE3
#    if tt1 != ELEMENT_TYPE_VALUETYPE goto RULE3
    if rt2 != "I" goto RULE3
    pir_output = "$I1000000 = "
    pir_output = concat stack0
    pir_output = concat "\n"
    stack0 = "$I1000000"
    goto DONE

    # Float, Enum
RULE3:
    if rt1 != "N" goto RULE4
    if rt2 != "P" goto RULE4
#    if tt2 != ELEMENT_TYPE_VALUETYPE goto RULE4
    pir_output = "$N1000000 = "
    pir_output = concat stack1
    pir_output = concat "\n"
    stack1 = "$N1000000"
    goto DONE

    # Enum, Float
RULE4:
    if rt1 != "P" goto RULE5
#    if tt1 != ELEMENT_TYPE_VALUETYPE goto RULE5
    if rt2 != "N" goto RULE5
    pir_output = "$N1000000 = "
    pir_output = concat stack0
    pir_output = concat "\n"
    stack0 = "$N1000000"
    goto DONE

    # Enum, Enum. XXX This is nasty - it could be underlying num or int. We'll
    # assume int for now.
RULE5:
    if rt1 != "P" goto DONE
    if tt1 != ELEMENT_TYPE_VALUETYPE goto DONE
    if rt2 != "P" goto DONE
    if tt2 != ELEMENT_TYPE_VALUETYPE goto DONE
    pir_output = "$I1000000 = "
    pir_output = concat stack0
    pir_output = concat "\n$I1000001 = "
    pir_output = concat stack1
    pir_output = concat "\n"
    stack0 = "$I1000000"
    stack1 = "$I1000001"
    goto DONE

    # Return.
DONE:
    .return(pir_output, stack0, stack1)
.end
