# Copyright (C) 2011, Parrot Foundation.

=head1 NAME

tools/build/h2inc.pl

=head1 DESCRIPTION

Generate C<.pasm> and C<.pm> files with constants based on C<.h> files.

Invoked by F<make>.  Imports functions from Parrot::H2inc.

=head1 USAGE

    perl tools/build/h2inc.pl <input_file> <output_file>

Example (from F<make> output):

    /usr/local/bin/perl tools/build/h2inc.pl include/parrot/enums.h \
        lib/Parrot/Pmc2c/PCCMETHOD_BITS.pm

=cut

use strict;
use warnings;
use lib qw( lib );
use Parrot::H2inc qw(
    parse_file
    perform_directive
    generate_text
    print_generated_file
);

my $usage = "Usage: $0 <input_file> <output_file>\n";

die $usage unless @ARGV == 2;
my ($in_file, $out_file) = @ARGV;

my $directive = parse_file($in_file, $out_file);
die "invalid output file: '$out_file' for input '$in_file'" unless $directive;

my $defs_ref = perform_directive($directive);

my $generated_text = generate_text($directive, $defs_ref);

print_generated_file( {
    in      => $in_file,
    out     => $out_file,
    script  => $0,
    gen     => $generated_text,
} );


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
