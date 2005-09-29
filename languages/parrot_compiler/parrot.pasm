# Copyright: 2002-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

  # Get the input as a string, don't care about buffer overflow yet
  read S0, 1000000

  # Get a handle on the builtin PASM compiler
  compreg P1, "PASM"

  # compile the code
  set_args "(0)", S0
  get_results "(0)", P0
  invokecc P1	

  # evaluate the compiled code
  invokecc P0	
 
  end
