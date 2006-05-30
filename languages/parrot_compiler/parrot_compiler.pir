# Copyright (C) 2002-2006, The Perl Foundation.
# $Id$

.sub main :main
  .param pmc argv

  load_bytecode "Getopt/Obj.pbc"

  # Specification of command line arguments.
  .local pmc getopts
  getopts = new "Getopt::Obj"
  push getopts, "language=s"
  # getopts."notOptStop"(1)


  # the program name is the first element in argv
  .local string program_name
  program_name = shift argv

  # Make a copy of argv, because this can easier be handled in get_options
  # TODO: eliminate need for copy
  .local pmc argv_pmc_arr
  argv_pmc_arr = new .ResizablePMCArray
  .local int k, argc
  k = 0
  argc = argv
  beginfor:
    unless k < argc goto endfor
    $P0 = shift argv
    push argv_pmc_arr, $P0
    inc k
    goto beginfor
  endfor:

  .local pmc opt
  opt = getopts."get_options"(argv_pmc_arr)

  # Now we do what the passed options tell
  .local int is_defined

  # Was '--language' passed ?
  is_defined = defined opt["language"]
  if is_defined goto HAS_LANGUAGE_PARAM
    print "Please pass --language=<language>\n"
    end
  HAS_LANGUAGE_PARAM:

  .local string language
  language = opt["language"]

  # Get the input as a string, don't care about buffer overflow yet
  read S0, 1000000

  # Assume that the input is PASM and compile it
  compreg P1, language
  P0 = P1( S0 )

  # invoke the compiled code
  P0()

.end
