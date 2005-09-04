.namespace [ "Tcl" ]

.sub "&switch"
  .local pmc argv
  .local int argc
  argv = foldup
  argc = argv
  
  .local pmc retval

  if argc < 2 goto bad_args
flag_loop:
  unless argv goto bad_args
  $S0 = shift argv
  $S1 = substr $S0, 0, 1
  if $S0 == "--" goto get_subj
  if $S1 != "-" goto skip_subj

  branch flag_loop

get_subj:
  unless argv goto bad_args
  $S0 = shift argv
skip_subj:
  .local string subject
  subject = $S0

  .local pmc body
  argc = argv
  if argc != 1 goto body_from_argv

body_from_list:
  .local pmc __list
  __list = find_global "_Tcl", "__list"
  
  $P0 = shift argv
  ($I0, retval) = __list($P0)
  if $I0 == TCL_ERROR goto bad_list
  body = retval

  branch got_body

body_from_argv:
  body = argv

got_body:
  .local string pattern, code

body_loop:
  unless body goto body_end
  pattern = shift body
  code = shift body

  if subject == pattern goto body_match
  branch body_loop

body_end:
  if pattern == "default" goto body_match

  retval = new String
  retval = ""
  .return (TCL_OK, retval)

body_match:
  .local pmc parse
  parse = find_global "_Tcl", "parse"
  $P0 = parse(code)

  # I don't know why we do this
  register $P0

  .return $P0."interpret"()

bad_args:
  retval = new String
  retval = "wrong # args: should be \"switch ?switches? string pattern body ... ?default body?\""
  .return (TCL_ERROR, retval)

bad_list:
  .return (TCL_ERROR, retval)
.end
