#! perl
# Copyright (C) 2012-2015, Parrot Foundation.

=head1 NAME

t/stress/threads.t - Threads with Garbage Collection

=head1 SYNOPSIS

    % prove -v t/stress/threads.t

=head1 DESCRIPTION

Tests threads stability under garbage collection.

Also IO stress: Large -t trace pir output segfaults in GC (strings problem). see gc.t

=cut

use strict;
use warnings;
use lib qw(lib . ../lib ../../lib);
use Test::More;
use Parrot::Test tests => 2;
use Parrot::Config;

# Task stress with GC
# Segfault #880
{
    $ENV{TEST_PROG_ARGS} ||= '';
    if ($^O eq 'darwin') {
        my $cwd = `pwd`;
        chomp($cwd);
        $ENV{DYLD_LIBRARY_PATH} = $cwd."/blib/lib";
    }
    my $parrot = File::Spec->join( File::Spec->curdir(), 'parrot' . $PConfig{exe} );
    my $src = 'examples/threads/chameneos.pir';
    my $pbc = 'examples/threads/chameneos.pbc';
    system($parrot, '-o', $pbc, $src);
    my $todo = $PConfig{ccflags} =~ /-DTHREAD_DEBUG/;
    pbc_exit_code_is( $pbc, 0, 'chameneos',
        $todo ? (todo => 'GH #880 GC walks into thread interp') : ());
    unlink $pbc;
}


# IO stress: trace pir output segfaults
# ASSERT src/gc/gc_gms.c:1189: failed assertion '(pmc) == NULL || (pmc)->orig_interp == (interp)'
{
    local $ENV{TEST_PROG_ARGS} .= '-t11 --gc-nursery-size=0.001 --gc-debug ';

    pir_exit_code_is( << 'CODE', 0, "IO Stress with -t", todo => 'stringbuilder gc stress #1132');
.sub test :main
    load_bytecode "dumper.pbc"
    load_bytecode 'Test/More.pbc'
    load_bytecode 'MIME/Base64.pbc'
    load_bytecode 'PGE.pbc'
    load_bytecode 'PGE/Util.pbc'
    load_language 'data_json'

   .local pmc json
    json = compreg 'data_json'

    .local pmc encode_decode_tests, decode_tests
    encode_decode_tests = json.'compile'( <<'END_JSON' )
[ ["Hello, World!\n","SGVsbG8sIFdvcmxkIQo="],
  ["aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
  "YWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFh\nYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYQ=="]
]
END_JSON

    .local pmc enc_sub
    enc_sub = get_global [ "MIME"; "Base64" ], 'encode_base64'
    .local pmc is
    is   = get_hll_global [ 'Test'; 'More' ], 'is'
    .local pmc test_iterator, test_case
    encode_decode_tests = encode_decode_tests()
    test_iterator = iter encode_decode_tests

    .local string plain, base64, result
    test_case   = shift test_iterator
    plain       = shift test_case
    base64      = shift test_case
    result = enc_sub( plain )
    is( result, base64 )

.end
CODE

}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
