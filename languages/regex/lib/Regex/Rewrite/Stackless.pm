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

sub need_group_setup {
    my ($self, $group) = @_;
    $self->{_setup_starts}{$group} = 1;
    $self->{_setup_ends}{$group} = 1;
}

sub rewrite_try {
    my ($self, $R, $lastback) = @_;
    return $self->rewrite($R, $lastback);
}

# Most general case:
#
# ( R ) ->
#                  push start[n]
#                  start[n] <- pos
#                  R or iback
#                  push end[n]
#                  end[n] <- pos
#                  goto next
#
#           iback: start[n] <- pop
#                  goto lastback
#
#            back: end[n] <- pop
#                  goto R.back
#
#            next:
#
# Cost: 3 + 4rs + 2rf + 2ff
#
sub rewrite_group {
    my ($self, $R, $group, $lastback) = @_;
    my $iback = $self->mark("group_iback");
    my $back = $self->mark("group_back");
    my $next = $self->mark("after_group");

    $self->need_group_setup($group);

    my ($R_back, @R_ops) = $self->rewrite($R, $iback);

    my @ops = (         aop('getstart', [ 'I0', $group ]),
                        aop('pushindex', [ 'I0' ]),
                        aop('setstart', [ $group, 'pos' ]),
                        @R_ops,
                        aop('getend', [ 'I0', $group ]),
                        aop('pushindex', [ 'I0' ]),
                        aop('setend', [ $group, 'pos' ]),
                        aop('goto', [ $next ] ),
              $iback => aop('popint', [ 'I0' ]),
                        aop('setstart', [ $group, 'I0' ] ),
                        aop('goto', [ $lastback ] ),
               $back => aop('popint', [ 'I0' ]),
                        aop('setend', [ $group, 'I0' ] ),
                        aop('goto', [ $R_back ] ),
               $next =>
              );

    return ($back, @ops);
}

sub rewrite_match {
    my ($self, $char, $lastback) = @_;

    my $back = $self->mark('undo_match');
    my $next = $self->mark('after_match');

    return ($back,
            aop('check', [ 1, $lastback ]),
            aop('match', [ $char, $lastback ]),
            aop('increment', [ 1, $lastback ]),
            aop('goto', [ $next ]),
   $back => aop('increment', [ -1, $lastback ]),
            aop('goto', [ $lastback ]),
   $next =>
            );
}

sub rewrite_other {
    my ($self, $op, $lastback) = @_;
    return aop($op->{name}, [ @{ $op->{args} }, $lastback ]);
}

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
    my $self = shift;

    my $RETURN = $self->{_labels}{'return'} = $self->mark("RETURN");
    my $FAIL = $self->{_labels}{'fail'};

    # Stuff that goes after the regular expression code
    push @_, (
                  aop('match_succeeded'),
                  aop('goto', [ $RETURN ]),
                  $FAIL => aop('match_failed'),
                  $RETURN =>
                 );

    # Generate the main regular expression code
    my $tree = rop('seq', [ @_ ]);
    my (undef, @ops) = $self->rewrite($tree, $FAIL);

    # Set up the full preamble, including stuff gathered from
    # rewriting the expression.
    my $pretree = rop('seq', [ aop('preamble'), $self->startup() ] );
    my (undef, @preops) = $self->rewrite($pretree, $FAIL);

    # Glue them together
    unshift(@ops, @preops);

    foreach my $temp_reg (values %{ $self->{_temps} }) {
        unshift @ops, aop('push_reg', [ $temp_reg ]);
        push @ops, aop('pop_reg', [ $temp_reg ]);
    }

    push @ops, aop('terminate');

    return @ops;
}

sub startup {
    my ($self) = @_;

    my @ops;
    foreach my $group (sort %{ $self->{_setup_starts} || {} }) {
        push @ops, aop('setstart', [ $group, -2 ]);
    }

    foreach my $group (sort %{ $self->{_setup_ends} || {} }) {
        push @ops, aop('setend', [ $group, -2 ]);
    }

    return @ops;
}

1;
