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
    .local pmc gparse
    .local string gname

    load_bytecode "PGE.pbc"
    load_bytecode "dumper.imc"
    load_bytecode "PGE/Dumper.pir"
    load_bytecode "PGE/Glob.pir"
    load_bytecode "PGE/Text.pir"
    find_global p6rule_compile, "PGE", "p6rule"
    find_global glob_compile, "PGE", "glob"
    istrace = 0
    null rulesub

    gparse = p6rule_compile(":w ( (grammar) <ident> ; | (rule) <ident> \{$<rulex>:=[<-[{]>*]\} ;? )*")

  read_loop:
    print "\ninput \"rule <pattern>\", \"glob <pattern>\", \"save <name>\",\n"
    print "target string, \"pir\", \"exp\", \"trace\", \"next\", or \"use <file>\"\n"
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
    if $S0 == "use" goto use_grammar

    if_null rulesub, match_nopattern
    match = rulesub(x)
  match_result:
    unless match goto match_fail
    print "match succeeded\n"
    $P0 = find_global "_dumper"
    $P0(match, "$/")
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
    if_null rulesub, match_nopattern
    x = substr x, 5
    store_global x, rulesub
    print "Saved as "
    print x
    print "\n"
    goto read_loop
    
  
  print_pir:
    if_null rulesub, match_nopattern
    print pir
    goto read_loop

  print_exp:
    if_null rulesub, match_nopattern
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

  use_grammar:
    x = substr x, 4
    $P0 = open x, "<"
    $S0 = read $P0, 65535
    close $P0
    $P0 = gparse($S0)
    # $P0.dump()
    $P1 = $P0."get_array"()
    $P1 = $P1[0]
    $I0 = elements $P1
    $I1 = 0
  use_grammar_stmt:
    if $I1 >= $I0 goto read_loop
    $P3 = $P1[$I1]
    inc $I1
    $P9 = $P3[0]
    $S0 = $P9
    $P9 = $P3['ident']
    $S1 = $P9
    if $S0 == 'grammar' goto grammar_stmt
    $P9 = $P3['rulex']
    $S2 = $P9
    p6rule_compile($S2, gname, $S1)
    print "Loaded "
    print gname
    print "::"
    print $S1
    print "\n"
    goto use_grammar_stmt
  grammar_stmt:
    $P9 = $P3['ident']
    gname = $P9
    goto use_grammar_stmt

  end_demo:
.end
