package Regex::Rewrite;
use Regex::RegexOps;
use Regex::AsmOps;
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

sub mark {
    my ($self, $desc) = @_;
    $desc ||= '';
    my $number = ++$self->{_markers}->{$desc};
    $number = '' if ($number == 1) && ($desc ne '');
    return bless([ 'label', "\@$desc$number" ], 'asm_op');
}

sub alloc_temp_int {
    my ($self, $name) = @_;
    my $NUM_REGISTERS = 32; # ?
    $name ||= "_temp_int_" . $self->{_temp_int_count};
    my $register = "I" . $self->{_temp_int_count};

    if (++$self->{_temp_int_count} > $NUM_REGISTERS) {
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
    return $R, rop_goto($self->{_return});
}

sub rewrite_goto {
    my ($self, $R) = @_;
    return aop_goto($R) if $R->[0] eq 'label';
    return $R;
}

sub rewrite_test {
    my ($self, $op1, $test, $op2, $dest) = @_;
    my $continue = $self->mark('after_test');
    my $rev_test = { "==" => "!=",
		     "!=" => "==",
		     "<" => ">=",
		     ">" => "<=",
		     "<=" => ">",
		     ">=" => "<",
		 }->{$test};

    if ($dest->[0] eq 'goto') {
        return aop_if($op1, $test, $op2, $dest->[1]);
    } elsif ($dest->[0] eq 'label') {
        return aop_if($op1, $test, $op2, $dest);
    } else {
        return rop_test($op1, $rev_test, $op2, rop_goto($continue)),
          $dest, $continue;
    }
}

sub rewrite_accept {
    my ($self, $R) = @_;
    return $R;
}

sub rewrite_seq {
    my $self = shift;
    return @_;
}

sub rewrite_other {
    my ($self, $op) = @_;
    return (bless $op, 'asm_op');
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
        unshift @ops, aop_push_reg($temp_reg);
        push @ops, aop_pop_reg($temp_reg);
    }

    push @ops, aop_terminate();

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
