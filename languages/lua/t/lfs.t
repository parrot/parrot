#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$

=head1 NAME

t/lfs.t - Lua File System Library

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/lfs.t

=head1 DESCRIPTION

Tests Lua File System Library
(implemented in F<languages/lua/lib/lfs.pir>).

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 15;
use Test::More;
use Cwd;
use File::Basename;
use File::Spec;

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'require lfs' );
require "lfs"
print(type(lfs))
print(lfs._VERSION)
CODE
table
LuaFileSystem 1.2
OUTPUT

my $cwd = dirname(File::Spec->canonpath(getcwd));
language_output_is( 'lua', << 'CODE', << "OUTPUT", 'function lfs.currentdir' );
require "lfs"
print(lfs.currentdir())
CODE
$cwd
OUTPUT

my $upcwd = File::Spec->catfile($cwd, 'src');
language_output_is( 'lua', << 'CODE', << "OUTPUT", 'function lfs.chdir' );
require "lfs"
print(lfs.chdir("src"))
print(lfs.currentdir())
print(lfs.chdir(".."))
print(lfs.currentdir())
CODE
true
$upcwd
true
$cwd
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function lfs.chdir' );
require "lfs"
r, msg = lfs.chdir("bad_dir")
print(r)
print(msg)
CODE
nil
Unable to change working directory to 'bad_dir'
No such file or directory

OUTPUT

my $xpto = File::Spec->catfile($cwd, 'xpto');
language_output_is( 'lua', <<'CODE', <<"OUT", 'function lfs.mkdir' );
require "lfs"
print(lfs.mkdir("xpto"))
print(lfs.chdir("xpto"))
print(lfs.currentdir())
print(lfs.chdir(".."))
print(lfs.currentdir())
CODE
true
true
$xpto
true
$cwd
OUT

language_output_is( 'lua', <<'CODE', <<"OUT", 'function lfs.dir' );
require "lfs"
for file in lfs.dir("xpto") do
    print(file)
end
CODE
.
..
OUT

rmdir '../xpto' if (-d '../xpto');

language_output_is( 'lua', <<'CODE', <<"OUT", 'function lfs.mkdir' );
require "lfs"
r, msg = lfs.mkdir("xptoo/xptoo")
print(r)
print(msg)
CODE
nil
No such file or directory
OUT

language_output_like( 'lua', <<'CODE', <<"OUT", 'function lfs.dir' );
require "lfs"
lfs.dir("xptoo")
CODE
/cannot open xptoo: No such file or directory/
OUT

mkdir '../xpto' unless -d '../xpto';

language_output_is( 'lua', <<'CODE', <<"OUT", 'function lfs.mkdir' );
require "lfs"
print(lfs.rmdir("xpto"))
CODE
true
OUT

ok( !-d $xpto, "Test that rm removed the directory" );
rmdir '../xpto' if (-d '../xpto');

language_output_is( 'lua', <<'CODE', <<"OUT", 'function lfs.mkdir' );
require "lfs"
r, msg = lfs.rmdir("xpto")
print(r)
print(msg)
CODE
nil
No such file or directory
OUT

unlink('../file.txt') if ( -f '../file.txt' );
open my $X, '>', '../file.txt';
binmode $X, ':raw';
print {$X} "file with text\n";
close $X;

language_output_is( 'lua', <<'CODE', <<"OUT", 'function lfs.attributes' );
require "lfs"
attr = lfs.attributes("file.txt")
print(type(attr))
print(attr.mode)
print(attr.size)
CODE
table
file
15
OUT

language_output_is( 'lua', <<'CODE', <<"OUT", 'function lfs.attributes' );
require "lfs"
print(lfs.attributes("file.txt", "mode"))
print(lfs.attributes("file.txt", "size"))
CODE
file
15
OUT

language_output_is( 'lua', <<'CODE', <<"OUT", 'function lfs.attributes (no file)' );
require "lfs"
r, msg = lfs.attributes("no_file.txt")
print(r)
print(msg)
CODE
nil
cannot obtain information from file `no_file.txt'
OUT

language_output_like( 'lua', <<'CODE', <<"OUT", 'function lfs.lock (closed)' );
require "lfs"
f = io.open("file.txt")
f:close()
lfs.lock(f)
CODE
/lock: closed file/
OUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

