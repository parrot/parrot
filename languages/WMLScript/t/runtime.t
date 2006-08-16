#! perl -w
# Copyright (C) 2006, The Perl Foundation.
# $Id: runtime.t 13503 2006-07-24 15:26:45Z ambs $

=head1 NAME

t/runtime.t - WMLScript Runtime Libraries

=head1 SYNOPSIS

    % perl -I../../lib t/runtime.t

=cut

use Parrot::Test tests => 2;
use Test::More;

TODO: {
local $TODO = 'bug with pbc_merge ???';        

pir_output_is( << 'CODE', << 'OUTPUT', 'wmlslib merged' );
.loadlib 'wmls_ops'
.HLL 'WMLScript', 'wmls_group'

.sub '_init' :anon
  load_bytecode 'languages/WMLScript/runtime/wmlslib.pbc'
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
}

pir_output_is( << 'CODE', << 'OUTPUT', 'alternate wmlslib' );
.loadlib 'wmls_ops'
.HLL 'WMLScript', 'wmls_group'

.sub '_init' :anon
  load_bytecode 'languages/WMLScript/runtime/wmlslang.pbc'
  load_bytecode 'languages/WMLScript/runtime/wmlsfloat.pbc'
  load_bytecode 'languages/WMLScript/runtime/wmlsstring.pbc'
  load_bytecode 'languages/WMLScript/runtime/wmlsconsole.pbc'
  load_bytecode 'languages/WMLScript/runtime/wmlsstdlibs.pbc'
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

