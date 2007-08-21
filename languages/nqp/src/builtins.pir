.namespace

.sub 'print'
    .param pmc list            :slurpy
    .local pmc iter

    iter = new 'Iterator', list
  iter_loop:
    unless iter goto iter_end
    $P0 = shift iter
    print $P0
    goto iter_loop
  iter_end:
    .return (1)
.end


.sub 'say'
    .param pmc list            :slurpy
    'print'(list :flat)
    print "\n"
    .return (1)
.end

.sub 'ok'
    .param pmc    condition
    .param string description :optional
    .param int    has_desc    :opt_flag
    if condition goto it_was_ok
        print "not "
  it_was_ok:
    print "ok "
    $P0 = get_global "$test_counter"
    $P0 += 1
    print $P0
    unless has_desc goto no_description
        print " # "
        print description
  no_description:
    print "\n"
    .return (1)
.end

.sub 'plan'
    .param int quantity
    $P0 = new 'Integer'
    $P0 = 0
    set_global "$test_counter", $P0
    print "1.."
    print quantity
    print "\n"
.end

.sub 'onload' :init :load
    #Initialize on load, in case they do not call plan.
    $P0 = new 'Integer'
    $P0 = 0
    set_global "$test_counter", $P0
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
