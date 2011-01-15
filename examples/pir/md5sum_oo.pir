# Copyright (C) 2010, Parrot Foundation.

.sub main :main
      .param pmc argv
      load_bytecode "Digest/MD5.pbc"
      .local pmc mba
      .local string filename

      set filename, argv[1]
      $S0 = "Creating new MappedByteArray, and opening " . filename
      say $S0
      mba = new 'MappedByteArray'
      mba.'open'(filename)

      say 'getting the data from the Mapped Byte Array...'
      $I1 = elements mba
      $S0 = mba.'get_string'(0, $I1, 'binary')

      $P0 = new ["Digest";"MD5"]
      $P0."md5sum"($S0)
      $P0."md5_print"()
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
