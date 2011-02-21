#! parrot-nqp

Q:PIR {
    # We want Test::More features for testing. Not NQP's builtin.
    .include "test_more.pir"
    load_bytecode "opsc.pbc"
};

my $c := pir::compreg__ps('Ops');
test_parse_simple($c);

done_testing();


sub test_parse_simple($c) {
    _parse($c, q|
inline op noop() {
}
|);
    ok(1, "Empty op parsed");

    _parse($c, q|
inline op noop() {
    foo();
}
|);
    ok(1, "Simple call op parsed");

    _parse($c, q|
inline op noop() {
    foo(42);
}
|);
    ok(1, "Complex call op parsed");

    _parse($c, q|
inline op noop() {
    char bar;
}
|);
    ok(1, "Simple declaration parsed");

    _parse($c, q|
inline op noop() {
    Interp * const new_interp;
}
|);
    ok(1, "Complex declaration parsed");

    _parse($c, q|
inline op noop() {
    Interp * const new_interp = foo();
}
|);
    ok(1, "More complex declaration parsed");


};


sub _parse($c, $buf) {
    my $res := $c.parse($buf, :target<parse>);
    _dumper($res);
    $res;
}

INIT {
    pir::load_bytecode("dumper.pbc");
}

# vim: ft=perl6
