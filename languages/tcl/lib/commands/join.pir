###
# [join]

.namespace [ "Tcl" ]

.sub "join"
  .param pmc a_list
  .param pmc joiner_pmc

  if argcP == 0 goto bad_args
  if argcP > 2 goto bad_args

  if argcP ==2 goto continue
  joiner_pmc = new String
  joiner_pmc = " "
continue:

  .local pmc retval
  .local int return_type

  .local pmc a_list

  .local pmc __list
  __list = find_global "_Tcl", "__list"
  
  (return_type, retval) = __list(a_list)
  if return_type == TCL_ERROR goto done
  a_list = retval

got_list:
  .local string joiner_str
  joiner_str = joiner_pmc
  .local string rv
  rv = join joiner_str, a_list
  retval = new String
  retval = rv
done:
  .return(return_type,retval)

bad_args:
  $P1 = new String
  $P1 = "wrong # args: should be \"join list ?joinString?\""
  .return(TCL_ERROR, $P1)

.end
