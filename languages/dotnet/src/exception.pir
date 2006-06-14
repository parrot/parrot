# This file contains code related to translating exception handling.

.HLL '_dotnet', ''

# This generates code that goes before a leave instruction to ensure the
# correct stuff is removed from the exception stack and any finally blocks are
# executed.
.sub handler_leave_code
    .param pmc assembly
    .param pmc ehs
    .param int dest
    .param int pc
    .local int try_start, try_length, try_end, i, num_handlers, mark, flags
    .local int finallys_walked, handler_start, handler_length, handler_end
    .local string pir_output, tmp
    .local pmc eh

    # Loop over handlers.
    num_handlers = elements ehs
    i = 0
    mark = 0
EH_LOOP:
    if i >= num_handlers goto EH_LOOP_END
    eh = ehs[i]

    # Get info about handler.
    flags = eh.get_flags()
    try_start = eh.get_try_offset()
    try_length = eh.get_try_length()
    try_end = try_start + try_length
    handler_start = eh.get_handler_offset()
    handler_length = eh.get_handler_length()
    handler_end = handler_start + handler_length

    # See if we've got to the block we're leaving for. If so, we know the
    # mark to pop to and we've found all finally blocks we need to call.
    if dest < try_start goto EH_LOOP_NEXT
    if pc < try_start goto EH_LOOP_NEXT
    if dest > try_end goto EH_LOOP_NEXT
    mark = i + 1
    goto EH_LOOP_END
EH_LOOP_NEXT:

    # Now check if the current try or handler contains the location we're
    # leaving from. If it does, then we now find stuff we ain't walked
    # over.
    finallys_walked = 1
    if pc < try_start goto TRY_WALKED_OVER
    if pc >= try_end goto TRY_WALKED_OVER
    finallys_walked = 0
TRY_WALKED_OVER:
    if pc < handler_start goto CATCH_WALKED_OVER
    if pc >= handler_end goto CATCH_WALKED_OVER
    finallys_walked = 0
CATCH_WALKED_OVER:

    # If this is a finally handler we need to check if it's one that has
    # not yet been walked over, and if so emit a call to it.
    if flags != 2 goto NOT_FINALLY
    if finallys_walked != 0 goto NOT_FINALLY
    pir_output = concat "$P1000000 = null\nsaved_ehs["
    tmp = i
    pir_output = concat tmp
    pir_output = concat "] = $P1000000\n"
    pir_output = concat "bsr FINALLY_"
    tmp = handler_start
    pir_output = concat tmp
    pir_output = concat "\n"
NOT_FINALLY:
    inc i
    goto EH_LOOP
EH_LOOP_END:

    # Generate mark code.
    tmp = mark
    pir_output = concat "popmark "
    pir_output = concat tmp
    pir_output = concat "\npushmark "
    pir_output = concat tmp
    pir_output = concat "\n"

    # Return generated code.
    .return(pir_output)
.end


# This generates the code that terminates a finally block.
.sub endfinally_code
    .param pmc assembly
    .param pmc ehs
    .param int pc
    .local string pir_output, tmp
    .local pmc eh, ex
    .local int num_handlers, i, found, flags
    .local int handler_start, handler_length, handler_end

    # Look for the entry in the handlers table that relates to the current
    # finally handler.
    num_handlers = elements ehs
    i = 0
    found = -1
EH_LOOP:
    if i >= num_handlers goto EH_LOOP_END
    eh = ehs[i]
    flags = eh.get_flags()
    if flags != 2 goto EH_LOOP_NEXT
    handler_start = eh.get_handler_offset()
    if pc < handler_start goto EH_LOOP_NEXT
    handler_length = eh.get_handler_length()
    handler_end = handler_start + handler_length
    if pc > handler_end goto EH_LOOP_NEXT
    found = i
    goto EH_LOOP_END
EH_LOOP_NEXT:
    inc i
    goto EH_LOOP
EH_LOOP_END:
    
    # If we didn't find the current finally block, we're shafted.
    if found >= 0 goto NOT_SHAFTED
    ex = new .Exception
    ex["_message"] = "Failed to find finally handler for an endfinally"
    throw ex
NOT_SHAFTED:

    # Now just generate the code.
    pir_output = "$P1000000 = saved_ehs["
    tmp = found
    pir_output = concat tmp
    pir_output = concat "]\nif null $P1000000 goto FINALLY_RET_"
    tmp = pc
    pir_output = concat tmp
    pir_output = concat "\nthrow $P1000000\nFINALLY_RET_"
    pir_output = concat tmp
    pir_output = concat ": ret\n"

    # Return produced PIR.
    .return(pir_output)
.end


# This gets info from a class type and class id from an exception handler.
.sub class_info_from_ehtype
    .param pmc assembly
    .param int class_type
    .param int class_id
    .local pmc ex, classes, pclass
    .local string pclass_ns, tmp

    # Find out what type of class we have.
    dec class_id
    if class_type == 2 goto DEF
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
