# a gdb command file
# copy this file into your home directory or
# $  gdb -x tools/dev/.gdbinit

define pi
  echo I
  output $arg0
  echo =
  output GDB_I(interpreter, $arg0)
  echo \n
end

document pi
pi n  ... print contents of interpreter register In
         (a variable 'interpreter' must be in context)
end

define ps
  echo S
  output $arg0
  echo =
  output GDB_S(interpreter, $arg0)
  echo \n
end

document ps
ps n  ... print contents of interpreter register Sn
         (a variable 'interpreter' must be in context)
end
