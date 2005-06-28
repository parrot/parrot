#!/usr/bin/perl -w
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$
use strict;
use vars qw($DIR);

# the directory to put the tests in
$DIR = 't-tcl';

use File::Spec;
use Getopt::Std;
use Test::Harness;

our ($opt_u, $opt_h, $opt_c);
getopts('uhc');

=head1 NAME

tcl-test.pl

=head1 DESCRIPTION

Run the tests from the Tcl distribution. This script will download 
the tests from Tcl CVS, extract them, and use Test::Harness to
run them and report the results.

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
    run_tests(grep {-f $_} @ARGV);
}

##
## convert_tests()
##
## Convert the tests to a usable form.
##
sub convert_tests {
    print "Converting tests\n";
    my @files = glob( File::Spec->catfile( $DIR, "*.test" ) );
    for my $file (@files) {
        my $test = substr $file, 0, -3;
        
        system("rm $test") if -e $test;
        
        open my $ffh, "<", $file
            or die "Couldn't open $file\n";
        my %tests = extract_tests( do{local $/;<$ffh>} );
        close $ffh;
        
        open my $tfh, ">>", $test
            or die "Couldn't open $test\n";
        print $tfh format_tests(%tests);
        close $tfh;
    }
    1;
}

##
## checkout_tests()
##
## Checkout the tests from CVS into $DIR.
##
sub checkout_tests {
    print "Checking out tests from CVS\n";
    system "cvs -Q -d :pserver:anonymous\@cvs.sourceforge.net:/cvsroot/tcl co -d $DIR tcl/tests";
    1;
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
    my ($source) = @_;
    my %tests;
    
    my $regex = qr[
        test \s+ (\S+)
             \s+ \{ ([^{]+) \}
             \s+ \{ \n
                 ( (?:\s+ [^\n]+\n)+ )
        \} \s+
            (?: \{ ([^\n]+) \}
              | " ((?:[^"\\]|\\.)+) "   #" (keep my editor happy)
              | (\w+) )
    ]sx;
    
    while ($source =~ m[$regex]go) {
        my ($name, $expl, $body, $out) = ($1, $2, $3, choose($4, $5, $6));
        
        # make the test print the last line of output
        $body =~ s/^(\s*)([^\n]+)\s*\Z/$1puts [$2]/m;
        
        $tests{$name} = [$expl, $body, $out];
    }
    
    return %tests;
}

##
## $string = format_tests(%tests)
##
## Create the source for a .t file for the tests.
##
sub format_tests {
    my (%tests) = @_;
    
    my $count = scalar keys %tests;
    my $string = <<"END";
#!/usr/bin/perl
    
use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => $count;

END
    
    for my $name (sort keys %tests) {
        my ($expl, $body, $out) = @{ $tests{$name} };
        $string .= <<"END";
language_output_is('tcl', <<'TCL', <<'OUT', <<'DESC');
$body
TCL
$out
OUT
$name - $expl
DESC

END
    }
    
    return $string;
}

##
## run_tests(@globs)
##
## Run the tests.
## 
sub run_tests {
    my (@files) = @_ ? @_ : glob( File::Spec->catfile( $DIR, "*.t" ) );
    
    return unless @files;
    runtests(@files);
}

##
## update_tests()
## 
## Run CVS update.
##
sub update_tests {
    print "Updating tests from CVS\n";
    system "(cd $DIR && cvs -Q up *.test)";
    1;
}

##
## usage()
## 
## Print the usage message.
##
sub usage {
    print <<"USAGE";
Usage: tcl-test.pl [-cu]
    -c Convert the .test files to .t files
    -u Update the tests from CVS.
USAGE
    1;
}
