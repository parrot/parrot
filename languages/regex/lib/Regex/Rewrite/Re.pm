package Regex::Rewrite::Re;
use base 'Regex::Rewrite';
use Regex::RegexOps;
use Regex::AsmOps;
use strict;

# Must override rewrite_atend because re currently has no atend asm op.
sub rewrite_atend {
    my $self = shift;
    my $check = $self->mark('check');
    my $notend = $self->mark('notend');
    return (rop_assign('I1', 1),
            rop_onfail($check),
            rop_advance(1),
            rop_advance(-1),
            rop_assign('I1', 0),
            rop_fail(),
            $check => rop_test('I1', '!=', 0, $notend),
            rop_fail(),
            $notend => );
}

sub rewrite_optional {
    my ($self, $R, $greedy) = @_;

    if ($greedy) {
        return rop_try($R);
    } else {
        return rop_onfail($R);
    }
}

sub rewrite_try {
    my ($self, $R) = @_;
    if ($R->[0] eq 'label') {
        my $next = $self->mark('fallback');
        return (
                rop_onfail($next),
                rop_goto($R),
                $next =>
               );
    } else {
        my $continue = $self->mark('after_try');
        return (
                rop_onfail($continue),
                $R,
                $continue =>
               );
    }
}

sub rewrite_onfail {
    my ($self, $R) = @_;
    return aop_onfail($R) if ($R->[0] eq 'label');

    my $R_start = $self->mark('onfail');
    my $continue = $self->mark('after_onfail');
    return (
            aop_onfail($R_start),
            rop_goto($continue),
            $R_start => $R,
            $continue =>
           );
}

# Greedy: match R or continue; repeat
# Nongreedy: onfail, match R and continue. Else just continue.
sub rewrite_star {
    my ($self, $R, $greedy) = @_;

    my $continue = $self->mark('star_cont');

    if ($greedy) {
        my $start = $self->mark('star_start');
        return (
                $start => rop_onfail($continue),
                $R,
                rop_goto($start),
                $continue =>
               );
    } else {
        return (
                rop_onfail(rop_seq($R,
                                   rop_goto($continue))),
                $continue =>
               );
    }
}

# Match exactly $count occurrences of $R
sub rewrite_finite {
    my ($self, $R, $count) = @_;
    my $temp = $self->alloc_temp_int();
    my $start = $self->mark('count_start');
    return (
            rop_assign($temp, 0),
            $start => $R,
            rop_incr($temp),
            rop_test($temp, '<', $count, $start)
           );
}

# Match 0..$max occurrences of $R, either greedily or nongreedily
sub rewrite_upto {
    my ($self, $R, $max, $greedy) = @_;
    my $temp = $self->alloc_temp_int();
    my $start = $self->mark('upto_start');

    my $match_an_R = rop_seq(rop_test($temp, '==', $max, rop_fail()),
                             $R,
                             rop_incr($temp));

    if ($greedy) {
        return (
                rop_assign($temp, 0),
                $start => rop_try(rop_seq($match_an_R, rop_goto($start)))
               );
    } else {
        return (
                rop_assign($temp, 0),
                $start => rop_onfail(rop_seq($match_an_R, rop_goto($start)))
               );
    }
}

# Try to match $R. If that fails, match $S.
sub rewrite_alternate {
    my ($self, $R, $S) = @_;
    my $S_start = $self->mark('alt_S');
    my $continue = $self->mark('after_alt');

    return (
            rop_onfail($S_start),
            $R,
            rop_goto($continue),
            $S_start => $S,
            $continue =>
           );
}

sub rewrite_scan {
    my ($self, $R) = @_;

    my $scan = $self->mark('scan_start');
    my $advance = $self->mark('scan_advance');
    my $continue = $self->mark('after_scan');

    return (
            $scan => rop_onfail($advance),
            $R,
            rop_goto($continue),
            $advance => rop_advance(1),
            rop_goto($scan),
            $continue =>
           );
}

########################### Overarching concerns ###################

# The Re engine needs to call re_succeeded when the match succeeds, and
# re_failed if it fails.

sub run {
    my $self = shift;

    my $RETURN = $self->{_labels}{'return'} = $self->mark("RETURN");
    my $FAIL = $self->{_labels}{'fail'} = $self->mark("FAIL");

    unshift @_, aop_preamble, rop_onfail($FAIL);

    push @_, (
              aop_match_succeeded(),
              rop_goto($RETURN),
              $FAIL => aop_match_failed(),
              $RETURN =>
             );

    return $self->SUPER::run(@_);
}

1;
