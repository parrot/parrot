# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_MACRO.pir - PHP API macros

=head1 DESCRIPTION

=head2 Macros

=over 4

=cut


=item C<.RETURN_BOOL( val )>

=cut

.macro RETURN_BOOL(val)
    new $P0, 'PhpBoolean'
    set $P0, .val
    .return ($P0)
.endm


=item C<.RETURN_DOUBLE( val )>

=cut

.macro RETURN_DOUBLE(val)
    new $P0, 'PhpFloat'
    set $P0, .val
    .return ($P0)
.endm


=item C<.RETURN_EMPTY_STRING()>

=cut

.macro RETURN_EMPTY_STRING()
    new $P0, 'PhpString'
    set $P0, ''
    .return ($P0)
.endm


=item C<.RETURN_FALSE()>

=cut

.macro RETURN_FALSE()
    new $P0, 'PhpBoolean'
    set $P0, 0
    .return ($P0)
.endm


=item C<.RETURN_LONG( val )>

=cut

.macro RETURN_LONG(val)
    new $P0, 'PhpInteger'
    set $P0, .val
    .return ($P0)
.endm


=item C<.RETURN_NULL()>

=cut

.macro RETURN_NULL()
    new $P0, 'PhpUndef'
    .return ($P0)
.endm


=item C<.RETURN_STRING( val )>

=cut

.macro RETURN_STRING(val)
    new $P0, 'PhpString'
    set $P0, .val
    .return ($P0)
.endm


=item C<.RETURN_TRUE()>

=cut

.macro RETURN_TRUE()
    new $P0, 'PhpBoolean'
    set $P0, 1
    .return ($P0)
.endm


=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
