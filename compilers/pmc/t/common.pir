=head1 COMMON FUNCTIONS FOR TESTING

=cut

.sub 'test_parse_one'
    .param string file
    $S0 = _slurp(file)
    .local pmc compiler
    compiler = compreg 'PMC'
    push_eh fail
    compiler.'parse'($S0, 'target'=>'parse')
    pop_eh
    ok(1, file)
    .return ()
  fail:
    pop_eh
    ok(0, file)
.end

.sub '_slurp'
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
