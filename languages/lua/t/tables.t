#! perl -w
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id: tables.t  $

=head1 NAME

t/tables.t - Lua tables

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/tables.t

=head1 DESCRIPTION

See "Programming in Lua", section 2.5 "Tables".

=cut

use strict;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 2;

language_output_is( 'lua', <<'CODE', <<'OUT', '' );
a = {}
k = "x"
a[k] = 10
a[20] = "great"
print(a["x"])
k = 20
print(a[k])
a["x"] = a ["x"] + 1
print(a["x"])
CODE
10
great
11
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', '' );
a = {}
a["x"] = 10
b = a
print(b["x"])
b["x"] = 20
print(a["x"])
a = nil
b = nil
CODE
10
20
OUT

