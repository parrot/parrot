#! perl -w
# Copyright (C) 2006, The Perl Foundation.
# $Id$

=head1 NAME

t/runtime.t - WMLScript Runtime Libraries

=head1 SYNOPSIS

    % perl -I../../lib t/runtime.t

=cut

use strict;
use warnings;
use Parrot::Test tests => 2;
use Test::More;

pir_output_is( << 'CODE', << 'OUTPUT', 'WMLScript.pbc' );
.loadlib 'wmls_ops'
.HLL 'WMLScript', 'wmls_group'

.sub '_init' :anon
  load_bytecode 'languages/WMLScript/src/WMLScript.pbc'
.end

.sub 'function0' :anon
  .local pmc const0
  new const0, .WmlsString
  set const0, "Hello World!"
  .local pmc P_temp_0

PC0:  # LOAD_CONST_S
  $P0 = clone const0
PC1:  # CALL_LIB_S
  P_temp_0 = find_lib(99, 1)
  $P0 = P_temp_0($P0)
PC3:  # POP
  # just pop
PC4:

  new $P0, .WmlsString, ''
  .return ($P0)
.end

.sub 'main' :main
  _init()
  function0()
.end
CODE
Hello World!
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'alternate way' );
.loadlib 'wmls_ops'
.HLL 'WMLScript', 'wmls_group'

.sub '_init' :anon
  load_bytecode 'languages/WMLScript/src/wmlsstdlibs.pir'
.end

.sub 'function0' :anon
  .local pmc const0
  new const0, .WmlsString
  set const0, "Hello World!"
  .local pmc P_temp_0

PC0:  # LOAD_CONST_S
  $P0 = clone const0
PC1:  # CALL_LIB_S
  P_temp_0 = find_lib(99, 1)
  $P0 = P_temp_0($P0)
PC3:  # POP
  # just pop
PC4:

  new $P0, .WmlsString, ''
  .return ($P0)
.end

.sub 'main' :main
  _init()
  function0()
.end
CODE
Hello World!
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

