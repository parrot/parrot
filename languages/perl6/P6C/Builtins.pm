package P6C::Builtins;

=head1 B<P6C::Builtins>

XXX: Pre-declare functions the hard way.  Once IMCC supports more
opcodes, this (and emit) will become unnecessary, as we can use a
"header file" to declare builtins in Perl 6 syntax, and add_code to
supply their function bodies.

=cut

use P6C::Context;
use P6C::Parser;

sub declare {
    my $hash = shift;
    $hash->{print1} = new P6C::IMCC::Sub args => [['PerlUndef', 'a']];
    $P6C::Context::CONTEXT{print1} = new P6C::Context type => 'PerlUndef';

    $hash->{exit} = new P6C::IMCC::Sub args => [['PerlUndef', 'a']];
    $P6C::Context::CONTEXT{exit} = new P6C::Context type => 'PerlUndef';

    for (qw(print warn die)) {
	$P6C::Context::CONTEXT{$_} = $P6C::Context::DEFAULT_ARGUMENT_CONTEXT;
	$hash->{$_} = new P6C::IMCC::Sub args => [['PerlArray', '_']];
    }
}

sub add_code {
    my $funcs = shift;
    # (see docs above)
}

sub emit {

print <<'END';
.emit

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
bsr _print
print "\nDied.\n"
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
new P0, .PerlArray
store_global P0, "_AV_catchers"
ret

.eom

END

}
1;
