# a gdb command file
# copy this file into your home directory or
# $  gdb -x tools/dev/.gdbinit

# parrot print
define pp
  printf "%s=%s",$arg0,GDB_P(interpreter, $arg0)
  echo \n
end
set $S0="S0"
set $S1="S1"
set $S2="S2"
set $S3="S3"
set $S4="S4"
set $S5="S5"
set $S6="S6"
set $S7="S7"
set $S8="S8"
set $S9="S9"

set $I0="I0"
set $I1="I1"
set $I2="I2"
set $I3="I3"
set $I4="I4"
set $I5="I5"
set $I6="I6"
set $I7="I7"
set $I8="I8"
set $I9="I9"

set $N0="N0"
set $N1="N1"
set $N2="N2"
set $N3="N3"
set $N4="N4"
set $N5="N5"
set $N6="N6"
set $N7="N7"
set $N8="N8"
set $N9="N9"

document pp
Parrot Print register
pp $S0   print parrot register S0 ($S0 ... $S9)
pp $N1   print parrot register N1 ($N0 ... $N9)
pp "I22" print parrot register I22 (general syntax)
.
(a variable 'interpreter' must be in context)
end

# parrot break
define pb
  echo PB #
  output GDB_B(interpreter, $arg0)
  echo \n
end

document pb
Parrot Break
pb n  ... set breakpoint at opcode offset n
.
(a variable 'interpreter' must be in context)
end
