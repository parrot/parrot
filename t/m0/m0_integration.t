#! perl
# Copyright (C) 2011, Parrot Foundation.

=head1 NAME

t/tools/m0_integration.t - M0 integration tests

=head1 SYNOPSIS

    % prove t/m0/m0_integration.t

=head1 DESCRIPTION

Tests the M0 assembler and interpreter with the files in
t/m0/integration/ .

=cut

use strict;
use warnings;
use File::Slurp qw/slurp/;
#use Carp::Always;

use Test::More;
use File::Spec::Functions;
use TAP::Parser;
use Data::Dumper;

my @m0_files = glob catfile( '.', qw/t m0 integration *.m0/);

plan tests => 2 * scalar @m0_files;

for my $file (@m0_files) {
    if($file =~ m/add_n/) {
        local $TODO = "set_imm N0, 0, 42.0 gets flagged as an invalid M0 line";
        test_m0_file($file);
    } else {
        test_m0_file($file);
    }
}

sub test_m0_file {
    my ($file)  = @_;

    assemble($file);
    my $interp    = catfile( ".", qw/src m0 perl5 m0_interp.pl/ );

    my $tap = `$^X $interp ${file}b 2>&1`;
    my $parser = TAP::Parser->new( {tap => $tap} );
    $parser->run;
    is($parser->has_problems, 0, "$file passes");
    return;
}

sub assemble {
    my ($options) = @_;
    my $assembler    = catfile( ".", qw/src m0 perl5 m0_assembler.pl/ );
    my $out = `$^X $assembler $options 2>&1`;
    is($?, 0, "Got a successful exit code assembling $options") or diag $out;
    return $out;
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
