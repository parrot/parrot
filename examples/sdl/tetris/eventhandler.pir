
=head1 TITLE

eventhandler.pir - a tetris event handler class

=cut

.namespace ["Tetris::EventHandler"]

.sub __onload :tag('load')
    $P0 = get_class "Tetris::EventHandler"
    unless null $P0 goto END
    load_bytecode "library/SDL/EventHandler.pir"

    get_class $P0, ['SDL'; 'EventHandler']
    subclass $P0, $P0, "Tetris::EventHandler"
    $P1 = new 'String'
    $P1 = "BUILD"
    setprop $P0, "BUILD", $P1
    addattribute $P0, "app"
END:
.end

.sub BUILD :method
    .param pmc app

    setattribute self, 'app', app
.end

.sub app :method
    .local pmc app

    getattribute app, self, 'app'
    .return (app)
.end

.sub dispatch_event :method
    .local pmc app
    .local int ret

    app = self."app"()
    app."setTimer"( 0 )
    $P0 = get_hll_global ['SDL'; 'Event'], "disptach_event"
    ret = $P0()
    app."setTimer"( 1 )
    .return (ret)
.end

.sub nextBlock :method
    .param int boardID
    .param int blockID
    .local pmc app
    .local pmc board
    .local pmc block

    print "next block on board "
    print boardID
    print " is "
    print blockID
    print "\n"

    app = self."app"()
    board = app."board"( boardID )

    # get the current next block
    block = board."getNextBlock"()

    # set the wanted block as new next block
    board."nextBlock"( blockID )
    # make it active by activating a new block
    board."nextBlock"()

    # restore the old "nextBlock"
    board."setNextBlock"( block )
.end

.sub key_down_escape :method
    end
.end

.sub key_down_0 :method
    self."nextBlock"( 0, -1 )
.end

.sub key_down_1 :method
    self."nextBlock"( 0, 0 )
.end

.sub key_down_2 :method
    self."nextBlock"( 0, 1 )
.end

.sub key_down_3 :method
    self."nextBlock"( 0, 2 )
.end

.sub key_down_4 :method
    self."nextBlock"( 0, 3 )
.end

.sub key_down_5 :method
    self."nextBlock"( 0, 4 )
.end

.sub key_down_6 :method
    self."nextBlock"( 0, 5 )
.end

.sub key_down_7 :method
    self."nextBlock"( 0, 6 )
.end

.sub key_down_space :method
    $P0 = self."app"()
    $P0."fall"( 0 )
.end

.sub key_down_left :method
    $P0 = self."app"()
    $P0."move"( 0, -1, 0 )
.end

.sub key_down_right :method
    $P0 = self."app"()
    $P0."move"( 0, +1, 0 )
.end

.sub key_down_up :method
    $P0 = self."app"()
    $P0."rotate"( 0, -1 )
.end

.sub key_down_down :method
    $P0 = self."app"()
    $P0."rotate"( 0, +1 )
.end

.sub key_down_F1 :method
    $P0 = self."app"()
    $P0."newGame"( 1 )
.end

.sub key_down_F2 :method
    $P0 = self."app"()
    $P0."newGame"( 2 )
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
