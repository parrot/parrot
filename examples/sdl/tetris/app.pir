
=head1 TITLE

app.pir - a tetris application object

B<Note:> The Tetris::App class is implemented as a singleton.

=head1 SYNOPSIS

    app = new "Tetris::App"

    app."run"()
    app."shutdown"()
    end

    ...

    # create a new random C<next block> on board 3
    app = get_hll_global [ "Tetris::App" ], "app"
    app."nextBlock"( 3 )

=head1 CLASS INFORMATION

This is the main tetris class. Neither has
it parent classes nor is it subclassed.

=cut


.include "timer.pasm"
.namespace ["Tetris::App"]

.sub __onload :tag('load')
    $P0 = get_class "Tetris::App"
    unless null $P0 goto END

    load_bytecode "library/SDL/App.pir"
    load_bytecode "library/SDL/Color.pir"
    load_bytecode "library/SDL/Event.pir"
    load_bytecode "library/SDL/Rect.pir"

    load_bytecode "examples/sdl/tetris/eventhandler.pir"
    load_bytecode "examples/sdl/tetris/board.pir"

    newclass $P0, "Tetris::App"

    addattribute $P0, "SDL"
    addattribute $P0, "EventHandler"
    addattribute $P0, "DebugFlags"
    addattribute $P0, "Timer"
    addattribute $P0, "TimerDisableCount"
    addattribute $P0, "InTimer"
    addattribute $P0, "Players"
    addattribute $P0, "Palette"
    addattribute $P0, "Boards"

    # set the BUILD method name
    $P1 = new 'String'
    $P1 = 'BUILD'
    setprop $P0, 'BUILD', $P1
END:
.end

=head1 CONSTRUCTOR

=over 4

=item BUILD - called automatically by "new"

Initializes the application.

It performs the SDL initialization and
creates some internal data structures afterwards.

This method throws an exception if an error occurs.

=cut

.sub BUILD :method
    # create the app object
    set_hll_global [ "Tetris::App" ], "app", self

    $P0 = new 'Hash'
    setattribute self, 'DebugFlags', $P0

    # prepare SDL's constructor arguments
    $P0           = new 'Hash'
    $P0["height"] = 480
    $P0["width"]  = 640
    $P0["bpp"]    =  32
    $P0["flags"]  =   1

    # create the SDL object
    $P0 = new ['SDL'; 'App'], $P0

    # store the SDL object
    setattribute self, 'SDL', $P0

    # generate some data structures
    self."genPalette"()

    # create the app timer
    self."initTimer"()

    # init the SDL event handler
    $P0 = new "Tetris::EventHandler", self
    setattribute self, 'EventHandler', $P0

    # create the debug flags hash
    $P0 = new 'Hash'
    setattribute self, 'DebugFlags', $P0

    # start a new single player game
    self."newGame"( 1 )
.end

=back

=head1 METHODS

The Tetris::App class provides the following methods:

=over 4

=item sdl = app."SDL"()

=cut

.sub SDL :method
    getattribute $P0, self, 'SDL'

    .return ($P0)
.end

=item app."shutdown"()

Shuts SDL down and performs some internal cleanup.

B<Note:> The application object is invalid afterwards, you are not allowed to
call any other of its methods after this one.

This method returns nothing.

=cut

.sub shutdown :method
    .local pmc sdl

    # XXX free data structures
    # ...

    # shutdown the SDL system
    $P0 = self."SDL"()
    if_null $P0, END
    $P0."quit"()
END:
.end

=item success = app."run"()

The application's main loop.

Returns if the user requested a shutdown.
An exception is thrown if an error occurs.

=cut

.sub _app_timer
    get_hll_global $P0, [ "Tetris::App" ], "app"
    $P0."timer"()
.end

.sub run :method
    .local pmc eh
    .local pmc loop

    getattribute eh, self, 'EventHandler'

    loop = new ['SDL'; 'Event']

    self."enableTimer"()
    loop."process_events"( 0.1, eh, self )
    self."disableTimer"()
    print "done\n"
.end

=item app."initTimer"()

=cut

.sub initTimer :method
    $P0 = new "Array"
    $P1 = get_hll_global [ "Tetris::App" ], "_app_timer"
    $P0 = 8
    $P0[0] = .PARROT_TIMER_NSEC
    $P0[1] = 0.1
    $P0[2] = .PARROT_TIMER_HANDLER
    $P0[3] = $P1
    $P0[4] = .PARROT_TIMER_REPEAT
    $P0[5] = -1
    $P0[6] = .PARROT_TIMER_RUNNING
    $P0[7] = 1

    $P1 = new 'Timer', $P0
    setattribute self, 'Timer', $P1

    $P0 = new 'Integer'
    $P0 = 1
    setattribute self, 'TimerDisableCount', $P0

    $P0 = new 'Integer'
    $P0 = 0
    setattribute self, 'InTimer', $P0
.end

=item app."setTimerStatus"( status )

=cut

.sub setTimerStatus :method
    .param int status

    getattribute $P0, self, 'Timer'
    set $P0[.PARROT_TIMER_RUNNING], status
.end

=item app."enableTimer"()

=cut

.sub enableTimer :method
    getattribute $P0, self, 'TimerDisableCount'
    dec $P0
    if $P0 != 0 goto END
    self."setTimerStatus"( 1 )
END:
.end

=item app."disableTimer"()

=cut

.sub disableTimer :method
    getattribute $P0, self, 'TimerDisableCount'
    inc $P0
    self."setTimerStatus"( 0 )
.end

=item color = app."color"( number )

Returns the specified color entry from the palette.

=cut

.sub color :method
    .param int number
    .local pmc palette
    .local pmc color

    palette = self."palette"()
    color = palette[number]

    .return (color)
.end

=item palette = app."palette"()

Returns the color palette.

=cut

.sub palette :method
    .local pmc palette

    getattribute palette, self, 'Palette'
    if_null palette, CREATE
    branch RET
CREATE:
    (palette) = self."genPalette"()

    branch RET

NULL:
    print "warning: no color palette found!\n"

RET:
    .return (palette)
.end

=item palette = app."genPalette"() B<(internal)>

Creates the color palette.

This method returns the created palette.

=cut

.sub genPalette :method
    .local pmc palette
    .local pmc hash
    .local pmc color
    .local int i
    .local int r
    .local int g
    .local int b
    .local int l

    palette = new 'ResizablePMCArray'
    hash = new 'Hash'

    set i, 0
GENLOOP:
    band l, i, 8
    band r, i, 4
    band g, i, 2
    band b, i, 1
    shr r, 2
    shr g, 1
    mul r, 127
    mul g, 127
    mul b, 127
    unless l, NOT_BRIGHT
    add r, 64
    add g, 64
    add b, 64
NOT_BRIGHT:

    hash["r"] = r
    hash["g"] = g
    hash["b"] = b
    color = new ['SDL'; 'Color'], hash

    push palette, color
    inc i
    if i < 16 goto GENLOOP

    setattribute self, 'Palette', palette

    .return (palette)
.end

=item board = self."board"( boardID )

Lookup a board using its ID.

=over 4

=item parameter C<boardID>

The ID of the board to return.

=back

Returns the board object, or NULL if
no board with the specified ID exists.

=cut

.sub board :method
    .param int boardID
    .local pmc board

    getattribute board, self, 'Boards'

    $I0 = board
    if boardID < $I0 goto OK
ERR:
    null board
    print "board "
    print boardID
    print " not found!\n"
    branch END

OK:
    board = board[boardID]
    defined $I0, board
    unless $I0 goto ERR

END:
    .return (board)
.end

=item block = app."currentBlock"( boardID )

Returns the currently falling block of a board.

=over 4

=item parameter C<boardID>

The ID of the board whose C<current block> should be returned.

=back

Returns the block object, or NULL if the board was not found.

=cut

.sub currentBlock :method
    .param int boardID
    .local pmc temp

    temp = self."board"( boardID )
    if_null temp, BLOCKISNULL
    temp = temp."currentBlock"()

BLOCKISNULL:
    .return (temp)
.end

=item success = app."rotate"( boardID, dir )

Rotates the current block of a board.

=over 4

=item parameter C<boardID>

The ID of the board whose block should be rotated.

=item parameter C<dir>

+1 = rotate clockwise

-1 = rotate counterclockwise

=back

Returns 1 if the rotation was possible, 0 otherwise.

=cut

.sub rotate :method
    .param int boardID
    .param int dir
    .local pmc block
    .local int ret

    self."disableTimer"()

    ret = 0

    # lookup the block
    block = self."currentBlock"( boardID )
    if_null block, END

    # rotate the block
    ret = block."rotate"( dir )
    if ret == 0 goto END

    # redraw the screen
    self."drawScreen"( 0 )

END:
    self."enableTimer"()

    .return (ret)
.end

=item success = app."move"( boardID, xval, yval )

Moves the currently falling block of a board.
It does not lock the block onto the board in any case, use
C<_Board::lockBlock()> if you want this.

=over 4

=item parameter C<boardID>

The ID of the board whose block should be moved.

=item parameter C<xval>

Number of units the block should be moved horizontally.

Positiv numbers will move the block rightwards, negative
numbers leftwards.

=item parameter C<xval>

Number of units the block should be moved vertically.

Positiv numbers will move the block downwards, negative
numbers upwards (untested; not recommended).

=back

Returns 1 if the movement was possible, 0 otherwise.

=cut

.sub move :method
    .param int boardID
    .param int xval
    .param int yval
    .local int success
    .local pmc block

    # disable the timer
    self."disableTimer"()

    block = self."currentBlock"( boardID )
    if_null block, END
    success = block."move"( xval, yval )

    unless success goto END
    self."drawScreen"( 0 )

END:
    # reenable the timer
    self."enableTimer"()

    .return (success)
.end

=item block = self."nextBlock"( boardID, id )

Activates the C<next block> on the specified board
and creates a new C<next block>.
The old current block is just overwritten, and not locked
onto the board. Use C<_Board::lockBlock()> for this.

=over 4

=item parameter C<boardID>

The ID of the board where the next block should be activated.

=item parameter C<id> B<(optional)>

The id of the block to create. The id is an index in the
blockdata array. Please refer to <_Tetris::App::blockdata()>
for more information.

=back

This method returns the new falling block.

=cut

.sub nextBlock :method
    .param int boardID
    .param int id       :optional
    .param int got_id   :opt_flag
    .local pmc temp

    print "nextBlock: ("
    print boardID
    print ") "
    print id
    print "\n"

    if got_id goto SKIP_SET_ID
    # no INT arg => use a random next block
    id = -1
SKIP_SET_ID:

    temp = self."board"( boardID )
    if_null temp, APP_NEXTBLOCK_END
    temp = temp."nextBlock"(id )

APP_NEXTBLOCK_END:
    .return (temp)
.end

=item app."fall"( boardID )

Lets the current block of the specified board
fall down fast.

=over 4

=item parameter C<boardID>

The ID of the board where the block should fall down fast.

=back

This method returns 1 if the board was found, 0 otherwise.

=cut

.sub fall :method
    .param int boardID
    .local pmc board
    .local int ret

    ret = 0
    board = self."board"( boardID )
    if_null board, APP_FALL_END
    board."fall"()
    ret = 1

APP_FALL_END:
    .return (ret)
.end

=item falling = app."falling"( boardID )

Checks if the current block of the specified board
is falling down fast.

=over 4

=item parameter C<boardID>

The ID of the board to check.

=back

This method returns 1 if the block is falling down fast, 0 otherwise.

=cut

.sub falling :method
    .param int boardID
    .local pmc board
    .local int ret

    ret = 0
    board = self."board"( boardID )
    if_null board, APP_FALLING_END
    ret = board."falling"()

APP_FALLING_END:
    .return (ret)
.end

=item interval = app."fallInterval"( boardID )

Checks the board's falling speed.

=over 4

=item parameter C<boardID>

The ID of the board to check.

=back

This method returns how many seconds it take for a block
to fall down one unit.

=cut

.sub fallInterval :method
    .param int boardID
    .local pmc board
    .local num ret

    ret = 0
    board = self."board"( boardID )
    if_null board, APP_INTERVAL_END
    ret = board."fallInterval"()

APP_INTERVAL_END:
    .return (ret)
.end

=item nextfall = app."nextFallTime"( boardID )

Checks when the block on the specified board falls down
the next unit.

=over 4

=item parameter C<boardID>

The ID of the board to check.

=back

Returns the time when the block falls down the next time.

=cut

.sub nextFallTime :method
    .param int boardID
    .local pmc board
    .local num ret

    board = self."board"( boardID )
    if_null board, APP_NEXTFALL_END
    ret = board."nextFallTime"()

APP_NEXTFALL_END:
    .return (ret)
.end

=item app."setNextFallTime"( boardID, val )

Sets the time when the block on the specified board
falls down the next unit.

=over 4

=item parameter C<boardID>

The ID of the board to modify.

=item parameter C<val>

The time when the block falls down the next time.

=back

This method returns nothing.

=cut

.sub setNextFallTime :method
    .param int boardID
    .param num val
    .local pmc board

    board = self."board"( boardID )
    if_null board, APP_SETFALL_END
    board."setNextFallTime"( val )

APP_SETFALL_END:
    .return ()
.end

=item redrawn = app."timer"()

Has to be called at frequent intervals.

Returns 1 if the screen has been redrawn, 0 otherwise.

=cut

.sub timer :method
    .local pmc board
    .local int redraw
    .local int ret
    .local pmc boards
    .local pmc board
    .local int i
    .local pmc inTimer

    redraw = 0

    # check the timer disable count
    # do nothing if the timer is disabled
    getattribute $P0, self, 'TimerDisableCount'
    if $P0 > 0 goto END

    getattribute inTimer, self, 'InTimer'

    i = inTimer
    if i goto END

    # XXX: fetch exceptions and reset this flag
    # we are in the timer handler function
    inc inTimer

    # get the boards array
    (boards, i) = self."boards"( self )

LOOP:
    dec i
    if i < 0 goto REDRAW
    board = boards[i]

    # call the board's timer
    ret = board."timer"()

    unless ret goto LOOP
    redraw = 1
    branch LOOP

REDRAW:
    unless redraw goto NOREDRAW
    self."drawScreen"( 0 )
NOREDRAW:

    dec inTimer
END:

    .return (redraw)
.end

=item app."drawScreen"( full )

Redraws the screen.

=over 4

=item parameter C<full>

0 = update only modified parts (uses a draw cache)

1 = draw everything

=back

This method returns nothing.

=cut

.sub drawScreen :method
    .param int full
    .local pmc screen
    .local pmc temp

    self."disableTimer"()

    screen = self."SDL"()
    screen = screen."surface"()

    # draw everything?
    $I0 = self."flag"( "show blocksize" )
    if $I0 goto FULL
    $I0 = self."flag"( "draw full" )
    if $I0 goto FULL
    branch NOT_FULL
FULL:
    full = 1
NOT_FULL:

    #
    # draw the main background
    #

    # to see the draw cache optimisation
    $I0 = self."flag"( "show optimisation" )
    if $I0 goto FORCE
    unless full goto NO_MAINBACKGROUND
FORCE:
    .local pmc rect
    .local pmc screen
    .local pmc color

    rect = new 'Hash'
    rect["width"] = 640
    rect["height"] = 480
    rect["x"] = 0
    rect["y"] = 0
    temp = new ['SDL'; 'Rect'], rect
    color = self."color"( 3 )

    screen."fill_rect"( temp, color )
NO_MAINBACKGROUND:
    #
    # draw the boards
    #
    self."drawBoards"( screen, full )

    #
    # update the screen
    #
    # XXX: optimize screen updates
    rect = new 'Hash'
    rect["width"] = 640
    rect["height"] = 480
    rect["x"] = 0
    rect["y"] = 0
    temp = new ['SDL'; 'Rect'], rect
    screen."update_rect"( temp )

    self."enableTimer"()
.end

=item app."drawBoards"( screen, full )

=cut

.sub drawBoards :method
    .param pmc screen
    .param int full
    .local pmc boards
    .local pmc board
    .local int i

    (boards, i) = self."boards"()

LOOP:
    dec i
    if i < 0 goto END
    board = boards[i]
    board."draw"( screen, full )
    branch LOOP

END:
    .return ()
.end

=item (boards, count) = app."boards"()

Returns the number of boards registered as well as
the boards array.

=cut

.sub boards :method
    .local pmc boards
    .local int count

    getattribute boards, self, 'Boards'
    count = 0
    if_null boards, END
    count = boards

END:
    .return (boards, count)
.end

=item app."registerBoard"( board, id ) B<(internal)>

Called by the board constructor to add the board object
to the application's board array. Returns the index where
the board has been added, which is used as the board ID.

=cut

.sub registerBoard :method
    .param pmc board
    .local pmc boards
    .local int id

    (boards, id) = self."boards"()
    set boards[id], board

    .return (id)
.end

=item value = app."flag"( name, value )

Get or sets an integer debug flag.

=over 4

=item parameter C<name>

The flag's name.

=item parameter C<value> B<(optional)>

Set the flag to the specified (integer) value.

=back

Returns the flag's (new) value.

=cut

.sub flag :method
    .param string name
    .param int value        :optional
    .param int got_value    :opt_flag

    .local pmc flag
    .local int ret

    # get the flags hash
    getattribute flag, self, 'DebugFlags'

    # check the number of INT args
    unless got_value goto FLAG_GET
    # set a new value
    set flag[name], value

FLAG_GET:
    set ret, flag[name]

    .return (ret)
.end

=item app."newGame"( boards )

Starts a new game with the specified number of boards.

=over 4

=item parameter C<boards>

The number of boards to create.

=back

This method returns nothing.

=cut

.sub newGame :method
    .param int players     :optional
    .param int got_players :opt_flag
    .local pmc temp
    .local int xpos

    self."disableTimer"()

    set xpos, 10

    # check the number of INT args
    if got_players goto SET

    getattribute temp, self, 'Players'
    players = 1
    if_null temp, SET
    players = temp
    branch END_SET

SET:
    # save the number of players
    new temp, 'Integer'
    set temp, players

    setattribute self, 'Players', temp
END_SET:

    print "starting a "
    print players
    print " player game...\n"

    # create the boards array
    new temp, 'ResizablePMCArray'

    setattribute self, 'Boards', temp

NEWGAME_NEW_BOARD:
    if players <= 0 goto NEWGAME_END
    print "new board...\n"
    temp = new "Tetris::Board", self
    print "new board done.\n"
    temp."setPosition"( xpos, 10 )
    add xpos, 320
    dec players
    branch NEWGAME_NEW_BOARD

NEWGAME_END:
    self."drawScreen"( 1 )

    self."enableTimer"()

    .return ()
.end

=back

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
