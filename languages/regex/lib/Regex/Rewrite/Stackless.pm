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
    my $FAIL = $self->genlabel("FAIL");
    $self->{_labels}{'fail'} = $FAIL;
}

sub dbprint {
    my ($self, $what) = @_;
    return () unless $self->{DEBUG};
    my @ops;
    foreach my $part ($what =~ /((?:\%\w+)|[^\%]+)/g) {
        if ($part =~ /^%/) {
            push @ops, aop('print', [ substr($part, 1) ]);
        } else {
            $part =~ s/(["'\\])/\\$1/g;
            $part =~ s/\n/\\n/g;
            push @ops, aop('print', [ "\"$part\"" ]);
        }
    }
    return @ops;
}

sub need_group_setup {
    my ($self, $group) = @_;
    $self->{_setup_starts}{$group} = 1;
    $self->{_setup_ends}{$group} = 1;
}

sub rewrite_try {
    my ($self, $op, $R, $lastback) = @_;
    return $self->rewrite($R, $lastback);
}

# Most general case:
#
# ( R ) ->
#                  push start[n]
#                  push end[n]
#                  start[n] <- pos
#                  R or rfail
#                  end[n] <- pos
#                  goto next
#
#           rfail: pop -> end[n]
#                  pop -> start[n]
#                  goto lastback
#
#            next:
#
# back is R.back
#
sub rewrite_group {
    my ($self, $op, $R, $group, $lastback) = @_;
    my $rfail = $self->genlabel("group_iback");
    my $next = $self->genlabel("group_next");

    $self->need_group_setup($group);

    my ($R_back, @R_ops) = $self->rewrite($R, $rfail);

    my @ops = (
                        aop('getstart', [ 'I0', $group ]),
                        $self->dbprint("pushing start[$group]: "),
                        aop('pushint', [ 'I0' ]),
                        aop('getend', [ 'I0', $group ]),
                        $self->dbprint("pushing end[$group]: "),
                        aop('pushint', [ 'I0' ]),
                        aop('setstart', [ $group, 'pos' ]),
                        @R_ops,
                        $self->dbprint("setting end[$group] := %I1\n"),
                        aop('setend', [ $group, 'pos' ]),
                        aop('goto', [ $next ]),
              $rfail => $self->dbprint("R in group failed\n"),
                        aop('popint', [ 'I0' ]),
                        aop('setend', [ $group, 'I0' ] ),
                        aop('popint', [ 'I0' ]),
                        aop('setstart', [ $group, 'I0' ] ),
                        aop('goto', [ $lastback ] ),
               $next =>

              );

    return ($R_back, @ops);
}

# Cost: 4 + 2ff (insanely high!) if we need to check the length
#       3 + 2ff otherwise
# 1 of that is a goto that could be eliminated pretty easily.
sub rewrite_match {
    my ($self, $op, $char, $lastback) = @_;

    my $back = $self->genlabel('undo_match');
    my $next = $self->genlabel('after_match');

    my @ops;
    push @ops, aop('check', [ 1, $lastback ])
      unless ($op->{nocheck});

    push @ops, (
                     aop('match', [ $char, $lastback ]),
                     aop('increment', [ 1, $lastback ]),
                     aop('goto', [ $next ]),
            $back => aop('increment', [ -1, $lastback ]),
                     aop('goto', [ $lastback ]),
            $next =>
               );

    return ($back, @ops);
}

sub rewrite_check {
    my ($self, $op, $amount, $R, $lastback) = @_;
    my ($R_back, @R_body) = $self->rewrite($R, $lastback);
    my @ops = (
               aop('check', [ $amount, $lastback ]),
               @R_body
              );
    return ($R_back, @ops);
}

sub rewrite_other {
    my ($self, $op, $lastback) = @_;
    return aop($op->{name}, [ @{ $op->{args} }, $lastback ]);
}

# scan(R) ->   scan: R or advance
#                    goto next
#           advance: pos++ or lastback
#                    goto scan
#              next:
#
# back is R.back
#
sub rewrite_scan {
    my ($self, $op, $R, $lastback) = @_;

    my $scan = $self->genlabel('scan_start');
    my $advance = $self->genlabel('scan_advance');
    my $next = $self->genlabel('after_scan');

    my ($R_back, @R_body) = $self->rewrite($R, $advance);

    my @ops = (
                  $scan => @R_body,
                           aop('goto', [ $next ]),
               $advance => $self->dbprint("advancing\n"),
                           aop('advance', [ 1, $lastback ]),
                           aop('goto', [ $scan ]),
                  $next =>
              );

    return ($R_back, @ops);
}

sub rewrite_simple_or_simple {
    my ($self, $op, $R, $S, $lastback) = @_;

    my $nextalt = $self->genlabel('nextalt');
    my $back = $self->genlabel('alt_back');
    my $try_S = $self->genlabel('alt_S');
    my $next = $self->genlabel('next');

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

# R|S|T ->       R or tryS
#                push 0
#                goto next
#          tryS: S or tryT
#                push 1
#                goto next
#          tryT: T or lastback
#                push 2
#                goto next
#          back: popint -> I0
#                eq I0, 0, R.back
#                eq I0, 1, S.back
#                goto T.back
#          next:
#
sub rewrite_alternate {
    my ($self, $op, @args) = @_;
    my $lastback = pop(@args);

    my $back = $self->genlabel('alt_back');
    my $next = $self->genlabel('alt_next');
    my @tries = map { $self->genlabel('alt_try') } 2..@args;
    my @fails = (@tries, $lastback);

    my (@ibacks, @iops);
    foreach (@args) {
        my ($iback, @ops) = $self->rewrite($_, shift(@fails));
        push @ibacks, $iback;
        push @iops, \@ops;
    }

    my @ops;
    for my $i (0..$#args) {
        push @ops, $tries[$i-1] unless $i == 0;
        push @ops, @{ $iops[$i] };
        push @ops, aop('pushint', [ $i ]);
        push @ops, aop('goto', [ $next ]);
    }

    push @ops, $back => aop('popint', [ 'tmp' ]);

    for my $i (0..$#args-1) {
        $DB::single = 1;
        push @ops, aop('eq', [ 'tmp', $i, $ibacks[$i] ]);
    }

    push @ops, aop('goto', [ $ibacks[-1] ]);
    push @ops, $next;

    return ($back, @ops);
}
sub old_rewrite_alternate {
    my ($self, $op, $R, $S, $lastback) = @_;

    my $back = $self->genlabel('alt_back');
    my $fail = $self->genlabel('RS_fail');
    my $next = $self->genlabel('next');

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

# R* ->       push 1
#       loop: R or next
#             push 0
#             goto loop
#       back: popint -> firstflag
#             if (!firstflag) goto R.back
#             goto lastback
#       next:
#
# R*? ->        pushindex
#               goto next
#        rfail: popint -> tmp or R.back
#               goto lastback
#         back: R or rfail
#               pushmark
#         next:
#
sub rewrite_star {
    my ($self, $op, $R, $greedy, $lastback) = @_;

    my $next = $self->genlabel('star_next');
    my $back = $self->genlabel('star_back');

    if ($greedy) {
        my ($R_back, @R_ops) = $self->rewrite($R, $next);
        my $loop = $self->genlabel('loop');
        my @ops = (
                   aop('pushint', [ 1 ]),
          $loop => @R_ops,
                   aop('pushint', [ 0 ]),
                   aop('goto', [ $loop ]),
          $back => $self->dbprint("backtracking into *\n"),
                   aop('popint', [ 'tmp', $lastback ]),
                   aop('unless', [ 'tmp', $R_back ]),
                   aop('goto', [ $lastback ]),
          $next =>
                  );

        return ($back, @ops);
    } else {
        my $rfail = $self->genlabel('nongreedy_star_fail');
        my ($R_back, @R_ops) = $self->rewrite($R, $rfail);
        my @ops = (
                   aop('pushint', [ 0 ]),
                   aop('goto', [ $next ]),
         $rfail => aop('popindex', [ 'tmp', $R_back ]),
                   aop('goto', [ $lastback ]),
          $back => @R_ops,
                   aop('pushmark'),
          $next =>
                  );
        return ($back, @ops);
    }
}

# R+ ->       pushmark
#       loop: R or rback
#             push 0
#             goto loop
#      rback: popindex -> junk or lastback
#
# (back is R.back)
#
#
sub rewrite_plus {
    my ($self, $op, $R, $lastback) = @_;

    my $loop = $self->genlabel('plus_loop');
    my $rfail = $self->genlabel('plus_rfail');
    my ($R_back, @R_ops) = $self->rewrite($R, $rfail);
    my @ops = (
                        aop('pushmark', [ "+" ]),
               $loop => @R_ops,
                        aop('pushint', [ 0 ]),
                        aop('goto', [ $loop ]),
              $rfail => aop('popindex', [ '?R_TMP', $lastback ]),
              );

    return ($R_back, @ops);
}

#
# R+? ->        pushmark
#         back: R or rfail
#               push 0
#               goto next
#        rfail: popindex -> junk or lastback
#               goto R.back
#
sub rewrite_nongreedy_plus {
    my ($self, $op, $R, $lastback) = @_;

    my $back = $self->genlabel('plus_backloop');
    my $rfail = $self->genlabel('plus_rfail');
    my $next = $self->genlabel('plus_next');
    my ($R_back, @R_ops) = $self->rewrite($R, $rfail);
    my @ops = (
                        aop('pushmark', [ "+" ]),
               $back => @R_ops,
                        aop('pushint', [ 0 ]),
                        aop('goto', [ $next ]),
              $rfail => aop('popindex', [ '?R_TMP', $lastback ]),
                        aop('goto', [ $R_back ]),
               $next =>
              );

    return ($back, @ops);
}

sub rewrite_optional {
    my ($self, $op, $R, $greedy, $lastback) = @_;
    return $greedy ? $self->rewrite_greedy_optional($op, $R, $lastback)
                   : $self->rewrite_nongreedy_optional($op, $R, $lastback);
}

# R? ->       R or rfail
#             push 1
#             goto next
#       back: popint -> tmp
#             if tmp, R.back
#             goto lastback
#      rfail: push 0
#       next:
#
sub rewrite_greedy_optional {
    my ($self, $op, $R, $lastback) = @_;

    my $back = $self->genlabel('greedy_optional_back');
    my $next = $self->genlabel('after_greedy_optional');
    my $rfail = $self->genlabel('greedy_optional_fail');
    my ($R_back, @R_ops) = $self->rewrite($R, $rfail);

    my @ops = (
                        @R_ops,
                        aop('pushint', [ 1 ]),
                        aop('goto', [ $next ]),
               $back => aop('popint', [ 'tmp' ]),
                        aop('if', [ 'tmp', $R_back ]),
                        aop('goto', [ $lastback ]),
              $rfail => aop('pushint', [ 0 ]),
               $next =>
              );

    return ($back, @ops);
}

# R?? ->       pushindex
#              goto next
#        back: popindex or R.back
#              R or lastback
#              pushmark
#        next:
#
sub rewrite_nongreedy_optional {
    my ($self, $op, $R, $lastback) = @_;

    my $back = $self->genlabel('nongreedy_opt_back');
    my $next = $self->genlabel('after_greedy_opt');
    my ($R_back, @R_ops) = $self->rewrite($R, $lastback);

    my @ops = (
                        aop('pushindex'),
                        aop('goto', [ $next ]),
               $back => aop('popindex', [ $R_back ]),
                        @R_ops,
                        aop('pushmark', [ '?? - with R' ]),
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
    my $op = shift;
    my $fallback = pop;

    my @ops;
    foreach (@_) {
#        $DB::single = 1 if /multi_match/;
        my ($back, @rewritten) = $self->rewrite($_, $fallback);
        push @ops, @rewritten;
        $fallback = $back;
    }

    return ($fallback, @ops);
}

sub describe_seq { undef };
sub describe_check { undef };
sub describe_group { "group $_[3]" }

sub wrap {
    my ($self, $op, $back, @ops) = @_;
    return ($back, @ops) unless $self->{DEBUG};

    my $method = "describe_" . $op->{name};
    my $desc = $op->{name};
    if ($self->can($method)) {
        $desc = $self->$method($op, @{ $op->{args} });
        return ($back, @ops) if ! defined $desc;
    }

    my $db_back = $self->genlabel($op->{name}."_back");
    my $db_start = $self->genlabel($op->{name}."_enter");
    return ( $db_back,
                       $self->dbprint("-> $desc ENTER pos=%I1\n"),
                       aop('goto', [ $db_start ]),
           $db_back => $self->dbprint("<- $desc BACK pos=%I1\n"),
                       aop('goto', [ $back ]),
          $db_start => @ops,
                       $self->dbprint(".. $desc NEXT pos=%I1\n"),
           );
}

sub rewrite {
    my ($self, $op, $lastback) = @_;

    if (UNIVERSAL::isa($op, 'Regex::Ops::Tree')) {
        my $method = "rewrite_" . $op->{name};
        if ($self->can($method)) {
            return $self->$method($op, @{ $op->{args} }, $lastback)
              unless $self->{DEBUG};
            return $self->wrap($op, $self->$method($op, @{ $op->{args} }, $lastback));
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

    my $RETURN = $self->{_labels}{'return'} = $self->genlabel("RETURN");
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
    foreach my $group (sort keys %{ $self->{_setup_starts} || {} }) {
        push @ops, aop('setstart', [ $group, -2 ]);
    }

    foreach my $group (sort keys %{ $self->{_setup_ends} || {} }) {
        push @ops, aop('setend', [ $group, -2 ]);
    }

    return @ops;
}

1;
