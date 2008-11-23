#! perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/mathx.t - mathx library

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/mathx.t

=head1 DESCRIPTION

Tests mathx
(implemented in F<languages/lua/src/lib/mathx.pir>).

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 1;
use Parrot::Config;
use Test::More;
use Parrot::Test::Lua;

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'require' );
require 'mathx'
print(math.pi)
CODE
/^3\.14/
OUTPUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
