# z3 bytecode compiler
# version 0.1 by leo

# TODO parrot
#  * clear attributes to PMCNULL
#  * fix missing attribute err mess
#  * implement super()
#  * clarify attribute inheritance

.sub main @MAIN
  .param pmc argv
  .local pmc zm, zc, ini, opt_spec, opts
  opt_spec = new ResizableStringArray
  push opt_spec, "debug"
  $S0 = shift argv	# the program
  load_bytecode "Getopt/Long.pbc"
  .local pmc get_options
  find_global get_options, "Getopt::Long", "get_options"
  opts = get_options(argv, opt_spec)

  load_bytecode "z3main.pir"
  ini = global "zm_init"
  zc = ini()
  .local string file
  file = argv[0]
  zm = zc."instantiate"(file, opts)
  zm."stats"()
  zm."translate"()
.end

#.include "library/Getopt/Long.pir"
