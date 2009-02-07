#! perl
# Copyright (C) 2007-2009, The Perl Foundation.
# $Id$

use strict;
use warnings;
use 5.008;

use Getopt::Long;
use File::Spec::Functions;

use Test::More tests => 25;

=head1 NAME

tools/install/smoke.pl - checks parrot in install directory

=head1 SYNOPSIS

parrot in bin

    % cd /usr/local/parrot-$version
    % perl tools/install/smoke.pl

parrot in .

    % perl tools/install/smoke.pl --bindir=.

test installation in DESTDIR:

    % cd /usr/src/parrot
    % mkdir .inst
    % make install DESTDIR=.inst
    % perl tools/install/smoke.pl DESTDIR=.inst

=head1 DESCRIPTION

Checks that most of things run (or just start) into the install directory,
try to detect missing parts.

=head1 OPTIONS

=over

=item --bindir=/usr/bin

Override default value : 'bin'

=item --libdir=/usr/lib

Override default value : 'lib'

=back

=cut

my ($bindir, $libdir, $DESTDIR);
my $opts = GetOptions(
    'bindir=s'  => \$bindir,
    'libdir=s'  => \$libdir,
    'DESTDIR=s' => \$DESTDIR,
);

$bindir = 'bin' unless $bindir;
$libdir = 'lib' unless $libdir;

chdir $DESTDIR if ($DESTDIR);

my $filename;
my $exe;
my $out;
my $FH;
my $parrot = catfile($bindir, 'parrot');

#
# parrot executable
#

$exe = catfile($bindir, 'pbc_merge');
$out = `$exe`;
ok($out =~ /^pbc_merge/, "check pbc_merge");

$exe = catfile($bindir, 'pbc_dump');
$out = `$exe`;
ok($out =~ /^pbc_dump/, "check pbc_dump");

ok(system("$parrot -V") == 0, "display parrot version");

$exe = catfile($bindir, 'perl6');
$out = `$exe -v`;
ok($out =~ /Rakudo/, "check rakudo");

#
# some compiler tools
#

$filename = 'test.pg';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "token TOP { \\s* }\n";
close $FH;
$out = `$parrot $libdir/parrot/library/PGE/Perl6Grammar.pir $filename`;
ok($out =~ /^\n## <::TOP>/, "check PGE");
unlink($filename);

# compilers/tge is typically not installed
$filename = 'test.tg';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "transform past (ROOT) { }\n";
close $FH;
$out = `$parrot compilers/tge/tgc.pir $filename`;
ok($out =~ /^\n\.sub '_ROOT_past'/, "check TGE");
unlink($filename);

# compilers/nqp is typically not installed
$filename = 'test.nqp';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "say('hello world!');\n";
close $FH;
$out = `$parrot compilers/nqp/nqp.pbc $filename`;
ok($out eq "hello world!\n", "check nqp");
unlink($filename);

#
# some languages
#

$filename = 'test.bc';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "1 + 2\n";
close $FH;
$out = `$parrot languages/abc/abc.pbc $filename`;
ok($out eq "3\n", "check abc");
unlink($filename);

$filename = 'test.apl';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "\"Hello world!\"";
close $FH;
$out = `$parrot languages/APL/APL.pbc $filename`;
ok($out eq "Hello world!\n", "check APL");
unlink($filename);

$out = `$parrot languages/bf/bf.pbc`;
ok($out =~ /^usage/, "check bf");
$out = `$parrot languages/bf/bfc.pbc`;
ok($out =~ /^usage/, "check bfc");
$out = `$parrot languages/bf/bfco.pbc`;
ok($out =~ /^usage/, "check bfco");

$out = `$parrot languages/cardinal/cardinal.pbc -e "print 'hello world';"`;
ok($out eq "hello world", "check cardinal");

$out = `$parrot languages/dotnet/net2pbc.pbc`;
ok($out =~ /^Usage/, "check dotnet");

$filename = 'test.js';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "print(\"Hello World from JS\\n\");";
close $FH;
$out = `$parrot languages/ecmascript/js.pbc $filename`;
ok($out eq "Hello World from JS\n\n", "check ecmascript");
unlink($filename);

$filename = 'test.l';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "( print \"Hello, World!\" )\n";
close $FH;
$out = `$parrot languages/lisp/lisp.pbc $filename`;
ok($out eq "Hello, World!\n", "check lisp");
unlink($filename);

$filename = 'test.lolcode';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH <<'LOLCODE';
HAI 1.2
    VISIBLE "HAI WORLD!"
KTHXBYE
LOLCODE
close $FH;
$out = `$parrot languages/lolcode/lolcode.pbc $filename`;
ok($out eq "HAI WORLD!\n", "check lolcode");
unlink($filename);

$out = `$parrot languages/lua/lua.pbc -e "print(nil)"`;
ok($out eq "nil\n", "check lua");

$out = `$parrot languages/ook/ook.pbc`;
ok($out eq q{}, "check ook");

$out = `$parrot languages/perl6/perl6.pbc -e "say 'hello world'"`;
ok($out eq "hello world\n", "check rakudo");

$filename = 'test.l';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "( write \"Hello, World!\\n\" )\n";
close $FH;
$out = `$parrot languages/pheme/pheme.pbc $filename`;
ok($out eq "Hello, World!\n", "check pheme");
unlink($filename);

$filename = 'test.php';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "<?php echo \"Hello, World!\\n\"; ?>";
close $FH;
$out = `$parrot languages/pipp/pipp.pbc $filename`;
ok($out eq "Hello, World!\n", "check pipp");
unlink($filename);

$filename = 'test.p1';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "print \"Hello, World!\\n\";\n";
close $FH;
$out = `$parrot languages/punie/punie.pbc $filename`;
ok($out eq "Hello, World!\n", "check punie");
unlink($filename);

$filename = 'test.py';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "print 'Hello, World!'\n";
close $FH;
$out = `$parrot languages/pynie/pynie.pbc $filename`;
ok($out eq "Hello, World!\n", "check pynie");
unlink($filename);

$filename = 'test.squaak';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "print(\"Hello, World!\")\n";
close $FH;
$out = `$parrot languages/squaak/squaak.pbc $filename`;
ok($out eq "Hello, World!\n", "check squaak");
unlink($filename);

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

