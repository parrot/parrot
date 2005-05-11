.sub _main
    .local string x
    .local string pattern
    .local int istraced
    .local pmc stdin
    .local pmc rulesub
    .local pmc pir
    .local pmc exp
    .local pmc match
    .local pmc p6rule_compile
    .local pmc glob_compile
    .local int istrace

    load_bytecode "PGE.pbc"
    load_bytecode "PGE/Dumper.pir"
    load_bytecode "PGE/Glob.pir"
    find_global p6rule_compile, "PGE", "p6rule"
    find_global glob_compile, "PGE", "glob"
    istrace = 0
    null rulesub

    (rulesub, pir, exp) = p6rule_compile("\w+")
    store_global "ident", rulesub
   
  read_loop:
    print "\ninput \"rule <pattern>\", \"glob <pattern>\", \"save <name>\",\n"
    print "target string, \"pir\", \"exp\", \"trace\", or \"next\"\n"
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
    if $S0 == "save" goto save_rule
    if $S0 == "pir" goto print_pir
    if $S0 == "exp" goto print_exp
    if $S0 == "trace" goto toggle_trace

    isnull rulesub, match_nopattern
    match = rulesub(x)
  match_result:
    unless match goto match_fail
    print "match succeeded\n"
    match."dump"("$/")
    goto read_loop
  match_fail:
    print "match failed\n"
    goto read_loop
  match_nopattern:
    print "no pattern entered yet\n"
    goto read_loop

  match_next:
    match."next"()
    goto match_result

  make_glob:
    pattern = substr x, 5
    (rulesub, pir, exp) = glob_compile(pattern)
    goto read_loop

  make_p6rule:
    pattern = substr x, 5
    (rulesub, pir, exp) = p6rule_compile(pattern)
    goto read_loop

  save_rule:
    isnull rulesub, match_nopattern
    x = substr x, 5
    store_global x, rulesub
    print "Saved as "
    print x
    print "\n"
    goto read_loop
    
  
  print_pir:
    isnull rulesub, match_nopattern
    print pir
    goto read_loop

  print_exp:
    isnull rulesub, match_nopattern
    exp."dump"(0)
    goto read_loop

  toggle_trace:
    istrace = not istrace
    trace istrace
    unless istrace goto trace_off
    print "Tracing is now on\n"
    goto read_loop
  trace_off:
    print "Tracing is now off\n"
    goto read_loop
  end_demo:
.end
