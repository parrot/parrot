# Copyright (C) 2008-2009, Parrot Foundation.
# $Id$

=head1

say.pir -- simple implementation of a say function

=cut

.namespace []

.sub 'say'
    .param pmc args            :slurpy
    .local pmc iter
    iter = new 'Iterator', args
  iter_loop:
    unless iter goto iter_end
    $P0 = shift iter
    print $P0
    goto iter_loop
  iter_end:
    print "\n"
    .return ()
.end

.sub 'printf'
    .param pmc format
    .param pmc args   :slurpy
    .local pmc iter
    iter = new 'Iterator', args
  iter_loop:
    unless iter goto iter_end
    goto iter_loop
  iter_end:
.end

.sub 'puts'
    .param pmc str
    print str
    print "\n"
.end

.sub 'infix:<'
    .param pmc a
    .param pmc b
    islt $I0, a, b
    .return ($I0)
.end

.sub 'postfix:++'
    .param pmc arg
    $P0 = clone arg
    inc $P0
    .return (arg)
.end

.sub 'postfix:--'
    .param pmc arg
    $P0 = clone arg
    dec $P0
    .return (arg)
.end

.sub 'prefix:++'
    .param pmc arg
    inc arg
    .return (arg)
.end

.sub 'prefix:--'
    .param pmc arg
    dec arg
    .return (arg)
.end



# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

