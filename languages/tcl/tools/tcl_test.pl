#! perl
# Copyright (C) 2005, The Perl Foundation.
# $Id$

use strict;
use warnings;
use vars qw($DIR);

# the directory to put the tests in
$DIR = 't_tcl';

use Fatal qw{open};
use File::Spec;
use Getopt::Std;
use Test::Harness;

$|=1;

our ($opt_u, $opt_h, $opt_c);
getopts('uhc');

=head1 NAME

tcl-test.pl

=head1 DESCRIPTION

Run the tests from the Tcl distribution. This script will download
the tests from the Tcl CVS repository, change them slightly to use
our C<Test::More> like suite so we can then use prove to report the
results.

=head1 BUGS

The need for this script. Eventually use tcltest.tcl

=head1 SYNOPSIS

  tcl-test.pl [-c] [-u]

  -c Convert the .test files to .t files
  -u Update the tests from CVS.

=cut

main();

##
## main()
##
sub main {
    usage() and exit if $opt_h;
    checkout_tests() and convert_tests() if not -d $DIR;
    update_tests()   and convert_tests() if $opt_u;
    convert_tests() if $opt_c;
    return run_tests(grep {-f $_} @ARGV); 
}

##
## convert_tests()
##
## Convert the tests to a usable form.
##
sub convert_tests {
    print "Converting tests\n";
    my @files = glob( File::Spec->catfile( $DIR, '*.test' ) );
    for my $file (@files) {
        my $test = substr $file, 0, -3;
        # parrot's getopt dislikes filenames with - in them.
        $test =~ s/-/_/g;
        system("rm $test") if -e $test;

        open my $ffh, '<', $file;
        my $test_src = extract_tests( do{local $/=undef;<$ffh>} );
        close $ffh;

        warn "Extracting tests for $file\n";
        open my $tfh, '>>', $test;
        print {$tfh} $test_src;
        close $tfh;
    }
    return;
}
##
## checkout_tests()
##
## Checkout the tests from CVS into $DIR.
##
sub checkout_tests {
    print "Checking out tests from CVS\n";
    
    my $rc = system <<"END_COMMAND";
cvs -z3 -d :pserver:anonymous:\@tcl.cvs.sourceforge.net:/cvsroot/tcl co -d $DIR tcl/tests
END_COMMAND

    return ($rc == 0) ; # just care if it failed, not howm
}

##
## my $var = choose(@vars)
##
## Select the first defined variable.
##
sub choose {
    for (@_) {
        return $_ if defined $_;
    }
    return;
}

##
## %tests = extract_tests($string)
##
## Extract the tests from the .test file. (test_name => [ $expl, $source, $out ])
##

sub extract_tests {
    my ($source) = shift ;

    # This is a bit unweildy.

    my @removes = (<<'END_TCL',
if {[lsearch [namespace children] ::tcltest] == -1} {
    package require tcltest
    namespace import -force ::tcltest::*
}
END_TCL
    <<'END_TCL',
package require tcltest 2
namespace import -force ::tcltest::*
END_TCL
    <<'END_TCL',
if {[lsearch [namespace children] ::tcltest] == -1} {
    package require tcltest 2
    namespace import -force ::tcltest::*
}
END_TCL
    <<'END_TCL',
if {[catch {package require tcltest 2.1}]} {
    puts stderr "Skipping tests in [info script]. tcltest 2.1 required."
    return
}
END_TCL
    <<'END_TCL',
if {[lsearch [namespace children] ::tcltest] == -1} {
    package require tcltest 2.1
    namespace import -force ::tcltest::*
}
END_TCL
    <<'END_TCL',
::tcltest::cleanupTests
return
END_TCL
    <<'END_TCL',
cleanupTests
return
END_TCL
    );

    foreach my $remove (@removes) {
        $source =~ s/\Q$remove\E//xms;
    }

    $source = <<'END_SHEBANG' . $source . <<'END_CLEANUP';
#!../../parrot tcl.pbc
source lib/test_more.tcl
END_SHEBANG
plan no_plan
END_CLEANUP

    return $source;
}

##
## run_tests(@globs)
##
## Run the tests.
##
sub run_tests {
    my (@files) = @_ ? @_ : glob File::Spec->catfile( $DIR, '*.t' ) ;

    if (@files) {
        return runtests(@files);
    } else {  
        return;
    }
}

##
## my $string = unescape( $original )
##
## Unescape backslashes from a Tcl string.
##
sub unescape {
    my ($string) = @_;
    return if not $string;

    $string =~ s/\\([^abfnrtvoxu])/$1/g;

    return $string;
}

##
## update_tests()
##
## Run CVS update.
##
sub update_tests {
    print "Updating tests from CVS\n";
    system "(cd $DIR && cvs -Q up *.test)";
    
    return;
}

##
## usage()
##
## Print the usage message.
##
sub usage {
    print <<'END_USAGE';
Usage: tcl-test.pl [-cu]
    -c Convert the .test files to .t files
    -u Update the tests from CVS.
END_USAGE

    return;
}
