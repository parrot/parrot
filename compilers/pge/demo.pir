.sub _main
    .local string x
    .local string pattern
    .local string rulepir
    .local int istraced
    .local pmc rulesub
    .local pmc stdin
    .local pmc match
    .local pmc p6rule_compile
    .local pmc p5re_compile
    .local pmc glob_compile
    .local pmc pge_set_trace

    load_bytecode "../../runtime/parrot/library/PGE.pir"
    find_global p6rule_compile, "PGE", "p6rule"
    find_global p5re_compile, "PGE", "p5re"
    find_global glob_compile, "PGE", "glob"
    find_global pge_set_trace, "PGE", "set_trace"
   
    getstdin stdin
    istraced = 0 
    pge_set_trace(istraced)

  read_loop:
    print "\ninput \"rule <pattern>\", \"glob <pattern>\", \"pir\",\n"
    print "target string, \"trace\", or \"next\"\n"
    getstdin stdin
    readline x, stdin
    length $I0, x 
    if $I0 < 1 goto end_demo
    $I0 = index x, " "
    if $I0 > 0 goto get_cmd
    $I0 = index x, "\n"
  get_cmd:
    $S0 = substr x, 0, $I0
    chopn x, 1
    if $S0 == "next" goto match_next
    if $S0 == "rule" goto make_p6rule
    if $S0 == "glob" goto make_glob
    if $S0 == "p5" goto make_p5re
    if $S0 == "pir" goto print_pir
    if $S0 == "trace" goto toggle_trace

    isnull rulesub, match_nopattern
    match = rulesub(x)
  match_result:
    unless match goto match_fail
    print "match succeeded\n"
    match."_print"()
    goto read_loop
  match_fail:
    print "match failed\n"
    goto read_loop
  match_nopattern:
    print "no pattern entered yet\n"
    goto read_loop

  match_next:
    match."_next"()
    goto match_result

  make_p6rule:
    pattern = substr x, 5
    (rulesub, rulepir) = p6rule_compile(pattern)
    goto read_loop
  
  make_glob:
    pattern = substr x, 5
    (rulesub, rulepir) = glob_compile(pattern)
    goto read_loop

  make_p5re:
    pattern = substr x, 3
    (rulesub, rulepir) = p5re_compile(pattern)
    goto read_loop

  print_pir:
    print rulepir
    goto read_loop

  toggle_trace:
    istraced = !istraced
    pge_set_trace(istraced)
    print "Tracing for new patterns is now "
    if istraced goto toggle_trace_on
    print "off\n"
    goto read_loop
  toggle_trace_on:
    print "on\n"
    goto read_loop

  end_demo:
.end
