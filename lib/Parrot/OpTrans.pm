#
# OpTrans.pm
#
# $Id$
#

use strict;
#use warnings;

package Parrot::OpTrans;

sub new    { return bless { }, shift; }
sub prefix { return 'Parrot_'; }
sub suffix { return ''; }
# The type for the array of opcodes. Usually it's an array opcode_t, but the
# prederef runops core uses an array of void* to do its clever tricks.
sub opsarraytype { return 'opcode_t' };

# Default implementation of the goto_X methods is gen_goto(expr_X())
#
sub core_type {
    die "OpTrans::XX doesn't have core_type";
}

sub gen_goto {
    my ($self, $where_str) = @_;
    return "return $where_str";
}

sub goto_address {
    my $self = shift;
    return $self->gen_goto($self->expr_address(@_));
}

sub goto_offset {
    my $self = shift;
    return $self->gen_goto($self->expr_offset(@_));
}

sub goto_pop {
    my ($self) = @_;
    return $self->gen_goto($self->expr_pop(@_));
}

#############################################
# ops2c code generation functions
#


1;

