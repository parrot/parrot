.sub main :main
    load_bytecode 'PGE.pbc'
    load_bytecode 'dumper.pbc'
    load_bytecode 'PGE/Dumper.pbc'

    '__onload'()

    .local pmc stdin
    stdin = getstdin

    .local string source
    .local string chunk
    source = ""
    .local pmc program, match
    program = get_hll_global ['Benchmark'], 'program'
  loop:
    chunk = read stdin, 65536
    unless chunk goto end
    source .= chunk 
    goto loop
  end:
    match = program(source, 'grammar'=>'Benchmark')
.end


.include 'ambs1_gen.pir'
   
