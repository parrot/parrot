.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&regsub'
  .param pmc argv :slurpy
 
  .local int argc
  argc = elements argv 
  if argc < 3 goto badargs

  .local string expression, target, subSpec
 
  # XXX (#40758): not handling options. 

  expression = argv[0]
  target     = argv[1]
  subSpec    = argv[2] # XXX (#40759): not respecting any special chars in this yet.
 
   .local pmc tclARE # XXX for now, just use P5 regexen
   tclARE = compreg 'PGE::P5Regex'

   .local pmc rule,match 
   rule = tclARE(expression)
   match = rule(target)
   unless match goto match_failed
 
   .local int from,match_len
   from = match.'from'()
   .local string matched_portion
   matched_portion = match.'text'()
   match_len = length matched_portion
 

   substr target, from, match_len, subSpec

done:
   .return (target)

match_failed:
   .return(target)

badargs:
  tcl_error 'wrong # args: should be "regsub ?switches? exp string subSpec ?varName?"'

.end
