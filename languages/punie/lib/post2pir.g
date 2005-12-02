# This is just a stub to allow Punie to execute code. It will be
# replaced.

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

POST::Op: result(.) = {
    .local string output
    $S1 = node.op()
    output = "    " . $S1
    output .= " "
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
    output .= "\n"
    .return (output)
}

POST::Val: result(.) = {
    $S1 = node.value()
    .return ($S1)
}
