    Leaf:   min(.) = { 
        $P1 = getattribute node, "value"
        .return ($P1)
    }

    Branch: min(.) = {
        .local pmc left
        .local pmc right
        .local pmc min
        .local pmc left_val
        .local pmc right_val

        left = getattribute node, "left"
        left_val = tree.get('min', left)
        right = getattribute node, "right"
        right_val = tree.get('min', right)

        min = left_val
        if min <= right_val goto got_min
        min = right_val
      got_min:
       .return (min)
    }

    # find the global minimum and propagate it back down the tree
    ROOT:   gmin(.) = { 
        .local pmc gmin
        gmin = new PerlInt
        gmin = tree.get('min', node)
        .return (gmin)
    }

    Branch: gmin(.left)  = { 
        .local pmc gmin
        gmin = tree.get('gmin', node)
        .return (gmin)
    }

    Branch: gmin(.right) = {
        .local pmc gmin
        gmin = tree.get('gmin', node)
        .return (gmin)
    }

    # reconstruct the tree with every leaf replaced with the minimum
    # value
    Leaf:   result(.) = {
        .local pmc newnode

        newnode = new 'Leaf'
        $P1 = tree.get('gmin', node)
        setattribute newnode, 'value', $P1
        .return(newnode)
    }

    Branch: result(.) = {
        .local pmc newnode
        .local pmc left_child
        .local pmc right_child
        newnode = new 'Branch'
        left_child = getattribute node, 'left'
        right_child = getattribute node, 'right'
        $P1 = tree.get('result', left_child)
        $P2 = tree.get('result', right_child)

        setattribute newnode, 'left', $P1
        setattribute newnode, 'right', $P2
        .return(newnode)
    }
