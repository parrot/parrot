package Regex::Rewrite::Stackless;
use base 'Regex::Rewrite';
use Regex::RegexOps;
use Regex::AsmOps;
use strict;

# Stackless engines work rather differently, and so I completely
# changed the function signatures and everything.
#
# rewrite : (optree, lastback) -> (back, ops...)
#
# where $lastback is the previous backtracking point that we should
# jump to if matching $op fails; $back is the backtracking point that
# can be returned to within the processing of the current $op to fix
# up the partial state and possibly attempt another match, or just
# abort and return to $lastback.
#

sub init {
    my ($self, @args) = @_;
    $self->SUPER::init(@args);
    my $FAIL = $self->mark("FAIL");
    $self->{_labels}{'fail'} = $FAIL;
}

sub rewrite_accept {
    my ($self, $R, $lastback) = @_;
    return $self->rewrite($R, $lastback);
}

sub rewrite_try {
    my ($self, $R, $lastback) = @_;
    return $self->rewrite($R, $lastback);
}

sub rewrite_other {
    my ($self, $op, $lastback) = @_;
    return bless [ @$op, $lastback ], 'asm_op';
}

###################### New stuff ###################

# Most rewrite rules will declare a fallback point, and also jump back
# to the previous fallback point on failure. So this threads all the
# fallback points together.
sub rewrite_seq {
    my $self = shift;
    my $fallback = pop;

    my @ops;
    foreach (@_) {
        my ($back, @rewritten) = $self->rewrite($_, $fallback);
        push @ops, @rewritten;
        $fallback = $back;
    }

    return ($fallback, @ops);
}

sub rewrite {
    my ($self, $op, $lastback) = @_;

    if (ref($op) eq 'regex_op') {
        my ($opname, @args) = @$op;
        my $method = "rewrite_$opname";
        if ($self->can($method)) {
            return $self->$method(@args, $lastback);
        } else {
            return ($lastback, $self->rewrite_other($op, $lastback));
        }
    } elsif (ref($op) eq 'asm_op') {
        return ($lastback, $op);
    } else {
        $DB::single = 1;
        die "malformed op $op: should be blessed regex_op or asm_op";
    }
}

sub run {
    my ($self, $tree) = @_;

    my (undef, @ops) = $self->rewrite($tree, $self->{_labels}{fail});

    foreach my $temp_reg (values %{ $self->{_temps} }) {
        unshift @ops, aop_push_reg($temp_reg);
        push @ops, aop_pop_reg($temp_reg);
    }

    push @ops, aop_terminate();

    return @ops;
}

1;
