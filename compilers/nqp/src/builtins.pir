# $Id$

.namespace []

=over 4

=item C<print(...)>

Implementing a Perl 6 style print statement.

=cut

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


=item C<say(...)>

Implementing a Perl 6 style say statement, which automatically appends
a newline to the end of what is printed.

=cut

.sub 'say'
    .param pmc list            :slurpy
    .tailcall 'print'(list :flat, "\n")
.end


=item C<infix:,>

Build a list from the arguments sent to the operator.

=cut

.sub 'infix:,'
    .param pmc args            :slurpy
    .local pmc list
    list = new 'ResizablePMCArray'
  args_loop:
    unless args goto end
    $P0 = shift args
    push list, $P0
    goto args_loop
  end:
    .return (list)
.end

=item C<ok(...)>

Internal implementation of the Test::More 'ok'.  It increments
the internal test counter and handles making test output.

=cut

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


=item C<plan(...)>

Internal implementation of the Test::More 'plan'.  It sets the internal
test counter to 0 and outputs the TAP plan line.

=cut

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

=item C<load_bytecode(string)>

=cut

.sub 'load_bytecode'
    .param string str
    load_bytecode str
    .return ()
.end

=item C<sleep(sec)>

=cut

.sub 'sleep'
    .param int sec
    sleep sec
    .return ()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
