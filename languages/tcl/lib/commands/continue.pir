###
# [continue]

.namespace [ "Tcl" ]

.sub "&continue"
  .param pmc argv :slurpy
 
  .local int argc
  argc = argv

  if argc != 0 goto badargs
  .tcl_continue()

badargs:
  .throw ("wrong # args: should be \"continue\"\n")
.end
