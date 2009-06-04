=head1 COMMON FUNCTIONS FOR TESTING

=cut

.sub test_parse_loop
    .param pmc hash
    .param int expect_fail

    .local pmc it, key
    .local string vtable, test_result

    it = iter hash
  iter_loop:
    unless it goto iter_done
    key = shift it
    vtable = hash[key]
    test_result = 'test_parse_one'(vtable)
    if expect_fail == 1 goto test_isnt
    is(test_result, '', key)
    goto iter_loop
  test_isnt:
    isnt(test_result, '', key)
    goto iter_loop
  iter_done:
.end


.sub test_parse_one
    .param string vtable
    .local pmc compiler
    compiler = compreg 'VTable'
    push_eh fail
    compiler.'parse'(vtable, 'target'=>'parse')
    pop_eh
    .return ('')

  fail:
    .local pmc ex
    .local string ex_type, ex_msg, ret_val
    .get_results(ex)
    pop_eh
    ex_type = typeof ex
    ex_msg = ex
    ret_val = concat ex_type, ': '
    ret_val = concat ret_val, ex_msg
    .return (ret_val)
.end


.sub get_emitter_and_capture
    .param string source
    .param string target

    .local pmc compiler, emitter, capture
    compiler = compreg 'VTable'
    capture = compiler.'compile'(source, 'target'=> target)

    .return (emitter, capture)
.end


.sub _slurp
    .param string file
    .local pmc pio
    pio  = open file
    $S0  = pio.'readall'()
    close pio
    .return ($S0)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
