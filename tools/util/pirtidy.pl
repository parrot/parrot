#! perl
# $Id: $

=head1 NAME

tools/util/pirtidy.pl - a PIR script indenter and reformatter

=head1 SYNOPSIS

 perl pirtidy.pl [ options ] file1 file2 file3 ...
         (output goes to file1.tdy, file2.tdy, file3.tdy, ...)

=head1 DESCRIPTION

pirtidy reads a perl script and writes an indented, reformatted script.

pirtidy is somewhat liberal about how it formats your script - it has
no qualms about converting your script to use a maximal amount of 
syntactic sugar.

Inspired by perltidy.

=head1 EXAMPLES

 perl pirtidy.pl somefile.pir

This will produce a file somefile.pir.tdy containing the script
reformatted using the default options. pirtidy never changes the input file.

=cut 

use strict;
use lib 'lib';

use Parrot::PIR::Formatter;

my $extension = "tdy";
my $verbose = "that is SO true.";

# loop over all the files specified on the command line
foreach my $file (@ARGV) {
  warn "Processing $file...\n" if $verbose;
  open my $ifh, "<", $file or die "unable to open '$file' for reading: $!\n";
  my $outfile = "$file.$extension";
  open my $ofh, ">", $outfile or die "unable to open '$outfile' for writing: $!\n";

  my $formatter = new Parrot::PIR::Formatter();
  
  $formatter->add_pir($_) for (<$ifh>);

  print {$ofh} $formatter->format();
 
  close $ifh;
  close $ofh;
}

=head1 BUGS

Missing all of the perltidy-ish geeknobs and options.

=cut
