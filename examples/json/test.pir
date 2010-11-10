#!../../parrot
# Copyright (C) 2006-2009, Parrot Foundation.

.sub main :main
   .param pmc argv

   .local int argc
   argc = elements argv

   if argc != 2 goto bad_args

   .local pmc    json, code, data
   .local string text
   load_language  'data_json'
   json = compreg 'data_json'
   text = argv[1]
   code = json.'compile'(text)
   data = code()

   load_bytecode 'dumper.pbc'
   _dumper(data, 'JSON')
   end

  bad_args:
   say "Must specify a single arg."
   end
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
