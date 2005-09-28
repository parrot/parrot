###
# [while]

.namespace [ "Tcl" ]

.sub "&while"
  .param pmc argv :slurpy
  .local int argc
  argc = argv

  if argc != 2 goto bad_args

  .local string condition,body
  condition = argv[0]
  body      = argv[1]

  .local pmc retval, parsed_code

  .local pmc parse
  .local pmc expression_p, compiled_condition

  parse = find_global "_Tcl", "parse"
  expression_p = find_global "_Tcl", "__expression_parse"

  parsed_code = parse(body)
  compiled_condition = expression_p(condition)

while_loop:
  retval = compiled_condition()
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
