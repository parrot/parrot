package Regex::Rewrite;
use Regex::Ops::Tree;
use Regex::Ops::List;
use strict;

sub new {
    my ($proto, %opts) = @_;
    my $self = bless \%opts, (ref($proto) || $proto);
    $self->init();
    return $self;
}

sub init {
    my $self = shift;
    $self->{_markers} = {};
    $self->{_temp_int_count} = 0;
}

sub aop {
    Regex::Ops::List->op(@_);
}

sub mark {
    my ($self, $desc) = @_;
    $desc ||= '';
    my $number = ++$self->{_markers}->{$desc};
    $number = '' if ($number == 1) && ($desc ne '');
    return Regex::Ops::List->mark("\@$desc$number");
}

sub alloc_temp_int {
    my ($self, $name) = @_;
    my $NUM_REGISTERS = 32; # ?
    $name ||= "_temp_int_" . $self->{_temp_int_count};
    my $register = "I" . $self->{_temp_int_count};

    if (++$self->{_temp_int_count} > $NUM_REGISTERS) {
        # I betcha live region detection would be better...
        die "Too many temporaries requested! Implement register spilling!";
    }

    $self->{_temps}{$name} = $register;
    return $register;
}

sub get_temp {
    my ($self, $name) = @_;
    return $self->{_temps}->{$name} || die "Requested unallocated temporary!";
}

######################## Default rewrite rules #######################

sub rewrite_terminate {
    my ($self, $R) = @_;
    return $R, aop('goto', [ $self->{_return} ]);
}

sub rewrite_goto {
    my ($self, $R, $lastback) = @_;
    return aop('goto', [ $R ]) if $R->{name} eq 'LABEL';
    return $self->rewrite($R, $lastback);
}

sub rewrite_test {
    my ($self, $op1, $test, $op2, $dest, $lastback) = @_;
    my $continue = $self->mark('after_test');
    my $rev_test = { "==" => "!=",
		     "!=" => "==",
		     "<" => ">=",
		     ">" => "<=",
		     "<=" => ">",
		     ">=" => "<",
		 }->{$test};

    if ($dest->{name} eq 'goto') {
        return aop('if', [ $op1, $test, $op2, $dest->[1] ]);
    } elsif ($dest->{name} eq 'LABEL') {
        return aop('if', [ $op1, $test, $op2, $dest ]);
    } else {
        my $testop = rop('test', [ $op1, $rev_test, $op2,
                                   rop('goto', [ $continue ]) ]);
        return ($self->rewrite($testop, $lastback),
                $self->rewrite($dest, $lastback),
                $continue);
    }
}

sub rewrite_seq {
    my $self = shift;
    return @_;
}

sub rewrite_other {
    my ($self, $op, @args) = @_;
    return aop($op, \@args);
}

# TODO: can_match_empty (so s/a*/x/g doesn't go into infinite loop)
# This is sometimes a runtime property.
sub rewrite_multi_match {
    my ($self, $min, $max, $greedy, $R, @rest) = @_;

    if (($min == 0) && ($max == 1)) {
        return $self->rewrite_optional($R, $greedy, @rest);
    } elsif (($min == 0) && ($max == -1)) {
        return $self->rewrite_star($R, $greedy, @rest);
    } elsif (($min == 1) && ($max == -1) && $self->can('rewrite_plus')) {
        return $self->rewrite_plus($R, $greedy, @rest);
    } elsif ($min > 0) {
        my $newmax = ($max == -1) ? -1 : $max - $min;
        # Hmm... this duplicates R. That could make the code huge.
        return (
                $self->rewrite_finite($R, $min, @rest),
                $self->rewrite_multi_match(0, $newmax, $greedy, $R, @rest)
               );
    } else {
        return $self->rewrite_upto($R, $max, $greedy, @rest);
    }
}

################################ Main loop #######################

sub run {
    my $self = shift;

    my @ops = $self->rewrite(@_);

    foreach my $temp_reg (values %{ $self->{_temps} }) {
        unshift @ops, aop('push_reg', [ $temp_reg ]);
        push @ops, aop('pop_reg', [ $temp_reg ]);
    }

    push @ops, aop('terminate');

    return @ops;
}

sub rewrite {
    my $self = shift;
    my @r;

    for my $op (@_) {
        if (ref($op) eq 'regex_op') {
            my @args = @$op;
            my $opname = shift(@args);
            my $method = "rewrite_$opname";
            if ($self->can($method)) {
                push @r, $self->rewrite($self->$method(@args));
            } else {
                push @r, $self->rewrite_other($op);
            }
	} elsif (ref($op) eq 'asm_op') {
            push @r, $op;
	} else {
            $DB::single = 1;
            die "malformed op: should be blessed regex_op or asm_op";
        }
    }
    return @r;
}

1;
