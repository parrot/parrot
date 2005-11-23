=head1 NAME

PAST::Node - a base class for PAST abstract syntax tree nodes

=head1 DESCRIPTION

All PAST nodes subclass from this base type.

=cut

.namespace [ "PAST::Node" ]

.sub "__onload" @LOAD
    .local pmc base
    newclass base, "PAST::Node"
    addattribute base, "type"             # what kind of node is it
    addattribute base, "source"           # the original source code
    addattribute base, "line"             # line position in source
    addattribute base, "children"         # child nodes
    .return ()
.end


.sub __init method
    .param PerlArray args
    $P0 = new PerlUndef
    $P1 = new PerlUndef
    $P2 = new Integer
    $P3 = new PerlArray

    setattribute self, "type", $P0
    setattribute self, "source", $P1
    setattribute self, "line", $P2
    setattribute self, "children", $P3
.end

.sub "set_node" method
    .param string type
    .param string source
    .param int line
    .param pmc children
    $P0 = getattribute self, "type"
    $P0 = type
    $P1 = getattribute self, "source"
    $P1 = source
    $P2 = getattribute self, "line"
    $P2 = line
    setattribute self, "children", children
    .return ()
.end
