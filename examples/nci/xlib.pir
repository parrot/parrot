# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 TITLE

xlib.pir - Test NCI with libX11

=head1 SYNOPSIS

Testing...

This is an initial version, be careful and not expect too much.

=head1 BUGS

Note that the Event structure is platform dependent.
The nci declaration attempts to be platform independent,
but depends of the size of some X11 types and struct
alignment.

=cut

########################################################################

#-----------------------------------------------------------------------
.sub fail
    .param string msg
    say msg
    exit 1
.end

########################################################################

.namespace ['xlib']

# xlib handle
.const string xlib_handle = 'xlib_handle'

# attributes used for xlib types
.const string attr_XDisplay = 'x_Display'
.const string attr_XWindow = 'x_Window'

# attributes used for parrot objects
.const string attr_display = 'obj_display'

#-----------------------------------------------------------------------
.sub get_xlib_handle
    .local pmc xlib
    xlib = get_global xlib_handle
    $I0 = defined xlib
    if $I0 goto done

# Load library and store handler
    xlib = loadlib 'libX11'
    $I0 = defined xlib
    unless $I0 goto cygwin
    if xlib goto store
cygwin:
    xlib = loadlib 'cygX11-6'
    $I0 = defined xlib
    unless $I0 goto failed
    unless xlib goto failed
store:
    set_global xlib_handle, xlib
done:
    .return(xlib)
failed:
    fail('No xlib')
.end

#-----------------------------------------------------------------------
.sub get_xlib_function
    .param string name
    .param string signature

    .local pmc xlib
    xlib = get_xlib_handle()
    .local pmc func
    func = get_global name
    $I0 = defined func
    if $I0 goto done

    func = dlfunc xlib, name, signature
    set_global name, func
done:
    .return(func)
.end

#-----------------------------------------------------------------------
.sub get_Display_class
    .local pmc Display
    Display = find_global 'Display_class'
    $I0 = defined Display
    if $I0 goto done

    Display = newclass ['xlib'; 'Display']
    addattribute Display, attr_XDisplay
    set_global 'Display_class', Display

# export functions to be used from Display methods
    .local pmc ns, nsDisplay, nsWindow
    ns = get_namespace
    nsDisplay = get_namespace ['Display']
    .local pmc explist
    explist = new 'ResizablePMCArray'
    explist[0] = 'get_xlib_handle'
    explist[1] = 'get_xlib_function'
    explist[2] = 'get_Window_class'
    ns.export_to(nsDisplay, explist)
    nsWindow = get_namespace ['Window']
    ns.export_to(nsWindow, explist)

done:
    .return(Display)
.end

#-----------------------------------------------------------------------
.sub get_Event_class
    .local pmc Event
    Event = find_global 'Event_class'
    $I0 = defined Event
    if $I0 goto done

    Event = newclass ['xlib'; 'Event']
    addattribute Event, 'xEvent'
    set_global 'Event_class', Event
done:
    .return(Event)
.end

#-----------------------------------------------------------------------
.sub get_Window_class
    .local pmc Window
    Window = find_global 'Window_class'
    $I0 = defined Window
    if $I0 goto done

    Window = newclass ['xlib'; 'Window']
    addattribute Window, attr_display
    addattribute Window, attr_XWindow
    set_global 'Window_class', Window

# export functions to be used from Window methods
    .local pmc ns, nsWindow
    ns = get_namespace
    nsWindow = get_namespace ['Window']
    .local pmc explist
    explist = new 'ResizablePMCArray'
    explist[0] = 'get_xlib_handle'
    explist[1] = 'get_xlib_function'
    ns.export_to(nsWindow, explist)

done:
    .return(Window)
.end

#-----------------------------------------------------------------------
.sub OpenDisplay
    .param string displayname :optional

    .local pmc opendisplay
    opendisplay = get_xlib_function('XOpenDisplay', 'pt')

    .local pmc xdisplay
    xdisplay = opendisplay(displayname)

    .local pmc Display
    Display = get_Display_class()
    .local pmc display
    display = new Display

    setattribute display, attr_XDisplay, xdisplay

    .return(display)
.end

#-----------------------------------------------------------------------
.sub DisplayName
    .param string name :optional

    .local pmc func
    func = get_xlib_function('XDisplayName', 'tt')

    if name goto getit
    name = ''
getit:
    .local string dispname
    dispname = func(name)
    .return(dispname)
.end

#-----------------------------------------------------------------------
.sub newEvent
    .local pmc Event
    Event = get_Event_class()
    .local pmc event
    event = new Event
    .return(event)
.end

#-----------------------------------------------------------------------
.sub KeysymToString
    .param int keysym

    .local pmc func
    func = get_xlib_function('XKeysymToString', 'ti')
    .local string r
    r = func(keysym)
    .return(r)
.end

#-----------------------------------------------------------------------
.sub StringToKeysym
    .param string keystring

    .local pmc func
    func = get_xlib_function('XStringToKeysym', 'it')
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
.sub destroy :vtable
    say 'Destroying xlib;Display'
.end

#-----------------------------------------------------------------------
.sub hello :method
    say 'Hello'
.end

#-----------------------------------------------------------------------
.sub Close :method
    .local pmc closedisplay
    closedisplay = get_xlib_function('XCloseDisplay', 'ip')

    $P0 = getattribute self, attr_XDisplay
    $I0 = closedisplay($P0)
.end

#-----------------------------------------------------------------------
.sub DefaultScreen :method
    .local pmc func
    func = get_xlib_function('XDefaultScreen', 'ip')
    $P0 = getattribute self, attr_XDisplay
    $I0 = func($P0)
    .return($I0)
.end

#-----------------------------------------------------------------------
.sub DefaultGC :method
    .local int screen
    screen = self.DefaultScreen()
    .local pmc xdisp
    xdisp = getattribute self, attr_XDisplay
    .local pmc func
    func = get_xlib_function('XDefaultGC','ppi')
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
    func = get_xlib_function('XBlackPixel','ipi')
    $P0 = getattribute self, attr_XDisplay
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
    func = get_xlib_function('XWhitePixel', 'ipi')
    $P0 = getattribute self, attr_XDisplay
    $I0 = func($P0, screen)
    .return($I0)
.end

#-----------------------------------------------------------------------
.sub RootWindow :method
    .local pmc func
    func = get_xlib_function('XRootWindow', 'ppi')
    $P0 = getattribute self, attr_XDisplay
    .local pmc window
    $P1 = func($P0, 0)

    .local pmc arg
    arg = new 'Hash'
    arg [attr_display] = self
    arg [attr_XWindow] = $P1
    .local pmc Window
    Window = get_Window_class()
    window = new Window, arg
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
    func = get_xlib_function('XCreateSimpleWindow', 'pppiiiiiii')

    $P0 = getattribute self, attr_XDisplay
    .local pmc parent_w
    parent_w = getattribute parent, attr_XWindow
    .local pmc new_window
    new_window = func($P0, parent_w, x, y, width, height, border_width, border, background)
    if null new_window goto failed
    $I0 = defined new_window
    unless $I0 goto failed

    .local pmc arg
    arg = new 'Hash'
    arg [attr_display] = self
    arg [attr_XWindow] = new_window

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
    func = get_xlib_function('XNextEvent', 'ipp')
    .local pmc disp
    disp = getattribute self, attr_XDisplay
    .local pmc xevent
    xevent = getattribute event, 'xEvent'
    $I0 = func(disp, xevent)
    .return($I0)
.end

#-----------------------------------------------------------------------
.sub KeycodeToKeysym :method
    .param int keysym

    .local pmc func
    func = get_xlib_function('XKeycodeToKeysym', 'ipii')
    .local pmc disp
    disp = getattribute self, attr_XDisplay
    .local int keycode
    keycode = func(disp, keysym, 0)
    .return(keycode)
.end

#-----------------------------------------------------------------------
.sub KeysymToKeycode :method
    .param int keysym

    .local pmc func
    func = get_xlib_function('XKeysymToKeycode', 'ipi')
    .local pmc disp
    disp = getattribute self, attr_XDisplay
    .local int keycode
    keycode = func(disp, keysym)
    .return(keycode)
.end

########################################################################

.namespace ['xlib';'Event']

#-----------------------------------------------------------------------
.sub get_event_struct
    .local pmc arg
    arg = get_global 'st_xevent'
    $I0 = defined arg
    if $I0 goto done

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

    set_global 'st_xevent', arg
done:
    .return(arg)
.end

#-----------------------------------------------------------------------
.sub init :vtable

    .local pmc arg
    arg = get_event_struct()
    .local pmc xevent
    xevent = new 'ManagedStruct', arg
    xevent[0] = 0
    setattribute self, 'xEvent', xevent
.end

#-----------------------------------------------------------------------
.sub type :method
    .local pmc xevent
    xevent = getattribute self, 'xEvent'
    $I0 = xevent[0]
    .return($I0)
.end

#-----------------------------------------------------------------------
.sub serial :method
    .local pmc xevent
    xevent = getattribute self, 'xEvent'
    $I0 = xevent[1]
    .return($I0)
.end

#-----------------------------------------------------------------------
.sub time :method
    .local pmc xevent
    xevent = getattribute self, 'xEvent'
    $I0 = xevent[7]
    .return($I0)
.end

#-----------------------------------------------------------------------
.sub x :method
    .local pmc xevent
    xevent = getattribute self, 'xEvent'
    $I0 = xevent[8]
    .return($I0)
.end

#-----------------------------------------------------------------------
.sub y :method
    .local pmc xevent
    xevent = getattribute self, 'xEvent'
    $I0 = xevent[9]
    .return($I0)
.end

#-----------------------------------------------------------------------
.sub keycode :method
    .local pmc xevent
    xevent = getattribute self, 'xEvent'
    $I0 = xevent[13]
    .return($I0)
.end

########################################################################

.namespace ['xlib';'Window']

#-----------------------------------------------------------------------
.sub getdisplay :method
    .local pmc disp
    disp = getattribute self, attr_display
    .local pmc xdisp
    xdisp = getattribute disp, attr_XDisplay
    .return(xdisp)
.end

#-----------------------------------------------------------------------
.sub Destroy :method
    .local pmc xdisp
    xdisp = self.getdisplay()
    .local pmc xwin
    xwin = getattribute self, attr_XWindow
    .local pmc func
    func = get_xlib_function('XDestroyWindow', 'ipp')
    $I0 = func(xdisp, xwin)
    .return($I0)
.end

#-----------------------------------------------------------------------
.sub SelectInput :method
    .param int mask

    .local pmc xdisp
    xdisp = self.getdisplay()
    .local pmc xwin
    xwin = getattribute self, attr_XWindow
    .local pmc func
    func = get_xlib_function('XSelectInput', 'ippi')
    $I0 = func(xdisp, xwin, mask)
    .return($I0)
.end

#-----------------------------------------------------------------------
.sub Map :method
    .local pmc xdisp
    xdisp = self.getdisplay()
    .local pmc xwin
    xwin = getattribute self, attr_XWindow
    .local pmc func
    func = get_xlib_function('XMapWindow', 'ipp')
    $I0 = func(xdisp, xwin)
    .return($I0)
.end

#-----------------------------------------------------------------------
.sub Unmap :method
    .local pmc xdisp
    xdisp = self.getdisplay()
    .local pmc xwin
    xwin = getattribute self, attr_XWindow
    .local pmc func
    func = get_xlib_function('XUnmapWindow', 'ipp')
    $I0 = func(xdisp, xwin)
    .return($I0)
.end

#-----------------------------------------------------------------------
.sub StoreName :method
    .param string name

    .local pmc xdisp
    xdisp = self.getdisplay()
    .local pmc xwin
    xwin = getattribute self, attr_XWindow

    .local pmc func
    func = get_xlib_function('XStoreName', 'ippt')
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
    xwin = getattribute self, attr_XWindow

    .local pmc func
    func = get_xlib_function('XDrawPoint', 'ipppii')
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
    xwin = getattribute self, attr_XWindow

    .local pmc func
    func = get_xlib_function('XDrawLine', 'ipppiiii')
    $I0 = func(xdisp, xwin, gc, x1, y1, x2, y2)
    .return($I0)
.end

#-----------------------------------------------------------------------
# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
