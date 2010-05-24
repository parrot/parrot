# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

runtime/parrot/library/Instrument/Probe.pir - A class to automate the task of creating probes for instruments.

=head1 SYNOPSIS

    # Create a catchall probe which will be called for
    #  each op.
    probe = new ['Instrument';'Probe';'Catchall']
    probe.'set_callback'('catchall_callback')
    probe.'set_finalize'('catchall_finalize')
    
    # Create a probe that will be called whenever the
    #  specified ops are encountered.
    probe2 = new ['Instrument';'Probe']
    probe2.'inspect'('lt')
    probe2.'inspect'('gt')
    probe2.'set_callback'('specific_callback')
    probe2.'set_finalize'('specific_finalize')

=head2 TODO
1. Refactor, too much copy and paste for now.

=cut


=head2 Class Instrument;Probe

Class Instrument;Probe creates a probe who's callback will be called
when the specified ops are encountered during execution.

=cut
.namespace ['Instrument';'Probe']

.sub '' :anon :init :load
    .local pmc class

    class = newclass ['Instrument';'Probe']
    addattribute class, 'instr_obj'
    addattribute class, 'callback'
    addattribute class, 'ops_unprocessed'
    addattribute class, 'ops_processed'
    addattribute class, 'enabled'
    addattribute class, 'finalize'

    .return()
.end

=item init

=cut

.sub 'init' :vtable :method
    .local pmc instr_pmc, callback, ops_u, ops_p, enabled

    # Probe is still unattached to an Instrument object.
    # This attribute will be set by the Instrument object
    #  when the probe is attached to it.
    instr_pmc = new ['Undef']
    setattribute self, 'instr_obj', instr_pmc
    
    # Callback is still undefined.
    callback = new ['Undef']
    setattribute self, 'callback', callback
    
    # Ops is an empty Hash
    ops_u = new ['Hash']
    ops_p = new ['Hash']
    setattribute self, 'ops_unprocessed', ops_u
    setattribute self, 'ops_processed', ops_p
    
    # Enabled is a Boolean.
    # Each probe is initially disabled
    enabled = new ['Boolean']
    enabled = 0
    setattribute self, 'enabled', enabled

.end

=item inspect

=cut

.sub 'inspect' :method
    .param pmc ops
    .local pmc ops_attr
    ops_attr = getattribute self, 'ops_unprocessed'
    
    # ops can be either:
    # 1. String : Identify an op through a string.
    # 2. Integer: Identify an op through the op number.
    # 3. ResizableIntegerArray: A group of op numbers.
    # 4. ResizableStringArray: A group of op names.
    #
    # Anything other than these types are rejected.
    .local string type
    type = typeof ops

    if type == 'String' goto T_STR
    if type == 'Integer' goto T_INT
    if type == 'ResizableIntegerArray' goto T_ARR
    if type == 'ResizableStringArray' goto T_ARR
    
    # If we get here, it is an unknown type.
    # Throw an exception.
    .local pmc ex
    .local string msg
    msg = 'Unknown type: '
    msg .= type
    
    ex = new ['Exception']
    ex = msg
    throw ex

T_STR:
T_INT:
    # Given either the op name or the op number,
    #  we do nothing other than stashing it into
    #  the ops attribute. When the probe is enabled,
    #  the ops attribute is inspected and hooks are
    #  inserted based on the contents of that hash.
    # Each entry into the hash is simply given a boolean
    #  value.
    # Validation of the op's name or number is done
    #  when the probe is enabled.
    ops_attr[ops] = 1
    .return()

T_ARR:
    # Iterate through the array and stash the current
    #  value into the ops_attr hash.
    .local pmc it, cur
    it = iter ops
    
T_ARR_BEG:

    unless it goto T_ARR_END
    
    cur = shift it
    ops_attr[cur] = 1

    goto T_ARR_BEG
    
T_ARR_END:
    .return()

.end

=item set_callback

=cut

.sub 'set_callback' :method
    .param pmc sub
    .local pmc ex
    .local string msg
    # If sub is of type string, we need to lookup
    #  the symbol in the namespace.
    .local string type

CHECK:
    type = typeof sub
        
    if type == 'String' goto LOOKUP
    if type == 'Sub' goto SET
    
    # If we reached here, we couldn't find the
    #  symbol or a bad parameter was passed in.
    msg = 'Unknown type of callback: '
    msg .= type

EXC:    
    ex = new ['Exception']
    ex = msg
    throw ex

LOOKUP:
    # Lookup the symbol in the namespace
    # (Not sure if this is foolproof)
    .local string name
    name = sub
    
    # Try relative namespace
    sub = get_global name
    $I0 = defined sub
    if $I0 goto CHECK
    
    # Try HLL namespace
    sub = get_hll_global name
    $I0 = defined sub
    if $I0 goto CHECK
    
    # Try root namespace
    sub = get_root_global name
    $I0 = defined sub
    if $I0 goto CHECK

    # Cannot find the symbol!
    msg = 'Could not find symbol '
    msg .= name
    msg .= '.'
    
    goto EXC

SET:
    # Set the attribute callback and return.
    setattribute self, 'callback', sub
    .return()
.end

=item set_finalize

=cut

.sub 'set_finalize' :method
    .param pmc sub
    .local pmc ex
    .local string msg
    # If sub is of type string, we need to lookup
    #  the symbol in the namespace.
    .local string type

CHECK:
    type = typeof sub
        
    if type == 'String' goto LOOKUP
    if type == 'Sub' goto SET
    
    # If we reached here, we couldn't find the
    #  symbol or a bad parameter was passed in.
    msg = 'Unknown type of callback: '
    msg .= type

EXC:    
    ex = new ['Exception']
    ex = msg
    throw ex

LOOKUP:
    # Lookup the symbol in the namespace
    # (Not sure if this is foolproof)
    .local string name
    name = sub
    
    # Try relative namespace
    sub = get_global name
    $I0 = defined sub
    if $I0 goto CHECK
    
    # Try HLL namespace
    sub = get_hll_global name
    $I0 = defined sub
    if $I0 goto CHECK
    
    # Try root namespace
    sub = get_root_global name
    $I0 = defined sub
    if $I0 goto CHECK

    # Cannot find the symbol!
    msg = 'Could not find symbol '
    msg .= name
    msg .= '.'
    
    goto EXC

SET:
    # Set the attribute callback and return.
    setattribute self, 'finalize', sub
    .return()
.end

=item enable

=cut

.sub 'enable' :method
    .local pmc instr_attr, ops_u_attr, ops_p_attr, en_attr, cb_attr
    .local pmc it, key
    .local string msg, type, op_name
    .local int op_num

    instr_attr = getattribute self, 'instr_obj'
    ops_u_attr = getattribute self, 'ops_unprocessed'
    ops_p_attr = getattribute self, 'ops_processed'
    en_attr    = getattribute self, 'enabled'
    cb_attr    = getattribute self, 'callback'
    
    # Check to see if we are already enabled.
    if en_attr == 1 goto ENABLE_DONE
    
    # Check to see if the instr_pmc attribute
    #  has been set. if not we cannot do anything.
    msg  = 'Probe is not attached to an Instrument. Could not enable'
    type = typeof instr_attr
    
    if type != 'Instrument' goto EXCEP
    
    # Process the unprocessed ops in ops_u_attr.
    
    # Because we simply dump in both integers
    #  and string into the hash, first we get
    #  the key from the iterator, then we force
    #  it to be a string, then we try to convert it
    #  to an integer.
    # If it fails to get converted into an integer,
    #  op_num will be 0. Check if op_num == 0, then we
    #  need to lookup the name by querying instr_attr.

    it = iter ops_u_attr

UNPROC_BEG:
    unless it goto UNPROC_DONE
    
    key = shift it
    op_name = key
    op_num  = op_name
    
UNPROC_CHECK:
    # Check if the op is really 0
    if op_num == 0 goto OPS_LOOKUP

    # If we can convert op_name to op_num, that means that
    #  the op passed was by number. So we do not need to care
    #  about variants.
    # Put this op into the processed hash, with the value
    #  being a reference to the callback pmc.
    # TODO: Ensure that the value is not duplicated. Check how Hash works.
    ops_p_attr[op_num] = cb_attr
  
UNPROC_LOOKUPED:

    goto UNPROC_BEG

UNPROC_DONE:
ENABLE_DONE:

    # All unprocessed ops are done at this point.
    # Pass ops_p_attr to the instrument pmc for hooking.
    instr_attr.'insert_op_hooks'(ops_p_attr)

    # We are done with enabling.
    # Set the enabled attribute and return.
    en_attr = 1
    setattribute self, 'enabled', en_attr
    
    .return()
    

EXCEP:
    # Throw an exception with the message
    #  in msg.
    .local pmc ex
    ex = new ['Exception']
    ex = msg
    throw ex

OPS_LOOKUP:
    # Lookup the op number from op_name
    # This will return an array, so for each element
    #  in the array, insert it into ops_p_attr.
    .local pmc query_ret, op_lu_it, op_lu_cur

    query_ret = instr_attr.'op_query'(0, op_name)
    op_lu_it = iter query_ret

OPS_LOOKUP_BEG:
    unless op_lu_it goto OPS_LOOKUP_END

    op_lu_cur = shift op_lu_it
    op_num = op_lu_cur
    
    ops_p_attr[op_num] = cb_attr
    
    goto OPS_LOOKUP_BEG

OPS_LOOKUP_END:

    goto UNPROC_LOOKUPED
    
.end

=item disable

=cut

.sub 'disable' :method
.end


=head2 Class Instrument;Probe;Catchall

Class Instrument;Probe;Catchall creates a probe who's callback is called
for all ops encountered during execution

=cut

.namespace ['Instrument';'Probe';'Catchall']

.sub '' :anon :init :load
    .local pmc class

    class = newclass ['Instrument';'Probe';'Catchall']
    addattribute class, 'instr_obj'
    addattribute class, 'callback'
    addattribute class, 'enabled'
    addattribute class, 'finalize'

    .return()
.end

=item init

=cut

.sub 'init' :vtable :method
    .local pmc instr_pmc, callback, ops_u, ops_p, enabled

    # Probe is still unattached to an Instrument object.
    # This attribute will be set by the Instrument object
    #  when the probe is attached to it.
    instr_pmc = new ['Undef']
    setattribute self, 'instr_obj', instr_pmc
    
    # Callback is still undefined.
    callback = new ['Undef']
    setattribute self, 'callback', callback
    
    # Enabled is a Boolean.
    # Each probe is initially disabled
    enabled = new ['Boolean']
    enabled = 0
    setattribute self, 'enabled', enabled

.end

=item set_callback

=cut

.sub 'set_callback' :method
    .param pmc sub
    .local pmc ex
    .local string msg
    # If sub is of type string, we need to lookup
    #  the symbol in the namespace.
    .local string type

CHECK:
    type = typeof sub
        
    if type == 'String' goto LOOKUP
    if type == 'Sub' goto SET
    
    # If we reached here, we couldn't find the
    #  symbol or a bad parameter was passed in.
    msg = 'Unknown type of callback: '
    msg .= type

EXC:    
    ex = new ['Exception']
    ex = msg
    throw ex

LOOKUP:
    # Lookup the symbol in the namespace
    # (Not sure if this is foolproof)
    .local string name
    name = sub
    
    # Try relative namespace
    sub = get_global name
    $I0 = defined sub
    if $I0 goto CHECK
    
    # Try HLL namespace
    sub = get_hll_global name
    $I0 = defined sub
    if $I0 goto CHECK
    
    # Try root namespace
    sub = get_root_global name
    $I0 = defined sub
    if $I0 goto CHECK

    # Cannot find the symbol!
    msg = 'Could not find symbol '
    msg .= name
    msg .= '.'
    
    goto EXC

SET:
    # Set the attribute callback and return.
    setattribute self, 'callback', sub
    .return()
.end

=item set_finalize

=cut

.sub 'set_finalize' :method
    .param pmc sub
    .local pmc ex
    .local string msg
    # If sub is of type string, we need to lookup
    #  the symbol in the namespace.
    .local string type

CHECK:
    type = typeof sub
        
    if type == 'String' goto LOOKUP
    if type == 'Sub' goto SET
    
    # If we reached here, we couldn't find the
    #  symbol or a bad parameter was passed in.
    msg = 'Unknown type of callback: '
    msg .= type

EXC:    
    ex = new ['Exception']
    ex = msg
    throw ex

LOOKUP:
    # Lookup the symbol in the namespace
    # (Not sure if this is foolproof)
    .local string name
    name = sub
    
    # Try relative namespace
    sub = get_global name
    $I0 = defined sub
    if $I0 goto CHECK
    
    # Try HLL namespace
    sub = get_hll_global name
    $I0 = defined sub
    if $I0 goto CHECK
    
    # Try root namespace
    sub = get_root_global name
    $I0 = defined sub
    if $I0 goto CHECK

    # Cannot find the symbol!
    msg = 'Could not find symbol '
    msg .= name
    msg .= '.'
    
    goto EXC

SET:
    # Set the attribute callback and return.
    setattribute self, 'finalize', sub
    .return()
.end

=item enable

=cut

.sub 'enable' :method
    .local pmc instr_attr, en_attr, cb_attr
    .local string msg, type

    instr_attr = getattribute self, 'instr_obj'
    en_attr    = getattribute self, 'enabled'
    cb_attr    = getattribute self, 'callback'
    
    # Check to see if we are already enabled.
    if en_attr == 1 goto ENABLE_DONE
    
    # Check to see if the instr_pmc attribute
    #  has been set. if not we cannot do anything.
    msg  = 'Probe is not attached to an Instrument. Could not enable'
    type = typeof instr_attr
    
    if type != 'Instrument' goto EXCEP
    
ENABLE_DONE:

    # Catchall hooks are treated separate from specific hooks.
    # They are called first too.
    instr_attr.'insert_op_catchall'(cb_attr)

    # We are done with enabling.
    # Set the enabled attribute and return.
    en_attr = 1
    setattribute self, 'enabled', en_attr
    
    .return()
    

EXCEP:
    # Throw an exception with the message
    #  in msg.
    .local pmc ex
    ex = new ['Exception']
    ex = msg
    throw ex
    
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
