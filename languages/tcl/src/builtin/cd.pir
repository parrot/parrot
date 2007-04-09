.HLL '_Tcl', ''
.namespace [ 'builtins' ]

.sub 'cd'
  .param string retval
  .param pmc    raw_args
  .param pmc    argv

  .local pmc pir
  pir = new 'PGE::CodeString'
  .local string dir
  .local int argc
  argc = elements argv

  if argc >= 2 goto bad_args
  if argc == 0 goto noargs
  
  dir = argv[0]
  goto cd_it

noargs:
  pir.emit(<<'END_PIR', retval)
  %0 = new .Env
  %0 = %0['HOME']
END_PIR
  dir = retval

cd_it:
  pir.emit(<<'END_PIR', retval, dir)
  $P0 = new .OS
  %0  = $P0.'chdir'(%1)
END_PIR

  .return(pir)

bad_args:
  $S0 = "tcl_error 'wrong # args: should be \"cd\ ?dirName?\"'\n"
  .return($S0)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
