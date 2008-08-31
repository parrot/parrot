#! perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/lpeg.t - LPeg library

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/lpeg.t

=head1 DESCRIPTION

Tests LPeg
(implemented in F<languages/lua/src/lib/lpeg.pir>).

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 1;
use Test::More;
use Parrot::Config;
use Parrot::Test::Lua;

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'require & version' );
require "lpeg"
print(lpeg.version())
CODE
0.8
OUTPUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
