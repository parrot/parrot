#! perl
# Copyright (C) 2007-2008, The Perl Foundation.
# $Id$

use strict;
use warnings;

use Test::More tests => 27;

=head1 NAME

tools/install/smoke.pl - checks parrot in install directory

=head1 SYNOPSIS

    % cd /usr/local/parrot-$version
    % perl tools/install/smoke.pl

=head1 DESCRIPTION

Checks that most of things run (or just start) into the install directory,
try to detect missing part.

=cut

use File::Spec::Functions;

my $filename;
my $exe;
my $out;
my $FH;
my $parrot = catfile('bin', 'parrot');

#
# parrot executable
#

$exe = catfile('bin', 'pbc_merge');
$out = `$exe`;
ok($out =~ /^pbc_merge/, "check pbc_merge");

$exe = catfile('bin', 'pdump');
$out = `$exe`;
ok($out =~ /^pdump/, "check pdump");

ok(system("$parrot -V") == 0, "display parrot version");

$exe = catfile('bin', 'perl6');
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
$out = `$parrot lib/parrot/library/PGE/P6Grammar.pir $filename`;
ok($out =~ /^\n## <::TOP>/, "check PGE");
unlink($filename);

$filename = 'test.tg';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "transform past (ROOT) { }\n";
close $FH;
$out = `$parrot compilers/tge/tgc.pir $filename`;
ok($out =~ /^\n\.sub '_ROOT_past'/, "check TGE");
unlink($filename);

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

$out = `$parrot --no-gc languages/cardinal/cardinal.pbc -e "say 'hello world';"`;
ok($out eq "hello world\n", "check cardinal");

$out = `$parrot languages/dotnet/net2pbc.pbc`;
ok($out =~ /^Usage/, "check dotnet");

$filename = 'test.js';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "print(\"Hello World from JS\\n\");";
close $FH;
$out = `$parrot languages/ecmascript/js.pbc $filename`;
ok($out eq "Hello World from JS\n", "check ecmascript");
unlink($filename);

$filename = 'test.HQ9Plus';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "H";
close $FH;
$out = `$parrot languages/HQ9Plus/HQ9Plus.pbc $filename`;
ok($out eq "Hello, world!\n", "check HQ9Plus");
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
print $FH q{
HAI 1.2
    VISIBLE "HAI WORLD!"
KTHXBYE
};
close $FH;
$out = `$parrot languages/lolcode/lolcode.pbc $filename`;
ok($out eq "HAI WORLD!\n", "check lolcode");
unlink($filename);

$out = `$parrot --no-gc languages/lua/lua.pbc -e "print(nil)"`;
ok($out eq "nil\n", "check lua");

$out = `$parrot languages/m4/m4.pbc`;
ok($out =~ /^Usage/, "check m4");

$out = `$parrot languages/ook/ook.pbc`;
ok($out eq q{}, "check ook");

$out = `$parrot --no-gc languages/perl6/perl6.pbc -e "say 'hello world'"`;
ok($out eq "hello world\n", "check rakudo");

$filename = 'test.l';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "( write \"Hello, World!\\n\" )\n";
close $FH;
$out = `$parrot languages/pheme/pheme.pbc $filename`;
ok($out eq "Hello, World!\n", "check pheme");
unlink($filename);

$out = `$parrot languages/plumhead/plumhead.pbc`;
ok($out =~ /^usage/, "check plumhead");

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

TODO: {
    local $TODO = 'missing file ?';

$filename = 'test.tcl';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "puts 'hello world!'\n";
close $FH;
$out = `$parrot languages/tcl/tcl.pbc $filename`;
ok($out eq "hello world!\n", "check tcl");
unlink($filename);
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

