package Regex::Rewrite::Rx;
use base 'Regex::Rewrite::Stackless';
use Regex::Ops::Tree;
use Regex::Ops::List;
use strict;

*aop = *Regex::Rewrite::aop;
*rop = *Regex::Rewrite::rop;

sub rewrite_scan {
    my ($self, $R, $lastback) = @_;

    my $scan = $self->mark('scan_start');
    my $advance = $self->mark('scan_advance');
    my $next = $self->mark('after_scan');

    my ($R_back, @R_body) = $self->rewrite($R, $advance);

    my @ops = (
                           aop('goto', [ $scan ]),
               $advance => aop('advance', [ 1, $lastback ]),
                  $scan => @R_body,
                  $next =>
              );

    return ($lastback, @ops);
}

sub rewrite_simple_or_simple {
    my ($self, $R, $S, $lastback) = @_;

    my $nextalt = $self->mark('nextalt');
    my $back = $self->mark('alt_back');
    my $try_S = $self->mark('alt_S');
    my $next = $self->mark('next');

    my ($R_back, @R_ops) = $self->rewrite($R, $nextalt);
    my ($S_back, @S_ops) = $self->rewrite($S, $back);

    return $S_back, (
                     aop('pushmark'),
                     aop('pushindex'),
                     @R_ops,
                     aop('goto', [ $next ]),
         $nextalt => aop('popindex', [ $self->{_labels}{'fail'} ]),
           $try_S => @S_ops,
                     aop('goto', [ $next ]),
            $back => aop('popindex', [ $lastback ]),
                     aop('goto', [ $try_S ]),
            $next =>
                    );
}

sub rewrite_alternate {
    my ($self, $R, $S, $lastback) = @_;

    my $back = $self->mark('alt_back');
    my $fail = $self->mark('RS_fail');
    my $next = $self->mark('next');

    my ($R_back, @R_ops) = $self->rewrite($R, $fail);
    my ($S_back, @S_ops) = $self->rewrite($S, $fail);

    return $back, (
                     aop('pushmark', [ "|" ]),
                     aop('pushindex'),
                     @R_ops,
                     aop('pushmark', [ "|R" ]),
                     aop('pushindex'),
                     aop('goto', [ $next ]),
            $back => aop('popindex', [ $S_back ]),
                     aop('popindex', [ $R_back ]),
            $fail => aop('popindex', [ $lastback ]),
                     @S_ops,
                     aop('pushmark', [ "|S" ]),
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
                aop('pushmark', [ "*" ]),
       $loop => aop('pushindex'),
                @R_ops,
                aop('goto', [ $loop ]),
       $back => aop('popindex', [ $lastback ]),
       $next =>
);
    } else {
        my ($R_back, @R_ops) = $self->rewrite($R, $next);
       @ops =
(
                aop('goto', [ $next ]),
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
                         aop('pushmark', [ "+" ]),
                $loop => @R_ops,
                         aop('pushindex'),
                         aop('goto', [ $loop ]),
                $back => aop('popindex', [ $lastback ]),
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
                        aop('pushmark', [ "?" ]),
                        @R_ops,
                        aop('pushindex'),
                        aop('goto', [ $next ]),
               $back => aop('popindex', [ $lastback ]),
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
                        aop('pushmark', [ "??" ]),
                        aop('pushindex'),
                        aop('goto', [ $next ]),
               $back => aop('popindex', [ $lastback ]),
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

    unshift @_, aop('preamble');
    my $RETURN = $self->{_labels}{'return'} = $self->mark("RETURN");
    my $FAIL = $self->{_labels}{'fail'};

    push @_, (
              aop('match_succeeded'),
              aop('goto', [ $RETURN ]),
              $FAIL => aop('match_failed'),
              $RETURN =>
             );

    return $self->SUPER::run(rop('seq', [ @_ ]));
}

1;
