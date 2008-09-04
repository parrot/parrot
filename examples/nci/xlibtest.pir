# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 TITLE

xlibtest.pir - Test NCI with libX11

=head1 SYNOPSIS

This is an initial version, be careful and not expect too much.

Compile xlib.pir to xlib.pbc before usage.

Press Escape key to exit.

=cut


.include 'xlibconstants.pir'

.sub main :main

    load_bytecode 'xlib.pbc'

# Initialize and print some information

    show_display_name()

    .local pmc openDisplay
    openDisplay = get_global ['xlib'], 'OpenDisplay'

    .local pmc display
    display = openDisplay('')

    display.hello()

    print 'DefaultScreen: '
    $I0 = display.DefaultScreen()
    say $I0

    print 'BlackPixel: '
    .local int black
    black = display.BlackPixel()
    say black

    print 'WhitePixel: '
    .local int white
    white = display.WhitePixel(0)
    say white

# Create and map the window

    .local pmc rw
    rw = display.RootWindow()

    .local pmc w
    w = display.CreateSimpleWindow(rw, 0, 0, 600, 400, 0, 0, white)
    $I0 = KeyPressMask
    bor $I0, ButtonPressMask
    bor $I0, ButtonReleaseMask
    bor $I0, PointerMotionMask
    w.SelectInput($I0)
    w.StoreName('Hello, parrot')
    w.Map()

# Get keycode of the Escape key to check in key press event

    .local pmc KeysymToString
    KeysymToString = get_global ['xlib'], 'KeysymToString'
    .local pmc StringToKeysym
    StringToKeysym = get_global ['xlib'], 'StringToKeysym'

#    print 'Escape-'
    $I0 = StringToKeysym('Escape')
#    print $I0
#    print '-'
    .local int codeEscape
    codeEscape = display.KeysymToKeycode($I0)
#    say codeEscape

# Event loop

    .local pmc newEvent
    newEvent = get_global ['xlib'], 'newEvent'

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
    $I0 = display.NextEvent(event)

    $I1 = event.type()

    eq $I1, KeyPress, keypress
    eq $I1, KeyRelease, loop
    eq $I1, ButtonPress, press
    eq $I1, ButtonRelease, release
    eq $I1, MotionNotify, paint
    say $I1
    goto loop
keypress:
    $I0 = event.keycode()
#    say 'Keypress'
#    say $I0

#    $I1 = display.KeycodeToKeysym($I0)
#    say $I1
#    $S0 = KeysymToString($I1)
#    say $S0
#    eq $S0, 'Escape', finish

    eq $I0, codeEscape, finish
    goto loop

press:
    lastpx = event.x()
    lastpy = event.y()
    w.DrawPoint(lastpx, lastpy)
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
    px = event.x()
#    print px
#    print ' '
    py = event.y()
#    print py
#    say ''

    eq lastpx, px, checky
    goto draw
checky:
    eq lastpy, py, loop
draw:
    w.DrawLine(lastpx, lastpy, px, py)
    lastpx = px
    lastpy = py

    goto loop

# End. Close window and display, and exit.

finish:
    say 'Exiting'
    w.Unmap()
    w.Destroy()

    display.Close()
.end

#-----------------------------------------------------------------------
.sub show_display_name
    print 'DisplayName: "'
    .local pmc DisplayName
    DisplayName = get_global ['xlib'], 'DisplayName'
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
