
.HLL 'Forth'
.namespace ['VirtualStack']

.sub init :anon :load
    .local pmc class
    class = newclass 'VirtualStack'

    addattribute class, '@cstack'
.end

.sub init :vtable :method
    .local pmc cstack
    cstack = new 'ResizableStringArray'
    setattribute self, '@cstack', cstack
.end

.sub elements :vtable :method
    $P0 = getattribute self, '@cstack'
    $I0 = elements $P0
    .return($I0)
.end

.sub get_bool :vtable :method
    $P0 = getattribute self, '@cstack'
    $I0 = elements $P0
    .return($I0)
.end

.sub get_string_keyed_int :vtable :method
    .param int key
    $P0 = getattribute self, '@cstack'
    $S0 = $P0[key]
    .return($S0)
.end

.sub pop_string :vtable :method
    .local pmc cstack
    cstack = getattribute self, '@cstack'

    $I0 = elements cstack
    if $I0 == 0 goto rstack

    $S0 = pop cstack
    .return($S0)

rstack:
    .return("pop stack")
.end

.sub push_string :vtable :method
    .param string elem

    .local pmc cstack
    cstack = getattribute self, '@cstack'
    push cstack, elem

    .return()
.end

.sub consolidate_to_cstack :method
    .local pmc cstack, iter
    cstack = getattribute self, '@cstack'
    .local string code
    code = ""
loop:
    unless cstack goto done
    $S0 = shift cstack
    code .= "    push stack, "
    code .= $S0
    code .= "\n"
    goto loop
done:
    .return(code)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
