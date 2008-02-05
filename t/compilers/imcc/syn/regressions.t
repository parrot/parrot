#!perl
# Copyright (C) 2008, The Perl Foundation.
# $Id $

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Config;
use Parrot::Test tests => 1;

pir_error_output_like( <<'CODE', <<'OUT', "RT# 41097", todo => 'segfaults');
.sub main :main
    get_results '(0)'
.end
CODE
/syntax error/
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
