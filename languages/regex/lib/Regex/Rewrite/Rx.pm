package Regex::Rewrite::Rx;
use base 'Regex::Rewrite::Stackless';
use Regex::RegexOps;
use Regex::AsmOps;
use strict;

sub rewrite_scan {
    my ($self, $R, $lastback) = @_;

    my $scan = $self->mark('scan_start');
    my $advance = $self->mark('scan_advance');
    my $next = $self->mark('after_scan');

    my ($R_back, @R_body) = $self->rewrite($R, $advance);

    my @ops = (
                           aop_goto($scan),
               $advance => aop_advance(1, $lastback),
                  $scan => @R_body,
                  $next =>
              );

    return ($lastback, @ops);
}

sub rewrite_alternate {
    my ($self, $R, $S, $lastback) = @_;

    my $nextalt = $self->mark('nextalt');
    my $back = $self->mark('alt_back');
    my $try_S = $self->mark('alt_S');
    my $next = $self->mark('next');

    my ($R_back, @R_ops) = $self->rewrite($R, $nextalt);
    my ($S_back, @S_ops) = $self->rewrite($S, $back);

    return $S_back, (
                     aop_pushmark(),
                     aop_pushindex(),
                     @R_ops,
                     aop_goto($next),
         $nextalt => aop_popindex($self->{_labels}{'fail'}),
           $try_S => @S_ops,
                     aop_goto($next),
            $back => aop_popindex($lastback),
                     aop_goto($try_S),
            $next =>
                    );
}

sub rewrite_star {
    my ($self, $R, $greedy, $lastback) = @_;

    my $back = $self->mark('star_back');
    my $next = $self->mark('next');

    my @ops;
    if ($greedy) {
        my ($R_back, @R_ops) = $self->rewrite($R, $back);
        my $loop = $self->mark('loop');
        @ops =
(
                aop_pushmark(),
       $loop => aop_pushindex(),
                @R_ops,
                aop_goto($loop),
       $back => aop_popindex($lastback),
       $next =>
);
    } else {
        my ($R_back, @R_ops) = $self->rewrite($R, $next);
       @ops =
(
                aop_goto($next),
       $back => @R_ops,
       $next =>
);
    }

    return ($back, @ops);
}

sub rewrite_plus {
    my ($self, $R, $greedy, $lastback) = @_;
    my $back = $self->mark('plus_back');

    my @ops;
    if ($greedy) {
        my $loop = $self->mark('plus_loop');
        my (undef, @R_ops) = $self->rewrite($R, $back);
        @ops = (
                         aop_pushmark(),
                $loop => @R_ops,
                         aop_pushindex(),
                         aop_goto($loop),
                $back => aop_popindex($lastback)
               );
    } else {
        my (undef, @R_ops) = $self->rewrite($R, $lastback);
        @ops = ( $back => @R_ops );
    }

    return ($back, @ops);
}

sub rewrite_optional {
    my ($self, $R, $greedy, $lastback) = @_;
    return $greedy ? $self->rewrite_greedy_optional($R, $lastback)
                   : $self->rewrite_nongreedy_optional($R, $lastback);
}

sub rewrite_greedy_optional {
    my ($self, $R, $lastback) = @_;

    $DB::single = 1;

    my $back = $self->mark('greedy_optional_back');
    my $next = $self->mark('after_greedy_optional');
    my ($R_back, @R_ops) = $self->rewrite($R, $next);

    my @ops = (
                        aop_pushmark(),
                        @R_ops,
                        aop_pushindex(),
                        aop_goto($next),
               $back => aop_popindex($lastback),
               $next =>
              );

    return ($back, @ops);
}

sub rewrite_nongreedy_optional {
    my ($self, $R, $lastback) = @_;

    my $back = $self->mark('nongreedy_opt_back');
    my $next = $self->mark('after_greedy_opt');
    my ($R_back, @R_ops) = $self->rewrite($R, $next);

    my @ops = (
                        aop_pushmark(),
                        aop_pushindex(),
                        aop_goto($next),
               $back => aop_popindex($lastback),
                        @R_ops,
               $next =>
              );

    return ($back, @ops);
}

########################### Overarching concerns ###################

# The Rx engine needs to call rx_succeed when the match succeeds, and
# rx_fail if it fails.

sub run {
    my $self = shift;

    unshift @_, aop_preamble;
    my $RETURN = $self->{_labels}{'return'} = $self->mark("RETURN");
    my $FAIL = $self->{_labels}{'fail'};

    push @_, (
              aop_match_succeeded(),
              aop_goto($RETURN),
              $FAIL => aop_match_failed(),
              $RETURN =>
             );

    return $self->SUPER::run(rop_seq(@_));
}

1;
