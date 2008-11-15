
.HLL 'Forth'
.namespace ['VariableStack']

.sub init :anon :load
    .local pmc class
    class = newclass 'VariableStack'

    addattribute class, '@stack'
    addattribute class, '$next'
.end

.sub init :vtable :method
    .local pmc stack, cell
    stack = new 'ResizableIntegerArray'
    cell  = new 'Integer'
    cell  = 0

    setattribute self, '@stack', stack
    setattribute self, '$next',  cell
.end

.sub get_integer :vtable :method
    .local pmc next
    next = getattribute self, '$next'
    $I0  = next
    inc next
    .return($I0)
.end

.sub get_pmc_keyed_int :vtable :method
    .param int key
    .local pmc stack
    stack = getattribute self, '@stack'

    $P0 = stack[key]
    .return($P0)
.end

.sub set_pmc_keyed_int :vtable :method
    .param int key
    .param pmc value

    .local pmc stack
    stack = getattribute self, '@stack'
    stack[key] = value
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
