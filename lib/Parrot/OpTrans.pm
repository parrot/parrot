# Copyright: 2002 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::OpTrans - Transform Op to C Code 

=head1 DESCRIPTION

C<Parrot::OpTrans> is the abstract superclass for the Parrot op to C
transforms. Each transform contains various bits of information needed
to generate the C code, and creates a different type of run loop. The
methods defined here supply various default values and behaviour common
to all transforms.

The subclass hierarchy is as follows:

    OpTrans
       |_________________________
       |           |             |
       C         CGoto       Compiled
       |           |
    CPrederef      |
       |           |
       |___________|
       |           |
    CSwitch       CGP

=head2 Class Methods

=over 4

=cut

use strict;
#use warnings;

package Parrot::OpTrans;

=item C<new()>

Returns a new instance.

=cut

sub new    { return bless { }, shift; }

=back

=head2 Instance Methods

=over 4

=item C<prefix()>

Returns the default "C<Parrot_>" prefix.

=cut

sub prefix { return 'Parrot_'; }

=item C<suffix()>

Returns an empty string.

=cut

sub suffix { return ''; }

=item C<opsarraytype()>

Returns the type for the array of opcodes. By default here it's an array
C<opcode_t>, but the prederef runops core uses an array of C<void*> to
do its clever tricks.

=cut

sub opsarraytype { return 'opcode_t' };

=item C<core_type()>

Raises an exception.

=cut

sub core_type {
    die "OpTrans::XX doesn't have core_type";
}

=item C<gen_goto($where)>

The various C<goto_I<X>> methods below call this method with the return
value of an C<expr_I<X>> method (implemented in subclass).

=cut

sub gen_goto {
    my ($self, $where_str) = @_;
    return "return $where_str";
}

=item C<goto_address($address)>

Transforms the C<goto ADDRESS($address)> macro in an ops file into the
relevant C code.

=cut

sub goto_address {
    my $self = shift;
    return $self->gen_goto($self->expr_address(@_));
}

=item C<goto_offset($offset)>

Transforms the C<goto OFFSET($offset)> macro in an ops file into the
relevant C code.

=cut

sub goto_offset {
    my $self = shift;
    return $self->gen_goto($self->expr_offset(@_));
}

=item C<goto_pop()>

Transforms the C<goto POP($address)> macro in an ops file into the
relevant C code.

=cut

sub goto_pop {
    my ($self) = @_;
    return $self->gen_goto($self->expr_pop(@_));
}

=back

=head1 SEE ALSO

=over 4

=item C<Parrot::OpTrans::C>

=item C<Parrot::OpTrans::CGP>

=item C<Parrot::OpTrans::CGoto>

=item C<Parrot::OpTrans::CPrederef>

=item C<Parrot::OpTrans::CSwitch>

=item C<Parrot::OpTrans::Compiled>

=back

=cut

1;

