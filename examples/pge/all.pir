.sub "main" :main
    .local pmc p6rule
    .local pmc stdin
    .local string x
    .local pmc cmdpat, cmd, arg
    .local pmc rulesub, rulepir, ruleexp
    .local pmc match
    .local pmc dumper
    .local int istrace

    load_bytecode "PGE.pbc"
    load_bytecode "dumper.imc"
    load_bytecode "PGE/Dumper.pir"
    load_bytecode "PGE/Util.pir"

    "loadexpr"("Simple", "expr")
    "loadexpr"("Perl6", "expr")

    p6rule = find_global "PGE", "p6rule"
    cmdpat = p6rule("^(rule|next|trace|pir)\\s*(.*)$")
    dumper = find_global "_dumper"
    null istrace
    null rulesub
    null rulepir
    null ruleexp
    null match

  read_loop:
    $S0 = <<"PROMPT"

Enter \"rule <pattern>\" target string, \"next\", 
\"pir\", \"exp\", or \"trace\" 
PROMPT
    print $S0
    stdin = getstdin
    x = readline stdin
    $I0 = length x
    if $I0 < 1 goto end
    chopn x, 1
    $P0 = cmdpat(x)
    unless $P0 goto do_match
    cmd = $P0[0]
    arg = $P0[1]
    if cmd == "rule" goto cmd_rule
    if cmd == "next" goto cmd_next
    if cmd == "trace" goto cmd_trace
    if cmd == "pir" goto cmd_pir
  do_match:
    if_null rulesub, nopattern
    match = rulesub(x)
  match_result:
    unless match goto match_fail
    print "match succeeded\n"
    dumper(match, "$/")
    goto read_loop
  match_fail:
    print "match failed\n"
    goto read_loop
  nopattern:
    print "no pattern entered\n"
    goto read_loop
  cmd_next:
    match."next"()
    goto match_result
  cmd_rule:
    (rulesub, rulepir, ruleexp) = p6rule(arg)
    goto read_loop
  cmd_trace:
    istrace = not istrace
    trace istrace
    if istrace goto trace_on
    print "Tracing is now off\n"
    goto read_loop
  trace_on:
    print "Tracing is now on\n"
    goto read_loop
  cmd_pir:
    print rulepir
    goto read_loop
  end:
.end

.sub "loadexpr"
    .param string namespace
    .param string name
    $P0 = find_global namespace, "__onload"
    $P0()
    print "loaded "
    print namespace
    print "::"
    print name
    print "\n"
.end

.include "simple.pir"
.include "p6parse.pir"
