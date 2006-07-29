.sub main :main
    load_bytecode 'PGE.pbc'
    load_bytecode 'dumper.pbc'
    load_bytecode 'PGE/Dumper.pbc'

    '__onload'()

    .local pmc stdin
    stdin = getstdin

    .local pmc program, match
    program = get_hll_global ['Benchmark'], 'program'
  loop:
    .local string source
    source = read stdin, 65535
    unless source goto end

    match = program(source, 'grammar'=>'Benchmark')
    goto loop
  end:
.end


.include 'ambs1_gen.pir'
   
