.sub _main
    .local string x
    .local string pattern
    .local string patpir
    .local pmc rule
    .local pmc stdin
    .local pmc match
    .local pmc p6ge_compile
    .local pmc p6ge_set_trace

    load_bytecode "p6ge.pir"
    find_global p6ge_compile, "P6GE", "_p6ge_compile"
    find_global p6ge_set_trace, "P6GE", "_p6ge_set_trace"
    

  read_loop:
    print "input /pattern, string to match, + to continue match,"
    print " ? to print pir,\n"
    getstdin stdin
    readline x, stdin
    length $I0, x 
    if $I0 < 1 goto end_loop
    $S0 = substr x, 0, 1                   # determine command type
    if $S0 == "/" goto load_pattern        # /pattern
    if $S0 == "?" goto print_pir           # ? == print pir
    if $S0 == "+" goto match_again         # + == repeat last match
    chopn x,1
    match = rule(x)                        # perform a match on x
    goto match_result
  match_again:
    match."_next"()
  match_result:
    unless match goto match_fail
    print "match succeeded:\n"
    match."_print"()
    goto read_loop
  match_fail:
    print "match failed\n"
    goto read_loop

  load_pattern:
    p6ge_set_trace(0)
    chopn x,1
    $S0 = substr x, -1, 1
    if $S0 != '/' goto sans_slash
    p6ge_set_trace(1)
    chopn x,1
  sans_slash:
    pattern = substr x, 1                  # get the pattern
    (rule, patpir) = p6ge_compile(pattern) # compile to PIR code
    goto read_loop

  print_pir:
    print "pattern = /"
    print pattern
    print "/\nPIR subroutine =\n"
    print patpir
    goto read_loop
  
  end_loop:
.end
