#! perl -w
# Copyright (C) 2006, The Perl Foundation.
# $Id$

=head1 NAME

t/lexico.t - Lua lexicography

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/lexico.t

=head1 DESCRIPTION

See "Lua 5.1 Reference Manual", section 2.1 "Lexical Conventions".

=cut

use strict;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 2;
use Test::More;

language_output_is( 'lua', <<'CODE', <<'OUT', 'string' );
print 'alo\n123"'
print "alo\n123\""
print '\97lo\10\04923"'
print [[alo
123"]]
print [[
alo
123"]]
print [==[
alo
123"]==]
CODE
alo
123"
alo
123"
alo
123"
alo
123"
alo
123"
alo
123"
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'number' );
print(3)
print(3.0)
print(3.1416)
print(314.16e-2)
print(0.31416E1)
print(0xff)
print(0x56)
CODE
3
3
3.1416
3.1416
3.1416
255
86
OUT

