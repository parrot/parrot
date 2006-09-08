#!../../parrot 
.sub main :main
  .param pmc argv

  .local int argc
  argc = elements argv
 
  if argc != 2 goto bad_args

  load_bytecode 'PGE.pbc'
  load_bytecode 'PGE/Util.pbc'
  load_bytecode 'compilers/json/JSON.pbc'
  
  .local pmc JSON
  JSON = compreg "JSON"
  $S0 = argv[1]
  $P1 = JSON($S0)

   load_bytecode 'dumper.pbc'
   _dumper($P1, "JSON")
   end

  bad_args:
   say "must specify a single arg."
   end
.end
