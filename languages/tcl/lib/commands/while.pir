###
# [while]

.namespace [ "Tcl" ]

.sub "&while"
  .param pmc argv :slurpy
  .local int argc
  argc = argv

  if argc != 2 goto bad_args

  .local pmc    cond_p
  cond_p = argv[0]
  .local string body_p
  body_p = argv[1]

  .local pmc retval, parsed_code

  .local pmc parse
  .local pmc expression_p
  .local pmc expression_i

  parse = find_global "_Tcl", "parse"
  expression_p = find_global "_Tcl", "__expression_parse"
  expression_i = find_global "_Tcl", "__expression_interpret"

  $S0 = body_p
  parsed_code = parse($S0)
  register parsed_code

while_loop:
  $S0 = cond_p
  retval = expression_p($S0)
  retval = expression_i(retval)
  unless retval goto done
  push_eh handle_continue
    retval = parsed_code."interpret"()
  clear_eh

  goto while_loop

handle_continue:
  .local int return_type
  .get_return_code(P5,return_type)
  if return_type == TCL_BREAK goto done
  if return_type == TCL_CONTINUE goto while_loop

done:
  .return("")

bad_args:
  .throw ("wrong # args: should be \"while test command\"")

.end
