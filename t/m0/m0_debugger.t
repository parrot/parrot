#! perl
# Copyright (C) 2012, Parrot Foundation.

=head1 NAME

t/tools/m0_debugger.t - M0 debugger tests

=head1 SYNOPSIS

    % prove t/m0/m0_debugger.t

=head1 DESCRIPTION

Tests the M0 debugger and interpreter with the files in
t/m0/debugger/ .

=cut

use strict;
use warnings;
use File::Slurp qw/slurp/;
#use Carp::Always;

use Test::More;
use File::Spec::Functions;
use TAP::Parser;
use Data::Dumper;

my $m0b_file        = glob catfile( '.', qw/t m0 basic hello_canon.m0b/);

plan tests => 1;

output_like(
    $m0b_file,
    catfile( '.', qw/t m0 debugger 01_simple.in/),
    catfile( '.', qw/t m0 debugger 01_simple.out/),
    'simple debugger test',
);


sub output_like {
    my ($m0b_file, $script_file, $out_file, $desc)  = @_;

    my $interp = $ENV{M0_DEBUG_INTERP} || catfile( ".", qw/src m0 c m0-debugger.exe/ );
    my $args   = join(' ', ('-s', $script_file) );

    diag "$interp ${m0b_file} $args 2>&1\n" if $ENV{DEBUG};
    my $out = `$interp ${m0b_file} $args 2>&1`;
    my $snippet = slurp $out_file;

    is($out, $snippet, $desc);

    return;
}

END {
    unless ($ENV{POSTMORTEM}) {
    }
}
# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
