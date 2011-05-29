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

plan tests => 1;

interp_output_like("t/m0/integration/m0_noop.m0", qr/1\.\.1\nok 1/, "m0_noop");

sub interp_output_like {
    my ($file, $regex, $desc)  = @_;

    assemble($file);
    my $interp    = catfile( ".", qw/src m0 m0_interp.pl/ );

    my $out = `$^X $interp ${file}b 2>&1`;
    like($out, $regex, $desc);

    return;
}

sub assemble {
    my ($options) = @_;
    my $assembler    = catfile( ".", qw/src m0 m0_assembler.pl/ );
    my $out = `$^X $assembler $options 2>&1`;
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
