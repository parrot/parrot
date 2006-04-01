# This is just a stub to allow APL to execute code. It will be replaced.

ROOT: result(.) = {
    .local string output
    output = ".sub _main :main\n"
    $P1 = node.children()
    .local pmc iter
    iter = new Iterator, $P1    # setup iterator for node
    iter = 0
  iter_loop:
    unless iter, iter_end         # while (entries) ...
      shift $P2, iter
      $S3 = tree.get('result', $P2)
      output .= $S3
      goto iter_loop
  iter_end:
    output .= ".end\n"
    .return (output)
}

# Flatten out the ops into a simple sequence.
POST::Ops: result(.) = {
    .local string output
    $P1 = node.children()
    .local pmc iter
    iter = new Iterator, $P1    # setup iterator for node
    iter = 0
  iter_loop:
    unless iter, iter_end         # while (entries) ...
      shift $P2, iter
      $S3 = tree.get('result', $P2)
      output .= $S3
      goto iter_loop
  iter_end:
    .return (output)
}

POST::Op: result(.) = {
    .local string output
    .local int counter
    counter = 0
    .local string opname
    opname = node.op()
    if opname == 'if' goto conditional
    if opname == 'unless' goto conditional
      goto not_conditional
  conditional:
      output = tree.get('conditional', node)
      .return (output)
    not_conditional:

    output = "    " . opname
    output .= " "
    $P1 = node.children()
    .local pmc iter
    iter = new Iterator, $P1    # setup iterator for node
    iter = 0
  iter_loop:
    unless iter goto iter_end         # while (entries) ...
      shift $P2, iter
      inc counter
      $S3 = tree.get('result', $P2)
      if counter <= 1 goto no_comma_out
      output .= ", "
    no_comma_out:
      output .= $S3
      goto iter_loop
  iter_end:
    output .= "\n"
    .return (output)
}

POST::Op: conditional(.) = {
    .local string output
    .local string opname
    opname = node.op()
    .local string truelabel
    .local string falselabel
    truelabel = node.generate_label('true')
    falselabel = node.generate_label('false')
    output = "    " . opname
    output .= " "
    $P1 = node.children()

    # The conditional expression
    $P2 = $P1[0]
    $S3 = tree.get('result', $P2)
    output .= $S3
    output .= " goto "
    output .= truelabel
    output .= "\n"

    # Skipping over the statements in the conditional
    output .= "goto "
    output .= falselabel
    output .= "\n"
    
    # The statements in the conditional
    output .= truelabel
    output .= ":\n"
    $P2 = $P1[1]
    $S3 = tree.get('result', $P2)
    output .= $S3

    # After the statements in the conditional
    output .= "\n"
    output .= falselabel
    output .= ":\n"
    .return (output)
}

POST::Var: result(.) = {
    $S1 = node.varname()
    .return ($S1)
}

POST::Val: result(.) = {
    $S2 = node.valtype()
    if $S2 == 'str' goto wrap_string
    if $S2 == 'int' goto wrap_int
    if $S2 != 'num' goto return_default
  wrap_float:
    # Cheat and get the number formatted properly using sprintf.
    # XXX eventually this will come from a PMC.
    $N1 = node.value()
    if $N1 < 0 goto wrap_float_negative
    $P1 = new .ResizablePMCArray
    $P1[0] = $N1
    $S1 = sprintf "\"%s\"", $P1
    .return ($S1)
  wrap_float_negative:
    $N1 = abs $N1
    $P1 = new .ResizablePMCArray
    $P1[0] = $N1
    # XXX can't use a utf8 sprintf format string.
    $S1 = sprintf "%s\"", $P1
    $S1 = unicode:"unicode:\"\u207B" . $S1
    .return ($S1)
  wrap_string:
    # Escape strings properly
    $S1 = node.value()
    load_bytecode 'library/Data/Escape.pir' # XXX move into pre-amble code
    .local pmc escape
    escape = find_global 'Data::Escape', 'String'
    $S3 = escape($S1, '"')
    $S1 = '"' . $S3
    $S1 .= '"'
    .return ($S1)
  wrap_int:
    $I1 = node.value()
    if $I1 >= 0 goto return_default 
    $I1 = abs $I1
    $S3 = unicode:"unicode:\"\u207B"
    $S4 = $I1
    $S3 .= $S4
    $S3 .= '"'
    .return ($S3)
  return_default:
    $S1 = node.value()
    .return ($S1)
}
