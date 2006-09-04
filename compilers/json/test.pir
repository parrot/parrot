#!../../parrot 
.sub main :main
  .param pmc argv

  .local int argc
  argc = elements argv
 
  if argc != 2 goto bad_args

  load_bytecode 'PGE.pbc'
  load_bytecode 'PGE/Util.pbc'
  load_bytecode 'compilers/json/JSON.pir'  #the json grammar file

   .local pmc parse, match
   parse = get_root_global ['parrot'; 'JSON'], 'thing'
   if_null parse, bad_parser

   $P0 = get_root_global ['parrot'; 'PGE::Match'], 'newfrom'
   $S0 = argv[1]
   match = $P0($S0)
   match.to(0)
   match = parse(match)
   unless match goto failed
 
   load_bytecode 'dumper.pbc'
   load_bytecode 'PGE/Dumper.pbc'
   $S0 = typeof match
   say $S0
   $P0 = get_root_global ['parrot'], '_dumper'
   $P0(match)
   end
  failed:
   say "that's not a JSON value"
   end
  bad_parser:
   say "can't find JSON.."  
   end
  bad_args:
   say "must specify a single arg."
   end
.end
