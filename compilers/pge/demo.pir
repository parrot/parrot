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
    .local pmc p5regexp_compile
    .local pmc glob_compile
    .local int istrace
    .local string gname

    load_bytecode "PGE.pbc"
    load_bytecode "dumper.imc"
    load_bytecode "PGE/Dumper.pir"
    load_bytecode "PGE/Glob.pir"
    load_bytecode "PGE/Text.pir"
    load_bytecode "PGE/Util.pir"
    p6rule_compile = compreg "PGE::P6Rule"
    glob_compile = compreg "PGE::Glob"
    p5regexp_compile = compreg "PGE::P5Regexp"
    istrace = 0
    null rulesub

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
    if $S0 == "regexp" goto make_regexp

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

  make_regexp:
    pattern = substr x, 7
    (rulesub, pir, exp) = p5regexp_compile(pattern)
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
    $P0 = find_global "_dumper"
    $P0(exp, "exp")
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

    $P1 = find_global "PGE", "compile_rules"
    $P1($S0)
    print "Loaded "
    print x
    print "\n"
    goto read_loop

  end_demo:
.end
