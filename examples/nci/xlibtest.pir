# Copyright (C) 2008, Parrot Foundation.
# $Id$

=head1 TITLE

xlibtest.pir - Test NCI with libX11

=head1 SYNOPSIS

This is an initial version, be careful and not expect too much.

Compile Xlib.pir to Xlib.pbc before usage:

../../parrot -o Xlib.pbc Xlib.pir

Press Escape key to exit.

=cut


.include 'Xlibconstants.pir'

.sub main :main

    load_bytecode 'Xlib.pbc'

# Initialize and print some information

    show_display_name()

    .local pmc openDisplay
    openDisplay = get_global ['Xlib'], 'OpenDisplay'

    .local pmc display
    display = openDisplay('')

    display.'hello'()

    print 'DefaultScreen: '
    $I0 = display.'DefaultScreen'()
    say $I0

    print 'BlackPixel: '
    .local int black
    black = display.'BlackPixel'()
    say black

    print 'WhitePixel: '
    .local int white
    white = display.'WhitePixel'(0)
    say white

# Create and map the window

    .local pmc rw
    rw = display.'RootWindow'()

    .local pmc w
    w = display.'CreateSimpleWindow'(rw, 0, 0, 600, 400, 0, 0, white)
    $I0 = KeyPressMask
    bor $I0, ButtonPressMask
    bor $I0, ButtonReleaseMask
    bor $I0, PointerMotionMask
    bor $I0, StructureNotifyMask
    bor $I0, ExposureMask
    w.'SelectInput'($I0)
    w.'StoreName'('Hello, parrot')
    w.'Map'()

# Get keycode of the Escape key to check in key press event

    .local pmc KeysymToString
    KeysymToString = get_global ['Xlib'], 'KeysymToString'
    .local pmc StringToKeysym
    StringToKeysym = get_global ['Xlib'], 'StringToKeysym'

#    print 'Escape-'
    $I0 = StringToKeysym('Escape')
#    print $I0
#    print '-'
    .local int codeEscape
    codeEscape = display.'KeysymToKeycode'($I0)
#    say codeEscape

    .local pmc listline
    listline = new 'ResizablePMCArray'
    .local pmc line

# Event loop

    .local pmc newEvent
    newEvent = get_global ['Xlib'], 'newEvent'

    .local pmc event
    event = newEvent()

    .local int pressed
    .local int px
    .local int py
    .local int lastpx
    .local int lastpy
    pressed = 0
    lastpx = 0
    lastpy = 0
loop:
    $I0 = display.'NextEvent'(event)

    $I1 = event.'type'()

    eq $I1, KeyPress, keypress
    eq $I1, KeyRelease, loop
    eq $I1, ButtonPress, press
    eq $I1, ButtonRelease, release
    eq $I1, MotionNotify, paint
    eq $I1, Expose, expose
    eq $I1, ClientMessage, message
    eq $I1, DestroyNotify, finish

    # Unhandled event type
    #say $I1
    goto loop

keypress:
    $I0 = event.'keycode'()
#    say 'Keypress'
#    say $I0

#    $I1 = display.KeycodeToKeysym($I0)
#    say $I1
#    $S0 = KeysymToString($I1)
#    say $S0
#    eq $S0, 'Escape', finish

    ne $I0, codeEscape, loop
    w.'Unmap'()
    w.'Destroy'()
    goto loop

press:
    lastpx = event.'x'()
    lastpy = event.'y'()
    w.'DrawPoint'(lastpx, lastpy)
    line = new 'ResizableIntegerArray'
    push listline, line
    push line, lastpx
    push line, lastpy
    pressed = 1
    goto loop
release:
    pressed = 0
    goto loop

paint:
    unless pressed goto loop
#    print $I1
#    print ': '
#    $I0 = event.serial()
#    print $I0
#    print ' '
#    $I0 = event.time()
#    print $I0
#    print ' '
    px = event.'x'()
#    print px
#    print ' '
    py = event.'y'()
#    print py
#    say ''

    eq lastpx, px, checky
    goto draw
checky:
    eq lastpy, py, loop
draw:
    w.'DrawLine'(lastpx, lastpy, px, py)
    lastpx = px
    lastpy = py
    push line, px
    push line, py

    goto loop

expose:
    #say 'Exposed'

    $I0 = elements listline
    #say $I0
    unless $I0 goto loop
    $I1 = 0
nextline:
    #print $I0
    #print ' - '
    #say $I1

    eq $I1, $I0, loop
    $P0 = listline[$I1]
    inc $I1
    $I2 = elements $P0
    #say $I2
    unless $I2 goto nextline

    $I3 = 0
    lastpx = $P0[$I3]
    inc $I3
    lastpy = $P0[$I3]
    inc $I3
    w.'DrawPoint'(lastpx, lastpy)
nextpoint:
    eq $I3, $I2, nextline
    px = $P0[$I3]
    inc $I3
    py = $P0[$I3]
    inc $I3
    w.'DrawLine'(lastpx, lastpy, px, py)
    lastpx = px
    lastpy = py
    goto nextpoint

    goto loop

message:
    w.'Unmap'()
    w.'Destroy'()
    goto loop

# End. Close window and display, and exit.

finish:
    say 'Exiting'

    display.'Close'()
.end

#-----------------------------------------------------------------------
.sub show_display_name
    print 'DisplayName: "'
    .local pmc DisplayName
    DisplayName = get_global ['Xlib'], 'DisplayName'
    .local string dname
    dname = DisplayName()
    print dname
    say '"'
.end

#-----------------------------------------------------------------------
# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
