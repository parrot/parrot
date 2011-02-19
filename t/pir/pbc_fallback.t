#!perl
# Copyright (C) 2011, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests =>   1;

=head1 NAME

t/pir/pbc_fallback.t - PBC Fallback

=head1 SYNOPSIS

    % prove t/pir/pbc_fallback.t

=head1 DESCRIPTION

Test PIR that loads PIR.  See http://trac.parrot.org/parrot/ticket/692.

=cut

pir_output_is( <<'CODE', <<'OUTPUT', "use it in PIR" );
.sub main :main
  load_bytecode 't/pir/testlib/loadtest.pbc'
.end
CODE
loaded
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
