package P6C::Builtins;

=head1 B<P6C::Builtins>

XXX: Pre-declare functions the hard way.  Once IMCC supports more
opcodes, this (and emit) will become unnecessary, as we can use a
"header file" to declare builtins in Perl 6 syntax, and add_code to
supply their function bodies.

=cut

use P6C::Context;
use P6C::Parser;
use strict;

# Squash warnings about builtins having empty bodies.  One entry for
# each builtin implemented below.
use vars '%builtin_names';
BEGIN {
    my @names = qw(print1 exit warn die print sleep time substr length
		   index map grep join reverse defined install_catch
		   pop_catch);
    @builtin_names{@names} = (1) x @names;
}

sub is_builtin {
    return exists $builtin_names{+shift};
}

sub declare {
    my $hash = shift;
    for (qw(print1 exit sleep install_catch pop_catch)) {
        my ($sig, $ctx) = P6C::Parser::parse_sig('$a', no_named => 1);
	$P6C::Context::CONTEXT{$_} = $ctx;
	$hash->{$_} = new P6C::IMCC::Sub params => $sig, rettype => [];
	$P6C::Parser::WANT{$_} = 'scalar_expr';
    }

    for (qw(time)) {
        my ($sig, $ctx) = P6C::Parser::parse_sig('', no_named => 1);
	$P6C::Context::CONTEXT{$_} = $ctx;
	$hash->{$_} = new P6C::IMCC::Sub params => $sig, rettype => 'PerlInt';
	$P6C::Parser::WANT{$_} = 'no_args';
    }

    for (qw(print warn die)) {
        my ($sig, $ctx) = P6C::Parser::parse_sig('*@params', no_named => 1);
	$P6C::Context::CONTEXT{$_} = $ctx;
	$hash->{$_} = new P6C::IMCC::Sub params => $sig, rettype => [];
	$P6C::Parser::WANT{$_} = 'bare_arglist';
    }
    for (qw(join)) {
        my ($sig, $ctx) = P6C::Parser::parse_sig('$separator,*@params', no_named => 1);
	$P6C::Context::CONTEXT{$_} = $ctx;
	$hash->{$_} = new P6C::IMCC::Sub params => $sig,
                                         rettype => 'PerlString';
	$P6C::Parser::WANT{$_} = 'bare_arglist';
    }
    for (qw(substr)) {
        my ($sig, $ctx) = P6C::Parser::parse_sig('*@params', no_named => 1);
	$P6C::Context::CONTEXT{$_} = $ctx;
	$hash->{$_} = new P6C::IMCC::Sub params => $sig,
                                         rettype => 'PerlString';
	$P6C::Parser::WANT{$_} = 'bare_arglist';
    }

    for (qw(index)) {
        my ($sig, $ctx) = P6C::Parser::parse_sig('$haystack,$needle,*@params', no_named => 1);
	$P6C::Context::CONTEXT{$_} = $ctx;
	$hash->{$_} = new P6C::IMCC::Sub params => $sig, rettype => 'PerlInt';
	$P6C::Parser::WANT{$_} = 'bare_arglist';
    }

    for (qw(length)) {
        my ($sig, $ctx) = P6C::Parser::parse_sig('$s', no_named => 1);
	$P6C::Context::CONTEXT{$_} = $ctx;
	$hash->{$_} = new P6C::IMCC::Sub params => $sig,
                                         rettype => 'PerlInt';
	$P6C::Parser::WANT{$_} = 'bare_arglist';
    }

    for (qw(reverse)) {
        my ($sig, $ctx) = P6C::Parser::parse_sig('*@params', no_named => 1);
	$P6C::Context::CONTEXT{$_} = $ctx;
	$hash->{$_} = new P6C::IMCC::Sub params => $sig,
                                         rettype => 'PerlArray';
	$P6C::Parser::WANT{$_} = 'bare_arglist';
    }

    for (qw(grep map)) {
        my ($sig, $ctx) = P6C::Parser::parse_sig('$condition,*@params', no_named => 1);
	$P6C::Context::CONTEXT{$_} = $ctx;
	$hash->{$_} = new P6C::IMCC::Sub params => $sig,
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

.sub _substr non_prototyped
    .local pmc params
    foldup params
    $I0 = params # Number of params
    if $I0 < 2 goto substr_die
    $S0 = params[0] # String
    $I1 = params[1] # Start offset
    if $I0 == 2 goto substr_2
    $I2 = params[2] # Length
    if $I0 > 4 goto substr_die
    length $I3, $S0
    $I4 = $I3
    if $I2 >= 0 goto substr_34
# len negative, leave -len of string
    $I3 = $I3 - $I1
    $I3 = $I3 + $I2
    $I2 = $I3
substr_34:
    $S1 = ""
# # offset >= len?
    if $I1 >= $I4 goto substr_ret
    if $I0 == 4 goto substr_4
substr_3:
    substr $S1, $S0, $I1, $I2
substr_ret:
    $P1 = new PerlString
    $P1 = $S1
    .pcc_begin_return
    .return $P1
    .pcc_end_return
substr_4:
    $S2 = params[3]
    substr $S1, $S0, $I1, $I2, $S2
    params[2] = $S1
    goto substr_ret
substr_2:
    length $I2, $S0
    sub $I2, $I2, $I1
    goto substr_3
substr_die:
    $S0 = "wrong number of args for substr"
    $P3 = new PerlString
    $P3 = $S0
    find_lex $P2, "&die"
    $P2($P3)
    goto substr_ret
    end
.end

.sub _length non_prototyped
    .param pmc s
    $S0 = s
    length $I0, $S0
    $P1 = new PerlInt
    set $P1, $I0
    .pcc_begin_return
    .return $P1
    .pcc_end_return
    end
.end

.sub _reverse non_prototyped
    .local pmc orig_array
    foldup orig_array
    $I0 = orig_array
    dec $I0
    $I1 = 0
    $P1 = new PerlArray
reverse_loopstart:
    $P2 = orig_array[$I0]
    $P1[$I1] = $P2
    inc $I1
    dec $I0
    if 0 <= $I0 goto reverse_loopstart
    .pcc_begin_return
    .return $P1
    .pcc_end_return
    end
.end

.sub _join non_prototyped
    .param pmc separator_pmc
    .local pmc params
    foldup params, 1
    .local int num_params
    num_params = params
    if num_params > 0 goto join_next
# Empty args:
    $S0 = ""
    goto join_ret
# At least one arg:
join_next:
    .local string separator
    separator = separator_pmc
    $S0 = params[0]		# accumulated string
    .local int counter
    counter = 1			# arg number
    goto join_test
join_loopstart:
    $S2 = params[counter]
    concat $S0, separator
    concat $S0, $S2
    inc counter
join_test:
    if num_params != counter goto join_loopstart
join_ret:
    $P2 = new PerlString
    $P2 = $S0
    .pcc_begin_return
    .return $P2
    .pcc_end_return
    end
.end

.sub _index non_prototyped
    .param string haystack
    .param string needle
    .local pmc params
    foldup params, 2
    $I2 = params
    $I0 = 0
    $P1 = new PerlInt
    $P1 = $I0
    if $I3 > 0 goto index_3_arg
    index $I0, haystack, needle
    $P1 = $I0
    goto index_end
index_3_arg:
    $I1 = params[0]
    index $I0, haystack, needle, $I1
    $P1 = $I0
index_end:
    .pcc_begin_return
    .return $P1
    .pcc_end_return
    end
index_numarg_error:
    $S0 = "wrong number of args for index"
    _die($S0)
    goto index_end
.end

.sub _time non_prototyped
    $P1 = new PerlNum
    time $N1
    set $P1, $N1
    .pcc_begin_return
    .return $P1
    .pcc_end_return
.end

.sub _sleep non_prototyped
    .param pmc wait
    $I0 = wait
    sleep $I0
.end

.sub _print1 non_prototyped
    .param object p
    print p
    print "\n"
.end

.sub _print non_prototyped
    .local pmc params
    .local int num_elem
    .local int counter
    foldup params
    num_elem = params
    counter = 0
print_loopstart:
    if counter == num_elem goto print_loopend
    $P0 = params[counter]
    print $P0
    inc counter
    goto print_loopstart
print_loopend:
.end

.sub _exit non_prototyped
    .param object message
    print message
    print "\n"
    end
.end

.sub _die non_prototyped
    .local object params
    foldup params

    # setup $!: ####################
    .local object dollar_bang
    dollar_bang = new PerlString
    .local int num_params
    num_params = params
    if num_params == 0 goto die_unknown
    $P1 = new PerlString
    .local int counter
    counter = 0
die_loopstart:
    if num_params == counter goto die_loopend
    $P1 = params[counter]
    dollar_bang = dollar_bang . $P1
    inc counter
    goto die_loopstart
die_unknown:
    dollar_bang = "Unknown error."
die_loopend:
    store_global "_SV__BANG_", dollar_bang

    # Look for a CATCH handler: ###
    .local object try_stack
    find_global try_stack, "_AV_catchers"
    $I0 = try_stack
    if $I0 == 0 goto die_nohandler

    # Remove top catch handler
    dec $I0
    $P0 = try_stack[$I0]
    try_stack = $I0
    store_global "_AV_catchers", try_stack
    invoke $P0

die_nohandler:
    print dollar_bang
    print "\nDied (no handler).\n"
    end
.end

.sub _warn non_prototyped
    .local object params
    foldup params
    $P1 = _print(params)
    .pcc_begin_return
    .return $P1
    .pcc_end_return
.end

.sub _grep non_prototyped
    .param Sub condition
    .local pmc params
    foldup params, 1
    .local int tmp
    .local PerlArray result_list
    .local int ii
    .local pmc comparison_result
    .local pmc element
    result_list = new PerlArray
    lt I3, 2, __grep_die_numargs
    typeof S0, condition
    ne S0, "Sub", __grep_die_arg1
    ii = 0
__grep_loop_top:
    tmp = params
    ge ii, tmp, __grep_loop_end
    element = params[ii]
    comparison_result = condition(element)
    unless comparison_result, __grep_next
    push result_list, element
__grep_next:
    inc ii
    branch __grep_loop_top
__grep_loop_end:
    .pcc_begin_return
    .return result_list
    .pcc_end_return
__grep_die_numargs:
    set S0, "wrong number of args for grep"
    condition = new PerlArray
    set condition[0], S0
    _die(condition)
    branch __grep_loop_end
__grep_die_arg1:
    set S0, "First argument to grep must be a closure"
    condition = new PerlArray
    set condition[0], S0
    _die(condition)
    branch __grep_loop_end
.end

.sub _map non_prototyped
    .local pmc params
    foldup params
    $P2 = new PerlArray
    set $I3, params
    lt $I3, 2, __map_die_numargs
    set $P0, params[0]
    typeof S0, $P0
    ne S0, "Sub", __map_die_arg1
    set I0, 1
    set I1, 0
    set I2, params
__map_loop_start:
# call closure with current array value as arg
    save $P0
    set $P3, params[I0]
    $P5 = new PerlArray
    set $P5, 1
    set $P5[0], $P3
    __map_closure($P5)
###    restore $P4
    set $I3, $P4
    lt $I3, 1, __map_check_end
    dec $I3
    set $P6, $P4[$I3]
__map_return_check:
    if $P6, __map_match_ok
    branch __map_check_end
__map_match_ok:
    set $P2[I1], $P6
    inc I1
__map_check_end:
    inc I0
    eq I0, I2, __map_loop_end
    branch __map_loop_start
__map_loop_end:
    .pcc_begin_return
    .return $P2
    .pcc_end_return
__map_die_numargs:
    set S0, "wrong number of args for map"
    $P0 = new PerlArray
    set $P0[0], S0
    _die($P0)
    branch __map_loop_end
__map_die_arg1:
    set S0, "First argument to map must be a closure"
    $P0 = new PerlArray
    set $P0[0], S0
    _die($P0)
    branch __map_loop_end
__map_closure:
    pushp
    save $P1
    invoke
    .pcc_begin_return
    .pcc_end_return
.end

.sub __setup
#  P5 is array of commandline args
#  -lt: should we really preserve any registers here?
    $P1 = new PerlArray
    $P2 = new PerlString
    set I0, P5
# $0 / $$PROGRAM_NAME
    set $P2, P5[0]
    store_global "_SV_0", $P2
    store_global "_SV_$PROGRAM_NAME", $P2

# @ARGS == @ARGV[1..@ARGV.length]
    set I1, 0
    set I2, 1
    dec I0
    set $P1, I0
    branch __setup_arg_end
__setup_arg:
    set S0, P5[I2]
    set $P1[I1], S0
    inc I1
    inc I2
__setup_arg_end:
    lt I1, I0, __setup_arg
    store_global "_AV_ARGS", $P1

# %ENV
    $P1 = new PerlEnv
    store_global "_HV_ENV", $P1

# exception handling:
    $P0 = new PerlArray
    store_global "_AV_catchers", $P0
    $P0 = new PerlUndef
    store_global "_SV__BANG_", $P0
    ret # Only called from top level
.end

.sub _install_catch non_prototyped
    .param pmc continuation
    .local pmc try_stack
    find_global try_stack, "_AV_catchers"
    $I1 = try_stack
    try_stack[$I1] = continuation
    store_global "_AV_catchers", try_stack
.end

.sub _pop_catch non_prototyped
    .local pmc try_stack
    find_global try_stack, "_AV_catchers"
    $I1 = try_stack
    dec $I1
    try_stack = $I1
    store_global "_AV_catchers", try_stack
.end

END

}
1;

