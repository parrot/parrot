package Regex::Rewrite::Stackless;
use base 'Regex::Rewrite';
use Regex::Ops::Tree;
use Regex::Ops::List;
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

*aop = *Regex::Rewrite::aop;
*rop = *Regex::Rewrite::rop;

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

# This is much complicated by the need to delete groups that are backtracked
# through.
sub rewrite_group {
    my ($self, $R, $group, $lastback) = @_;
    my $doit = $self->mark("group");
    my $back = $self->mark("group_back");

    my ($R_back, @R_ops) = $self->rewrite($R, $back);

    my @ops = (         aop('goto', [ $doit ]),
	       $back => aop('delete', [ $group ]),
	                aop('goto', [ $lastback ]),
	       $doit => aop('start', [ $group ]),
	                @R_ops,
	                aop('end', [ $group ]),
	       );

    return ($R_back, @ops);
}

sub rewrite_other {
    my ($self, $op, $lastback) = @_;
    return aop($op->{name}, [ @{ $op->{args} }, $lastback ]);
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

    if (UNIVERSAL::isa($op, 'Regex::Ops::Tree')) {
        my $method = "rewrite_" . $op->{name};
        if ($self->can($method)) {
            return $self->$method(@{ $op->{args} }, $lastback);
        } else {
            return ($lastback, $self->rewrite_other($op, $lastback));
        }
    } elsif (UNIVERSAL::isa($op, "Regex::Ops::List")) {
        return ($lastback, $op);
    } else {
        $DB::single = 1;
        die "malformed op $op";
    }
}

sub run {
    my ($self, $tree) = @_;

    my (undef, @ops) = $self->rewrite($tree, $self->{_labels}{fail});

    foreach my $temp_reg (values %{ $self->{_temps} }) {
        unshift @ops, aop('push_reg', [ $temp_reg ]);
        push @ops, aop('pop_reg', [ $temp_reg ]);
    }

    push @ops, aop('terminate');

    return @ops;
}

1;
