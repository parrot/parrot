# Copyright (C) 2007-2012, Parrot Foundation.

=pod

=head1 DESCRIPTION

A tutorial lesson about Parrot's math operations (continued).

=head1 MATH OPERATIONS

Some math operations have an opcode name, but no simple operator syntax in
PIR. In these cases you can use the opcode name directly.

For a large list of the various mathematical operations supported by Parrot,
see the documentation at F<src/ops/math.ops>.

Some uncommon math operations have opcodes packaged with Parrot but not part of
core. These must be loaded as libraries. see the documentation at
F<src/dynoplibs/math.ops>, F<src/dynoplibs/obscure.ops>.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

