package Regex::Rewrite;
use Regex::Ops::Tree;
use Regex::Ops::List;
require 'Regex.pm';
use strict;

*aop = *Regex::Rewrite::aop;
*rop = *Regex::Rewrite::rop;

# The basic method signature used here:
#
# rewrite_X : (optree, lastback) -> (back, ops...)
#
# where $lastback is the previous backtracking point that we should
# jump to if matching $op fails; $back is the backtracking point that
# can be returned to within the processing of the current $op to fix
# up the partial state and possibly attempt another match, or just
# abort and return to $lastback.
#

sub new {
    my ($proto, %options) = @_;
    my $self = bless \%options, (ref($proto) || $proto);
    $self->init();
    return $self;
}

sub init {
    my ($self, @args) = @_;
    $self->{_markers} = {};
    $self->{_temp_int_count} = 3;
    $self->{state} ||= Regex->global_state();
    my $FAIL = $self->genlabel("FAIL");
    $self->{_labels}{'fail'} = $FAIL;
}


sub aop {
    Regex::Ops::List->op(@_);
}

sub genlabel {
    my ($self, $desc) = @_;
    return $self->{state}->genlabel($desc);
}

sub alloc_temp_int {
    my ($self, $name) = @_;
    my $NUM_REGISTERS = 32; # ?
    $name ||= "_temp_int_" . $self->{_temp_int_count};
    my $register = "I" . $self->{_temp_int_count};

    if (++$self->{_temp_int_count} > $NUM_REGISTERS) {
        # Time to switch to IMCC.
        die "Too many temporaries requested! Implement register spilling!";
    }

    $self->{_temps}{$name} = $register;
    return $register;
}

# This implementation should be overridden by the host language,
# because it's not a very good one.
sub new_local {
    my ($self, $name, $type) = @_;
    $type ||= 'int';
    die "cannot handle type '$type'" if $type ne 'int';

    # Bad implementation -- does not handle recursion. Actual
    # instances should probably be subclasses that use something like
    # IMCC's facilities for creating local vars.
    return $self->alloc_temp_int($name);
}

sub new_rxlocal {
    my ($self, $op, $name, $type) = @_;
    my $var = $self->new_local($name, $type);
    push @{ $op->{rxlocals} }, $var;
    return $var;
}

sub op_save_rxlocals {
    my ($self, $op) = @_;
    if ($op->{non_reentrant}) {
        # Mark this variable as needing to be preserved across rule calls
        push @{ $self->{rxlocals} }, @{ $op->{rxlocals} };
        return ();
    } else {
        my $rxlocals = ($op->{rxlocals} ||= []);
        return (aop(comment => [ "save rxlocals for op" ]),
                map { aop('pushint' => [ $_, "op rxlocal $_" ]) }
                    @$rxlocals);
    }
}

sub op_restore_rxlocals {
    my ($self, $op) = @_;
    if ($op->{non_reentrant}) {
        return ();
    } else {
        my $rxlocals = ($op->{rxlocals} ||= []);
        return (aop(comment => [ "restore rxlocals for op" ]),
                map { aop('popint' => [ $_, "op rxlocal $_" ]) }
                    reverse @$rxlocals);
    }
}

sub rule_save_rxlocals {
    my ($self) = @_;

    my $rxlocals = ($self->{rxlocals} ||= []);
    return (aop(comment => [ "save rxlocals" ]),
            map { aop('pushint' => [ $_, "rxlocal $_" ]) }
                @$rxlocals);
}

sub rule_restore_rxlocals {
    my ($self) = @_;
    my $rxlocals = ($self->{rxlocals} ||= []);
    return (aop(comment => [ "restore rxlocals" ]),
            map { aop('popint' => [ $_, "rxlocal $_" ]) }
                reverse @$rxlocals);
}

sub get_temp {
    my ($self, $name) = @_;
    return $self->{_temps}->{$name} || die "Requested unallocated temporary!";
}

######################## Default rewrite rules #######################

sub rewrite_terminate {
    my ($self, $op, $R) = @_;
    return $R, aop('goto', [ $self->{_return} ]);
}

sub rewrite_goto {
    my ($self, $op, $R, $lastback) = @_;
    return aop('goto', [ $R ]) if $R->{name} eq 'LABEL';
    return $self->rewrite($R, $lastback);
}

sub rewrite_test {
    my ($self, $op, $op1, $test, $op2, $dest, $lastback) = @_;
    my $continue = $self->genlabel('after_test');
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

# TODO: can_match_empty (so s/a*/x/g doesn't go into infinite loop)
# This is sometimes a runtime property.
sub rewrite_multi_match {
    my ($self, $op, $min, $max, $greedy, $R, @rest) = @_;

#    $DB::single = 1;
    if (($min == 0) && defined($max) && ($max == 1)) {
        return $self->rewrite_optional($op, $R, $greedy, @rest);
    } elsif (($min == 0) && (!defined($max) || ($max == -1))) {
        return $self->rewrite_star($op, $R, $greedy, @rest);
    } elsif (($min == 1) && (!defined($max) || $max == -1) && $self->can('rewrite_plus')) {
        if ($greedy) {
            return $self->rewrite_plus($op, $R, @rest);
        } else {
            return $self->rewrite_nongreedy_plus($op, $R, @rest);
        }
    } else {
        if ($greedy) {
            return $self->rewrite_greedy_range($op, $R, $min, $max, @rest);
        } else {
            return $self->rewrite_nongreedy_range($op, $R, $min, $max, @rest);
        }
    }
}

####### Old Stackless start #######

# Does nothing if DEBUG is not set (if you're using this through
# perl6, then you can turn this on with the $RX_DEBUG environment
# variable)
#
# Otherwise, emits a print of the given string, but with %-escapes.
sub dbprint {
    my ($self, $what) = @_;
    return () unless $self->{DEBUG};
    my @ops;
    $what = "%<rx_pos>: $what";
    foreach my $part ($what =~ /((?:\%\<\w+\>)|[^\%]+)/g) {
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
                        $self->dbprint("setting end[$group] := %<rx_pos>\n"),
                        aop('setend', [ $group, 'pos' ]),
                        aop('goto', [ $next ]),
              $rfail => $self->dbprint("R in group failed\n"),
                        aop('popint', [ 'I0', 'group end' ]),
                        aop('setend', [ $group, 'I0' ] ),
                        aop('popint', [ 'I0', 'group start' ]),
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

    my @debugging;
    if ($self->{DEBUG}) {
        my $old_lastback = $lastback;
        $lastback = $self->genlabel('debug_matchback');
        @debugging = ($lastback =>
                      $self->dbprint("failed to match $char at %<rx_pos>\n"),
                      aop('goto', [ $old_lastback ]));
    }
    push @ops, (
                     aop('match', [ $char, $lastback ]),
                     aop('increment', [ 1, $lastback ]),
                     aop('goto', [ $next ]),
            $back => $self->dbprint("Unmatching $char\n"),
                     aop('increment', [ -1, $lastback ]),
                     aop('goto', [ $lastback ]),
                     @debugging,
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

sub _translate_classpieces {
    my ($pieces) = @_;

    # Empty list
    return [] if @$pieces == 0;

    # Negated list
    if ($pieces->[0] eq 'neg') {
        return _negate_incexc(_translate_classpieces($pieces->[1]));
    }

    # Convert "a-b" to [97,98] and "a" to [97,97]
    my @ranges;
    foreach (@$pieces) {
        my ($first, $last);
        if (ref $_) {
            ($first, $last) = @$_;
        } else {
            ($first, $last) = ($_, $_);
        }
        push @ranges, [ ord($first), ord($last) ];
    }

    return _ranges_to_incexc(\@ranges);
}

sub _ranges_to_incexc {
    my @ranges = @{ shift() };

    # Sort those pairs by their first element
    @ranges = sort { $a->[0] <=> $b->[0] } @ranges;

    # Build up an inclusion/exclusion list
    my @incexc;
    foreach (@ranges) {
        my ($first, $last) = @$_;
        if (@incexc && $first <= $incexc[-1]) {
            # Merge (1,10)=1..9 with [4,x]=4..x and [10,x]=10..x
            if ($incexc[-1] <= $last+1) {
                $incexc[-1] = $last+1;
            }
        } else {
            # Append
            push @incexc, $first, ($last+1);
        }
    }

    return \@incexc;
}

sub _negate_incexc ($) {
    my ($incexc) = @_;
    return [ 0 ] if (@$incexc == 0);
    return [ 0, @$incexc ] if $incexc->[0] > 0;
    return [ ] if @$incexc == 1;
    shift @$incexc;
    $incexc->[0]++;
    return $incexc;
}

sub rewrite_classpieces {
    my ($self, $op, $classpieces, $lastback) = @_;
    my $incexc = _translate_classpieces($classpieces);
    return $self->rewrite_charclass($op, $incexc, $lastback);
}

sub rewrite_charclass {
    my ($self, $op, $incexc, $lastback) = @_;

    my @ops;
    push @ops, aop('check', [ 1, $lastback ])
      unless ($op->{nocheck});

    my $back = $self->genlabel('undo_charclass');
    my $next = $self->genlabel('after_charclass');

    push @ops, (
                         $self->dbprint("trying classmatch\n"),
                         aop('classmatch', [ $incexc, $lastback ]),
                         aop('increment', [ 1, $lastback ]),
                         aop('goto', [ $next ]),
                $back => aop('increment', [ -1, $lastback ]),
                         aop('goto', [ $lastback ]),
                $next =>
               );

    return ($back, @ops);
}

sub rewrite_advance {
    my ($self, $op, $howfar, $lastback) = @_;
    my $back = $self->genlabel('undo_charclass');
    my $next = $self->genlabel('after_charclass');

    my @ops = (          aop('advance', [ $howfar, $lastback ]),
                         aop('goto', [ $next ]),
                $back => aop('increment', [ -$howfar ]),
                         aop('goto', [ $lastback ]),
                $next =>
              );
    return ($back, @ops);
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
               $advance => $self->dbprint("scan advancing\n"),
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
        push @ops, $tries[$i-1] unless $i == 0; # Label for the try
        push @ops, $self->dbprint("Trying alternative $i of 0..$#args\n");
        push @ops, @{ $iops[$i] };
        push @ops, aop('pushint', [ $i ]);
        push @ops, aop('goto', [ $next ]);
    }

    push @ops, $back => aop('popint', [ 'tmp', 'branch marker' ]);

    for my $i (0..$#args-1) {
#        $DB::single = 1;
        push @ops, aop('eq', [ 'tmp', $i, $ibacks[$i] ]);
    }

    push @ops, aop('goto', [ $ibacks[-1] ]);
    push @ops, $next;

    return ($back, @ops);
}

# Dynamic alternation: a set of alternatives that should be tried in
# turn, but the exact alternatives are unknown (eg because they're
# coming from an array.)
#
# @R ->          .local $counter
#                $counter = 0
#           try: R[$counter] or goto fail
#                push $counter
#                goto next
#          fail: $counter++
#                if $counter >= @R goto lastback
#                goto try
#          back: pop $counter
#                goto R[].back
#          next:
#
# The code below does not assume the alternatives are coming from an
# array; instead, a callback is given that should rewrite the
# alternative that corresponds to the (dynamic) $counter passed in.
#
sub rewrite_dynamic_alternate {
    my ($self, $op, $sizer, $chooser, $lastback) = @_;

    my $try = $self->genlabel('dalt_try');
    my $fail = $self->genlabel('dalt_fail');
    my $back = $self->genlabel('dalt_back');
    my $next = $self->genlabel('dalt_next');

    my $counter = $self->new_local("counter");
    my ($N, @N_ops) = $sizer->($self, $op);
    my ($R_back, @R_ops) = $chooser->($self, $op, $counter, $fail);

#    $DB::single = 1;
    my @ops =  ( aop('assign', [ $counter, 0 ]),
                 @N_ops,
         $try => $self->dbprint("matching dynalt[%<$counter>]\n"),
                 @R_ops,
		 aop('pushint', [ $counter, "dynamic alt counter" ]),
		 aop('goto', [ $next ]),
	$fail => $self->dbprint("failed dynalt, advancing from dynalt[%<$counter>]/%<$N>\n"),
                 aop('add', [ $counter, 1 ]),
		 aop('ge', [ $counter, $N, $lastback ]),
		 aop('goto', [ $try ]),
	$back => $self->op_restore_rxlocals($op),
                 aop('popint', [ $counter, 'dynamic alt counter' ]),
                 $self->dbprint("backtracking into dynalt's index %<$counter> match\n"),
		 aop('goto', [ $R_back ]),
	$next => $self->op_save_rxlocals($op),
		 );

    return ($back, @ops);
}

# R<min,max> -> $matchcount = 0
#         loop: if $matchcount >= max goto next
#               R or check
#               $matchcount++
#               goto loop
#         back: if $matchcount == 0 goto lastback
#               $matchcount--
#               goto R.back
#        check: if $matchcount < min goto back
#         next:
#
# to make $matchcount local, we will choose a different name for every
# instance of this rewrite rule. Recursive calls to a given instance
# will be handled in the same way any other local variable would
# (somehow, they'll get saved on the stack.)

sub rewrite_greedy_range {
    my ($self, $op, $R, $min, $max, $lastback) = @_;

    my ($loop, $back, $local_back, $check, $next) =
     map { $self->genlabel("gr_$_") } qw(loop back local_back check next);

    my $matchcount = $self->new_rxlocal($op, "matchcount");

    my ($R_back, @R_ops) = $self->rewrite($R, $check);
    my @ops = (
               aop('set', [ $matchcount, 0 ]),
      $loop => aop('ge', [ $matchcount, $max, $next ]),
               @R_ops,
               aop('add', [ $matchcount, 1 ]),
               aop('goto', [ $loop ]),
      $back => $self->op_restore_rxlocals($op),
$local_back => aop('unless', [ $matchcount, $lastback ]),
               aop('add', [ $matchcount, -1 ]),
               aop('goto', [ $R_back ]),
     $check => aop('lt', [ $matchcount, $min, $local_back ]),
      $next => $self->op_save_rxlocals($op),
              );

    return ($back, @ops);
}

# R<0,max>? ->  $matchcount = 0
#               goto next
#        rfail: if $matchcount == 0 goto lastback
#               $matchcount--
#               goto R.back
#         back: if $matchcount >= max goto rfail
#               R or rfail
#               $matchcount++
#         next:
#

# R<min,max>? ->  $matchcount = 0
#                 goto check
#          rfail: if $matchcount == 0 goto lastback
#                 $matchcount--
#                 goto R.back
#           back: if $matchcount >= max goto rfail
#                 R or rfail
#                 $matchcount++
#          check: if $matchcount < min goto back
#           next:

# [ab]<1,2>?: a aa ab b ba bb

sub rewrite_nongreedy_range {
    my ($self, $op, $R, $min, $max, $lastback) = @_;

    my ($rfail, $local_back, $back, $check, $next) =
      map { $self->genlabel("ngr_$_") } qw(rfail local_back back check next);

    my $matchcount = $self->new_rxlocal($op, "matchcount");

    my ($R_back, @R_ops) = $self->rewrite($R, $rfail);
    my @ops = (
               aop('set', [ $matchcount, 0 ]),
               aop('goto', [ $check ]),
     $rfail => aop('unless', [ $matchcount, $lastback ]),
               aop('add', [ $matchcount, -1 ]),
               aop('goto', [ $R_back ]),
      $back => $self->op_restore_rxlocals($op),
$local_back => aop('ge', [ $matchcount, $max, $rfail ]),
               @R_ops,
               aop('add', [ $matchcount, 1 ]),
     $check => aop('lt', [ $matchcount, $min, $local_back ]),
      $next => $self->op_save_rxlocals($op),
              );

    return ($back, @ops);
}

# ( [ [aaaaa|aaaaaaa]<2,3> ]<1,2> )
# 30,42,20,28,15,21,10,14

# R* ->         push 0
#         loop: R or next
#               push 1
#               goto loop
#         back: popint -> haveTries_flag
#               if (haveTries_flag) goto R.back
#               goto lastback
#         next:
#
# R*? ->        pushindex
#               goto next
#        rfail: popint -> tmp or R.back
#               goto lastback
#         back: R or rfail
#               pushmark
#         next:
#
# conversion to using a temporary (not implemented this way; only for
# comparison with <n,m>? above.)
#
# R*? ->        $matchcount = 0
#               goto next
#        rfail: if $matchcount == 0 goto lastback
#               $matchcount--
#               goto R.back
#         back: R or rfail
#               $matchcount++
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
                   aop('pushint', [ 0 ]),
          $loop => @R_ops,
                   aop('pushint', [ 1 ]),
                   aop('goto', [ $loop ]),
          $back => $self->dbprint("backtracking into *\n"),
                   aop('popint', [ 'tmp', $lastback ]),
                   aop('if', [ 'tmp', $R_back ]),
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
                        aop('pushint', [ 0, 'plus matched marker' ]),
                        aop('goto', [ $loop ]),
              $rfail => aop('popindex', [ '<rx_tmp>', $lastback ]),
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
              $rfail => aop('popindex', [ '<rx_tmp>', $lastback ]),
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
               $back => aop('popint', [ 'tmp', 'optional marker' ]),
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

sub rewrite_rule {
    die "rules should be handled by host language";
#     my ($self, $op, $R, $lastback) = @_;
#     my $fail = $self->genlabel("fail");
#     my $mode = $self->new_local("mode", "int");
#     my $params = $self->new_local("params");
#     my ($R_back, @R_ops) = $self->rewrite($R, $fail);
#     my @ops = (       aop('return' => [ "int", 777 ]),
#                       aop('param' => [ "mode", "int", $mode ]),
#                       aop('param' => [ "params", "PerlArray", $params ]),
#                       aop('eq' => [ $mode, 1, $R_back ]),
#                       @R_ops,
#                       aop('return' => [ "int", 1 ]),
#              $fail => aop('return' => [ "int", 0 ])
#               );
#     return (undef, @ops); # Nothing should ever use the backtracking point
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
        my ($back, @rewritten) = $self->rewrite($_, $fallback);
        push @ops, @rewritten;
        $fallback = $back;
    }

    return ($fallback, @ops);
}

sub rewrite_external {
    my ($self, $op, $extname, $extargs, $lastback) = @_;
    my $handler = "external_$extname";
    if ($self->{$handler}) {
        return $self->{$handler}->($op, $extargs, $lastback);
    } else {
        return ($lastback, aop('external' => [ $extname, $extargs, $lastback ]));
    }
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
                       aop('goto', [ $db_start ]),
           $db_back => $self->dbprint("<- $desc BACK\n"),
                       aop('goto', [ $back ]),
          $db_start => $self->dbprint("-> $desc ENTER\n"),
                       @ops,
                       $self->dbprint(".. $desc NEXT\n"),
           );
}

################################ Main loop #######################

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
    my ($self, $tree, $ctx, $pass_label, $fail_label) = @_;
    die "Wrong #args" if @_ != 5;

    my $FAIL = $self->{_labels}{'fail'};
    my $back = $self->genlabel('regex_back');

    # Generate the main regular expression code
    my ($backtrack, @ops) = $self->rewrite($tree, $FAIL);

    # Generate code for saving/restoring the "rxlocals" gathered while
    # rewriting the regex
    my @save_rxlocals;
    my @restore_rxlocals;
    if ($ctx->{preserve_state}) {
        @save_rxlocals = $self->rule_save_rxlocals();
        @restore_rxlocals = $self->rule_restore_rxlocals();
    }

    # Set up the success/failure handling
    my $post_tree = rop('seq', [ aop('match_succeeded'),
                                 @save_rxlocals,
                                 aop('literal', [ "branch", $pass_label ]),
                        $FAIL => aop('match_failed'),
                                 aop('literal', [ "branch", $fail_label ]),
                        $back => @restore_rxlocals,
                                 aop('goto' => [ $backtrack ])
                               ]);
    my (undef, @post_ops) = $self->rewrite($post_tree, $back);

    # Set up the full preamble, including stuff gathered from
    # rewriting the expression.
    my $pre_tree = rop('seq', [ aop('preamble'), $self->startup() ] );
    my (undef, @pre_ops) = $self->rewrite($pre_tree, $FAIL);

    # Glue them together
    @ops = (@pre_ops, @ops, @post_ops);

    foreach my $temp_reg (values %{ $self->{_temps} }) {
        warn "temp register $temp_reg: I'm not sure this is supported anymore";
        unshift @ops, aop('push_reg', [ $temp_reg ]);
        push @ops, aop('pop_reg', [ $temp_reg ]);
    }

    return { lastback => $back, code => \@ops };
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
