# There is no "export" in nqp. So avoid putting subs into Test namespace.
#module Test;

our sub yaml_ok($yaml, $expected, $description, *%adverbs) {
    my $parser := YAML::Tiny.new;
    my $result := $parser.read_string($yaml);
    is_deeply($result, $expected, $description);
}

Q:PIR {
    # We want Test::More features for testing. Not NQP's builtin.
    .include "test_more.pir"
}

# vim: ft=perl6
