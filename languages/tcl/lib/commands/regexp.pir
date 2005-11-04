.namespace [ "Tcl" ]

.sub "&regexp"
  .param pmc argv :slurpy


badargs:
  .throw("wrong # args: should be \"regexp ?switches? exp string ?matchVar? ?subMatchVar subMatchVar ...?\"")

.end
