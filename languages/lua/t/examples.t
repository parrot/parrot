#! perl -w
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id: examples.t  $

=head1 NAME

t/examples.t - some Lua code examples

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/examples.t

=head1 DESCRIPTION

First tests in order to check infrastructure.

=cut

use strict;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 3;

language_output_is( 'lua', <<'CODE', <<'OUT', 'hello world' );
print("Hello World")
CODE
Hello World
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'hello world' );
print "Hello World"
CODE
Hello World
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'version' );
print(_VERSION)
CODE
/Lua 5.0/
OUT

