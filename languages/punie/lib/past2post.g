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

    # In the context of an Op node, collapse a child comma op, so the
    # child's children become the children of the current node.
    $I0 = elements newchildren
    if $I0 > 1 goto no_munge
      $P5 = newchildren[0]
      $S3 = typeof $P5
    unless $S3 == 'POST::Op' goto no_munge
      $S4 = $P5.op()
    unless $S4 == 'O_COMMA' goto no_munge
      newchildren = $P5.children()

  no_munge:
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
    $P3 = node.valtype()
    $P2 = new 'POST::Val'
    $P2.set_node($S1,$I1,$P1)
    $P2.valtype($P3)
    .return ($P2)
}
