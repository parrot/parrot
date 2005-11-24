ROOT: result(.) = {
    # get the source string and position offset from start of source
    # code for this match node
    $S2 = node 
    $I1 = node.from()

    # Ask the child node for its result
    .local pmc child
    $I0 = defined node["PunieGrammar::expr"]
    unless $I0 goto err_no_tree
    $P0 = node["PunieGrammar::expr"]
    child = tree.get('result', $P0, 'PunieGrammar::expr')

    # Build up the result for the ROOT node
    $P1 = new PerlArray
    push $P1, child
    $P2 = new 'PAST::Stmt'
    $P2.set_node($S2,$I1,$P1)

    $P3 = new PerlArray
    push $P3, $P2
    .local pmc result
    result = new 'PAST::Stmts'
    result.set_node($S2,$I1,$P3)
    .return (result)

  err_no_tree:
    print "The top-level node doesn't contain an 'expr' match.\n"
    end

#    $P0 = new Iterator, node    # setup iterator for node
#    set $P0, 0 # reset iterator, begin at start
#  iter_loop:
#    unless $P0, iter_end         # while (entries) ...
#      shift $S2, $P0              # get key for next entry
#      typeof I0, P0[$S2]         # get type of entry at key S2
#      set $P2, $P0[$S2]            # extract integer
#      $P3 = tree.get('result', $P1, $S2)
#      goto iter_loop
#  iter_end:
#    .return ()
}

PunieGrammar::expr: result(.) = {
    .local pmc result
    .local pmc children
    children = new PerlArray
    result = new 'PAST::Exp'
    $P1 = node.get_hash()
    $P0 = new Iterator, $P1    # setup iterator for node
    set $P0, 0 # reset iterator, begin at start
  iter_loop:
    unless $P0, iter_end         # while (entries) ...
      shift $S2, $P0             # get key for next entry
      $P2 = $P0[$S2]      # get entry at current key
      $P3 = tree.get('result', $P2, $S2)
      push children, $P3
      goto iter_loop
  iter_end:

    # get the source string and position offset from start of source
    # code for this match node
    $S2 = node 
    $I3 = node.from()
    result.set_node($S2,$I3,children)
    .return (result)
}

PunieGrammar::gprint: result(.) = {
    .local pmc result
    .local pmc children
    children = new PerlArray
    result = new 'PAST::Op'
    $P1 = node.get_hash()
    $P0 = new Iterator, $P1    # setup iterator for node
    set $P0, 0 # reset iterator, begin at start
  iter_loop:
    unless $P0, iter_end         # while (entries) ...
      shift $S2, $P0             # get key for next entry
      $P2 = $P0[$S2]      # get entry at current key
      $P3 = tree.get('result', $P2, $S2)
      push children, $P3
      goto iter_loop
  iter_end:

    # get the source string and position offset from start of source
    # code for this match node
    $S2 = node 
    $S3 = node[0]
    $I3 = node.from()
    result.set_node($S2,$I3,$S3,children)
    .return (result)
}

PunieGrammar::term: result(.) = {
    .local pmc result
    result = new 'PAST::Val'

    # get the source string and position offset from start of source
    # code for this match node
    $S2 = node 
    $I3 = node.from()
    result.set_node($S2,$I3,$S2)
    .return (result)
}
