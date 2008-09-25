#! perl
# Copyright (C) 2005-2008, The Perl Foundation.
# $Id$

use strict;
use warnings;
use vars qw($DIR);

# the directory to put the tests in
$DIR = 't_tcl';

use File::Spec;

$| = 1;

=head1 NAME

tcl_test.pl

=head1 DESCRIPTION

Run the tests from the Tcl distribution. This script will download
the tests from the Tcl CVS repository and then run them individually
using tcltest.

=head1 BUGS

We should be able to run the tcl test harness instead of running
each individual C<.test> file.

=head1 SYNOPSIS

  tcl_test.pl

=cut

# When testing, avoid these files for now.
my %skipfiles = (
  'binary' => 'Parrot assertion',
  'clock'  => 'not implemented, memory hog',
  'case'   => 'not implemented',
);

main();

##
## main()
##
sub main {
    checkout_tests() if not -d $DIR;
    return run_tests();
}

##
## checkout_tests()
##
## Checkout the tests from CVS into $DIR.
##
sub checkout_tests {
    print "Checking out tests from CVS\n";

    my $tag = 'core-8-5-4';    # For the version we're targeting.

    my $command =
        'cvs -z3 -d :pserver:anonymous:\@tcl.cvs.sourceforge.net:'
        . "/cvsroot/tcl co -d $DIR -r $tag tcl/tests";
    my $rc = system $command;

    return ( $rc == 0 );       # just care if it failed, not how
}

##
## run_tests(@globs)
##
## Run the tests...
##

sub run_tests {
    my (@files) = glob File::Spec->catfile( $DIR, '*.test' );

    foreach my $file (@files) {
      $file =~ m{/(\w+).test$};
      my $basename = $1;
      warn "checking $basename?";
      if (exists $skipfiles{$basename}) {
        print "Skipping $file: $skipfiles{$basename}\n";
	next;
      }
      my $cmd = "../../parrot tcl.pbc $file";
      print "$cmd\n";
      system $cmd;
    }
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
