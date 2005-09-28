###
# [join]

.namespace [ "Tcl" ]

.sub "&join"
  .param pmc argv :slurpy
  .local int argc
  argc = argv

  .local pmc a_list
  .local string joiner_str,rv
  a_list     = argv[0]
  joiner_str = argv[1]

  if argc == 0 goto bad_args
  if argc > 2 goto bad_args

  if argc ==2 goto continue
  joiner_str = " "

continue:
  .local pmc __list
  __list = find_global "_Tcl", "__list"
  a_list = __list(a_list)

got_list:
  rv = join joiner_str, a_list
  .return (rv)

bad_args:
  .throw ("wrong # args: should be \"join list ?joinString?\"")

.end
