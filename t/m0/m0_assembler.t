#! perl
# Copyright (C) 2011, Parrot Foundation.

=head1 NAME

t/tools/m0_assembler.t - Test the M0 assembler prototype

=head1 SYNOPSIS

    % prove t/m0/m0_assembler.t - test the assembler

=head1 DESCRIPTION

Tests the assembler.

=cut

use strict;
use warnings;

use Test::More;
use File::Spec::Functions;

plan tests => 2;

my $exefile = catfile( ".", qw/src m0 m0_assembler.pl/ );

output_like(
    catfile(qw/t m0 hello.m0/),
    qr/Parsing chunk/,
    'parse hello.m0'
);

output_like(
    catfile(qw/t m0 hello_invalid.m0/),
    qr/Invalid M0/ms,
    'parse hello_invalid.m0'
);

sub output_like {
    my ($options, $snippet, $desc)  = @_;

    my $out = `$^X $exefile $options`;

    like( $out, $snippet, $desc );

    return;
}
