#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$

=head1 NAME

t/tools/pdb.t - test the Parrot Debugger

=head1 SYNOPSIS

    % prove t/tools/pdb.t


=head1 DESCRIPTION

Tests the C<pdb> tool by providing it with a number of source files,
and running through it with various commands.

We never actually check the *full* output of pdb.  We simply check
several smaller components to avoid a test file that is far too
unwieldy.


=head1 REQUIREMENTS

This test script requires you to build pdb, by typing "make pdb" (using
a suitable make tool for your platform).  If this requirement has not
been met, all tests will be skipped.

=cut

use strict;
use warnings;
use lib qw(lib);

use Fatal qw{open close};
use Test::More;
use IO::File;
use Parrot::Config;
use File::Spec;

my $path_to_pdb;

BEGIN {
    $path_to_pdb = File::Spec->catfile(".", "pdb");
    my $exefile = $path_to_pdb . $PConfig{exe};
    unless(-f $exefile) {
        plan skip_all => "pdb hasn't been built";
        exit(0);
    }
}

my $tests = 0;

ok(pdb_output_like(<<PIR, "pir", "help", 'List of commands:'), "help page");
.sub main :main
    \$N3 = 3.14159
    print \$N3
    print "\\n"
.end
PIR
ok(pdb_output_like(<<PIR, "pir", "r", '3\.14159'), "running the program");
.sub main :main
    \$N3 = 3.14159
    print \$N3
    print "\\n"
.end
PIR
BEGIN { $tests += 2 };

BEGIN { plan tests => $tests; };


=head1 HELPER SUBROUTINES

=head2 pdb_output_like

    ok(pdb_output_like(<<PASM, "pasm", 'r', "some output"), "running $file");

Takes 4 arguments: a file to run, the filename-extension of the file
(probably "pir" or "pasm"), the command or commands to provide to pdb as
input, and a regex string to match within pdb's output.

=cut

my $testno = 0;
sub pdb_output_like {
    my ($file, $ext, $input, $check) = @_;
    $testno++;
    my $codefn    = "$0.$testno.$ext";
    my $stdinfn   = "$0.$testno.stdin";
    my $stdoutfn  = "$0.$testno.stdout";
    my $f = IO::File->new(">$codefn");
    $f->print($file);
    $f->close();
    $f = IO::File->new(">$stdinfn");
    $f->print($input);
    $f->print("\nquit\n");
    $f->close();
    system("$path_to_pdb $codefn <$stdinfn >$stdoutfn 2>&1");
    $f = IO::File->new($stdoutfn);
    my $output = join("", <$f>);
    return $output =~ /$check/;
}


=head1 TODO

=over 4

=item

Flesh it out.  This is a bare bones proof of concept.  Add tests for all of the
commands.

=back
