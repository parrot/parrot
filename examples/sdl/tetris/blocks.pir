
=head1 TITLE

blocks.pir - tetris block classes

=cut

.namespace ["Tetris::Blocks"]

.sub __onload :tag('load')
    $P0 = get_class "Tetris::Block::1"
    unless null $P0 goto END

    load_bytecode "examples/sdl/tetris/block.pir"

    get_class $P1, "Tetris::Block"

    $P2 = new 'String'
    $P2 = "__init"

    subclass $P0, $P1, "Tetris::Block::0"
    setprop $P0, "BUILD", $P2

    subclass $P0, $P1, "Tetris::Block::1"
    setprop $P0, "BUILD", $P2

    subclass $P0, $P1, "Tetris::Block::2"
    setprop $P0, "BUILD", $P2

    subclass $P0, $P1, "Tetris::Block::3"
    setprop $P0, "BUILD", $P2

    subclass $P0, $P1, "Tetris::Block::4"
    setprop $P0, "BUILD", $P2

    subclass $P0, $P1, "Tetris::Block::5"
    setprop $P0, "BUILD", $P2

    subclass $P0, $P1, "Tetris::Block::6"
    setprop $P0, "BUILD", $P2

    .local pmc blocks
    .local pmc block

    blocks = new 'ResizablePMCArray'

    $P0 = get_class "Tetris::Block::0"
    push blocks, $P0
    $P0 = get_class "Tetris::Block::1"
    push blocks, $P0
    $P0 = get_class "Tetris::Block::2"
    push blocks, $P0
    $P0 = get_class "Tetris::Block::3"
    push blocks, $P0
    $P0 = get_class "Tetris::Block::4"
    push blocks, $P0
    $P0 = get_class "Tetris::Block::5"
    push blocks, $P0
    $P0 = get_class "Tetris::Block::6"
    push blocks, $P0

    set_hll_global [ "Tetris::Block" ], "blocks", blocks
END:
.end

.namespace ["Tetris::Block::0"]

# ##
# ##
.sub __init :method
    .local pmc block

    block = new 'ResizablePMCArray'
    push block, 1
    push block, 1
    push block, 1
    push block, 1
    assign self, block
.end

.sub id :method
    .return (0)
.end

.namespace ["Tetris::Block::1"]

# ###
# #..
# ...
.sub __init :method
    .local pmc block

    block = new 'ResizablePMCArray'
    push block, 1
    push block, 1
    push block, 1
    push block, 1
    push block, 0
    push block, 0
    push block, 0
    push block, 0
    push block, 0
    assign self, block
.end

.sub id :method
    .return (1)
.end

.namespace ["Tetris::Block::2"]

# ###
# ..#
# ...
.sub __init :method
    .local pmc block

    block = new 'ResizablePMCArray'
    push block, 1
    push block, 1
    push block, 1
    push block, 0
    push block, 0
    push block, 1
    push block, 0
    push block, 0
    push block, 0
    assign self, block
.end

.sub id :method
    .return (2)
.end

.namespace ["Tetris::Block::3"]

# ##.
# .##
# ...
.sub __init :method
    .local pmc block

    block = new 'ResizablePMCArray'
    push block, 1
    push block, 1
    push block, 0
    push block, 0
    push block, 1
    push block, 1
    push block, 0
    push block, 0
    push block, 0
    assign self, block
.end

.sub id :method
    .return (3)
.end

.namespace ["Tetris::Block::4"]

# .##
# ##.
# ...
.sub __init :method
    .local pmc block

    block = new 'ResizablePMCArray'
    push block, 0
    push block, 1
    push block, 1
    push block, 1
    push block, 1
    push block, 0
    push block, 0
    push block, 0
    push block, 0
    assign self, block
.end

.sub id :method
    .return (4)
.end

.namespace ["Tetris::Block::5"]

# ###
# .#.
# ...
.sub __init :method
    .local pmc block

    block = new 'ResizablePMCArray'
    push block, 1
    push block, 1
    push block, 1
    push block, 0
    push block, 1
    push block, 0
    push block, 0
    push block, 0
    push block, 0
    assign self, block
.end

.sub id :method
    .return (5)
.end

.namespace ["Tetris::Block::6"]

# ####
# ....
# ....
# ....
.sub __init :method
    .local pmc block

    block = new 'ResizablePMCArray'
    push block, 1
    push block, 1
    push block, 1
    push block, 1
    push block, 0
    push block, 0
    push block, 0
    push block, 0
    push block, 0
    push block, 0
    push block, 0
    push block, 0
    push block, 0
    push block, 0
    push block, 0
    push block, 0
    assign self, block
.end

.sub id :method
    .return (6)
.end

=head1 AUTHOR

Jens Rieks E<lt>parrot at jensbeimsurfen dot deE<gt> is the author
and maintainer.
Please send patches and suggestions to the Perl 6 Internals mailing list.

=head1 COPYRIGHT

Copyright (C) 2004-2008, Parrot Foundation.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
