# Copyright (C) 2007-2009, Parrot Foundation.
# $Id$

=head1 Math Operations (continued)

Some math operations have an opcode name, but no simple operator syntax in
PIR. In these cases you can use the opcode name directly.

For a large list of the various mathematical operations supported by Parrot,
see the documentation at F<src/ops/math.ops>.

Some uncommon math operations have opcodes packaged with Parrot but not part of
core. These must be loaded as libraries. see the documentation at
F<src/dynoplibs/math.ops>, F<src/dynoplibs/obscure.ops>.

=cut

.loadlib 'obscure_ops' # fact lives in the obscure dynops lib

.sub main :main
    $N0 = abs -5.0  # the absolute value of -5.0 is 5.0
    print $N0
    print "\n"

    $I1 = fact 5    # the factorial of 5 is 120
    inc $I1         # 120 incremented by 1 is 121
    print $I1
    print "\n"
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

