ROOT: result(.) = {
    .local pmc newchildren
    newchildren = new PerlArray
    $P1 = node.children()
    .local pmc iter
    iter = new Iterator, $P1    # setup iterator for node
    iter = 0
  iter_loop:
    unless iter, iter_end         # while (entries) ...
      shift $P2, iter
      $P3 = tree.get('result', $P2)
      push newchildren, $P3
      goto iter_loop
  iter_end:
    $S1 = node.source()
    $I1 = node.pos()
    $P4 = new 'POST::Sub'
    $P4.set_node($S1,$I1,newchildren)
    .return ($P4)
}

PAST::Stmt: result(.) = {
    $P1 = node.children()
    $P2 = $P1[0]
    $P3 = tree.get('result', $P2)
    .return ($P3)
}

PAST::Exp: result(.) = {
    $P1 = node.children()
    $P2 = $P1[0]
    $P3 = tree.get('result', $P2)
    .return ($P3)
}

PAST::Op: result(.) = {
    # Iterate through the children of the node, and generate the result
    # for each child.
    .local pmc newchildren
    newchildren = new PerlArray
    $P1 = node.children()
    .local pmc iter
    iter = new Iterator, $P1    # setup iterator for node
    iter = 0
  iter_loop:
    unless iter, iter_end         # while (entries) ...
      shift $P2, iter
      $P3 = tree.get('result', $P2)
      push newchildren, $P3
      goto iter_loop
  iter_end:
    # The results for the children become the children of the new node.
    $S1 = node.source()
    $I1 = node.pos()
    $S2 = node.op()
    $P4 = new 'POST::Op'
    $P4.set_node($S1,$I1,$S2,newchildren)
    .return ($P4)
}

PAST::Val: result(.) = {
    $S1 = node.source()
    $I1 = node.pos()
    $P1 = node.value()
    $P2 = new 'POST::Val'
    $P2.set_node($S1,$I1,$P1)
    .return ($P2)
}
