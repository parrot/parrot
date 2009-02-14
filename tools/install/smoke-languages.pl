#! perl
# Copyright (C) 2007-2009, The Perl Foundation.
# $Id$

use strict;
use warnings;
use 5.008;

use Getopt::Long;
use File::Spec::Functions;

use Test::More tests => 10;

=head1 NAME

tools/install/smoke-languages.pl - checks some languages in install directory

=head1 SYNOPSIS

parrot in install tree

    % cd /usr/local/parrot-$version
    % perl tools/install/smoke-languages.pl

parrot in build tree

    % perl tools/install/smoke-languages.pl --bindir=.

test installation in DESTDIR:

    % cd /usr/src/parrot
    % mkdir .inst
    % make install DESTDIR=.inst
    % perl tools/install/smoke-languages.pl DESTDIR=.inst

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

$out = `$parrot -V`;
$out =~ m/version (\S+) built/;
my $version = $1;

my $langdir = ($bindir eq 'bin')
            ? "lib/parrot/$version/languages"
            : 'languages';

SKIP:
{
skip("skip Rakudo", 1) unless (-d "$langdir/rakudo");
$exe = catfile($bindir, 'perl6');
$out = `$exe -v`;
ok($out =~ /Rakudo/, "check rakudo");
}

#
# some languages
#

SKIP:
{
skip("skip gil", 1) unless (-d "$langdir/gil");
$filename = 'test.gil';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH q{say('Hello, world!');};
close $FH;
$out = `$parrot $langdir/gil/gil.pbc $filename`;
ok($out eq "Hello, world!\n", "check gil");
unlink($filename);
}

SKIP:
{
skip("skip HQ9Plus", 1) unless (-d "$langdir/hq9plus");
$filename = 'test.HQ9Plus';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "H";
close $FH;
$out = `$parrot $langdir/hq9plus/hq9plus.pbc $filename`;
ok($out eq "Hello, world!\n", "check HQ9Plus");
unlink($filename);
}

SKIP:
{
skip("skip Lua", 1) unless (-d "$langdir/lua");
$out = `$parrot $langdir/lua/lua.pbc -e "print(nil)"`;
ok($out eq "nil\n", "check lua");
}

SKIP:
{
skip("skip m4", 1) unless (-d "$langdir/m4");
$out = `$parrot $langdir/m4/m4.pbc`;
ok($out =~ /^Usage/, "check m4");
}

SKIP:
{
skip("skip Markdown", 1) unless (-d "$langdir/markdown");
$filename = 'test.text';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "Hello, World!\n\n";
close $FH;
$out = `$parrot $langdir/markdown/markdown.pbc $filename`;
ok($out eq "<p>Hello, World!</p>\n\n", "check markdown");
unlink($filename);
}

SKIP:
{
skip("skip primitivearc", 1) unless (-d "$langdir/primitivearc");
$filename = 'test.arc';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH q{"Hello, world!\n"};
close $FH;
$out = `$parrot $langdir/primitivearc/arc.pbc $filename`;
ok($out eq "Hello, world!\n\n", "check primitivearc");
unlink($filename);
}

SKIP:
{
skip("skip Rakudo", 1) unless (-d "$langdir/rakudo");
$out = `$parrot $langdir/rakudo/perl6.pbc -e "say 'hello world'"`;
ok($out eq "hello world\n", "check rakudo");
}

SKIP:
{
skip("skip Shakespeare", 1) unless (-d "$langdir/shakespeare");
$filename = 'test.spl';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH <<'CODE';
The Infamous Hello World Program.

Romeo, a young man with a remarkable patience.
Juliet, a likewise young woman of remarkable grace.
Ophelia, a remarkable woman much in dispute with Hamlet.
Hamlet, the flatterer of Andersen Insulting A/S.


                    Act I: Hamlet's insults and flattery.

                    Scene I: The insulting of Romeo.

[Enter Hamlet and Romeo]

Hamlet:
 You lying stupid fatherless big smelly half-witted coward!
 You are as stupid as the difference between a handsome rich brave
 hero and thyself! Speak your mind!

 You are as brave as the sum of your fat little stuffed misused dusty
 old rotten codpiece and a beautiful fair warm peaceful sunny summer's
 day. You are as healthy as the difference between the sum of the
 sweetest reddest rose and my father and yourself! Speak your mind!

 You are as cowardly as the sum of yourself and the difference
 between a big mighty proud kingdom and a horse. Speak your mind.

 Speak your mind!

[Exit Romeo]

                    Scene II: The praising of Juliet.

[Enter Juliet]

Hamlet:
 Thou art as sweet as the sum of the sum of Romeo and his horse and his
 black cat! Speak thy mind!

[Exit Juliet]

                    Scene III: The praising of Ophelia.

[Enter Ophelia]

Hamlet:
 Thou art as lovely as the product of a large rural town and my amazing
 bottomless embroidered purse. Speak thy mind!

 Thou art as loving as the product of the bluest clearest sweetest sky
 and the sum of a squirrel and a white horse. Thou art as beautiful as
 the difference between Juliet and thyself. Speak thy mind!

[Exeunt Ophelia and Hamlet]


                    Act II: Behind Hamlet's back.

                    Scene I: Romeo and Juliet's conversation.

[Enter Romeo and Juliet]

Romeo:
 Speak your mind. You are as worried as the sum of yourself and the
 difference between my small smooth hamster and my nose. Speak your
 mind!

Juliet:
 Speak YOUR mind! You are as bad as Hamlet! You are as small as the
 difference between the square of the difference between my little pony
 and your big hairy hound and the cube of your sorry little
 codpiece. Speak your mind!

[Exit Romeo]

                    Scene II: Juliet and Ophelia's conversation.

[Enter Ophelia]

Juliet:
 Thou art as good as the quotient between Romeo and the sum of a small
 furry animal and a leech. Speak your mind!

Ophelia:
 Thou art as disgusting as the quotient between Romeo and twice the
 difference between a mistletoe and an oozing infected blister! Speak
 your mind!

[Exeunt]

CODE
close $FH;
$out = `$parrot $langdir/shakespeare/shakespeare.pbc $filename`;
ok($out eq "Hello World!\n", "check shakespeare");
unlink($filename);
}

SKIP:
{
skip("skip unlambda", 1) unless (-d "$langdir/unlambda");
$filename = 'test.unl';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH <<'CODE';
# hello world
`r```````````.H.e.l.l.o. .w.o.r.l.di
CODE
close $FH;
$out = `$parrot $langdir/unlambda/unl.pbc $filename`;
ok($out eq "Hello world\n", "check unlambda");
unlink($filename);
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
