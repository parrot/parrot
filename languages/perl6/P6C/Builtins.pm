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
    for (qw(print1 exit sleep time)) {
	$hash->{$_} = new P6C::IMCC::Sub args => [['PerlUndef', 'a']];
	$P6C::Context::CONTEXT{$_} = new P6C::Context type => 'PerlUndef';
    }

    for (qw(print warn die)) {
	$P6C::Context::CONTEXT{$_} = $P6C::Context::DEFAULT_ARGUMENT_CONTEXT;
	$hash->{$_} = new P6C::IMCC::Sub args => [['PerlArray', '_']];
    }
    for (qw(time0)) {
	$hash->{$_} = new P6C::IMCC::Sub args => [];
	$P6C::Context::CONTEXT{$_} = new P6C::Context type => 'PerlUndef';
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
restore P1
time N30
set P1, N30
popp
popn
ret

_time0:
pushn
pushp
time N0
new P0, .PerlUndef
set P0, N0
store_global P0, "_SV_t"
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
    # setup $!:
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
    store_global P0, "_SV__BANG_"
    # Look for a CATCH handler:
    find_global P1, "_AV_catchers"
    set I0, P1
    eq I0, 0, _die_nohandler

    dec I0
    set P0, P1[I0]
    set P1, I0
    store_global P1, "_AV_catchers"
    callcc P0
    print "shouldn't be here\n"
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
call
popp
ret

__setup:
    pushp
    new P0, .PerlArray
    store_global P0, "_AV_catchers"
    new P0, .PerlUndef
    store_global P0, "_SV__BANG_"
    popp
    ret

__install_catch:
    pushp
    pushi
    capturecc P0
    find_global P2, "_AV_catchers"
    set I1, P2
    set P2[I1], P0
    store_global P2, "_AV_catchers"
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
    store_global P2, "_AV_catchers"
    popi
    popp
    ret

.eom

END

}
1;
