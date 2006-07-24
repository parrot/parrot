#! perl
# Copyright (C) 2005, The Perl Foundation.
# $Id$

use strict;
use warnings;
use vars qw($DIR %tests);

# the directory to put the tests in
$DIR = 't_tcl';

use Fatal qw{open};
use File::Spec;
use Getopt::Std;
use Text::Balanced; # XXX temporarily limit ourselves to perl 5.8...
                    # XXX This doesn't ever seem to be used...
use Test::Harness;

$|=1;

our ($opt_u, $opt_h, $opt_c);
getopts('uhc');

=head1 NAME

tcl-test.pl

=head1 DESCRIPTION

Run the tests from the Tcl distribution. This script will download
the tests from the Tcl CVS repository, convert them into a a TAP-style
protocol that can then use Test::Harness to run and report results.

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
        %tests = extract_tests( do{undef local $/;<$ffh>} );
        close $ffh;

	# Only generate output test file if we can find tests...
        my $output;
        eval {
            $output = format_tests(%tests);
        };
        if ($@) {
            warn "Warning! Unable to extract tests for $file\n";
        } else {
            warn "Extracting tests for $file\n";
            open my $tfh, '>>', $test;
            print {$tfh} $output;
            close $tfh;
        };
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
    my ($source) = @_;
    my %tests;

    my $regex = qr[
        test \s+ (\S+)                  # test ident
             \s+ \{ ([^}]+) \}          # test description
             \s+ (?:\S+ \s+)? \{ \n     # optional test harness info (ignoring)
                 ( (?:\s+ [^\n]+\n)+ )  # test body
        \} \s+
            (?: \{ ([^\n]+) \}          # test result
              | " ((?:[^"\\]|\\.)+) "   #" (keep my editor happy)
              | (\w+) )
    ]sx;

    while ($source =~ m[$regex]go) {
        my ($name, $expl, $body, $out) = ($1, $2, $3, choose($4, unescape($5), $6));

        # make the test print the last line of output
        # XXX This should be "print the last command". Which is harder.
        $body =~ s/^(\s*)([^\n]+)\s*\Z/$1puts [$2]/m;

        $tests{$name} = [$expl, $body, $out];
    }

    return %tests;
}

##
## $preamble = extract_preamble($string)
##
## Extract the preamable for tests from the .test file.
## This consists of any procedures defined in the test file outside of a test,
## as well as any catch commands.
##
sub extract_preamble {
    my ($source) = @_;
    my $preamble;

    my $regex = qr{
        ^                               # preambles begin the line
        (                               # then contain one of...
        catch {                       # a catch statement

        |                               # or
        proc                            # a procedure definition
        test \s+ (\S+)                  # test ident
             \s+ \{ ([^}]+) \}          # test description
             \s+ (?:\S+ \s+)? \{ \n     # optional test harness info (ignoring)
                 ( (?:\s+ [^\n]+\n)+ )  # test body
        \} \s+
            (?: \{ ([^\n]+) \}          # test result
              | " ((?:[^"\\]|\\.)+) "   #" (keep my editor happy)
              | (\w+) )
        )
    }sx;

    while ($source =~ m{$regex}go) {
        my ($name, $expl, $body, $out) = ($1, $2, $3, choose($4, unescape($5), $6));

        # make the test print the last line of output
        # XXX This should be "print the last command". Which is harder.
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
    die unless $count;

    my $string = <<"END";
#!/usr/bin/perl

use strict;
use lib qw(tcl/lib ./lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => $count;

END

    my $counter = 1;
    for my $name (sort keys %tests) {
        my ($expl, $body, $out) = @{ $tests{$name} };
        $string .= <<"END";
# TEST NUMBER: $counter
language_output_is('tcl', <<'TCL', <<'OUT', <<'DESC');
$body
TCL
$out
OUT
$name - $expl
DESC

END

        $counter++;
    }

    return $string;
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
