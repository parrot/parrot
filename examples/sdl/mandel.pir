# Copyright (C) 2006, The Perl Foundation.
# $Id$

=head1 TITLE

sdl/mandel.pir - Display Mandelbrot Set Using SDL

=head1 SYNOPSIS

To run this file, run the following command from the Parrot directory:

  $ ./parrot examples/sdl/mandel.pir [ options ]

=head2 Options

  --quit, -q      ... quit immediately (useful for benchmarking)
  --threads       ... non-working code to run 2 calculation threads 

=head1 KEYBOARD/MOUSE COMMANDS

  q          ... quit application
  r          ... reset to intial coors and scale
  <but-left> ... zoom in, center at click
  <but-mid>  ... center at click
  <but-right> .. zoom out, center at click
  <keypad+>  ... increase bailout limit by 100
  <keypad->  ... decrease bailout limit by 100

=cut

.sub _main :main
    .param pmc argv
    .local pmc opts, app, event, handler
    'load_libs'()
    opts = 'get_opts'(argv)
    app  = 'make_app'(opts)
    app.'calc'()
    $I0 = opts['quit']
    if $I0 goto ex
    event = getattribute app, 'event'
    handler = getattribute app, 'event_handler'
    event.'process_events'(handler, app)
ex:
    app.'quit'()
.end    

# utils
.sub 'load_libs'    
    # load the necessary libraries
    load_bytecode "library/SDL/App.pir"
    load_bytecode "library/SDL/Rect.pir"
    load_bytecode "library/SDL/Color.pir"
    load_bytecode "library/SDL/EventHandler.pir"
    load_bytecode "library/SDL/Event.pir"
    load_bytecode "library/Getopt/Obj.pir"
.end

# cmd line processing
.sub 'get_opts'
    .param pmc argv
    .local pmc opts, getopts
    getopts = new 'Getopt::Obj'
    push getopts, "quit|q"
    push getopts, "threads"
    $S0 = shift argv
    opts = getopts."get_options"(argv)
    .return (opts)
.end

# create the application
.sub 'make_app'
    .param pmc opts
    # create an SDL::App subclass
    .local pmc app, cl
    cl = subclass 'SDL::App', 'Mandel'
    addattribute cl, 'xstart'
    addattribute cl, 'ystart'
    addattribute cl, 'xend'
    addattribute cl, 'yend'
    addattribute cl, 'scale'
    addattribute cl, 'rect'
    addattribute cl, 'raw_palette'
    addattribute cl, 'event'
    addattribute cl, 'event_handler'
    addattribute cl, 'limit'
    addattribute cl, 'opts'
    # instantiate, seel also __init below
    app = new 'Mandel'
    setattribute app, 'opts', opts
    .return (app)
.end    

.namespace ['Mandel']

# init the Mandel app instance
.sub __init :method
    .local int w, h
    .local float scale, xstart, ystart
    # mandelbrot set is witdh [-2, 0.25] heigth [ -1, 1]
    # round up, scale *200
    xstart = -2.0
    ystart = -1.0
    scale = 200
    w = 600
    h = 400
    self.'init'( 'height' => h, 'width' => w, 'bpp' => 0, 'flags' => 1 )
    $P0 = new .Float
    $P0 = xstart
    setattribute self, 'xstart', $P0
    $P0 = new .Float
    $P0 = ystart
    setattribute self, 'ystart', $P0
    $P0 = new .Float
    $P0 = 1.0 # XXX calc from above
    setattribute self, 'xend', $P0
    $P0 = new .Float
    $P0 = 1.0
    setattribute self, 'yend', $P0
    $P0 = new .Float
    $P0 = scale
    setattribute self, 'scale', $P0
    $P0 = new .Integer
    $P0 = 200
    setattribute self, 'limit', $P0

    .local pmc rect, main_screen
    main_screen = self.'surface'()

    # create an SDL::Rect representing the entire main screen
    .local pmc rect
    rect = new 'SDL::Rect'
    rect.'init'( 'height' => h, 'width' => w, 'x' => 0, 'y' => 0 )
    setattribute self, 'rect', rect

    .local pmc palette, raw_palette, black
    palette = self.'create_palette'()
    raw_palette = self.'create_rawpalette'(palette)
    setattribute self, 'raw_palette', raw_palette
    # draw the background
    black = palette[0]
    main_screen.'fill_rect'( rect, black )
    main_screen.'update_rect'( rect )

    self.'init_events'()
.end

# accessors for some attribs
.sub 'xstart' :method
    .param float x     :optional
    .param int has_x   :opt_flag
    $P0 = getattribute self, 'xstart'
    unless has_x goto get
    $P0 = x
get:
    x = $P0
    .return (x)
.end

.sub 'ystart' :method
    .param float y     :optional
    .param int has_y   :opt_flag
    $P0 = getattribute self, 'ystart'
    unless has_y goto get
    $P0 = y
get:
    y = $P0
    .return (y)
.end

.sub 'xend' :method
    .param float x     :optional
    .param int has_x   :opt_flag
    $P0 = getattribute self, 'xend'
    unless has_x goto get
    $P0 = x
get:
    x = $P0
    .return (x)
.end

.sub 'yend' :method
    .param float y     :optional
    .param int has_y   :opt_flag
    $P0 = getattribute self, 'yend'
    unless has_y goto get
    $P0 = y
get:
    y = $P0
    .return (y)
.end

.sub 'scale' :method
    .param float s     :optional
    .param int has_s   :opt_flag
    $P0 = getattribute self, 'scale'
    unless has_s goto get
    $P0 = s
get:
    s = $P0
    .return (s)
.end

.sub 'limit' :method
    .param int l     :optional
    .param int has_l   :opt_flag
    $P0 = getattribute self, 'limit'
    unless has_l goto get
    $P0 = l
get:
    l = $P0
    .return (l)
.end

.sub 'calc' :method
    .local pmc main_screen, raw_palette, rect, pixels
    .local int w, h, x, y, pal_elems, raw_c, k, limit
    .local float xstart, ystart, scale
    # fetch the SDL::Surface representing the main window
    main_screen = self.'surface'()
    h = main_screen.'height'()
    w = main_screen.'width'()
    # lock the raw framebuffer
    xstart = self.'xstart'()
    ystart = self.'ystart'()
    scale =  self.'scale'()
    limit =  self.'limit'()
    raw_palette = getattribute self, 'raw_palette'
    rect        = getattribute self, 'rect'
    pal_elems = elements raw_palette
    # prefetch pixels
    pixels = main_screen.'pixels'()
    # start calculation
    .local pmc args
    args = new .FixedPMCArray
    set args, 10
    args[0] = w
    args[1] = xstart
    args[2] = ystart
    args[3] = scale
    args[4] = limit
    args[5] = pal_elems
    args[6] = raw_palette
    args[7] = pixels
    args[8] = main_screen
    args[9] = rect
    $P0 = getattribute self, 'opts'
    $I0 = $P0['threads']
    unless $I0 goto plain
    main_screen.'lock'()
    .local pmc thr
    .local int h2
    h2 = h / 2
    thr = new .ParrotThread
    .const .Sub raw_calc_f = 'raw_calc'
    .include 'cloneflags.pasm'
    .local int flags
    flags  = .PARROT_CLONE_CODE
    flags |= .PARROT_CLONE_CLASSES
    thr.'run'(flags, raw_calc_f, h2, h, args)
    raw_calc(0, h2, args)
    thr.join()
    main_screen.'unlock'()
    .return()
plain:
    main_screen.'lock'()
    raw_calc(0, h, args)
    main_screen.'unlock'()
.end

.sub raw_calc
    .param int y0
    .param int h
    .param pmc args

    .local int w, x, y, pal_elems, raw_c, k, limit, offs_y
    .local float xstart, ystart, scale
    .local pmc raw_palette, pixels, main_screen, rect
    .local float z, Z, t, c, C, zz, ZZ
    w = args[0]
    xstart = args[1]
    ystart = args[2]
    scale =  args[3]
    limit =  args[4]
    pal_elems = args[5]
    raw_palette = args[6]
    pixels = args[7]
    main_screen = args[8]
    rect = args[9]
    y = y0
loop_y:
    offs_y = w * y
    C = y / scale	# Im c part
    C += ystart
    x = 0
loop_x:
    c = x / scale   # re c part
    c += xstart 
    z = 0.0
    Z = 0.0   # Z(0) = 0
    k = 0
    # iteration loop, calculate
    # Z(k+1) = Z(k)^2 + c
    # bailout if abs(Z) > 2 or iteration limit of k is exceeded
    zz = 0.0  # z*z
    ZZ = 0.0  # Z*Z
loop_k:
    # z = zz - ZZ + c
    t = zz - ZZ
    t += c

    # Z = 2*z*Z + C
    Z *= 2.0
    Z *= z
    Z += C

    # z = t
    z = t

    # if (z*z + Z*Z > 4) break;
    zz = z * z
    ZZ = Z * Z
    $N1 = zz + ZZ
    if $N1 > 4.0 goto set_pix
    inc k
    if k < limit goto loop_k	# iterations
    k = 0
set_pix:
    $I0 = k % pal_elems
    raw_c = raw_palette[$I0]
    $I0 = offs_y + x
    # main_screen.'draw_pixel'(x, y, raw_c) --> 
    pixels[0; $I0] = raw_c
    inc x
    if x < w goto loop_x
    # update the screen on each line
    main_screen.'update_rect'( rect )
    inc y
    if y < h goto loop_y

.end

.sub 'recalc' :method
    .param int x
    .param int y
    .param int but
    .local int w, h
    .local float xstart, ystart, xend, yend, scale, fx, fy, dx, dy
    .local float ds, mx, my, dx2, dy2
    .local pmc main_screen
    main_screen = self.'surface'()
    h = main_screen.'height'()
    w = main_screen.'width'()
    xstart = self.'xstart'()
    ystart = self.'ystart'()
    xend = self.'xend'()
    yend = self.'yend'()
    scale =  self.'scale'()
    # use x,y as center of new calculation
    dx = xend - xstart
    dy = yend - ystart
    # relative factor of new midpoint
    fx = x / w   # 0..1
    fy = y / h
    fx -= 0.5    # -0.5 .. +0.5
    fy -= 0.5
    fx *= dx     # cvt to mandel coors
    fy *= dy
    dx2 = dx / 2.0
    dy2 = dy / 2.0
    mx = xstart + dx2    # midpoint
    my = ystart + dy2
    mx += fx             # new midpoint
    my += fy
    ds = 1.0
    if but == 1 goto zoom_in
    if but == 2 goto done
    ds = 0.5
    goto done
zoom_in:    
    ds = 2.0
done:
    dx2 /= ds
    dy2 /= ds
    xstart = mx - dx2
    ystart = my - dy2
    self.'xstart'(xstart)
    self.'ystart'(ystart)
    xend = mx + dx2
    yend = my + dy2
    self.'xend'(xend)
    self.'yend'(yend)
    scale *= ds
    self.'scale'(scale)
    self.'calc'()
.end

# init event system
.sub 'init_events' :method
    .local pmc event, args, event_handler
    event = new 'SDL::Event'
    event.'init'()
    setattribute self, 'event', event

    $P0 = subclass 'SDL::EventHandler', ['Mandel'; 'EventHandler']
    event_handler = new ['Mandel'; 'EventHandler']
    event_handler.'init'(self)	# XXX unused
    setattribute self, 'event_handler', event_handler
.end

# sort by adding raw r+g+b values
.sub bright
    .param pmc l
    .param pmc r
    .local int cr, cl, br_l, br_r
    cl = l
    br_l = cl & 0xff
    cl >>= 8
    $I0 = cl & 0xff
    br_l += $I0
    cl >>= 8
    $I0 = cl & 0xff
    br_l += $I0
    cr = r
    br_r = cr & 0xff
    cr >>= 8
    $I0 = cr & 0xff
    br_r += $I0
    cr >>= 8
    $I0 = cr & 0xff
    br_r += $I0
    $I0 = cmp br_l, br_r
    .return ($I0)
.end

# create a 8x8x8 palette
.sub create_palette :method
    .local pmc palette, col, main_screen
    main_screen = self.'surface'()
    .local int r, g, b, color_type
    find_type  color_type, 'SDL::Color'
    palette = new .ResizablePMCArray
    r = 0
loop_r:
    g = 0
loop_g:    
    b = 0
loop_b:    
    col = new color_type
    col.'init'( 'r' => r, 'g' => g, 'b' => b )
    push palette, col
    b += 36
    if b <= 255 goto loop_b
    g += 36
    if g <= 255 goto loop_g
    r += 36
    if r <= 255 goto loop_r
    .const .Sub by_bright = "bright"
    palette.'sort'(by_bright)
    .return (palette)
.end

# create raw_palette with surface colors
.sub create_rawpalette :method
    .param pmc palette
    .local int i, n, raw_c
    .local pmc raw_palette, col, main_screen
    main_screen = self.'surface'()
    n = elements palette
    raw_palette = new .FixedIntegerArray
    raw_palette = n
    i = 0
loop:    
    col = palette[i]
    raw_c = col.'color_for_surface'( main_screen )
    raw_palette[i] = raw_c
    inc i
    if i < n goto loop
    .return (raw_palette)
.end

.namespace ['Mandel'; 'EventHandler']

.sub key_down_q :method
    .param pmc app
    app.'quit'()
    end
.end

# reset to default
.sub key_down_r :method
    .param pmc app
    app.'xstart'(-2.0)
    app.'ystart'(-1.0)
    app.'xend'(1.0)
    app.'yend'(1.0)
    app.'scale'(200)
    app.'limit'(200)
    app.'calc'()
.end

# keypad +/- change bailout limit
.sub key_down_kp_plus :method
    .param pmc app
    .local int limit
    limit = app.'limit'()
    limit += 100
    app.'limit'(limit)
    print "limit +\n"
    app.'calc'()
.end

.sub key_down_kp_minus :method
    .param pmc app
    .local int limit
    limit = app.'limit'()
    if limit <= 100 goto ignore
    limit -= 100
    app.'limit'(limit)
    print "limit -\n"
    app.'calc'()
ignore:
.end

.sub mouse_button_up :method
    .param pmc event
    .param pmc app

    .local int b, x, y
    event = event.'event'( 'MouseButton' )
    b = event['state']
    x = event['x']
    y = event['y']
    app.'recalc'(x, y, b)
.end

=head1 AUTHOR

leo

=head1 OPTIMIZATIONS

Runtimes for x86_64 AMD X2@2000
600 x 400 pixels,  200 iterations, 2s delay subtracted

=head2 Algorithm optimizations

Plain runcore and unoptimized parrot:

  Original version based on sdl/raw_pixels   21s
  Create raw_palette                         12s
  Prefetch raw_surface                       10s        [1]
  Optimize calculation loop (zz, ZZ)          9s        [2] 
  use raw pixels array                                  [3]  

=head2 Parrot based optimizations

Optimized build

  [2] plain runcore 64 bit                    3.0s
  [2] -C    runcore 64 bit                    1.5s
  [2] plain runcore 32 bit                    3.6s
  [2] -C    runcore 32 bit                    1.6s
  [1] -j                                      1.1s
  [2] -j                                      0.8s
  [3] -j                                      0.5s

=head1 SEE ALSO

L<http://en.wikipedia.org/wiki/Mandelbrot_set>

If you want faster mandelbrot with iteractive zooming use Xaos:

L<http://xaos.sourceforge.net/english.php>

=cut
