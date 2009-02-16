#! perl
# Copyright (C) 2007-2009, The Perl Foundation.
# $Id$

use strict;
use warnings;
use 5.008;

use Getopt::Long;
use File::Spec::Functions;

use Test::More tests => 7;

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

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

