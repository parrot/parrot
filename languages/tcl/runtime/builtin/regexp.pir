.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&regexp'
  .param pmc argv :slurpy
 
  .local int argc
  argc = argv 
  if argc < 2 goto badargs

  .local pmc options
  options = new .ResizablePMCArray
  push options, 'all'
  push options, 'about'
  push options, 'indices'
  push options, 'inline'
  push options, 'expanded'
  push options, 'line'
  push options, 'linestop'
  push options, 'lineanchor'
  push options, 'nocase'
  push options, 'start'


  .local pmc select_switches, switches
  select_switches  = get_root_global ['_tcl'], 'select_switches'
  switches = select_switches(options, argv, 1, 1)

  .local pmc select_switches

  .local pmc exp, a_string
  
   exp      = shift argv
   a_string = shift argv

   .local pmc tclARE, rule, match

   # RT#40774:            "tclARE"
   tclARE = compreg 'PGE::P5Regex'
   rule = tclARE(exp)
   match = rule(a_string)

   # matchVar
   argc = elements argv
   unless argc goto done
   .local string matchStr, matchVar
   matchStr = match 
   matchVar = shift argv
   .local pmc __set
   __set = get_root_global [ '_tcl' ], '__set'
   __set(matchVar, matchStr)

   .local pmc matches
   matches = match.'get_array'()
   .local string subMatchStr, subMatchVar

subMatches:
   argc = elements argv
   unless argc goto done

   subMatchVar = shift argv
   subMatchStr = ''
   if_null matches, set_it
   $I0 = elements matches
   unless $I0 goto set_it
   subMatchStr = shift matches
 
set_it:
   __set(subMatchVar,subMatchStr) 

next_submatch:
  goto subMatches  

done:
   .return match.__get_bool()

badargs:
  tcl_error 'wrong # args: should be "regexp ?switches? exp string ?matchVar? ?subMatchVar subMatchVar ...?"'

.end
