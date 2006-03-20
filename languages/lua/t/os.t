#! perl -w
# Copyright: 2006 The Perl Foundation.  All Rights Reserved.
# $Id: os.t 11478 2006-02-09 08:26:19Z fperrad $

=head1 NAME

t/os.t - Lua Operating System Library

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/os.t

=head1 DESCRIPTION

Tests Lua Operating System Library
(implemented in F<languages/lua/lib/luaos.pir>).

=cut

use strict;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 13;
use Test::More;

language_output_is( 'lua', << 'CODE', << 'OUTPUT', "function execute");
cmd = "perl -e \"print 'test'; exit(2)\""
r = os.execute(cmd)
print(r)
CODE
test2
OUTPUT


language_output_is( 'lua', << 'CODE', << 'OUTPUT', "function execute");
r = os.execute()
print(r)
CODE
1
OUTPUT


language_output_is( 'lua', << 'CODE', << 'OUTPUT', "function exit");
print("reached")
os.exit()
print("not reached")
CODE
reached
OUTPUT


language_output_is( 'lua', << 'CODE', << 'OUTPUT', "function getenv");
print(os.getenv("PARROT_TMP"))
CODE
nil
OUTPUT

$ENV{PARROT_TMP} = "GETENV_PARROT";

language_output_is( 'lua', << 'CODE', << 'OUTPUT', "function getenv");
print(os.getenv("PARROT_TMP"))
CODE
GETENV_PARROT
OUTPUT


open X, "> ../file.rm";
print X "file to remove";
close X;

language_output_is( 'lua', << 'CODE', << 'OUTPUT', "function remove");
r = os.remove("file.rm")
print(r)
CODE
true
OUTPUT

ok(!-e "../file.rm", "Test that the file is removed");
unlink("../file.rm") if (-e "../file.rm");

language_output_is( 'lua', << 'CODE', << 'OUTPUT', "function remove");
r, msg = os.remove("file.rm")
print(r)
print(msg)
CODE
nil
file.rm: No such file or directory
OUTPUT


open X, "> ../file.old";
print X "file to rename";
close X;

language_output_is( 'lua', << 'CODE', << 'OUTPUT', "function rename");
r = os.rename("file.old", "file.new")
print(r)
CODE
true
OUTPUT

ok(!-e "../file.old", "Test that old file is missing");
ok(-e "../file.new", "Test that new file is here");
unlink("../file.old") if (-e "../file.old");
unlink("../file.new") if (-e "../file.new");

language_output_is( 'lua', << 'CODE', << 'OUTPUT', "function rename");
r, msg = os.rename("file.old", "file.new")
print(r)
print(msg)
CODE
nil
file.old: No such file or directory
OUTPUT


language_output_like( 'lua', << 'CODE', << 'OUTPUT', "function time");
print(os.time())
CODE
/\d+/
OUTPUT

