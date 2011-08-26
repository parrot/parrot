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

#my @m0_files = grep { $_ !~ /cps_factorial/ }
#    glob catfile( '.', qw/t m0 integration *.m0/);
my @m0_files = (
    'm0_add_i.m0',
#    'm0_add_n.m0',
    'm0_and.m0',
    'm0_args.m0',
#    'm0_ashr.m0',
    'm0_chunk_name_const.m0',
#    'm0_convert_i_n.m0',
#    'm0_deref.m0',
    'm0_div_i.m0',
#    'm0_div_n.m0',
    'm0_goto_chunk.m0',
#    'm0_hash.m0',
    'm0_labels_without_goto.m0',
    'm0_labels_with_goto.m0',
    'm0_lshr.m0',
    'm0_metadata_basic.m0',
    'm0_mod_i.m0',
#    'm0_mod_n.m0',
    'm0_mult_i.m0',
#    'm0_mult_n.m0',
    'm0_noop.m0',
    'm0_or.m0',
#    'm0_poke_caller.m0',
#    'm0_set.m0',
#    'm0_set_imm.m0',
#    'm0_set_ref.m0',
    'm0_shl.m0',
    'm0_sub_i.m0',
#    'm0_sub_n.m0',
    'm0_xor.m0',
);
@m0_files = map { catfile( '.', (qw/t m0 integration/, $_) ) } @m0_files;

plan tests => 2 * scalar @m0_files;

for my $file (@m0_files) {
    if ($file =~ /m0_args/) {
        test_m0_file($file, "kittens", "2", "3", "4", "5");
    }
    else {
        test_m0_file($file);
    }
}

sub test_m0_file {
    my $file  = shift;

    assemble($file);
    my $interp    = catfile( ".", qw/src m0 c m0.exe/ );
    my $args = join(' ', @_);

    print "$interp ${file}b $args 2>&1\n";
    my $tap = `$interp ${file}b $args 2>&1`;
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
