=head1 tcllib

This file contains all the PIR necessary to setup the basic C<Tcl>,
C<_Tcl>, and C<_TclWord> namespaces. These namespaces can then be used
by our own C<tcl.pir> to setup a tclsh-like interpreter, or to allow
other PIR programs to access procedures in our own namespaces, also
providing a compreg-compatible method.

=cut

# XXX It would be nice to be able to reduce the # of times we call
# .HLL here and in the .included files to a minimum.

.HLL 'parrot', ''

.loadlib 'dynlexpad'
.include 'languages/tcl/src/macros.pir'
.include 'cclass.pasm'

.namespace [ 'TclExpr::PAST::Grammar' ]
.include 'languages/tcl/src/grammar/expr/pge2past.pir'

.namespace [ 'TclExpr::PIR::Grammar' ]
.include 'languages/tcl/src/grammar/expr/past2pir.pir'

.include 'languages/tcl/src/grammar/expr/past.pir'

# all the builtin commands (HLL: Tcl - loads 'tcl_group')
.include 'languages/tcl/runtime/builtins.pir'

# library files (HLL: _Tcl)
.include 'languages/tcl/runtime/conversions.pir'
.include 'languages/tcl/runtime/list.pir'
.include 'languages/tcl/runtime/list_to_string.pir'
.include 'languages/tcl/runtime/string.pir'
.include 'languages/tcl/runtime/string_to_list.pir'
.include 'languages/tcl/runtime/variables.pir'
.include 'languages/tcl/src/compiler.pir'
.include 'languages/tcl/src/parser.pir'


# create the 'tcl' namespace -- see RT #39852
# http://rt.perl.org/rt3/Ticket/Display.html?id=39852
.HLL 'Tcl', ''
.namespace ['tcl']
.sub foo
  .return()
.end

.HLL '_Tcl', ''
.namespace

.sub __load_macros :load :anon
  $P0 = compreg 'PIR'
  $P0 = $P0(".sub main\n.include 'languages/tcl/src/macros.pir'\n.end")
  $P0()
.end

.sub __prepare_lib :load :anon

  # Load any dependant libraries.
  load_bytecode 'Getopt/Obj.pbc'
  load_bytecode 'PGE.pbc'
  load_bytecode 'PGE/Util.pbc'
  load_bytecode 'TGE.pbc'

  # Expose Environment variables.
  .local pmc env,tcl_env,iterator
  env = new .Env
  tcl_env = new .TclArray
  
  iterator = new .Iterator, env
  iterator = 0

  .local string key,value
env_loop:
  unless iterator goto env_loop_done
  key = shift iterator
  value = env[key]
  tcl_env[key] = value

  goto env_loop

env_loop_done:
  .set_in_HLL('tcl', '$env', tcl_env)

  # keep track of names of file types.
  .local pmc filetypes
  filetypes = new .TclArray
  filetypes[0o060000] = 'blockSpecial'
  filetypes[0o020000] = 'characterSpecial'
  filetypes[0o040000] = 'directory'
  filetypes[0o010000] = 'fifo'
  filetypes[0o100000] = 'file'
  filetypes[0o120000] = 'link'
  filetypes[0o140000] = 'socket'

   store_global 'filetypes', filetypes

   .local pmc binary_types
   binary_types = new .TclArray
   binary_types['a'] = 1
   binary_types['A'] = 1
   binary_types['b'] = 1
   binary_types['B'] = 1
   binary_types['h'] = 1
   binary_types['H'] = 1
   binary_types['c'] = 1
   binary_types['s'] = 1
   binary_types['S'] = 1
   binary_types['i'] = 1
   binary_types['I'] = 1
   binary_types['w'] = 1
   binary_types['W'] = 1
   binary_types['f'] = 1
   binary_types['d'] = 1
   binary_types['x'] = 1
   binary_types['X'] = 1
   binary_types['@'] = 1

   store_global 'binary_types', binary_types

  # XXX - this is a holdover. We should incorporate this list into the
  # appropriate grammar so we don't have two lists sitting around.

  # Keep track of math functions
  .local pmc math_funcs
  math_funcs = new .TclArray

  math_funcs['abs']   = 1
  math_funcs['acos']  = 1
  math_funcs['asin']  = 1
  math_funcs['atan']  = 1
  math_funcs['cos']   = 1
  math_funcs['cosh']  = 1
  math_funcs['exp']   = 1
  math_funcs['log']   = 1
  math_funcs['log10'] = 1
  math_funcs['sin']   = 1
  math_funcs['sinh']  = 1
  math_funcs['sqrt']  = 1
  math_funcs['tan']   = 1
  math_funcs['tanh']  = 1

  store_global 'functions', math_funcs

  # Eventually, we'll need to register MMD for the various Tcl PMCs
  # (Presuming we don't do this from the .pmc definitions.)

  $P1 = new .TclArray
  store_global 'proc_body', $P1

  $P1 = new .TclArray
  store_global 'proc_args', $P1

  # Global variable initialization

   #version info
  $P0 = new .String
  $P0 = '0.1'
  .set_in_HLL('tcl', '$tcl_patchLevel', $P0)
  $P0 = new .String
  $P0 = '0.1'
  .set_in_HLL('tcl', '$tcl_version', $P0)
   
  #error information
  $P0 = new .TclString
  $P0 = 'NONE'
  .set_in_HLL('tcl', '$errorCode', $P0)
  $P0 = new .TclString
  $P0 = ''
  .set_in_HLL('tcl', '$errorInfo', $P0)

  # Setup the default channelIds
  $P1 = new .TclArray
  $P2 = getstdin
  $P1['stdin'] = $P2
  $P2 = getstdout
  $P1['stdout'] = $P2
  $P2 = getstderr
  $P1['stderr'] = $P2
  store_global 'channels', $P1
  
  # Setup the id # for channels..
  $P1 = new .Integer
  $P1 = 1
  store_global 'next_channel_id', $P1

  # calling level (for upvar, uplevel, globals vs. lex)
  $P1 = new .Integer
  $P1 = 0
  store_global 'call_level', $P1
  # call level diff (for skipping lex pads in upvar and uplevel)
  $P1 = new .Integer
  $P1 = 0
  store_global 'call_level_diff', $P1

  # Change counter: when something is compiled, it is compared to
  # This counter: if the counter hasn't changed since it was compiled,
  # it's safe to use the inline version (if available)
  # Otherwise fallback to the interpreted version.
  $P1 = new .Integer
  $P1 = 0
  store_global 'epoch', $P1

  # register the TCL compiler.
  $P1 = find_global '_tcl_compile'
  compreg 'TCL', $P1
  
  # Setup a global to keep a unique id for compiled subs.
  $P1 = new .Integer
  $P1 = 0
  store_global 'compiled_num', $P1

.end

.sub _tcl_compile
  .param string tcl_code

  .local pmc compiled_num
  compiled_num = find_global 'compiled_num'
  inc compiled_num

  .local pmc compiler,pir_compiler
  compiler = find_global 'compile'
  pir_compiler = find_global 'pir_compiler'

  ($I0,$S0) = compiler(0,tcl_code)
  .return pir_compiler($I0,$S0)
.end

.include 'languages/tcl/src/grammar/expr/expression.pir'
.include 'languages/tcl/src/grammar/expr/parse.pir'
.include 'languages/tcl/src/grammar/expr/functions.pir'
.include 'languages/tcl/src/grammar/expr/operators.pir'
