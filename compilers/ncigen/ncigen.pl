#! perl
# Copyright (C) 2008, Parrot Foundation.
# $Id$

use strict;
use warnings;

use Getopt::Long;
use Pod::Usage;
use File::Temp;
use File::Spec;
use IPC::Run3;

my $man = 0;
my $help = 0;
my $PARROT = "../../parrot";
my ($incpaths,$libname,$nsname);

GetOptions('help|?'   => \$help,
            man       => \$man,
            libname   => \$libname,
            nsname    => \$nsname,
            "I=s@"    => \$incpaths) or pod2usage(2);
pod2usage(1) if $help;
pod2usage(-exitstatus => 0, -verbose => 2) if $man;

#sub usage()

sub cc_preprocess {
  my ($file) = @_;
  my ($volume, $directories, $fileonly) = File::Spec->splitpath( $file );
  print "$fileonly\n";

  my $ofile = mktemp( $fileonly . "_XXXX");
  #execit("gcc -x c -fdirectives-only -E $file > $ofile");
  execit("gcc -x c -E $file > $ofile");
  return $ofile;
}

sub gen_NCI_signatures {
  my ( $file, $more_args ) = @_;
  return execit("make; $PARROT ncigen.pbc $more_args $file");
}

sub execit {
  my ($cmd) = @_;
  print "$cmd\n";
  my $output = `$cmd`;
  return $output;
}

sub main {
  my $more_args = "";
  $ARGV[0] = 't/spi.c' unless $ARGV[0];
  $libname = "libexamplelib"      unless $libname;
  $nsname  = "CLIB::examplelib"   unless $nsname;

  #$more_args = "--target=parse --libname=fred --nsname=GO::Mojo";
  $more_args = "--libname=$libname --nsname=$nsname";
  my $preproc_fn = cc_preprocess($ARGV[0]);

  my $nci_sigs = gen_NCI_signatures($preproc_fn, $more_args);
  unlink($preproc_fn);
  print $nci_sigs;
}

main();

__END__

=head1 NAME

sample - Using nci_gen.pl

=head1 SYNOPSIS

nci_gen [options] [file ...]

Options:
-help            brief help message
-man             full documentation

=head1 OPTIONS

=over 8

=item B<-help>

Print a brief help message and exits.

=item B<-man>

Prints the manual page and exits.

=back

=head1 DESCRIPTION

B<nci_gen> will read the given input file c header file and create a pir interface file.

=cut

