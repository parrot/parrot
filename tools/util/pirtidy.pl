#! perl
# $Id$

use strict;
use warnings;
use Fatal qw( open close );

use lib 'lib';
use Parrot::PIR::Formatter;

my $extension = 'tdy';
my $verbose   = 'that is SO true.';

# loop over all the files specified on the command line
foreach my $file (@ARGV) {
    warn "Processing $file...\n" if $verbose;
    open my $ifh, '<', $file;
    my $outfile = "$file.$extension";
    open my $ofh, '>', $outfile;

    my $formatter = new Parrot::PIR::Formatter();

    foreach my $line (<$ifh>) {
      $formatter->add_pir( $line );
    }

    my $output = $formatter->get_formatted();
    print {$ofh} $output;

    close $ifh;
    close $ofh;
}

__END__

=head1 NAME

tools/util/pirtidy.pl - a PIR script indenter and reformatter

=head1 SYNOPSIS

 perl pirtidy.pl [ options ] file1 file2 file3 ...
         (output goes to file1.tdy, file2.tdy, file3.tdy, ...)

=head1 DESCRIPTION

pirtidy reads a pir file and writes an indented, reformatted script.

pirtidy is somewhat liberal about how it formats your file -- it has
no qualms about converting your script to use a maximal amount of
syntactic sugar.

Inspired by perltidy.

=head1 EXAMPLES

 perl pirtidy.pl somefile.pir

This will produce a file somefile.pir.tdy containing the pir file
reformatted using the default options. pirtidy never changes the input file.

=head1 BUGS

Missing all of the perltidy-ish geeknobs and options.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
