#! perl
# Copyright (C) 2011, Parrot Foundation.

=head1 NAME

t/tools/m0_assembler.t - Test the M0 assembler prototype

=head1 SYNOPSIS

    % prove t/m0/m0_assembler.t - test the assembler

=head1 DESCRIPTION

Tests the M0 assembler that lives at src/m0/m0_assembler.pl .

=cut

use strict;
use warnings;
use File::Slurp qw/slurp/;
#use Carp::Always;

use Test::More;
use File::Spec::Functions;

plan tests => 30;

my $exefile    = catfile( ".", qw/src m0 perl5 m0_assembler.pl/ );
my $hello_m0   = catfile(qw/t m0 basic hello.m0/);
my $hello_m0b  = catfile(qw/t m0 basic hello.m0b/);
my $hello2_m0  = catfile(qw/t m0 basic hello2.m0/);
my $hello2_m0b = catfile(qw/t m0 basic hello2.m0b/);

output_like(
    $hello_m0,
    qr/Parsing chunk/,
    'parse hello.m0'
);

ok(-e $hello_m0b, 'created hello.m0b');
ok(-e $hello_m0b && -s $hello_m0b >= 16, 'hello.m0b is at least 16 bytes (size of M0 header)');

is(-s $hello_m0b, 118, 'hello.m0 bytecode should be 118 bytes');
my $hello_bc = slurp($hello_m0b, {binmode => ':raw'});
my $magic_number = substr($hello_bc, 0, 8);
cmp_ok($magic_number, 'eq', "\376M0B\r\n\032\n", "m0b file has correct magic number");

output_like(
    $hello2_m0,
    qr/Parsing chunk/,
    'parse hello2.m0, which has an empty string for a chunk name'
);

output_unlike(
    $hello2_m0,
    qr/Invalid M0/,
    'parse hello2.m0, which has an empty string for a chunk name. No "Invalid M0"'
);
ok(-e $hello2_m0b, 'created hello2.m0b');
ok(-e $hello2_m0b && -s $hello2_m0b >= 16, 'hello2.m0b is at least 16 bytes (size of M0 header)');


output_like(
    $hello_m0,
    qr/Parsing M0 v0/,
    'detect M0 v0'
);

output_like(
    $hello_m0,
    qr/Parsing M0 v0/,
    'detect M0 v0'
);

output_like(
    $hello_m0,
    qr/Parsed data for 42 ops/,
    'Parse data for the correct number of ops'
);

output_like(
    catfile(qw/t m0 invalid hello_multiversion.m0/),
    qr/Invalid M0/ms,
    'detect invalid M0 - multiple versions'
);

output_like(
    catfile(qw/t m0 invalid invalid_chunk_name.m0/),
    qr/Invalid M0/ms,
    'detect invalid chunk M0'
);

output_like(
    catfile(qw/t m0 invalid invalid_chunk_name2.m0/),
    qr/Invalid M0/ms,
    'detect invalid chunk M0'
);

output_like(
    catfile(qw/t m0 invalid hello_early_bytecode_segment.m0/),
    qr/Invalid M0/ms,
    'detect invalid M0 - early bytecode segment'
);

output_like(
    catfile(qw/t m0 invalid invalid_version.m0/),
    qr/Invalid M0: No version/ms,
    'detect invalid version'
);

output_like(
    catfile(qw/t m0 invalid invalid_bytecode.m0/),
    qr/Invalid M0 bytecode/ms,
    'detect invalid bytecode'
);

output_like(
    catfile(qw/t m0 invalid invalid_duplicate_labels.m0/),
    qr/Invalid M0/ms,
    'detect duplicate labels'
);

output_like(
    catfile(qw/t m0 invalid invalid_register.m0/),
    qr/Invalid register name: S999/,
    'detect invalid registers name (S999)',
);

output_like(
    catfile(qw/t m0 invalid invalid_op.m0/),
    qr/Invalid M0: unknown op 'set_immzzz'/,
    'detect invalid ops',
);

    my $file = catfile(qw/t m0 invalid invalid_register_type.m0/),
output_like(
    catfile(qw/t m0 invalid invalid_register_type.m0/),
    qr/Invalid register/,
    'detect invalid register types',
);

ok(!-e "${file}b", "invalid bytecode file ${file}b was not generated");

output_like(
    catfile(qw/t m0 invalid invalid_register_name.m0/),
    qr/Invalid register name: SPILLCOFFEE/,
    'detect invalid register name (SPILLCOFFEE)',
);

output_like(
    catfile(qw/t m0 invalid invalid_register_number.m0/),
    qr/Invalid register number/,
    'detect invalid register numbers',
);

output_like(
    catfile(qw/t m0 invalid invalid_register_number2.m0/),
    qr/Invalid register name: S/,
    'detect invalid registers (S)',
);

output_like(
    catfile(qw/t m0 invalid invalid_goto.m0/),
    qr/Invalid M0 - attempt to use undefined label lumiferous_aether/,
    'detect gotos with invalid labels',
);

output_like(
    catfile(qw/t m0 invalid invalid_chunk_names_collide.m0/),
    qr/Invalid M0/ms,
    'detect colliding chunk names',
);

ok(!-e catfile(qw/t m0 invalid invalid_bytecode.m0b/), 'invalid_bytecode.m0b was not created');

# TODO: check return code
output_like('',qr/Usage:/, 'given a Usage hint when assembler is given no arguments');

sub output_like {
    my ($options, $snippet, $desc)  = @_;

    local $ENV{M0DEBUG} = 1;
    my $out = `$^X $exefile $options 2>&1`;

    like( $out, $snippet, $desc );

    return;
}

sub output_unlike {
    my ($options, $snippet, $desc)  = @_;

    my $out = `$^X $exefile $options 2>&1`;

    unlike( $out, $snippet, $desc );

    return;
}


END {
    unless ($ENV{POSTMORTEM}) {
        unlink $hello_m0b, $hello2_m0b;
    }
}
# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
