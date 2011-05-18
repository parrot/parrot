#! perl
# Copyright (C) 2007-2009, Parrot Foundation.

use strict;
use warnings;
use 5.008;

use Cwd;
use Getopt::Long;
use File::Spec::Functions;

use Test::More tests => 34;

=head1 NAME

tools/install/smoke_languages.pl - checks some languages in install directory

=head1 SYNOPSIS

parrot in install tree

    % cd /usr/local/parrot-$version
    % perl tools/install/smoke_languages.pl

parrot in build tree

    % perl tools/install/smoke_languages.pl --bindir=.

test installation in DESTDIR:

    % cd /usr/src/parrot
    % mkdir .inst
    % make install DESTDIR=.inst
    % perl tools/install/smoke_languages.pl DESTDIR=.inst

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

chdir($DESTDIR) if ($DESTDIR);
my $pwd = getcwd();

sub quote {
    my $exe = shift;
    $exe .= '.exe' if ($^O eq 'MSWin32');
    $exe = '"' . $exe . '"' if ($exe =~ / /);
    return $exe;
}

my $filename;
my $exe;
my $out;
my $FH;
my $parrot = quote(catfile($pwd, $bindir, 'parrot'));

$out = `$parrot -V`;
$out =~ m/version (\S+) built/;
my $version = $1;

my $langdir = ($bindir eq 'bin')
            ? ($^O eq 'MSWin32') ? 'lib/parrot/languages' : "lib/parrot/$version/languages"
            : 'languages';

#
# some languages
#

SKIP:
{
$exe = quote(catfile($pwd, $bindir, 'parrot-abc'));
skip("abc", 1) unless (-d "$pwd/$langdir/abc" || -e $exe);
chdir("$pwd/$langdir/abc");
$filename = 'test.bc';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "1 + 2\n";
close $FH;
$exe = "$parrot abc.pbc" unless (-e $exe);
$out = `$exe $filename`;
ok($out eq "3\n", "check abc");
unlink($filename);
}

SKIP:
{
$exe = quote(catfile($pwd, $bindir, 'parrot-befunge'));
skip("Befunge", 1) unless (-d "$pwd/$langdir/befunge" || -e $exe);
chdir("$pwd/$langdir/befunge");
$filename = 'test.bef';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH <<'CODE';
<                   p 04   "v"
  ^ >
I                       @   _v
                            !,
  _   2! |                  :
    . \-  %2/36 `21  $   <  ^<   "<- then everything is ok!" +37
  !      #
  3      >
         <       v  ,  _ ^# -8 : g20 "f you can see a 4 here ->" 8 4
                 > :8- ^
CODE
close $FH;
$exe = "$parrot befunge.pbc" unless (-e $exe);
$out = `$exe $filename`;
ok($out eq "If you can see a 4 here ->4 <- then everything is ok!\n", "check befunge");
unlink($filename);
}

SKIP:
{
$exe = quote(catfile($pwd, $bindir, 'parrot-bf'));
skip("bf", 3) unless (-d "$pwd/$langdir/bf" || -e $exe);
chdir("$pwd/$langdir/bf");
$exe = "$parrot bf.pbc" unless (-e $exe);
$out = `$exe`;
ok($out =~ /^usage/, "check bf");
$exe = quote(catfile($pwd, $bindir, 'parrot-bfc'));
$exe = "$parrot bfc.pbc" unless (-e $exe);
$out = `$exe`;
ok($out =~ /^usage/, "check bfc");
$exe = quote(catfile($pwd, $bindir, 'parrot-bfco'));
$exe = "$parrot bfco.pbc" unless (-e $exe);
$out = `$exe`;
ok($out =~ /^usage/, "check bfco");
}

SKIP:
{
if (-d "$pwd/$langdir/blizkost") {
    chdir("$pwd/$langdir/blizkost");
}
elsif (-d "$pwd/$langdir/perl5") {
    chdir("$pwd/$langdir/perl5");
}
else {
    skip("blizkost", 1)
}
$exe = quote(catfile($pwd, $bindir, 'parrot-blizkost'));
$filename = 'test.pl';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "print qq{Hello, World!\n};\n";
close $FH;
$exe = "$parrot perl5.pbc" unless (-e $exe);
$out = `$exe $filename`;
ok($out eq "Hello, World!\n" || $out eq "Hello, World!\r\n", "check blizkost");
unlink($filename);
}

SKIP:
{
$exe = quote(catfile($pwd, $bindir, 'parrot-cardinal'));
skip("Cardinal", 1) unless (-d "$pwd/$langdir/cardinal" || -e $exe);
chdir("$pwd/$langdir/cardinal");
$exe = "$parrot cardinal.pbc" unless (-e $exe);
$out = `$exe -e "print 'hello world';"`;
ok($out eq "hello world", "check cardinal");
}

SKIP:
{
$exe = quote(catfile($pwd, $bindir, 'parrot-chitchat'));
skip("ChitChat", 1) unless (-d "$pwd/$langdir/chitchat" || -e $exe);
chdir("$pwd/$langdir/chitchat");
$filename = 'test.smalltalk';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "Transcript show: 'Hello, world!'.";
close $FH;
$exe = "$parrot chitchat.pbc" unless (-e $exe);
$out = `$exe $filename`;
ok($out eq "Hello, world!\n", "check chitchat");
unlink($filename);
}

SKIP:
{
skip(".NET", 1) unless (-d "$pwd/$langdir/dotnet");
chdir("$pwd/$langdir/dotnet");
$out = `$parrot dotnet/net2pbc.pbc`;
ok($out =~ /^Usage/, "check dotnet");
}

SKIP:
{
$exe = quote(catfile($pwd, $bindir, 'parrot-js'));
skip("EcmaScript", 1) unless (-d "$pwd/$langdir/ecmascript" || -e $exe);
chdir("$pwd/$langdir/ecmascript");
$filename = 'test.js';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "print(\"Hello World from JS\");";
close $FH;
$exe = "$parrot js.pbc" unless (-e $exe);
$out = `$exe $filename`;
ok($out eq "Hello World from JS\n", "check ecmascript");
unlink($filename);
}

SKIP:
{
$exe = quote(catfile($pwd, $bindir, 'parrot-fun'));
skip("fun", 1) unless (-d "$pwd/$langdir/fun" || -e $exe);
chdir("$pwd/$langdir/fun");
$filename = 'test.fun';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "\"Hello World!\".";
close $FH;
$exe = "$parrot fun.pbc" unless (-e $exe);
$out = `$exe $filename`;
ok($out eq "Hello World!\n", "check fun");
unlink($filename);
}

SKIP:
{
$exe = quote(catfile($pwd, $bindir, 'parrot-forth'));
skip("fun", 1) unless (-d "$pwd/$langdir/forth" || -e $exe);
chdir("$pwd/$langdir/forth");
$filename = 'test.frt';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH ".\" Hello World!\" CR";
close $FH;
$exe = "$parrot forth.pbc" unless (-e $exe);
$out = `$exe $filename`;
ok($out eq "Hello World!\n", "check forth");
unlink($filename);
}

SKIP:
{
$exe = quote(catfile($pwd, $bindir, 'parrot-gil'));
skip("gil", 1) unless (-d "$pwd/$langdir/gil" || -e $exe);
chdir("$pwd/$langdir/gil");
$filename = 'test.gil';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH q{say('Hello, world!');};
close $FH;
$exe = "$parrot gil.pbc" unless (-e $exe);
$out = `$exe $filename`;
ok($out eq "Hello, world!\n", "check gil");
unlink($filename);
}

SKIP:
{
$exe = quote(catfile($pwd, $bindir, 'parrot-hq9plus'));
skip("HQ9Plus", 1) unless (-d "$pwd/$langdir/hq9plus" || -e $exe);
chdir("$pwd/$langdir/hq9plus");
$filename = 'test.HQ9Plus';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "H";
close $FH;
$exe = "$parrot hq9plus.pbc" unless (-e $exe);
$out = `$exe $filename`;
ok($out eq "Hello, world!\n", "check HQ9Plus");
unlink($filename);
}

SKIP:
{
$exe = quote(catfile($pwd, $bindir, 'parrot-lisp'));
skip("Lisp", 1) unless (-d "$pwd/$langdir/lisp" || -e $exe);
chdir("$pwd/$langdir/lisp");
$filename = 'test.l';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "( print \"Hello, World!\" )\n";
close $FH;
$exe = "$parrot lisp.pbc" unless (-e $exe);
$out = `$exe $filename`;
ok($out eq "Hello, World!\n", "check lisp");
unlink($filename);
}

SKIP:
{
$exe = quote(catfile($pwd, $bindir, 'parrot-lolcode'));
skip("LOLCODE", 1) unless (-d "$pwd/$langdir/lolcode" || -e $exe);
chdir("$pwd/$langdir/lolcode");
$filename = 'test.lolcode';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH <<'CODE';
HAI 1.2
    VISIBLE "HAI WORLD!"
KTHXBYE
CODE
close $FH;
$exe = "$parrot lolcode.pbc" unless (-e $exe);
$out = `$exe $filename`;
ok($out eq "HAI WORLD!\n", "check lolcode");
unlink($filename);
}

SKIP:
{
delete $ENV{LUA_INIT};
delete $ENV{LUA_PATH};
$exe = quote(catfile($pwd, $bindir, 'parrot-lua'));
skip("Lua", 1) unless (-d "$pwd/$langdir/lua" || -e $exe);
chdir("$pwd/$langdir/lua");
$exe = "$parrot lua.pbc" unless (-e $exe);
$out = `$exe -e "print(nil)"`;
ok($out eq "nil\n", "check lua");
}

SKIP:
{
$exe = quote(catfile($pwd, $bindir, 'parrot-m4'));
skip("m4", 1) unless (-d "$pwd/$langdir/m4" || -e $exe);
chdir("$pwd/$langdir/m4");
$exe = "$parrot m4.pbc" unless (-e $exe);
$out = `$exe`;
ok($out =~ /^Usage/, "check m4");
}

SKIP:
{
$exe = quote(catfile($pwd, $bindir, 'parrot-markdown'));
skip("Markdown", 1) unless (-d "$pwd/$langdir/markdown" || -e $exe);
chdir("$pwd/$langdir/markdown");
$filename = 'test.text';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "Hello, World!\n\n";
close $FH;
$exe = "$parrot markdown.pbc" unless (-e $exe);
$out = `$exe $filename`;
ok($out eq "<p>Hello, World!</p>\n", "check markdown");
unlink($filename);
}

SKIP:
{
$exe = quote(catfile($pwd, $bindir, 'parrot-matrixy'));
skip("matrixy", 1) unless (-d "$pwd/$langdir/matrixy" || -e $exe);
chdir("$pwd/$langdir/matrixy");
$filename = 'test.oct';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "printf(\"Hello, world!\n\");";
close $FH;
$exe = "$parrot matrixy.pbc" unless (-e $exe);
$out = `$exe $filename`;
ok($out eq "Hello, world!\n", "check matrixy");
unlink($filename);
}

SKIP:
{
$exe = quote(catfile($pwd, $bindir, 'parrot-apl'));
skip("Paraplegic", 1) unless (-d "$pwd/$langdir/paraplegic" || -e $exe);
chdir("$pwd/$langdir/paraplegic");
$filename = 'test.apl';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "\"Hello world!\"";
close $FH;
$exe = "$parrot apl.pbc" unless (-e $exe);
$out = `$exe $filename`;
ok($out eq "Hello world!\n", "check Paraplegic");
unlink($filename);
}

SKIP:
{
$exe = quote(catfile($pwd, $bindir, 'parrot-pheme'));
skip("Pheme", 1) unless (-d "$pwd/$langdir/pheme" || -e $exe);
chdir("$pwd/$langdir/pheme");
$filename = 'test.l';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "( write \"Hello, World!\\n\" )\n";
close $FH;
$exe = "$parrot pheme.pbc" unless (-e $exe);
$out = `$exe $filename`;
ok($out eq "Hello, World!\n", "check pheme");
unlink($filename);
}

SKIP:
{
$exe = quote(catfile($pwd, $bindir, 'parrot-pipp'));
skip("Pipp", 1) unless (-d "$pwd/$langdir/pipp" || -e $exe);
chdir("$pwd/$langdir/pipp");
$filename = 'test.php';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "<?php echo \"Hello, World!\\n\"; ?>";
close $FH;
$exe = "$parrot pipp.pbc" unless (-e $exe);
$out = `$exe $filename`;
ok($out eq "Hello, World!\n", "check pipp");
unlink($filename);
}

SKIP:
{
$exe = quote(catfile($pwd, $bindir, 'parrot-porcupine'));
skip("porcupine", 1) unless (-d "$pwd/$langdir/porcupine" || -e $exe);
chdir("$pwd/$langdir/porcupine");
$filename = 'test.pas';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH <<'CODE';
program hello;
begin
    writeln('Hello, world!');
end.
CODE
close $FH;
$exe = "$parrot porcupine.pbc" unless (-e $exe);
$out = `$exe $filename`;
ok($out eq "Hello, world!\n", "check porcupine");
unlink($filename);
}

SKIP:
{
$exe = quote(catfile($pwd, $bindir, 'parrot-primitivearc'));
skip("primitivearc", 1) unless (-d "$pwd/$langdir/primitivearc" || -e $exe);
chdir("$pwd/$langdir/primitivearc");
$filename = 'test.arc';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH q{"Hello, world!\n"};
close $FH;
$exe = "$parrot primitivearc.pbc" unless (-e $exe);
$out = `$exe $filename`;
ok($out eq "Hello, world!\n\n", "check primitivearc");
unlink($filename);
}

SKIP:
{
$exe = quote(catfile($pwd, $bindir, 'parrot-punie'));
skip("Punie", 1) unless (-d "$pwd/$langdir/punie" || -e $exe);
chdir("$pwd/$langdir/punie");
$filename = 'test.p1';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "print \"Hello, World!\";\n";
close $FH;
$exe = "$parrot punie.pbc" unless (-e $exe);
$out = `$exe $filename`;
ok($out eq "Hello, World!", "check punie");
unlink($filename);
}

SKIP:
{
$exe = quote(catfile($pwd, $bindir, 'parrot-pynie'));
skip("Pynie", 1) unless (-d "$pwd/$langdir/pynie" || -e $exe);
chdir("$pwd/$langdir/pynie");
$filename = 'test.py';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "print('Hello, World!')\n";
close $FH;
$exe = "$parrot pynie.pbc" unless (-e $exe);
$out = `$exe $filename`;
ok($out eq "Hello, World!\n", "check pynie");
unlink($filename);
}

SKIP:
{
$exe = quote(catfile($pwd, $bindir, 'perl6'));
skip("Rakudo", 1) unless (-d "$pwd/$langdir/rakudo" || -e $exe);
chdir("$pwd/$langdir/rakudo");
$exe = "$parrot perl6.pbc" unless (-e $exe);
$out = `$exe -e "say 'hello world'"`;
ok($out eq "hello world\n", "check rakudo");
}

SKIP:
{
$exe = quote(catfile($pwd, $bindir, 'parrot-shakespeare'));
skip("Shakespeare", 1) unless (-d "$pwd/$langdir/shakespeare" || -e $exe);
chdir("$pwd/$langdir/shakespeare");
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
$exe = "$parrot shakespeare.pbc" unless (-e $exe);
$out = `$exe $filename`;
ok($out eq "Hello World!\n", "check shakespeare");
unlink($filename);
}

SKIP:
{
$exe = quote(catfile($pwd, $bindir, 'parrot-steme'));
skip("steme", 1) unless (-d "$pwd/$langdir/steme" || -e $exe);
chdir("$pwd/$langdir/steme");
$filename = 'test.scm';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "( say \"Hello, World!\" )\n";
close $FH;
$exe = "$parrot steme.pbc" unless (-e $exe);
$out = `$exe $filename`;
ok($out eq "Hello, World!\n", "check steme");
unlink($filename);
}

SKIP:
{
$exe = quote(catfile($pwd, $bindir, 'parrot-squaak'));
skip("Squaak", 1) unless (-d "$pwd/$langdir/squaak" || -e $exe);
chdir("$pwd/$langdir/squaak");
$filename = 'test.squaak';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH "print(\"Hello, World!\")\n";
close $FH;
$exe = "$parrot squaak.pbc" unless (-e $exe);
$out = `$exe $filename`;
ok($out eq "Hello, World!\n", "check squaak");
unlink($filename);
}

SKIP:
{
$exe = quote(catfile($pwd, $bindir, 'parrot-unl'));
skip("unlambda", 1) unless (-d "$pwd/$langdir/unlambda" || -e $exe);
chdir("$pwd/$langdir/unlambda");
$filename = 'test.unl';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH <<'CODE';
# hello world
`r```````````.H.e.l.l.o. .w.o.r.l.di
CODE
close $FH;
$exe = "$parrot unl.pbc" unless (-e $exe);
$out = `$exe $filename`;
ok($out eq "Hello world\n", "check unlambda");
unlink($filename);
}

SKIP:
{
$exe = quote(catfile($pwd, $bindir, 'winxed'));
skip("Winxed", 1) unless (-d "$pwd/$langdir/winxed" || -e $exe);
chdir("$pwd/$langdir/winxed");
$exe = "$parrot build/winxed_installed.pbc" unless (-e $exe);
$out = `$exe -e "print('hello world');"`;
ok($out eq "hello world", "check winxed");
}

SKIP:
{
$exe = quote(catfile($pwd, $bindir, 'parrot-wmlsi'));
skip("WMLScript", 1) unless (-d "$pwd/$langdir/wmlscript" || -e $exe);
skip("WMLScript, not wmlsc", 1) unless (`wmlsc -h` =~ /wmlsc/);
chdir("$pwd/$langdir/wmlscript");

$filename = 'test.wmls';
open $FH, '>', $filename
        or die "Can't open $filename ($!).\n";
print $FH <<'CODE';
extern function main()
{
    Console.println("Hello World!");
}
CODE
close $FH;
`wmlsc $filename`;
$exe = "$parrot wmlsi.pbc" unless (-e $exe);
$out = `$exe ${filename}c main`;
ok($out eq "Hello World!\n", "check wmlscript");
unlink($filename);
unlink($filename . 'c');
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
