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

    # XXX: might as well add ourselves to a few other things while
    # we're at it:
    $P6C::Context::CONTEXT{print1} = new P6C::Context type => 'PerlUndef';
    $P6C::Parser::WANT{print1} = 'scalar_expr';
}

sub add_code {
    my $funcs = shift;
    # (see docs above)
}

sub emit {

print <<'END';
.emit

print1:
pushp
restore P31
print P31
print "\n"
popp
ret

.eom

END

}
1;
