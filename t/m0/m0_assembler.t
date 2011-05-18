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

plan tests => 18;

my $exefile    = catfile( ".", qw/src m0 m0_assembler.pl/ );
my $hello_m0   = catfile(qw/t m0 hello.m0/);
my $hello_m0b  = catfile(qw/t m0 hello.m0b/);
my $hello2_m0  = catfile(qw/t m0 hello2.m0/);
my $hello2_m0b = catfile(qw/t m0 hello2.m0b/);

output_like(
    $hello_m0,
    qr/Parsing chunk/,
    'parse hello.m0'
);

ok(-e $hello_m0b, 'created hello.m0b');
ok(-e $hello_m0b && -s $hello_m0b >= 16, 'hello.m0b is at least 16 bytes (size of M0 header)');

my $hello_bc = slurp($hello_m0b);
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
    qr/Parsed data for 36 ops/,
    'Parse data for the correct number of ops'
);

output_like(
    catfile(qw/t m0 hello_invalid.m0/),
    qr/Invalid M0/ms,
    'detect invalid M0'
);

output_like(
    catfile(qw/t m0 invalid_chunk_name.m0/),
    qr/Invalid M0/ms,
    'detect invalid chunk M0'
);

output_like(
    catfile(qw/t m0 invalid_chunk_name2.m0/),
    qr/Invalid M0/ms,
    'detect invalid chunk M0'
);

output_like(
    catfile(qw/t m0 hello_invalid2.m0/),
    qr/Invalid M0/ms,
    'detect invalid M0'
);

output_like(
    catfile(qw/t m0 invalid_version.m0/),
    qr/Invalid M0: No version/ms,
    'detect invalid version'
);

output_like(
    catfile(qw/t m0 invalid_bytecode.m0/),
    qr/Invalid M0 bytecode/ms,
    'detect invalid bytecode'
);

ok(!-e catfile(qw/t m0 invalid_bytecode.m0b/), 'invalid_bytece.m0b was not created');

sub output_like {
    my ($options, $snippet, $desc)  = @_;

    my $out = `$^X $exefile $options`;

    like( $out, $snippet, $desc );

    return;
}

sub output_unlike {
    my ($options, $snippet, $desc)  = @_;

    my $out = `$^X $exefile $options`;

    unlike( $out, $snippet, $desc );

    return;
}


END {
    unless ($ENV{POSTMORTEM}) {
        unlink $hello_m0b, $hello2_m0b;
    }
}
