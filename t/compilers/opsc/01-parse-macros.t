#! parrot-nqp

# Tests for parsing C macros
#
Q:PIR {
    # We want Test::More features for testing. Not NQP's builtin.
    .include "test_more.pir"
    load_bytecode "opsc.pbc"
};

my $c := pir::compreg__ps('Ops');


parse_ok($c, "Simple #define",
q«
#define FOO bar
»,
list(
    hash( path => 'body/c_macro/0/name', value => 'FOO'),
    hash( path => 'body/c_macro/0/body/0', value => 'bar'),
)
);

parse_ok($c, "Multiline #define",
q«
#define FOO \
        bar
»,
list(
    hash( path => 'body/c_macro/0/name', value => 'FOO'),
)
);

parse_ok($c, "Multiline #define with args",
q«
#define VTABLE_foo(i, p) \
        (p)->vtable->foo(i, p)
»,
list(
    hash( path => 'body/c_macro/0/name', value => 'VTABLE_foo'),
)
);



done_testing();


multi sub parse_ok($c, $descriptor, $buf, @paths) {
    my $res;
    try {
        $res := _parse($c, $buf);
        ok(1, $descriptor);

        for @paths -> $p {
            check_path($res, $p);
        }
        CATCH {
            ok(0, $descriptor);
            diag($!);

        }
    }
}

sub check_path($tree, $p) {
    my $path := $p<path>;

    my @parts := split('/', $path);
    diag(join('-', |@parts));
    diag(+@parts);

    try {
        # Walk through tree
        my $dot := $tree;
        for @parts -> $step {
            if $step ~~ /^ <digit>+ $/ {
                $dot := $dot[$step];
            }
            else {
                $dot := $dot{$step};
            }
        }

        is($dot, $p<value>, $path) if $p.exists('value');

        CATCH {
            ok(0, $path);
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
