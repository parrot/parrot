#! ./parrot-nqp
# Copyright (C) 2011, Parrot Foundation.

pir::load_bytecode("opsc.pbc");
Q:PIR{ .include "test_more.pir" };

my $compiler := pir::compreg__Ps('Ops');
my $trans    := Ops::Trans::C.new;
my %c;
%c<trans>    := $trans;

for get_test_data() -> $test {
    try {
        my $past := $compiler.compile($test[1], target => 'past');
        my $body := $past<ops>[0].get_body(%c);
        diag( $body );
        ok( $body ~~ $test[2], $test[0]);

        CATCH {
            ok( 0, $test[0] ~ ': ' ~ $! );
        }
    }
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

        [
            'if (foo)',
            q«
inline op noop(in PMC) :flow {
    if (foo) bar();
}
            »,
            / 'if (foo)' /
        ],

        [
            'while (foo)',
            q«
inline op noop(in PMC) :flow {
    while (foo) bar();
}
            »,
            / 'while (foo)' /
        ],

        [
            'for (;;)',
            q«
inline op noop(in PMC) :flow {
    for (;;) bar();
}
            »,
            / 'for (; ; )' /
        ],

        [
            'for (foo;;)',
            q«
inline op noop(in PMC) :flow {
    for (foo;;) bar();
}
            »,
            / 'for (foo; ; )' /
        ],

        [
            'for (;foo;)',
            q«
inline op noop(in PMC) :flow {
    for (;foo;) bar();
}
            »,
            / 'for (; foo; )' /
        ],

        [
            'for (;;foo)',
            q«
inline op noop(in PMC) :flow {
    for (;;foo) bar();
}
            »,
            / 'for (; ; foo)' /
        ],

        [
            'for (foo;bar;baz)',
            q«
inline op noop(in PMC) :flow {
    for (foo;bar;baz) bar();
}
            »,
            / 'for (foo; bar; baz)' /
        ],


        [
            'Prefix -',
            q«
inline op noop(in PMC) :flow {
    $1 = -foo;
}
            »,
            / '-foo' /
        ],

        [
            'Infix *',
            q«
inline op noop(in PMC) :flow {
    $1 = foo * bar;
}
            »,
            / 'foo * bar' /
        ],

        [
            'Array access',
            q«
inline op noop(in PMC) :flow {
    $1 = foo[bar];
}
            »,
            / 'foo[bar]' /
        ],

        [
            'postcircumfix()',
            q«
inline op noop(in PMC) :flow {
    $1->vtable->foo(interp, $1);
}
            »,
            / '->vtable->foo(interp' /
        ],



    );
}

# vim: expandtab shiftwidth=4 ft=perl6:
