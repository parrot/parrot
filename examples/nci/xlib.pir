# Copyright (C) 2005-2008, The Perl Foundation.
# $Id$

=head1 TITLE

xlib.pir - Test NCI with libX11

=head1 SYNOPSIS

Testing...

Note that the Event structure is platform dependent.
The declaration attempts to be platform independent,
but dpends of the declarations of some X11 types.

This is an initial version, be careful and not expect too much.

Moving the mouse with a button pressed draws dots.

Press any key to exit.

=cut

# xlib handle
.const string xlib_handle = 'xlib_handle'

# xlib functions used
.const string f_XDisplayName = 'XDisplayName'
.const string f_XDefaultScreen = 'XDefaultScreen'
.const string f_XDefaultGC = 'XDefaultGC'
.const string f_XOpenDisplay = 'XOpenDisplay'
.const string f_XCloseDisplay = 'XCloseDisplay'
.const string f_XBlackPixel = 'XBlackPixel'
.const string f_XWhitePixel = 'XWhitePixel'
.const string f_XRootWindow = 'XRootWindow'
.const string f_XCreateSimpleWindow = 'XCreateSimpleWindow'
.const string f_XSelectInput = 'XSelectInput'
.const string f_XMapWindow = 'XMapWindow'
.const string f_XUnmapWindow = 'XUnmapWindow'
.const string f_XStoreName = 'XStoreName'
.const string f_XNextEvent = 'XNextEvent'
.const string f_XDrawPoint = 'XDrawPoint'
.const string f_XDrawLine = 'XDrawLine'
.const string f_XKeysymToString = 'XKeysymToString'
.const string f_XStringToKeysym = 'XStringToKeysym'
.const string f_XKeycodeToKeysym = 'XKeycodeToKeysym'
.const string f_XKeysymToKeycode = 'XKeysymToKeycode'

# attributes used for xlib types
.const string attr_Display = 'x_Display'
.const string attr_window = 'x_Window'

# attributes used for parrot objects
.const string attr_display = 'obj_display'

# event masks

.const int KeyPressMask = 1
.const int KeyReleaseMask = 2
.const int ButtonPressMask = 4
.const int ButtonReleaseMask = 8
.const int EnterWindowMask = 16
.const int LeaveWindowMask = 32
.const int PointerMotionMask = 64

# event types
.const int KeyPress = 2
.const int KeyRelease = 3
.const int ButtonPress = 4
.const int ButtonRelease = 5
.const int MotionNotify = 6

.sub main :main

    .local pmc openDisplay
    openDisplay = get_global ['xlib';'Display'], 'open'

    .local pmc display
    display = openDisplay()

    display.hello()

    .local pmc DisplayName
    DisplayName = get_global ['xlib'], 'DisplayName'
    .local pmc KeysymToString
    KeysymToString = get_global ['xlib'], 'KeysymToString'
    .local pmc StringToKeysym
    StringToKeysym = get_global ['xlib'], 'StringToKeysym'

    .local string dname
    dname = DisplayName()
    print 'DisplayName: "'
    print dname
    say '"'

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

    .local pmc rw
    rw = display.RootWindow()

#    print 'Escape-'
    $I0 = StringToKeysym('Escape')
#    print $I0
#    print '-'
    .local int codeEscape
    codeEscape = display.KeysymToKeycode($I0)
#    say codeEscape

    .local pmc w
    w = display.CreateSimpleWindow(rw, 0, 0, 600, 400, 0, 0, white)
    $I0 = KeyPressMask
    bor $I0, ButtonPressMask
    bor $I0, ButtonReleaseMask
    bor $I0, PointerMotionMask
    w.SelectInput($I0)
    w.StoreName('Hello, parrot')
    w.Map()

    .local pmc event
    event = new ['xlib';'Event']

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

finish:
    say 'Exiting'
    w.Unmap()

    display.close()
.end

.sub fail
    .param string msg
    say msg
    exit 1
.end

########################################################################

.namespace ['xlib']

#-----------------------------------------------------------------------
.sub init_lib :init
    say 'Init xlib'
# Load library and store handler
    .local pmc xlib
    xlib = loadlib 'libX11'
    $I0 = defined xlib
    unless $I0 goto cygwin
    if xlib goto done
cygwin:
    xlib = loadlib 'cygX11-6'
    $I0 = defined xlib
    unless $I0 goto failed
    unless xlib goto failed

done:
    set_global xlib_handle, xlib
# Create NCI functions
    .local pmc func
    func = dlfunc xlib, f_XDisplayName, 'tt'
    set_global f_XDisplayName, func
    func = dlfunc xlib, f_XKeysymToString, 'ti'
    set_global f_XKeysymToString, func
    func = dlfunc xlib, f_XStringToKeysym, 'it'
    set_global f_XStringToKeysym, func
    .return()
failed:
    fail('No xlib')
.end

#-----------------------------------------------------------------------
.sub DisplayName
    .param string name :optional

    .local pmc xlib
    xlib = get_global xlib_handle

    .local pmc func
    func = get_global f_XDisplayName

    if name goto getit
    name = ''
getit:
    .local string dispname
    dispname = func(name)
    .return(dispname)
.end

#-----------------------------------------------------------------------
.sub KeysymToString
    .param int keysym

    .local pmc xlib
    xlib = get_global xlib_handle

    .local pmc func
    func = get_global f_XKeysymToString
    .local string r
    r = func(keysym)
    .return(r)
.end

#-----------------------------------------------------------------------
.sub StringToKeysym
    .param string keystring

    .local pmc xlib
    xlib = get_global xlib_handle

    .local pmc func
    func = get_global f_XStringToKeysym
    .local int keysym
    keysym = func(keystring)
    .return(keysym)
.end

########################################################################

.namespace ['xlib';'Display']

#-----------------------------------------------------------------------
.sub createfunc
    .param pmc handler
    .param string name
    .param string ncisig

    .local pmc func
    func = dlfunc handler, name, ncisig
    set_global name, func
.end

#-----------------------------------------------------------------------
.sub init_class :init
    say 'Init xlib Display'

# Get xlib handle
    .local pmc xlib
    xlib = get_hll_global ['xlib'], xlib_handle
# Check to be sure
    $I0 = defined xlib
    unless $I0 goto failed
    unless xlib goto failed

# Create NCI functions
    createfunc(xlib, f_XOpenDisplay, 'pt')
    createfunc(xlib, f_XCloseDisplay, 'ip')
    createfunc(xlib, f_XDefaultScreen, 'ip')
    createfunc(xlib, f_XDefaultGC, 'ppi')
    createfunc(xlib, f_XBlackPixel, 'ipi')
    createfunc(xlib, f_XWhitePixel, 'ipi')
    createfunc(xlib, f_XRootWindow, 'ppi')
    createfunc(xlib, f_XCreateSimpleWindow, 'pppiiiiiii')
    createfunc(xlib, f_XNextEvent, 'ipp')
    createfunc(xlib, f_XKeycodeToKeysym, 'ipii')
    createfunc(xlib, f_XKeysymToKeycode, 'ipi')

# Class initialization
    .local pmc Display
    Display = newclass ['xlib'; 'Display']
    addattribute Display, attr_Display
    set_global 'Display', Display

    .return()
failed:
    fail('No xlib')
.end

#-----------------------------------------------------------------------
.sub destroy :vtable
    say 'Destroying xlib;Display'
.end

#-----------------------------------------------------------------------
.sub hello :method
    say 'Hello'
.end

#-----------------------------------------------------------------------
.sub open
    .param string displayname :optional

    if displayname goto open_it
    displayname = ''
open_it:

    .local pmc xlib
    xlib = get_hll_global ['xlib'], xlib_handle
    $I0 = defined xlib
    unless $I0 goto failed
    unless xlib goto failed

    .local pmc opendisplay
    opendisplay = get_global f_XOpenDisplay

    .local pmc xdisplay
    xdisplay = opendisplay('')

    .local pmc Display
    Display = find_global 'Display'
    .local pmc display
    display = new Display

    setattribute display, attr_Display, xdisplay

    .return(display)
failed:
    fail('No xlib')
.end

#-----------------------------------------------------------------------
.sub close :method
    .local pmc closedisplay
    closedisplay = get_global f_XCloseDisplay
    $P0 = getattribute self, attr_Display
    $I0 = closedisplay($P0)
.end

#-----------------------------------------------------------------------
.sub DefaultScreen :method
    .local pmc func
    func = get_global f_XDefaultScreen
    $P0 = getattribute self, attr_Display
    $I0 = func($P0)
    .return($I0)
.end

#-----------------------------------------------------------------------
.sub DefaultGC :method
    .local int screen
    screen = self.DefaultScreen()
    .local pmc xdisp
    xdisp = getattribute self, attr_Display
    .local pmc func
    func = get_global f_XDefaultGC
    $P1 = func(xdisp, screen)
    .return($P1)
.end

#-----------------------------------------------------------------------
.sub BlackPixel :method
    .param int screen :optional
    .param int has :opt_flag
    if has goto doit
    screen = self.DefaultScreen()
doit:
    .local pmc func
    func = get_global f_XBlackPixel
    $P0 = getattribute self, attr_Display
    $I0 = func($P0, screen)
    .return($I0)
.end

#-----------------------------------------------------------------------
.sub WhitePixel :method
    .param int screen :optional
    .param int has :opt_flag
    if has goto doit
    screen = self.DefaultScreen()
doit:
    .local pmc func
    func = get_global f_XWhitePixel
    $P0 = getattribute self, attr_Display
    $I0 = func($P0, screen)
    .return($I0)
.end

#-----------------------------------------------------------------------
.sub RootWindow :method
    .local pmc func
    func = get_global f_XRootWindow
    $P0 = getattribute self, attr_Display
    .local pmc window
    $P1 = func($P0, 0)

    .local pmc arg
    arg = new 'Hash'
    arg [attr_display] = self
    arg [attr_window] = $P1
    window = new ['xlib';'Window'], arg
    .return(window)
.end

#-----------------------------------------------------------------------
.sub CreateSimpleWindow :method
    .param pmc parent
    .param int x
    .param int y
    .param int width
    .param int height
    .param int border_width
    .param int border
    .param int background

    .local pmc func
    func = get_global f_XCreateSimpleWindow
    $P0 = getattribute self, attr_Display
    .local pmc parent_w
    parent_w = getattribute parent, attr_window
    $P1 = func($P0, parent_w, x, y, width, height, border_width, border, background)
    if null $P1 goto failed
    $I0 = defined $P1
    unless $I0 goto failed

    .local pmc arg
    arg = new 'Hash'
    arg [attr_display] = self
    arg [attr_window] = $P1

    .local pmc window
    window = new ['xlib';'Window'], arg
    .return(window)
failed:
    fail("Can't create window")
.end

#-----------------------------------------------------------------------
.sub NextEvent :method
    .param pmc event

    .local pmc func
    func = get_global f_XNextEvent
    .local pmc disp
    disp = getattribute self, attr_Display
    .local pmc xevent
    xevent = getattribute event, 'xEvent'
    $I0 = func(disp, xevent)
    .return($I0)
.end

#-----------------------------------------------------------------------
.sub KeycodeToKeysym :method
    .param int keysym

    .local pmc func
    func = get_global f_XKeycodeToKeysym
    .local pmc disp
    disp = getattribute self, attr_Display
    .local int keycode
    keycode = func(disp, keysym, 0)
    .return(keycode)
.end

#-----------------------------------------------------------------------
.sub KeysymToKeycode :method
    .param int keysym

    .local pmc func
    func = get_global f_XKeysymToKeycode
    .local pmc disp
    disp = getattribute self, attr_Display
    .local int keycode
    keycode = func(disp, keysym)
    .return(keycode)
.end

########################################################################

.namespace ['xlib';'Event']

#-----------------------------------------------------------------------
.sub init_class :init
    say 'Init xlib Event'

# Get xlib handle
    .local pmc xlib
    xlib = get_hll_global ['xlib'], xlib_handle

# Class initialization
    .local pmc Event
    Event = newclass ['xlib'; 'Event']
    addattribute Event, 'xEvent'
    set_global 'Event', Event
.end

.sub init :vtable
    # Check native type sizes
    .include 'iglobals.pasm'
    .local pmc config_hash, interp
    interp = getinterp
    config_hash = interp[.IGLOBALS_CONFIG_HASH]
    .local int intsize
    intsize = config_hash['intsize']
    say intsize
    .local int longsize
    longsize = config_hash['longsize']
    say longsize
    .local int ptrsize
    ptrsize = config_hash['ptrsize']
    say ptrsize
    .local int timesize
    timesize = 4
    .local int aligned
    aligned = intsize

# If size of long is 8, assume that padding in the struct
    eq longsize, 8, adjust8
    goto doit
adjust8:
    aligned = 8

doit:
    .local int char_t
    .local int int_t
    .local int long_t
    .local int ptr_t
    .local int time_t
    char_t = -93
    int_t = -91
    long_t = -90
    ptr_t = -70
    time_t = -76

    .local pmc arg
    arg = new 'FixedIntegerArray'
    set arg, 45

    say 'Event struct'
    .local int offs
    offs = 0
# type
    arg[0] = int_t
    arg[1] = 1
    arg[2] = offs
    say offs
    add offs, aligned
#serial
    arg[3] = long_t
    arg[4] = 1
    arg[5] = offs
    say offs
    add offs, longsize
# send_event
    arg[6] = int_t
    arg[7] = 1
    arg[8] = offs
    say offs
    add offs, aligned
# display
    arg[9] = ptr_t
    arg[10] = 1
    arg[11] = offs
    say offs
    add offs, ptrsize
# window
    arg[12] = ptr_t
    arg[13] = 1
    arg[14] = offs
    say offs
    add offs, ptrsize
# root
    arg[15] = ptr_t
    arg[16] = 1
    arg[17] = offs
    say offs
    add offs, ptrsize
# subwindow
    arg[18] = ptr_t
    arg[19] = 1
    arg[20] = offs
    say offs
    add offs, ptrsize
# time
    arg[21] = time_t
    arg[22] = 1
    arg[23] = offs
    say offs
    add offs, aligned
# x
    arg[24] = int_t
    arg[25] = 1
    arg[26] = offs
    say offs
    add offs, intsize
# y
    arg[27] = int_t
    arg[28] = 1
    arg[29] = offs
    say offs
    add offs, intsize
# x_root
    arg[30] = int_t
    arg[31] = 1
    arg[32] = offs
    say offs
    add offs, intsize
# y_root
    arg[33] = int_t
    arg[34] = 1
    arg[35] = offs
    say offs
    add offs, intsize
# state
    arg[36] = int_t
    arg[37] = 1
    arg[38] = offs
    say offs
    add offs, intsize
# keycode
    arg[39] = int_t
    arg[40] = 1
    arg[41] = offs
    say offs
    add offs, intsize
    say offs
# filler
    arg[42] = char_t
    arg[43] = 128
    arg[44] = offs

    .local pmc xevent
    xevent = new 'ManagedStruct', arg
    xevent[0] = 0
    setattribute self, 'xEvent', xevent
.end

.sub type :method
    .local pmc xevent
    xevent = getattribute self, 'xEvent'
    $I0 = xevent[0]
    .return($I0)
.end

.sub serial :method
    .local pmc xevent
    xevent = getattribute self, 'xEvent'
    $I0 = xevent[1]
    .return($I0)
.end

.sub time :method
    .local pmc xevent
    xevent = getattribute self, 'xEvent'
    $I0 = xevent[7]
    .return($I0)
.end

.sub x :method
    .local pmc xevent
    xevent = getattribute self, 'xEvent'
    $I0 = xevent[8]
    .return($I0)
.end

.sub y :method
    .local pmc xevent
    xevent = getattribute self, 'xEvent'
    $I0 = xevent[9]
    .return($I0)
.end

.sub keycode :method
    .local pmc xevent
    xevent = getattribute self, 'xEvent'
    $I0 = xevent[13]
    .return($I0)
.end

########################################################################

.namespace ['xlib';'Window']

#-----------------------------------------------------------------------
.sub createfunc
    .param pmc handler
    .param string name
    .param string ncisig

    .local pmc func
    func = dlfunc handler, name, ncisig
    set_global name, func

.end

#-----------------------------------------------------------------------
.sub init_class :init
    say 'Init xlib Window'

# Get xlib handle
    .local pmc xlib
    xlib = get_hll_global ['xlib'], xlib_handle
# Check to be sure
    $I0 = defined xlib
    unless $I0 goto failed
    unless xlib goto failed

# Create NCI functions
    createfunc(xlib, f_XSelectInput, 'ippi')
    createfunc(xlib, f_XMapWindow, 'ipp')
    createfunc(xlib, f_XUnmapWindow, 'ipp')
    createfunc(xlib, f_XStoreName, 'ippt')
    createfunc(xlib, f_XDrawPoint, 'ipppii')
    createfunc(xlib, f_XDrawLine, 'ipppiiii')

# Class initialization
    .local pmc Window
    Window = newclass ['xlib'; 'Window']
    addattribute Window, attr_window
    addattribute Window, attr_display
    set_global 'Window', Window

    .return()
failed:
    fail('No xlib')
.end

#-----------------------------------------------------------------------
.sub getdisplay :method
    .local pmc disp
    disp = getattribute self, attr_display
    .local pmc xdisp
    xdisp = getattribute disp, attr_Display
    .return(xdisp)
.end

#-----------------------------------------------------------------------
.sub SelectInput :method
    .param int mask

    .local pmc xdisp
    xdisp = self.getdisplay()
    .local pmc xwin
    xwin = getattribute self, attr_window
    .local pmc func
    func = get_global f_XSelectInput
    $I0 = func(xdisp, xwin, mask)
    .return($I0)
.end

#-----------------------------------------------------------------------
.sub Map :method
    .local pmc xdisp
    xdisp = self.getdisplay()
    .local pmc xwin
    xwin = getattribute self, attr_window
    .local pmc func
    func = get_global f_XMapWindow
    $I0 = func(xdisp, xwin)
    .return($I0)
.end

#-----------------------------------------------------------------------
.sub Unmap :method
    .local pmc xdisp
    xdisp = self.getdisplay()
    .local pmc xwin
    xwin = getattribute self, attr_window
    .local pmc func
    func = get_global f_XUnmapWindow
    $I0 = func(xdisp, xwin)
    .return($I0)
.end

#-----------------------------------------------------------------------
.sub StoreName :method
    .param string name

    .local pmc xdisp
    xdisp = self.getdisplay()
    .local pmc xwin
    xwin = getattribute self, attr_window

    .local pmc func
    func = get_global f_XStoreName
    $I0 = func(xdisp, xwin, name)
    .return($I0)
    .end

#-----------------------------------------------------------------------
.sub DrawPoint :method
    .param int x
    .param int y

    .local pmc disp
    disp = getattribute self, attr_display
    .local pmc xdisp
    xdisp = self.getdisplay()
    .local pmc gc
    gc = disp.DefaultGC()
    .local pmc xwin
    xwin = getattribute self, attr_window

    .local pmc func
    func = get_global f_XDrawPoint
    $I0 = func(xdisp, xwin, gc, x, y)
    .return($I0)
.end

#-----------------------------------------------------------------------
.sub DrawLine :method
    .param int x1
    .param int y1
    .param int x2
    .param int y2

    .local pmc disp
    disp = getattribute self, attr_display
    .local pmc xdisp
    xdisp = self.getdisplay()
    .local pmc gc
    gc = disp.DefaultGC()
    .local pmc xwin
    xwin = getattribute self, attr_window

    .local pmc func
    func = get_global f_XDrawLine
    $I0 = func(xdisp, xwin, gc, x1, y1, x2, y2)
    .return($I0)
.end

#-----------------------------------------------------------------------
# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
