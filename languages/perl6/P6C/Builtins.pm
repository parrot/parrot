package P6C::Builtins;

=head1 B<P6C::Builtins>

XXX: Pre-declare functions the hard way.  Once IMCC supports more
opcodes, this (and emit) will become unnecessary, as we can use a
"header file" to declare builtins in Perl 6 syntax, and add_code to
supply their function bodies.

=cut

use P6C::Context;
use P6C::Parser;

use vars '%builtin_names';
BEGIN {
    my @names = qw(print1 exit warn die print sleep time time0);
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
}

sub add_code {
    my $funcs = shift;
    # (see docs above)
}

sub emit {

print <<'END';

.emit

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
