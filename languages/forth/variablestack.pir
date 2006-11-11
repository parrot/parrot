
.HLL 'Forth', ''
.namespace ['VariableStack']

.sub init :anon :load
    .local pmc class
    class = newclass 'VariableStack'

    addattribute class, '@stack'
    addattribute class, '$next'
.end

.sub __init :method
    .local pmc stack, cell
    stack = new .ResizableIntegerArray
    cell  = new .Integer
    cell  = 0

    setattribute self, '@stack', stack
    setattribute self, '$next',  cell
.end

.sub __get_integer :method
    .local pmc next
    next = getattribute self, '$next'
    $I0  = next
    inc next
    .return($I0)
.end

.sub __get_pmc_keyed_int :method
    .param int key
    .local pmc stack
    stack = getattribute self, '@stack'

    $P0 = stack[key]
    .return($P0)
.end

.sub __set_pmc_keyed_int :method
    .param int key
    .param pmc value

    .local pmc stack
    stack = getattribute self, '@stack'
    stack[key] = value
.end
