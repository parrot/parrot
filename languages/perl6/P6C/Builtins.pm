package P6C::Builtins;

=head1 B<P6C::Builtins>

XXX: Pre-declare functions the hard way.  Once IMCC supports more
opcodes, this (and emit) will become unnecessary, as we can use a
"header file" to declare builtins in Perl 6 syntax, and add_code to
supply their function bodies.

=cut

use P6C::Context;
use P6C::Parser;

# Squash warnings about builtins having empty bodies.  One entry for
# each builtin implemented below.
use vars '%builtin_names';
BEGIN {
    my @names = qw(print1 exit warn die print sleep time substr length
		   index map grep join reverse);
    @builtin_names{@names} = (1) x @names;
}

sub is_builtin {
    return exists $builtin_names{+shift};
}

sub declare {
    my $hash = shift;
    for (qw(print1 exit sleep)) {
	$hash->{$_} = new P6C::IMCC::Sub args => [['PerlUndef', 'a']],
	    rettype => [];
	$P6C::Context::CONTEXT{$_} = new P6C::Context type => 'PerlUndef';
	$P6C::Parser::WANT{$_} = 'scalar_expr';
    }

    for (qw(time)) {
	$hash->{$_} = new P6C::IMCC::Sub args => [],
	    rettype => 'PerlInt';
	$P6C::Context::CONTEXT{$_} = new P6C::Context type => [];
	$P6C::Parser::WANT{$_} = 'no_args';
    }

    for (qw(print warn die)) {
	$P6C::Context::CONTEXT{$_} = $P6C::Context::DEFAULT_ARGUMENT_CONTEXT;
	$hash->{$_} = new P6C::IMCC::Sub args => [['PerlArray', '_']],
	    rettype => [];
	$P6C::Parser::WANT{$_} = 'bare_arglist';
    }
    for (qw(substr join)) {
	$P6C::Context::CONTEXT{$_} = $P6C::Context::DEFAULT_ARGUMENT_CONTEXT;
	$hash->{$_} = new P6C::IMCC::Sub args => [['PerlArray', '_']],
	    rettype => 'PerlString';
	$P6C::Parser::WANT{$_} = 'bare_arglist';
    }

    for (qw(index)) {
	$P6C::Context::CONTEXT{$_} = $P6C::Context::DEFAULT_ARGUMENT_CONTEXT;
	$hash->{$_} = new P6C::IMCC::Sub args => [['PerlArray', '_']],
	    rettype => 'PerlInt';
	$P6C::Parser::WANT{$_} = 'bare_arglist';
    }

    for (qw(length)) {
	$P6C::Context::CONTEXT{$_} = new P6C::Context type => 'PerlUndef';
	$hash->{$_} = new P6C::IMCC::Sub args => [['PerlString', '_']],
	    rettype => 'PerlInt';
	$P6C::Parser::WANT{$_} = 'bare_arglist';
    }

    for (qw(reverse)) {
	$P6C::Context::CONTEXT{$_} = $P6C::Context::DEFAULT_ARGUMENT_CONTEXT;
	$hash->{$_} = new P6C::IMCC::Sub args => [['PerlArray', '_']],
	    rettype => 'PerlArray';
	$P6C::Parser::WANT{$_} = 'bare_arglist';
    }

    for (qw(grep map)) {
	$P6C::Context::CONTEXT{$_} = $P6C::Context::DEFAULT_ARGUMENT_CONTEXT;
	$hash->{$_} = new P6C::IMCC::Sub args => [['PerlArray', '_']],
	    rettype => 'PerlArray';
	$P6C::Parser::WANT{$_} = "want_for_$_";
    }
}

sub add_code {
    my $funcs = shift;
    # (see docs above)
}

sub emit {

print <<'END';

.emit

_substr:
    pushp
    pushi
    pushs
# get arr
    restore P0
# n paras
    set I0, P0
    set S0, P0[0]
    set I1, P0[1]
    eq I0, 2, __substr_2
    set I2, P0[2]
    gt I0, 4, __substr_die
    lt I0, 2, __substr_die
    length I3, S0
    set I4, I3
    ge I2, 0, __substr_34
# len negative, leave -len of string
    sub I3, I3, I1
    add I3, I3, I2
    set I2, I3
__substr_34:
    set S1, ""
# # offset >= len?
    ge I1, I4, __substr_ret
    eq I0, 4, __substr_4
__substr_3:
    substr S1, S0, I1, I2
__substr_ret:
    new P1, .PerlString
    set P1, S1
    save P1
    pops
    popi
    popp
    ret
__substr_4:
    set S2, P0[3]
    substr S1, S0, I1, I2, S2
    set P0[2], S1
    branch __substr_ret
__substr_2:
    length I2, S0
    sub I2, I2, I1
    branch __substr_3
__substr_die:
    set S0, "wrong number of args for substr"
    new P0, .PerlArray
    set P0[0], S0
    save P0
    bsr _die
    branch __substr_ret

_length:
    pushp
    pushs
    pushi
    restore P0
    set S0, P0
    length I0, S0
    new P1, .PerlInt
    set P1, I0
    save P1
    popi
    pops
    popp
    ret

_reverse:
    pushp
    pushi
    restore P0
    set I0, P0
    dec I0
    set I1, 0
    new P1, .PerlArray
__reverse_loopstart:
    set P2, P0[I0]
    set P1[I1], P2
    inc I1
    dec I0
    le 0, I0, __reverse_loopstart
    save P1
    popi
    popp
    ret

_join:
    saveall
    restore P3
    set I1, P3
    gt I1, 1, __join_next
# Empty args:
    set S0, ""
    branch __join_ret
# At least one arg:
__join_next:
    set S1, P3[0]		# separator
    set S0, P3[1]		# accumulated string
    set I0, 2			# arg number
    branch __join_test
__join_loopstart:
    set S2, P3[I0]
    concat S0, S1
    concat S0, S2
    inc I0
__join_test:
    ne I1, I0, __join_loopstart
__join_ret:
    new P2, .PerlString
    set P2, S0
    save P2
    restoreall
    ret

_grep:
    pushp
    pushi
    pushs
    new P2, .PerlArray
    restore P1
    set I3, P1
    lt I3, 2, __grep_die_numargs
    set P0, P1[0]
    typeof S0, P0
    ne S0, "Sub", __grep_die_arg1
    set I0, 1
    set I1, 0
    set I2, P1
__grep_loop_start:
# call closure with current array value as arg
    save P0
    set P3, P1[I0]
    new P5, .PerlArray
    set P5, 1
    set P5[0], P3
    save P5
    bsr __grep_closure
    restore P4
    set I3, P4
    lt I3, 1, __grep_check_end
    dec I3
    set P6, P4[I3]
__grep_return_check:
    if P6, __grep_match_ok
    branch __grep_check_end
__grep_match_ok:
    set P2[I1], P3
    inc I1
__grep_check_end:
    inc I0
    eq I0, I2, __grep_loop_end
    branch __grep_loop_start
__grep_loop_end:
    save P2
    pops
    popi
    popp
    ret
__grep_die_numargs:
    set S0, "wrong number of args for grep"
    new P0, .PerlArray
    set P0[0], S0
    save P0
    bsr _die
    branch __grep_loop_end
__grep_die_arg1:
    set S0, "First argument to grep must be a closure"
    new P0, .PerlArray
    set P0[0], S0
    save P0
    bsr _die
    branch __grep_loop_end
__grep_closure:
    pushp
    restore P1
    restore P0
    save P1
    invoke
    restore P2
    save P2
    popp
    ret

_map:
    pushp
    pushi
    pushs
    new P2, .PerlArray
    restore P1
    set I3, P1
    lt I3, 2, __map_die_numargs
    set P0, P1[0]
    typeof S0, P0
    ne S0, "Sub", __map_die_arg1
    set I0, 1
    set I1, 0
    set I2, P1
__map_loop_start:
# call closure with current array value as arg
    save P0
    set P3, P1[I0]
    new P5, .PerlArray
    set P5, 1
    set P5[0], P3
    save P5
    bsr __map_closure
    restore P4
    set I3, P4
    lt I3, 1, __map_check_end
    dec I3
    set P6, P4[I3]
__map_return_check:
    if P6, __map_match_ok
    branch __map_check_end
__map_match_ok:
    set P2[I1], P6
    inc I1
__map_check_end:
    inc I0
    eq I0, I2, __map_loop_end
    branch __map_loop_start
__map_loop_end:
    save P2
    pops
    popi
    popp
    ret
__map_die_numargs:
    set S0, "wrong number of args for map"
    new P0, .PerlArray
    set P0[0], S0
    save P0
    bsr _die
    branch __map_loop_end
__map_die_arg1:
    set S0, "First argument to map must be a closure"
    new P0, .PerlArray
    set P0[0], S0
    save P0
    bsr _die
    branch __map_loop_end
__map_closure:
    pushp
    restore P1
    restore P0
    save P1
    invoke
    restore P2
    popp
    ret

_index:
    pushp
    pushs
    pushi
    restore P0
    set I2, P0
    lt I2, 2, __index_numarg_error
    set S0, P0[0]
    set S1, P0[1]
    set I0, 0
    new P1, .PerlInt
    set P1, I0
    lt I3, 3, __index_2_arg
    index I0, S0, S1
    set P1, I0
    branch __index_end
__index_2_arg:
    set I1, P0[2]
    index I0, S0, S1, I1
    set P1, I0
__index_end:
    save P1
    popi
    pops
    popp
    ret
__index_numarg_error:
    set S0, "wrong number of args for index"
    new P0, .PerlArray
    set P0[0], S0
    save P0
    bsr _die
    branch __index_end

_time:
    pushn
    pushp
    new P1, .PerlNum
    time N1
    set P1, N1
    save P1
    popp
    popn
    ret

_sleep:
    pushp
    pushi
    restore P0
    set I0, P0
    sleep I0
    popi
    popp
    ret

_print1:
    pushp
    restore P31
    print P31
    print "\n"
    popp
    ret

_print:
    pushi
    pushp
    restore P3
    set I0, P3
    set I1, 0
_print_loopstart:
    eq I0, I1, _print_loopend
    set P0, P3[I1]
    print P0
    inc I1
    branch _print_loopstart
_print_loopend:
    popp
    popi
    ret

_exit:
    pushp
    restore P0
    print P0
    print "\n"
    end
    ret

_die:
    pushp
    pushi

    # setup $!: ####################
    new P0, .PerlString
    restore P3
    set I0, P3
    eq I0, 0, _die_unknown
    new P1, .PerlString
    set I1, 0
_die_loopstart:
    eq I0, I1, _die_loopend
    set P1, P3[I1]
    concat P0, P0, P1
    inc I1
    branch _die_loopstart
_die_unknown:
    set P0, "Unknown error."
_die_loopend:
    store_global "_SV__BANG_", P0

    # Look for a CATCH handler: ###
    find_global P1, "_AV_catchers"
    set I0, P1
    eq I0, 0, _die_nohandler

    # Remove top catch handler
    dec I0
    set P0, P1[I0]
    set P1, I0
    store_global "_AV_catchers", P1
# Implicitly refers to continuation in P0
    invoke
_die_nohandler:
    print P0
    print "\nDied (no handler).\n"
    end
    ret

_warn:
    bsr _print
    ret

__CALL_CLOSURE:
    pushp
    restore P0
    restore P1
    save P1
    invoke
    popp
    ret

 __setup:
    save P0			# == argv
    pushp
    pushi
    restore P0
#  P0 is array of commandline args
#  -lt: should we really preserve any registers here?
    new P1, .PerlArray
    new P2, .PerlString
    set I0, P0
# $0 / $PROGRAM_NAME
    set P2, P0[0]
    store_global "_SV_0", P2
    store_global "_SV_PROGRAM_NAME", P2

# @ARGS == @ARGV[1..@ARGV.length]
    set I1, 0
    set I2, 1
    dec I0
    set P1, I0
    branch __setup_arg_end
__setup_arg:
    set S0, P0[I2]
    set P1[I1], S0
    inc I1
    inc I2
__setup_arg_end:
    lt I1, I0, __setup_arg
    store_global "_AV_ARGS", P1

# exception handling:
    new P0, .PerlArray
    store_global "_AV_catchers", P0
    new P0, .PerlUndef
    store_global "_SV__BANG_", P0
    popi
    popp
    ret

__install_catch:
    pushp
    pushi
    # gross continuation-creating sequence:
    restore P0
    find_global P2, "_AV_catchers"
    set I1, P2
    set P2[I1], P0
    store_global "_AV_catchers", P2
    popi
    popp
    ret

__pop_catch:
    pushp
    pushi
    find_global P2, "_AV_catchers"
    set I1, P2
    dec I1
    set P2, I1
    store_global "_AV_catchers", P2
    popi
    popp
    ret

.eom

END

}
1;
