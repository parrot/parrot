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
  'assocd' => 'all skipped',
  'async'  => 'expected boolean value but got ""',
  'autoMkindex' => 'unable to open file',
  'basic' => "can't delete 'run'",
  'binary' => 'Parrot assertion',
  'case'   => 'not implemented',
  'chanio' => 'unable to open file',
  'clock'  => 'not implemented, memory hog',
  'cmdAH'  => 'expected boolean value but got ""',
  'cmdIL'  => 'bad option "-1"',
  'cmdAZ'  =>'bad option "-1"',
  'cmdInfo' => 'all skipped',
  'config' => 'all failed',
  'dcall' => 'all skipped',
  'dict' => 'maximum recursion depth exceeded',
  'dstring' => 'expected boolean value but got ""',
  'encoding' => 'wrong # args: should be "string is class  ...',
  'expr'   => 'really slow, memory hog',
  'env' => 'unable to open file',
  'exec' => 'unable to open file',
  'fCmd' => 'expected boolean value but got ""',
  'fileName' => 'expected boolean value but got ""',
  'fileSystem' => 'unable to open file',
  'history' => 'expected boolean value but got ""',
  'http' => 'cannot start http server',
  'httpold' => 'unable to open file',
  'indexObj' => 'all skipped',
  'info' => "can't read variable",
  'init' => 'all failed',
  'interp' => 'wrong # args: should be "interp"',
  'io' => 'unable to open file',
  'iocmd' => 'unable to open file',
  'iogt' => 'unable to open file',
  'link' => 'all skipped',
  'list' => 'unmatched open quote in list',
  'lset' => 'all skipped',
  'macOSXFCmd' => 'expected boolean value but got ""',
  'macOSXLoad' => 'expected boolean value but got ""',
  'main' => 'all skipped or failed',
  'mathop' => 'Null PMC access...',
  'misc' => 'only passed 1/301',
  'msgcat' => 'unable to open file',
  'namespace-old' => 'memory hog',
  'namespace' => 'wrong # args...',
  'obj' => 'expected boolean value but got ""',
  'opt' => "can't read variable",
  'parse' => 'parsefail',
  'parseExpr' => 'memory hog',
  'pid' => 'all skipped or failed',
  'pkg' => 'no tests?',
  'pkgMkIndex' => 'unable to open file',
  'platform' => 'all skipped or failed',
  'reg' => 'memory hog',
  'regexp' => 'memory hog',
  'regexpComp' => 'memory hog',
  'registry' => 'expected boolean value but got ""',
  'result' => 'all skipped or failed',
  'safe' => "can't read variable",
  'socket' =>  'expected boolean value but got ""',
  'source' => 'all failed',
  'stack' =>  'expected boolean value but got ""',
  'string' => 'Invalid character for UTF-8 encoding',
  'stringObj' => 'Null PMC access...',
  'subst' => 'unmatched open brace in list',
  'tcltest' => 'unable to open file',
  'thread' =>  'expected boolean value but got ""',
  'timer' => 'invalid command name "x"',
  'tm' => 'all failed',
  'trace' => "can't read variable",
  'unixFCmd' =>  'expected boolean value but got ""',
  'unixFile' => "can't read directory",
  'unixInit' => 'all skipped',
  'unixNotfy' => 'all skipped',
  'unload' => 'invalid command name "child"',
  'util' => 'memory hog',
  'winConsole' => 'all skipped',
  'winDde' => 'expected boolean value but got ""',
  'winFCmd' => 'expected boolean value but got ""',
  'winFile' => 'expected boolean value but got ""',
  'winNotify' => 'all skipped',
  'winPipe' => 'expected boolean value but got ""',
  'winTime' => 'all skipped',
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
