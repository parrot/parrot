#!./parrot-nqp

# Tests for 'make' builtin.

plan(2);

my $/ := Regex::Match.new();
make 'ok 1';
say($/.ast);

# check that it finds contextual $/
our sub foo() {
    make 'ok 2'
}

foo();
say($/.ast);


