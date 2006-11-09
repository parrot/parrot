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
  $P0 = $P1(code)
  $P0()

  # XXX (#40748): Should catch exceptions in the code and return the error message
  .return ('')

bad_args:
  tcl_error 'wrong # args: should be "inline language code"'

fail:
  $S0 = 'invalid language "'
  $S0 .= language
  $S0 .= '" specified'
  tcl_error $S0
.end
