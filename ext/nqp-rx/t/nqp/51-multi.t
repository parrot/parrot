#! parrot-nqp

say("1..9");

our multi sub foo(Float $f) {
    say("ok 1");
}

our multi sub foo(NQP::Grammar $f) {
    say("ok 2");
}

our multi sub foo($def) {
    say($def);
}

foo(42.01);
foo(NQP::Grammar.new);
foo("ok 3");

class Foo {
    our multi method bar(Float $f) {
        say("ok 4");
    };

    our multi method bar($f) {
        say($f);
    };

    multi method baz(Integer $i) {
        say("ok 6");
    }

    multi method baz($i) {
        say($i);
    };

};

my $f := Foo.new;
$f.bar(43.5 - 0.5);
$f.bar("ok 5");
$f.baz(42);
$f.baz("ok 7");


class Bar {
    our multi method foo($x, :$opt?) {
        say($x);
    }

    our multi method foo(Float $x, :$opt?) {
        say("ok 8");
    }
}

my $b := Bar.new;
$b.foo(43.5 - 0.5);
$b.foo("ok 9");

