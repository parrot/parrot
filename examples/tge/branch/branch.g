    grammar TreeMin is TGE;Grammar;

    transform min (Leaf) :language('PIR') {
        $P1 = getattribute node, "value"
       .return ($P1)
    }

    transform min (Branch) :language('PIR') {
        .local pmc left
        .local pmc right
        .local pmc min
        .local pmc left_val
        .local pmc right_val

        left = getattribute node, "left"
        left_val = tree.'get'('min', left)
        right = getattribute node, "right"
        right_val = tree.'get'('min', right)

        min = left_val
        if min <= right_val goto got_min
        min = right_val
      got_min:
       .return (min)
    }

    # find the global minimum and propagate it back down the tree
    transform gmin (ROOT) :language('PIR') {
        .local pmc gmin
        gmin = new 'Integer'
        gmin = tree.'get'('min', node)
        .return (gmin)
    }

    transform gmin (Branch) :applyto('left') :language('PIR') {
        .local pmc gmin
        gmin = tree.'get'('gmin', node)
        .return (gmin)
    }

    transform gmin (Branch) :applyto('right') :language('PIR') {
        .local pmc gmin
        gmin = tree.'get'('gmin', node)
        .return (gmin)
    }

    # reconstruct the tree with every leaf replaced with the minimum
    # value
    transform result (Leaf) :language('PIR') {
        .local pmc newnode

        newnode = new 'Leaf'
        $P1 = tree.'get'('gmin', node)
        setattribute newnode, 'value', $P1
        .return(newnode)
    }

    transform result (Branch) :language('PIR') {
        .local pmc newnode
        .local pmc left_child
        .local pmc right_child
        newnode = new 'Branch'
        left_child = getattribute node, 'left'
        right_child = getattribute node, 'right'
        $P1 = tree.'get'('result', left_child)
        $P2 = tree.'get'('result', right_child)

        setattribute newnode, 'left', $P1
        setattribute newnode, 'right', $P2
        .return(newnode)
    }