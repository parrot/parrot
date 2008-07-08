#!/usr/bin/perl

use strict;
use warnings;

use Getopt::Long;
use Pod::Usage;
use File::Temp;
use IPC::Run3;

my $man = 0;
my $help = 0;
my $PARROT = "../../parrot";
my $incpaths;

GetOptions('help|?' => \$help, 
            man     => \$man,
            "I=s@"  => \$incpaths) or pod2usage(2);
pod2usage(1) if $help;
pod2usage(-exitstatus => 0, -verbose => 2) if $man;

#sub usage()

sub cc_preprocess {
  my ($file) = @_;
  my $ofile = mktemp($file . "_XXXX");
  #execit("gcc -x c -I /usr/include/postgresql -fdirectives-only -E $file > $ofile");
  execit("gcc -x c -I /usr/include/postgresql -E $file > $ofile");
  return $ofile;
}

sub dump_parse_tree {
  my ( $file, $more_args ) = @_;
  return execit("make; $PARROT c99.pbc $more_args $file");
}

sub execit {
  my ($cmd) = @_;
  print "$cmd\n";
  my $output = `$cmd`;
  return $output;
}

sub main {
  my $more_args = "";
  unless ( $ARGV[0] ) {
    $ARGV[0] = 't/spi.c' unless $ARGV[0];
  }
  $more_args = "--libname=fred --nsname=GO::Mojo";

  my $preproc_fn = cc_preprocess($ARGV[0]);

  my $parse_tree = dump_parse_tree($preproc_fn, $more_args);
  unlink($preproc_fn);
  print $parse_tree;
  print "$preproc_fn\n";
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

