###
# [if]

.namespace [ "Tcl" ]

.sub "&if"
  .param pmc argv :slurpy

  .local int argc 
  argc = argv

  unless argc goto no_args

  .local pmc elseifs
  elseifs = new TclList
  .local pmc retval,condition
  .local string code
  .local string condition
  .local string body
  .local string else
  .local int handling_else
  handling_else = 0
  .local int counter

  .local pmc compiler,pir_compiler,expr_compiler
  compiler = find_global "_Tcl", "compile"
  pir_compiler = find_global "_Tcl", "pir_compiler"
  expr_compiler = find_global "_Tcl", "__expression_compile"
 
  .local string temp_str
  temp_str ="" 

  counter = 0
  condition = argv[counter]
  inc counter
  if counter >= argc goto missing_script
  body = argv[counter]
  inc counter
  if body != "then" goto get_elseifs 
  if counter >= argc goto missing_script
  body = argv[counter]
  inc counter
  if counter >= argc goto get_final
get_elseifs:
  if counter >= argc goto get_final
  temp_str = argv[counter]
  if temp_str != "elseif" goto get_else
  $P1 = new TclList
  inc counter
  if counter >= argc goto missing_elseif
  $P2 = argv[counter]
  $P1[0] = $P2
  inc counter
  if counter > argc goto missing_script
  $P2 = argv[counter]
  $P1[1] = $P2
  push elseifs, $P1
  inc counter
  goto get_elseifs
get_else:
  handling_else = 1
  temp_str = argv[counter]
  if temp_str != "else" goto get_final
  inc counter
  if counter >= argc goto missing_script
  temp_str = argv[counter]
get_final:
  else = temp_str

  unless handling_else goto begin_parsing
  inc counter
  if counter != argc goto more_than_else

begin_parsing:
  ($I0,$S1) = expr_compiler(0,condition)
  $P2 = pir_compiler($I0,$S1)
  retval = $P2()

  unless retval goto do_elseifs
  code = body 
  goto done
 
do_elseifs:
  $I1 = elseifs
  if $I1 == 0 goto do_else
  $I2 = 0
elseif_loop:
  if $I2 == $I1 goto do_else
  $P1 = elseifs[$I2]
  condition = $P1[0]
  ($I0,$S2) = expr_compiler(0,condition)
  $P3 = pir_compiler($I0,$S2)
  retval = $P3()
  if retval goto done_elseifs
  inc $I2
  goto elseif_loop  

done_elseifs:
  code = $P1[1]
  goto done

do_else:
  code = else

done:
  ($I0,$P1) = compiler(0,code)
  $P2 = pir_compiler($I0,$P1)

  .return $P2()

no_args:
  .throw("wrong # args: no expression after \"if\" argument")

missing_script:
  $S0 = "wrong # args: no script following \"" 
  $I0 = counter
  dec $I0
  $S1  = argv[$I0]
  $S0 .= $S1
  $S0 .=  "\" argument"
  .throw ($S0)

more_than_else:
  .throw ("wrong # args: extra words after \"else\" clause in \"if\" command")

missing_elseif:
  .throw ("wrong # args: no expression after \"elseif\" argument")

.end
