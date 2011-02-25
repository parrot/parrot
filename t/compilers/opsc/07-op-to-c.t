#! ./parrot-nqp
# Copyright (C) 2011, Parrot Foundation.

pir::load_bytecode("opsc.pbc");
Q:PIR{ .include "test_more.pir" };

my $compiler := pir::compreg__Ps('Ops');
my $trans    := Ops::Trans::C.new;

for get_test_data() -> $test {
    my $past := $compiler.compile($test[1], target => 'past');
    my $body := $past<ops>[0].get_body($trans);
    diag( $body );
    ok( $body ~~ $test[2], $test[0]);
}


done_testing();

# Return tuples of (description, buf, regex) for testing emitting C
sub get_test_data() {
    list(
        [
            'Call foo(bar, baz)',
            q«
inline op noop(in PMC) :flow {
            foo(bar, baz);
}
        »,
        / 'foo(bar, baz)' /
        ],

    );
}

# vim: expandtab shiftwidth=4 ft=perl6:
