# Copyright: 2002-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

  # Get the input as a string, don't care about buffer overflow yet
  read S0, 1000000

  # Assume that the input is PASM and compile it
  compreg P1, "PASM"
  compile P0, P1, S0

  # Dumping the Eval PMC as a string seems to be unimplemented,
  # so simple invoke it
  invoke P0
  end
