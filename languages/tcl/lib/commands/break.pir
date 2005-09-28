###
# [break]

.namespace [ "Tcl" ]

.sub "&break"
  .param pmc argv :slurpy

  .local int argc
  argc = argv

  if argc != 0 goto badargs
  .tcl_break()

badargs:
  .throw("wrong # args: should be \"break\"")
.end
