.namespace [ "Tcl" ]

.sub "&switch"
  .local pmc argv
  .local int argc
  argv = foldup
  argc = argv
  
  .local pmc retval
  .local string mode
  mode = "-exact"

  if argc < 2 goto bad_args
flag_loop:
  unless argv goto bad_args
  $S0 = shift argv
  $S1 = substr $S0, 0, 1
  if $S0 == "--" goto get_subj
  if $S1 != "-" goto skip_subj

  # ouch!
  if $S0 == "-exact" goto set_mode
  if $S0 == "-glob" goto set_mode
  if $S0 == "-regexp" goto set_mode
  if $S0 == "-matchvar" goto set_fvar
  if $S0 == "-indexvar" goto set_fvar
  branch bad_flag

set_mode:
  mode = $S0
  branch flag_loop

set_fvar:
  $S0 = shift argv
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
  if mode == "-exact" goto exact_mode
  if mode == "-glob" goto glob_mode
  if mode == "-regexp" goto regex_mode

exact_mode:
exact_loop:
  unless body goto body_end
  pattern = shift body
  code = shift body

  if subject == pattern goto body_match
  branch exact_loop

glob_mode:
  .local pmc globber, rule
  globber = find_global "PGE", "glob"
glob_loop:
  unless body goto body_end
  pattern = shift body
  code = shift body

  (rule, $P1, $P2) = globber(pattern)
  $P0 = rule(subject)
  if $P0 goto body_match
  branch glob_loop

regex_mode:
regex_loop:
  unless body goto body_end
  pattern = shift body
  code = shift body
# fix this when we've got regexes
  if subject == pattern goto body_match
  branch glob_loop

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

bad_flag:
  retval = new String
  retval = "bad option \""
  retval .= $S0
  retval .= "\": must be -exact, -glob, -regexp, -matchvar, -indexvar, or --"
  .return (TCL_ERROR, retval)
.end
