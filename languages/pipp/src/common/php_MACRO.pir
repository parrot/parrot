# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_MACRO.pir - PHP API macros

=head1 DESCRIPTION

=head2 Macros

=over 4

=cut

.const int E_ERROR = 0x0001
.const int E_WARNING = 0x0002
.const int E_PARSE = 0x0004
.const int E_NOTICE	= 0x0008
.const int E_CORE_ERROR = 0x0010
.const int E_CORE_WARNING = 0x0020
.const int E_COMPILE_ERROR = 0x0040
.const int E_COMPILE_WARNING = 0x0080
.const int E_USER_ERROR = 0x0100
.const int E_USER_WARNING = 0x0200
.const int E_USER_NOTICE = 0x0400
.const int E_STRICT = 0x0800
.const int E_RECOVERABLE_ERROR = 0x1000

.const int E_ALL = 0x1fff
.const int E_CORE = 0x0030

.macro REGISTER_LONG_CONSTANT(symb, val)
    new $P0, 'PhpInteger'
    set $P0, .val
    set_hll_global .symb, $P0
.endm

.macro REGISTER_STRING_CONSTANT(symb, val)
    new $P0, 'PhpString'
    set $P0, .val
    set_hll_global .symb, $P0
.endm

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
    new $P0, 'PhpNull'
    .return ($P0)
.endm


=item C<.RETURN_RESOURCE( val )>

=cut

.macro RETURN_RESOURCE(val)
    new $P0, 'PhpResource', .val
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
