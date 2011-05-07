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

use Test::More;
use File::Spec::Functions;

plan tests => 9;


my $exefile = catfile( ".", qw/src m0 m0_assembler.pl/ );

output_like(
    catfile(qw/t m0 hello.m0/),
    qr/Parsing chunk/,
    'parse hello.m0'
);

ok(-e catfile(qw/t m0 hello.m0b/), 'created hello.m0b');

output_like(
    catfile(qw/t m0 hello.m0/),
    qr/Parsing M0 v0/,
    'detect M0 v0'
);

output_like(
    catfile(qw/t m0 hello.m0/),
    qr/Parsed data for 36 ops/,
    'Parse data for the correct number of ops'
);

output_like(
    catfile(qw/t m0 hello_invalid.m0/),
    qr/Invalid M0/ms,
    'detect invalid M0'
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

END {
    unless ($ENV{POSTMORTEM}) {
        unlink(catfile(qw/t m0 hello.m0b/));
    }
}
