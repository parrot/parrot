.namespace [ "Tcl" ]

.sub "&regexp"
  .param pmc argv :slurpy
 
  .local int argc
  argc = argv 
  if argc < 2 goto badargs

  .local pmc exp, a_string
  
   exp      = shift argv
   a_string = shift argv

   .local pmc tclARE, rule, match

   # XXX                       "tclARE"
   tclARE = find_global "PGE", "p6rule"

   rule = tclARE(exp)
   match = rule(a_string)

   $I0 = match
   .return ($I0)

badargs:
  .throw("wrong # args: should be \"regexp ?switches? exp string ?matchVar? ?subMatchVar subMatchVar ...?\"")

.end
