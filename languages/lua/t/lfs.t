#! perl
# Copyright (C) 2007-2008, The Perl Foundation.
# $Id$

=head1 NAME

t/lfs.t - Lua File System Library

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/lfs.t

=head1 DESCRIPTION

Tests Lua File System Library
(implemented in F<languages/lua/src/lib/lfs.pir>).

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 18;
use Test::More;
use Cwd;
use File::Basename;
use File::Spec;
use Parrot::Test::Lua;

my $test_prog = Parrot::Test::Lua::get_test_prog();

language_output_is( 'lua', << 'CODE', << 'OUT', 'require lfs' );
require "lfs"
print(type(lfs))
print(lfs._VERSION)
CODE
table
LuaFileSystem 1.4.0
OUT

my $cwd = dirname(File::Spec->canonpath(getcwd));
language_output_is( 'lua', << 'CODE', << "OUT", 'function lfs.currentdir' );
require "lfs"
print(lfs.currentdir())
CODE
$cwd
OUT

my $upcwd = File::Spec->catfile($cwd, 'src');
language_output_is( 'lua', << 'CODE', << "OUT", 'function lfs.chdir' );
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
OUT

language_output_is( 'lua', << 'CODE', << 'OUT', 'function lfs.chdir' );
require "lfs"
r, msg = lfs.chdir("bad_dir")
print(r)
print(msg)
CODE
nil
Unable to change working directory to 'bad_dir'
No such file or directory

OUT

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

language_output_like( 'lua', <<'CODE', <<'OUT', 'function lfs.dir' );
require "lfs"
for file in lfs.dir("xpto") do
    print(file)
end
CODE
/^(\.\n\.\.\n|\.\.\n\.\n)/
OUT

rmdir '../xpto' if (-d '../xpto');

language_output_is( 'lua', <<'CODE', <<'OUT', 'function lfs.mkdir' );
require "lfs"
r, msg = lfs.mkdir("xptoo/xptoo")
print(r)
print(msg)
CODE
nil
No such file or directory
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'function lfs.dir' );
require "lfs"
lfs.dir("xptoo")
CODE
/^[^:]+: [^:]+:\d+: cannot open xptoo: No such file or directory\nstack traceback:\n/
OUT

mkdir '../xpto' unless -d '../xpto';

language_output_is( 'lua', <<'CODE', <<'OUT', 'function lfs.mkdir' );
require "lfs"
print(lfs.rmdir("xpto"))
CODE
true
OUT

ok( !-d $xpto, "Test that rm removed the directory" );
rmdir '../xpto' if (-d '../xpto');

language_output_is( 'lua', <<'CODE', <<'OUT', 'function lfs.mkdir' );
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

language_output_is( 'lua', <<'CODE', <<'OUT', 'function lfs.attributes' );
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

my $nb = ($^O eq 'MSWin32') ? 11 : 13;
language_output_is( 'lua', <<'CODE', <<"OUT", 'function lfs.attributes' );
require "lfs"
attr = lfs.attributes("file.txt")
local nb = 0
for k in pairs(attr) do nb = nb + 1 end
print(nb)
CODE
$nb
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'function lfs.attributes' );
require "lfs"
print(lfs.attributes("file.txt", "mode"))
print(lfs.attributes("file.txt", "size"))
CODE
file
15
OUT

SKIP:
{
skip('only with Parrot', 1) if ($test_prog eq 'lua');

language_output_like( 'lua', <<'CODE', <<'OUT', 'function lfs.attributes (invalid)' );
require "lfs"
print(lfs.attributes("file.txt", "bad"))
CODE
/^[^:]+: [^:]+:\d+: bad argument #2 to 'attributes' \(invalid option 'bad'\)\nstack traceback:\n/
OUT
}

language_output_is( 'lua', <<'CODE', <<'OUT', 'function lfs.attributes (no file)' );
require "lfs"
r, msg = lfs.attributes("no_file.txt")
print(r)
print(msg)
CODE
nil
cannot obtain information from file `no_file.txt'
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'function lfs.lock (closed)' );
require "lfs"
f = io.open("file.txt")
f:close()
lfs.lock(f)
CODE
/^[^:]+: [^:]+:\d+: lock: closed file\nstack traceback:\n/
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'function lfs.symlinkattributes' );
require "lfs"
print(lfs.symlinkattributes("file.txt", "mode"))
print(lfs.symlinkattributes("file.txt", "size"))
CODE
file
15
OUT

# clean up file.txt
unlink('../file.txt') if ( -f '../file.txt' );

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

