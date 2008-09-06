#! perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/struct.t - struct library

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/struct.t

=head1 DESCRIPTION

Tests struct
(implemented in F<languages/lua/src/lib/struct.pir>).

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 3;
use Test::More;
use Parrot::Test::Lua;
use Config;

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'require' );
m = require "struct"
print(type(m))
CODE
table
OUTPUT

language_output_is( 'lua', << 'CODE', << "OUTPUT", 'struct.size"i"' );
require "struct"
print(struct.size("i"))
CODE
$Config{longsize}
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'struct.size"s"' );
require "struct"
print(struct.size("s"))
CODE
/^[^:]+: [^:]+:\d+: options `c0' - `s' have undefined sizes\nstack traceback:\n/
OUTPUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
