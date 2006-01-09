#! perl -w
# Copyright: 2006 The Perl Foundation.  All Rights Reserved.
# $Id: assign.t 10933 2006-01-06 01:43:24Z particle $

=head1 NAME

t/function.t - Lua functions

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/function.t

=head1 DESCRIPTION

See "Lua 5.0 Reference Manual", section 2.5.8 "Function Definitions".

See "Programming in Lua", section 5 "Functions".

=cut

use strict;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 1;

language_output_is( 'lua', <<'CODE', <<'OUT', 'global variable' );
function f(a, b) return a or b end

print(f(3))
print(f(3, 4))
print(f(3, 4, 5))
CODE
3
3
3
OUT

