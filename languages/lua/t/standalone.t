#! perl
# Copyright (C) 2007-2008, The Perl Foundation.
# $Id$

=head1 NAME

t/standalone.t

=head1 SYNOPSIS

    % perl t/standalone.t

=head1 DESCRIPTION

See "Lua 5.1 Reference Manual", section 6 "Lua Stand-alone",
L<http://www.lua.org/manual/5.1/manual.html#6>.

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../lib", "$FindBin::Bin";

use Parrot::Test tests => 22;
use Test::More;
use Parrot::Test::Lua;

my $test_prog = Parrot::Test::Lua::get_test_prog();

delete $ENV{LUA_INIT};
delete $ENV{TEST_PROG_ARGS};

language_output_is( 'lua', <<'CODE', <<'OUT', 'shebang' );
#!/usr/bin/env lua

print("Hello World")
CODE
Hello World
OUT

SKIP:
{
skip('only with an interpreter', 18) if ( $test_prog eq 'luac.pl'
                                       || $test_prog eq 'luap.pir'
                                       || $test_prog eq 'luac2pir.pir' );

language_output_like( 'lua', <<'CODE', <<'OUT', 'shebang misplaced' );

#!/usr/bin/env lua
print("Hello World")
CODE
/^lua[^:]*: [^:]+:\d+: /
OUT

unlink("$FindBin::Bin/../../../hello.lua") if ( -f "$FindBin::Bin/../../../hello.lua" );
open my $X, '>', "$FindBin::Bin/../../../hello.lua";
print {$X} "print 'Hello World'\n";
close $X;

language_output_is( 'lua', undef, << 'OUTPUT', 'file', params => "hello.lua"  );
Hello World
OUTPUT

SKIP: {
skip("need luac", 1) unless (`luac -v` =~ /^Lua 5\.1/);

system("luac -o $FindBin::Bin/../../../hello.luac $FindBin::Bin/../../../hello.lua");

language_output_is( 'lua', undef, << 'OUTPUT', 'bytecode translation', params => "hello.luac"  );
Hello World
OUTPUT

unlink("$FindBin::Bin/../../../hello.luac") if ( -f "$FindBin::Bin/../../../hello.luac" );
}

language_output_is( 'lua', undef, << 'OUTPUT', 'redirect', params => "< hello.lua"  );
Hello World
OUTPUT

unlink("$FindBin::Bin/../../../hello.lua") if ( -f "$FindBin::Bin/../../../hello.lua" );

language_output_like( 'lua', undef, << 'OUTPUT', 'no file', params => "no_file.lua"  );
/^lua[^:]*: cannot open no_file.lua: No such file or directory$/
OUTPUT

$ENV{LUA_INIT} = 'print "init"';
language_output_is( 'lua', <<'CODE', <<'OUT', 'LUA_INIT string' );
print("Hello World")
CODE
init
Hello World
OUT
delete $ENV{LUA_INIT};

$ENV{LUA_INIT} = 'error "init"';
language_output_like( 'lua', <<'CODE', <<'OUT', 'LUA_INIT error' );
print("Hello World")
CODE
/^lua[^:]*: [^:]+:\d+: init\nstack traceback:\n/
OUT
delete $ENV{LUA_INIT};

$ENV{LUA_INIT} = '?syntax error?';
language_output_like( 'lua', <<'CODE', <<'OUT', 'LUA_INIT bad string' );
print("Hello World")
CODE
/^lua[^:]*: [^:]+:\d+: /
OUT
delete $ENV{LUA_INIT};

unlink("$FindBin::Bin/../../../boot.lua") if ( -f "$FindBin::Bin/../../../boot.lua" );
open $X, '>', "$FindBin::Bin/../../../boot.lua";
print {$X} "print 'boot from boot.lua by LUA_INIT'\n";
close $X;

$ENV{LUA_INIT} = '@boot.lua';
language_output_is( 'lua', <<'CODE', <<'OUT', 'LUA_INIT file' );
print("Hello World")
CODE
boot from boot.lua by LUA_INIT
Hello World
OUT

unlink("$FindBin::Bin/../../../boot.lua") if ( -f "$FindBin::Bin/../../../boot.lua" );
open $X, '>', "$FindBin::Bin/../../../boot.lua";
print {$X} '?syntax error?';
close $X;

$ENV{LUA_INIT} = '@boot.lua';
language_output_like( 'lua', <<'CODE', <<'OUT', 'LUA_INIT bad file' );
print("Hello World")
CODE
/^lua[^:]*: [^:]+:\d+: /
OUT

unlink("$FindBin::Bin/../../../boot.lua");

$ENV{LUA_INIT} = '@no_file.lua';
language_output_like( 'lua', <<'CODE', <<'OUT', 'LUA_INIT no file' );
print("Hello World")
CODE
/^lua[^:]*: cannot open no_file.lua: No such file or directory$/
OUT

delete $ENV{LUA_INIT};

$ENV{TEST_PROG_ARGS} = '-e"a=1" -e "print(a)"';
language_output_is( 'lua', undef, <<'OUT', '-e' );
1
OUT

$ENV{TEST_PROG_ARGS} = '-e"a=1" -e "print(a)"';
language_output_is( 'lua', <<'CODE', <<'OUT', '-e & script' );
print("Hello World")
CODE
1
Hello World
OUT

$ENV{TEST_PROG_ARGS} = '-e "?syntax error?"';
language_output_like( 'lua', <<'CODE', <<'OUT', '-e bad' );
print "hello"
CODE
/^lua[^:]*: [^:]+:\d+: /
OUT

$ENV{TEST_PROG_ARGS} = '-v';
language_output_like( 'lua', undef, <<'OUT', '-v' );
/^Lua 5.1/
OUT

$ENV{TEST_PROG_ARGS} = '-v';
language_output_like( 'lua', <<'CODE', <<'OUT', '-v & script' );
print(arg[-1])
CODE
/^
Lua\s5.1.*\n
-v
$/x
OUT

$ENV{TEST_PROG_ARGS} = '--';
language_output_is( 'lua', <<'CODE', <<'OUT', '--', params => "-v" );
print(arg[1])
CODE
-v
OUT

$ENV{TEST_PROG_ARGS} = '-u';
language_output_like( 'lua', undef, <<'OUT', 'unknown option' );
/^usage: lua/
OUT

}

SKIP:
{
skip('only with Parrot', 3) unless ($test_prog eq 'lua.pbc');

$ENV{TEST_PROG_ARGS} = '-lalarm';
language_output_is( 'lua', << 'CODE', << 'OUTPUT', '-lalarm' );
print(type(alarm))
CODE
function
OUTPUT

$ENV{TEST_PROG_ARGS} = '-l alarm';
language_output_is( 'lua', << 'CODE', << 'OUTPUT', '-l alarm' );
print(type(alarm))
CODE
function
OUTPUT

$ENV{TEST_PROG_ARGS} = '-l no_lib';
language_output_like( 'lua', << 'CODE', << 'OUTPUT', '-l no_lib' );
print "hello"
CODE
/^lua[^:]*: [^:]+:\d+: module 'no_lib' not found:\n/
OUTPUT

}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

