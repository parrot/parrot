# $Id$
# A Brainfuck compiler
# By Leon Brocard <acme@astray.com>
# 
# See http://www.catseye.mb.ca/esoteric/bf/
# for more information on this silly language

  # Get the brainfuck source file into S0
  set S0, P0[1]
  if S0, SOURCE
  set S0, P0[0]
  print "usage: ../imcc/imcc -r "
  print S0
  print " file.bf\n"
  end

  # Read the file into S1
SOURCE:
  open I0, S0
SOURCE_LOOP:
  readline S2, I0
  concat S1, S2
  if S2, SOURCE_LOOP
  close I0

  length I30, S1

  # Initialise
  set S3,    "set I0, 0          # pc\n"
  concat S3, "new P0, .PerlArray # memory\n"
  concat S3, "set I1, 0          # pointer\n"

  set I0, 0 # pc
  set I3, 0 # label count

  # The main interpreter loop
INTERP:
  substr S0, S1, I0, 1
  concat S3, "\nSTEP"
  set    S4, I0
  concat S3, S4
  concat S3, ": # "
  concat S3, S0
  concat S3, "\n"

#  concat S3, '#print "STEP'
#  concat S3, S4
#  concat S3, '\n"'
#  concat S3, "\n"

  ne S0, "+", NOTPLUS
  concat S3, "set I2, P0[I1]\n"
  concat S3, "inc I2\n"
  concat S3, "set P0[I1], I2\n"
  branch NEXT

NOTPLUS:
  ne S0, "-", NOTMINUS
  concat S3, "set I2, P0[I1]\n"
  concat S3, "dec I2\n"
  concat S3, "set P0[I1], I2\n"
  branch NEXT

NOTMINUS:
  ne S0, ">", NOTGT
  concat S3, "inc I1\n"
  branch NEXT

NOTGT:
  ne S0, "<", NOTLT
  concat S3, "dec I1\n"
  branch NEXT

NOTLT:
  ne S0, "[", NOTOPEN

  set I2, 0 # "depth"

  set I3, I0
OPEN_LOOP:
  inc I3
  substr S2, S1, I3, 1
  ne S2, "[", OPEN_NOTOPEN
  inc I2
  branch OPEN_LOOP
OPEN_NOTOPEN:
  ne S2, "]", OPEN_LOOP
  eq I2, 0, OPEN_NEXT
  dec I2
  branch OPEN_LOOP
OPEN_NEXT:
  inc I3
  set S4, I3
  concat S3, "set I2, P0[I1]\n"
  concat S3, "unless I2, STEP"
  concat S3, S4
  concat S3, "\n"

  branch NEXT

NOTOPEN:
  ne S0, "]", NOTCLOSE

  set I3, I0
  set I2, 0 # "height"

CLOSE_LOOP:
  dec I3
  substr S2, S1, I3, 1
  ne S2, "]", CLOSE_NOTCLOSE
  inc I2
  branch CLOSE_LOOP
CLOSE_NOTCLOSE:
  ne S2, "[", CLOSE_LOOP
  eq I2, 0, CLOSE_NEXT
  dec I2
  branch CLOSE_LOOP

CLOSE_NEXT:
  set S4, I3
  concat S3, "branch STEP"
  concat S3, S4
  concat S3, "\n"

  branch NEXT

NOTCLOSE:
  ne S0, ".", NOTDOT
  concat S3, "set I2, P0[I1]\n"
  concat S3, "chr S31, I2\n"
  concat S3, "print S31\n"
  branch NEXT

NOTDOT:
  ne S0, ",", NEXT
  concat S3, "readline S31, 0\n"
  concat S3, "ord I2, S31\n"
  concat S3, "set P0[I1], I2\n"
  branch NEXT

NEXT:
  inc I0

  le I0, I30, INTERP
  concat S3, "end\n"

#  print S3
#  print "\n"

  # Now actually run it
  compreg P1, "PASM"
  compile P0, P1, S3
  invoke
  end
