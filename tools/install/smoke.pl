#! perl
# Copyright (C) 2007-2009, The Perl Foundation.
# $Id$

use strict;
use warnings;
use 5.008;

use Getopt::Long;
use File::Spec::Functions;

use Test::More tests => 22;

=head1 NAME

tools/install/smoke.pl - checks parrot in install directory

=head1 SYNOPSIS

parrot in install tree

    % cd /usr/local/parrot-$version
    % perl smoke.pl

parrot in build tree

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

=back

=cut

my ($bindir, $DESTDIR);
my $opts = GetOptions(
    'bindir=s'  => \$bindir,
    'DESTDIR=s' => \$DESTDIR,
);

$bindir = 'bin' unless $bindir;

chdir $DESTDIR if ($DESTDIR);

my $filename;
my $exe;
my $out;
my $FH;
my $parrot = catfile($bindir, 'parrot');
my $pirc = catfile($bindir, 'pirc');

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

$out = `$parrot -V`;
$out =~ m/version (\S+) built/;
my $version = $1;

my $libdir = ($bindir eq 'bin')
           ? "lib/parrot/$version/library"
           : 'runtime/parrot/library';

my $langdir = ($bindir eq 'bin')
            ? "lib/parrot/$version/languages"
            : 'languages';

my $compdir = ($bindir eq 'bin')
            ? "lib/parrot/$version/languages"
            : 'compilers';

#
# some compiler tools
#

$filename = 'test.pg';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "token TOP { \\s* }\n";
close $FH;
$out = `$parrot $libdir/PGE/Perl6Grammar.pir $filename`;
ok($out =~ /^\n## <::TOP>/, "check PGE");
unlink($filename);

$filename = 'test.pir';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH <<'PIR';
.sub main
    say "hello world!"
.end
PIR
close $FH;
$out = `$pirc -n $filename`;
ok($out eq "ok\n", "check pirc");
unlink($filename);

# compilers/tge is typically not installed
$filename = 'test.tg';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "transform past (ROOT) { }\n";
close $FH;
$out = `$parrot $compdir/tge/tgc.pir $filename`;
ok($out =~ /^\n\.sub '_ROOT_past'/, "check TGE");
unlink($filename);

# compilers/nqp is typically not installed
$filename = 'test.nqp';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "say('hello world!');\n";
close $FH;
$out = `$parrot $compdir/nqp/nqp.pbc $filename`;
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
$out = `$parrot $langdir/abc/abc.pbc $filename`;
ok($out eq "3\n", "check abc");
unlink($filename);

$filename = 'test.apl';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "\"Hello world!\"";
close $FH;
$out = `$parrot $langdir/APL/APL.pbc $filename`;
ok($out eq "Hello world!\n", "check APL");
unlink($filename);

$out = `$parrot $langdir/bf/bf.pbc`;
ok($out =~ /^usage/, "check bf");
$out = `$parrot $langdir/bf/bfc.pbc`;
ok($out =~ /^usage/, "check bfc");
$out = `$parrot $langdir/bf/bfco.pbc`;
ok($out =~ /^usage/, "check bfco");

$out = `$parrot $langdir/cardinal/cardinal.pbc -e "print 'hello world';"`;
ok($out eq "hello world", "check cardinal");

$out = `$parrot $langdir/dotnet/net2pbc.pbc`;
ok($out =~ /^Usage/, "check dotnet");

$filename = 'test.js';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "print(\"Hello World from JS\\n\");";
close $FH;
$out = `$parrot $langdir/ecmascript/js.pbc $filename`;
ok($out eq "Hello World from JS\n\n", "check ecmascript");
unlink($filename);

TODO: {
local $TODO = "lisp is currently broken";
$filename = 'test.l';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "( print \"Hello, World!\" )\n";
close $FH;
$out = `$parrot $langdir/lisp/lisp.pbc $filename`;
ok($out eq "Hello, World!\n", "check lisp");
unlink($filename);
}

$filename = 'test.lolcode';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH <<'LOLCODE';
HAI 1.2
    VISIBLE "HAI WORLD!"
KTHXBYE
LOLCODE
close $FH;
$out = `$parrot $langdir/lolcode/lolcode.pbc $filename`;
ok($out eq "HAI WORLD!\n", "check lolcode");
unlink($filename);

$filename = 'test.l';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "( write \"Hello, World!\\n\" )\n";
close $FH;
$out = `$parrot $langdir/pheme/pheme.pbc $filename`;
ok($out eq "Hello, World!\n", "check pheme");
unlink($filename);

$filename = 'test.php';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "<?php echo \"Hello, World!\\n\"; ?>";
close $FH;
$out = `$parrot $langdir/pipp/pipp.pbc $filename`;
ok($out eq "Hello, World!\n", "check pipp");
unlink($filename);

$filename = 'test.p1';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "print \"Hello, World!\\n\";\n";
close $FH;
$out = `$parrot $langdir/punie/punie.pbc $filename`;
ok($out eq "Hello, World!\n", "check punie");
unlink($filename);

$filename = 'test.py';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "print 'Hello, World!'\n";
close $FH;
$out = `$parrot $langdir/pynie/pynie.pbc $filename`;
ok($out eq "Hello, World!\n", "check pynie");
unlink($filename);

$filename = 'test.squaak';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "print(\"Hello, World!\")\n";
close $FH;
$out = `$parrot $langdir/squaak/squaak.pbc $filename`;
ok($out eq "Hello, World!\n", "check squaak");
unlink($filename);

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

