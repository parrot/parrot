#! parrot-nqp

Q:PIR {
    # We want Test::More features for testing. Not NQP's builtin.
    .include "test_more.pir"
    load_bytecode "opsc.pbc"
};

my $c := pir::compreg__ps('Ops');

parse_ok($c, q|
inline op noop() {
}
| , "Empty op parsed");

parse_ok($c, q|
inline op noop() {
    foo();
}
|, "Simple call op parsed");

parse_ok($c, q|
inline op noop() {
    foo(42);
}
|, "Complex call op parsed");

parse_ok($c, q|
inline op noop() {
    foo("Answer", 42);
}
|, "More complex call op parsed");

parse_ok($c, q|
inline op noop() {
    char bar;
}
|, "Simple declaration parsed");

parse_ok($c, q|
inline op noop() {
    Interp * const new_interp;
}
|, "Complex declaration parsed");

parse_ok($c, q|
inline op noop() {
    Interp * const new_interp = foo();
}
|, "More complex declaration parsed");

parse_ok($c, q|
inline op noop() {
    Interp * const new_interp = foo("Answer", 42);
}
|, "Really complex declaration parsed");

parse_ok($c, q|
inline op noop(in PMC) {
    foo = bar;
}|, "Simple assignment");

parse_ok($c, q|
inline op noop(in PMC) {
    foo($1);
}|, "Simple register");

parse_ok($c, q|
inline op noop(out PMC, in INT) {
    $1 = foo($2);
}|, "Simple register assignment");



done_testing();


sub parse_ok($c, $buf, $descriptor) {
    try {
        _parse($c, $buf);
        ok(1, $descriptor);
        CATCH {
            ok(0, $descriptor);
            diag($!);
        }
    }
}

sub _parse($c, $buf) {
    my $res := $c.parse($buf, :target<parse>);
    _dumper($res);
    $res;
}

INIT {
    pir::load_bytecode("dumper.pbc");
}

# vim: ft=perl6
