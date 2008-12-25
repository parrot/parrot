# Copyright (C) 2006-2008, The Perl Foundation.
# $Id$

=head1 NAME

runtime/wmlsconsole.pir - WMLScript Console library

=head1 DESCRIPTION

See "WMLScript Reference UP.SDK R4.B3 - October 1999".

=head1 FUNCTIONS

=cut

.HLL 'wmlscript'
.loadlib 'wmls_group'
.loadlib 'wmls_ops'


.sub 'getConsole'
    new $P0, 'Hash'

    .const 'Sub' _console_print = '_console_print'
    $P0[0]  = _console_print
    .const 'Sub' _console_println = '_console_println'
    $P0[1]  = _console_println

    .return ($P0)
.end


=head2 C<print(string)>

=head3 DESCRIPTION


=head3 PARAMETERS

string = String

=head3 RETURN VALUE

Number or invalid.

=cut

.sub '_console_print' :anon
    .param pmc str
    .local pmc res
    $I0 = isa str, 'WmlsInvalid'
    if $I0 goto L1
    $S0 = str
    print $S0
    $I0 = length $S0
    box res, $I0
    goto L2
  L1:
    new res, 'WmlsInvalid'
  L2:
    .return (res)
.end


=head2 C<println(string)>

=head3 DESCRIPTION


=head3 PARAMETERS

string = String

=head3 RETURN VALUE

Number or invalid.

=cut

.sub '_console_println' :anon
    .param pmc str
    .local pmc res
    $I0 = isa str, 'WmlsInvalid'
    if $I0 goto L1
    $S0 = str
    say $S0
    $I0 = length $S0
    box res, $I0
    goto L2
  L1:
    new res, 'WmlsInvalid'
  L2:
    .return (res)
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
