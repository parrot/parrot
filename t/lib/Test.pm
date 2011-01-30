# There is no "export" in nqp. So avoid putting subs into Test namespace.
#module Test;

our sub yaml_ok($yaml, $expected, $description, *%adverbs) {
    my $parser := YAML::Tiny.new;
    try {
        my $result := $parser.read_string($yaml);
        #print("result: "); _dumper($result);
        #print("expected: "); _dumper($expected);
        is_deeply($expected, $result, $description, todo => %adverbs<todo> ?? $description !! 0);

        CATCH {
            nok(1, "Parse failed '{ $! }'", %adverbs<todo> ?? $description !! 0);
        }
    }
}

Q:PIR {
    # We want Test::More features for testing. Not NQP's builtin.
    .include "test_more.pir"
    load_bytecode "dumper.pbc"
}

# vim: ft=perl6
