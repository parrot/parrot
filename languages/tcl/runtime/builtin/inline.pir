#
# [inline <language> { code }]
#
# a partcl only command that should probably live in a loadable lib.
#
# Like eval, except that you must specify a registered compiler.

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&inline'
  .param pmc argv :slurpy

  .local int argc
  argc = argv
  
  if argc != 2 goto bad_args

  .local string language,code

  language = argv[0]
  code     = argv[1]

  $P1 = compreg language
  if null $P1 goto fail
  push_eh compiler_error
    $P0 = $P1(code)
  clear_eh
  push_eh runtime_error
    $P0()
  clear_eh
  .return ('')


# First pass at RT#40748
compiler_error:
  get_results'(0,0)', $P1, $S1
  $S1 = 'compile error: ' . $S1
  tcl_error $S1

runtime_error:
  get_results'(0,0)', $P1, $S1
  $S1 = 'runtime error: ' . $S1
  tcl_error $S1

bad_args:
  tcl_error 'wrong # args: should be "inline language code"'

fail:
  $S0 = 'invalid language "'
  $S0 .= language
  $S0 .= '" specified'
  tcl_error $S0
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
