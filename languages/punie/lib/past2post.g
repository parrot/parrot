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

PAST::Stmts: result(.) = {
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
    $P4 = new 'POST::Ops'
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
     .local string opname
     opname = node.op()
    $S1 = substr opname, 0, 5
    if $S1 == 'infix' goto infix
    goto not_infix
  infix:
      $P4 = tree.get('infix', node)
      .return ($P4)
  not_infix:
    if opname == 'print' goto print_op
    goto not_print_op
  print_op:
      $P4 = tree.get('print_op', node)
      .return ($P4)
  not_print_op:
    # Iterate through the children of the node, and generate the result
    # for each child.
    .local pmc newchildren
    newchildren = new PerlArray
    .local pmc newops
    newops = new PerlArray
    $P1 = node.children()
    .local pmc iter
    iter = new Iterator, $P1    # setup iterator for node
    iter = 0
  iter_loop:
    unless iter, iter_end         # while (entries) ...
      shift $P2, iter
      $P3 = tree.get('result', $P2)
      $S1 = typeof $P3
      # Does the argument have setup code?
      unless $S1 == 'POST::Ops' goto simple_result
        $P1 = $P3.tmpvar()
      if null $P1 goto simple_result
        push newchildren, $P1
        push newops, $P3
        goto iter_loop
      simple_result:
        push newchildren, $P3
      goto iter_loop
  iter_end:

    # In the context of an Op node, collapse a child comma op, so the
    # child's children become the children of the current node.
#    $I0 = elements newchildren
#    if $I0 > 1 goto no_munge
#      $P5 = newchildren[0]
#      $S3 = typeof $P5
#    unless $S3 == 'POST::Op' goto no_munge
#      $S4 = $P5.op()
#    unless $S4 == 'O_COMMA' goto no_munge
#      newchildren = $P5.children()

  no_munge:
    # The results for the children become the children of the new node.
    $S1 = node.source()
    $I1 = node.pos()
    $S2 = node.op()
    $P4 = new 'POST::Op'
    $P4.set_node($S1,$I1,$S2,newchildren)

    # Check if we had setup code for one of the children. If so, bundle
    # it up in an Ops node.
    $I0 = elements newops
    if $I0 > 0 goto bundle_ops
      .return ($P4)
  bundle_ops:
    push newops, $P4

    # Create a node to contain the generated ops.
    $P5 = new 'POST::Ops'
    $P5.set_node($S1,$I1,newops)
    .return ($P5)
}

PAST::Op: infix(.) = {
    .local string opname
    .local pmc oplookup
    oplookup = find_global 'PunieOpLookup', 'lookup'
    $S1 = node.op()
    opname = oplookup($S1)
    .local string nodesource
    .local string nodepos
    nodesource = node.source()
    nodepos = node.pos()
    .local pmc newchildren
    newchildren = new PerlArray
    .local pmc newops
    newops = new PerlArray
    $P1 = node.children()
    .local pmc iter
    iter = new Iterator, $P1    # setup iterator for node
    iter = 0
  iter_loop:
    unless iter, iter_end         # while (entries) ...
      shift $P2, iter
      $P3 = tree.get('result', $P2)
      $S1 = typeof $P3
      if $S1 == 'POST::Ops' goto complex_result # the argument has setup
      if $S1 == 'POST::Val' goto create_tmp # the argument needs setup
        push newchildren, $P3
        goto iter_loop
      create_tmp:
        # Create a temp variable
        $P4 = new 'POST::Var'
        $P5 = $P4.new_dummy(nodesource,nodepos)
        push newops, $P5
        push newchildren, $P4
        # Assign the value node to the variable
        $P6 = new PerlArray
        push $P6, $P4 # the first argument is the variable
        push $P6, $P3 # the second argument is the value
        $P7 = new 'POST::Op'
        $P7.set_node(nodesource,nodepos,'set',$P6)
        push newops, $P7
        goto iter_loop
      complex_result:
        $P1 = $P3.tmpvar()
        push newchildren, $P1
        push newops, $P3
      goto iter_loop
  iter_end:



    # First we create a temporary variable
    .local pmc temp_var
    temp_var = new 'POST::Var'
    $P8 = temp_var.new_dummy(nodesource,nodepos)
    push newops, $P8

    # Add the temporary variable as the destination register of the op
    unshift newchildren, temp_var
    # Create the op for the current node
    $P9 = new 'POST::Op'
    $P9.set_node(nodesource,nodepos,opname,newchildren)
    push newops, $P9

    # Create the node to contain all the generated ops.
    $P10 = new 'POST::Ops'
    $P10.set_node(nodesource,nodepos,newops)
    $P10.tmpvar(temp_var)

    .return ($P10)
}

PAST::Op: print_op(.) = {
     .local string opname
     opname = node.op()
    .local string nodesource
    .local string nodepos
    nodesource = node.source()
    nodepos = node.pos()

    # This fairly lengthy bit collapses comma ops, by traversing down
    # the tree and yanking up the children of the comma op to the
    # current level.
    $P1 = node.children()
    $I0 = elements $P1
    if $I0 > 1 goto no_munge
      $P2 = $P1[0]
      $S3 = typeof $P2
    unless $S3 == 'PAST::Exp' goto no_munge
      $P3 = $P2.children()
      $P4 = $P3[0]
      $S3 = typeof $P4
    unless $S3 == 'PAST::Op' goto no_munge
      $S4 = $P4.op()
    unless $S4 == 'O_COMMA' goto no_munge
      $P1 = $P4.children()
  no_munge:
     # Done collapsing comma ops

    # Iterate through the children of the node, and generate the result
    # for each child.
    .local pmc newchildren
    newchildren = new PerlArray
    .local pmc newops
    newops = new PerlArray
    .local pmc iter
    iter = new Iterator, $P1    # setup iterator for node
    iter = 0
  iter_loop:
    unless iter, iter_end         # while (entries) ...
      shift $P2, iter
      $P3 = tree.get('result', $P2)
      $S1 = typeof $P3
      $P4 = new PerlArray
      $P5 = new 'POST::Op'
      $S1 = typeof $P3
      if $S1 == 'POST::Ops' goto complex_result # the argument has setup
	# The default case, create a new 'print' op node with the child
	# as an argument and push it on the list of new ops.
        push $P4, $P3
        $P5.set_node(nodesource,nodepos,opname,$P4)
        push newops, $P5
        goto iter_loop
      complex_result:
	# The complex case, retrieve the temp variable from the Ops
	# node, and push the Ops node on the list of new ops. Then
	# create a new 'print' op node with the temp variable as an
	# argument and push it on the list of new ops.
        $P1 = $P3.tmpvar()
        push newops, $P3
        push $P4, $P1
        $P5.set_node(nodesource,nodepos,opname,$P4)
        push newops, $P5
      goto iter_loop
  iter_end:

    # Create a node to contain the generated ops.
    $P5 = new 'POST::Ops'
    $P5.set_node(nodesource,nodepos,newops)
    .return ($P5)
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
