# Copyright (C) 2010, Parrot Foundation.

.loadlib 'io_ops'
.sub main
      .param pmc argv
      load_bytecode "Digest/MD5.pbc"
      .local pmc mba
      .local string filename

      set filename, argv[1]
      $S0 = "Creating new MappedByteArray, and opening " . filename
      say $S0
      say 'getting the data from the Mapped Byte Array...'

      $P0 = new 'FileHandle'
      $P0.'open'(filename, 'r')
      $P0.'encoding'('binary')
      $S0 = $P0.'readall'()

      $P1 = _md5sum($S0)
      $S0 = _md5_hex($P1)
      say $S0
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
