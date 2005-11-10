# $Id$
# An Optimizing Brainfuck compiler
# By Leo based on bfc.imc by Leon
##########################
# emit register-only code
# XXX does no register range checking
# it runs the bench.bf 15 times faster then bfc.imc
##########################

.sub _main
  .param pmc argv
  .local int pc
  .local int maxpc
  .local int label
  .local string labelstr
  .local string code
  .local string filename
  .local string file
  .local string line
  .local string program
  .local string char

  program = argv[0]
  # check argc
  $I0 = argv
  if $I0 < 2 goto usage
  # Get the filename
  filename = argv[1]
  if filename goto SOURCE
usage:
  print "usage: ../../parrot "
  print program
  print " file.bf\n"
  end

  # Read the file into S1
SOURCE:
  open $P1, filename, "<"
  defined $I0, $P1
  if $I0, SOURCE_LOOP
  print filename
  print " not found\n"
  branch usage
SOURCE_LOOP:
  read line, $P1, 1024
  file = file . line
  if line goto SOURCE_LOOP
  close $P1

  length maxpc, file

  # Initialise
  code =      ""
  # concat code, "trace 1\n"
  concat code,  "new P0, .ResizableIntegerArray # memory\n"
  # this array doesn't support negative indices properly
  # start with some offset
  concat code,  "getstdout P30\n"
  concat code,  "pop S0, P30\n        # unbuffer\n"
  concat code,  "getstdin P30\n"

  pc    = 0    # pc
  label = 0    # label count
  .local int depth, n_lt, n_gt, reg
  concat code,  "    cleari\n"

  # The main compiler loop
INTERP:
  substr_r char, file, pc, 1
  concat code,  "\nSTEP"
  labelstr = pc
  concat code,  labelstr
  concat code,  ": # "
  concat code,  char
  concat code,  "\n"

  if char != "+" goto NOTPLUS
  .local int n_plus
  null n_plus
  $I0 = pc + 1
plus_loop:
  inc n_plus
  if $I0 == maxpc goto emit_plus
  substr_r char, file, $I0, 1
  if char != "+" goto emit_plus
  inc $I0
  goto plus_loop
emit_plus:
  pc = $I0 - 1
  concat code,  "    add I"
  set $S1, reg
  concat code, $S1
  concat code, ", "
  $S0 = n_plus
  concat code,  $S0
  concat code,  "\n"
  concat code,  "    band I"
  concat code, $S1
  concat code,  ", 0xff\n"
  goto NEXT

NOTPLUS:
  if char != "-" goto NOTMINUS
  .local int n_minus
  null n_minus
  $I0 = pc + 1
minus_loop:
  inc n_minus
  if $I0 == maxpc goto emit_minus
  substr_r char, file, $I0, 1
  if char != "-" goto emit_minus
  inc $I0
  goto minus_loop
emit_minus:
  pc = $I0 - 1
  concat code,  "    sub I"
  set $S1, reg
  concat code, $S1
  concat code, ", "
  $S0 = n_minus
  concat code,  $S0
  concat code,  "\n"
  concat code,  "    band I"
  concat code, $S1
  concat code,  ", 0xff\n"
  goto NEXT

NOTMINUS:
  if char != ">" goto NOTGT

  null n_gt
  $I0 = pc + 1
gt_loop:
  inc n_gt
  if $I0 == maxpc goto emit_gt
  substr_r char, file, $I0, 1
  if char != ">" goto emit_gt
  inc $I0
  goto gt_loop
emit_gt:
  reg += n_gt
  bsr debug
  pc = $I0 - 1
  goto NEXT

NOTGT:
  if char != "<" goto NOTLT
  null n_lt
  $I0 = pc + 1
lt_loop:
  inc n_lt
  if $I0 == maxpc goto emit_lt
  substr_r char, file, $I0, 1
  if char != "<" goto emit_lt
  inc $I0
  goto lt_loop
emit_lt:
  reg -= n_lt
  bsr debug
  pc = $I0 - 1
  goto NEXT

NOTLT:
  if char != "[" goto NOTOPEN

  label = pc
  depth = 0
OPEN_LOOP:
  inc label
  substr $S2, file, label, 1
  if $S2 != "[" goto OPEN_NOTOPEN
  inc depth
  goto OPEN_LOOP
OPEN_NOTOPEN:
  if $S2 != "]" goto OPEN_LOOP
  if depth == 0 goto OPEN_NEXT
  dec depth
  goto OPEN_LOOP
OPEN_NEXT:
  inc label
  labelstr = label
  concat code,  "    unless I"
  set $S0, reg
  concat code,  $S0
  concat code,  ", STEP"
  concat code,  labelstr
  concat code,  "\n"

  goto NEXT

NOTOPEN:
  if char != "]" goto NOTCLOSE

  label = pc
  depth = 0 # "height"

CLOSE_LOOP:
  dec label
  substr $S2, file, label, 1
  if $S2 != "]" goto CLOSE_NOTCLOSE
  inc depth
  goto CLOSE_LOOP
CLOSE_NOTCLOSE:
  if $S2 != "[" goto CLOSE_LOOP
  if depth == 0 goto CLOSE_NEXT
  dec depth
  goto CLOSE_LOOP

CLOSE_NEXT:
  labelstr = label
  concat code,  "    branch STEP"
  concat code,  labelstr
  concat code,  "\n"

  goto NEXT

NOTCLOSE:
  if char != "." goto NOTDOT
  concat code,  "    chr S31, I"
  $S0 = reg
  concat code, $S0
  concat code, "\n"
  concat code,  "    print S31\n"
  goto NEXT

NOTDOT:
  if char != "," goto NEXT
  labelstr = pc
  concat code,  "    read S31, P30, 1\n"
  concat code,  "    if S31, no_eof"
  concat code,  labelstr
  concat code,  "\n"
  concat code,  "    null I31\n"
  concat code,  "    branch eof"
  concat code,  labelstr
  concat code,  "\n"
  concat code,  "no_eof"
  concat code,  labelstr
  concat code,  ":\n"
  concat code,  "    ord I31, S31\n"
  concat code,  "eof"
  concat code,  labelstr
  concat code,  ":\n"
  $S0 = reg
  concat code,  "    set I"
  concat code,  $S0
  concat code,  ", I31\n"
  goto NEXT

NEXT:
  inc pc

  if pc < maxpc goto INTERP
  labelstr = pc
  concat code,  "STEP"
  concat code,  labelstr
  concat code,  ":\n"
  concat code,  "end\n"

  # printerr code
  # printerr "\n"

  # Now actually run it
  compreg P1, "PASM"
  P0 = P1( code )
  P0()
  end
debug:
  ret
  concat code, "# depth "
  $S0 = depth
  concat code, $S0
  concat code, " reg "
  $S0 = reg
  concat code, $S0
  concat code, "\n"
  ret
.end
