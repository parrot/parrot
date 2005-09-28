###
# [exit]

.namespace [ "Tcl" ]

.sub "&exit"
  .param pmc argv :slurpy

  .local int argc
  argc = argv

  if argc > 2 goto badargs

  .local int exit_code
  exit_code = 0

  if argc == 0 goto done

  exit_code = argv[0]

done:
  exit exit_code

badargs:
  .throw("wrong # args: should be \"exit ?returnCode?\"")
.end
