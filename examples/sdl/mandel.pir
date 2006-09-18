# Copyright (C) 2006, The Perl Foundation.
# $Id: mandel.pir 12835 2006-05-30 13:32:26Z coke $

=head1 TITLE

sdl/mandel.pir - Display Mandelbrot Set Using SDL

=head1 SYNOPSIS

To run this file, run the following command from the Parrot directory:

  $ ./parrot examples/sdl/mandel.pir

=cut

.sub _main :main
    # first load the necessary libraries
    load_bytecode "library/SDL/App.pir"
    load_bytecode "library/SDL/Rect.pir"
    load_bytecode "library/SDL/Color.pir"

    # create an SDL::App object
    .local pmc app, cl
    cl = subclass 'SDL::App', 'Mandel'
    addattribute cl, 'xstart'
    addattribute cl, 'ystart'
    addattribute cl, 'scale'
    addattribute cl, 'rect'
    addattribute cl, 'raw_palette'
    app = new 'Mandel'
    app.'calc'()
    # show off for a bit then exit
    sleep 2
    app.'quit'()
.end    

.namespace ['Mandel']
.sub 'calc' :method
    .local pmc main_screen, raw_palette, rect, raw_surface
    .local int w, h, x, y, pal_elems, raw_c, k
    .local float xstart, ystart, scale
    # fetch the SDL::Surface representing the main window
    main_screen = self.'surface'()
    h = main_screen.'height'()
    w = main_screen.'width'()
    # lock the raw framebuffer
    $P0 = getattribute self, 'xstart'
    xstart = $P0
    $P0 = getattribute self, 'ystart'
    ystart = $P0
    $P0 = getattribute self, 'scale'
    scale = $P0
    raw_palette = getattribute self, 'raw_palette'
    rect        = getattribute self, 'rect'
    pal_elems = elements raw_palette
    # prefetch raw_surface
    raw_surface = main_screen.'surface'()
    # start calculation
    .local float z, Z, t, c, C, zz, ZZ
    .local int offs_y
    main_screen.'lock'()
    y = 0
loop_y:
    offs_y = w * y
    C = y / scale	# Im c part
    C += ystart
    x = 0
loop_x:
    c = x / scale   # re c part
    c += xstart 
    z = 0
    Z = 0
    k = 0
    # iteration loop, calculate
    # Z(k+1) = Z(k)^2 + c
    # bailout if abs(Z) > 2 or iteration limit of k is exceeded
    zz = z * z
    ZZ = Z * Z
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
    if $N1 > 4.0 goto print
    inc k
    if k < 200 goto loop_k	# iterations
    k = 0
print:	
    $I0 = k % pal_elems
    raw_c = raw_palette[$I0]
    $I0 = offs_y + x
    # main_screen.'draw_pixel'(x, y, raw_c)
    # -> opt
    raw_surface[ 'pixels'; 'array'; $I0 ] = raw_c
    inc x
    if x < w goto loop_x
    # update the screen on each iteration
    main_screen.'update_rect'( rect )
    inc y
    if y < h goto loop_y

    main_screen.'unlock'()
.end

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
    $P0 = scale
    setattribute self, 'scale', $P0

    .local pmc rect, main_screen
    main_screen = self.'surface'()

    # create an SDL::Rect representing the entire main screen
    .local pmc rect
    rect = new 'SDL::Rect'
    rect.'init'( 'height' => h, 'width' => w, 'x' => 0, 'y' => 0 )

    setattribute self, 'rect', rect
    .local pmc palette, raw_palette, black
    (palette, raw_palette) = create_palette(main_screen)
    setattribute self, 'raw_palette', raw_palette
    # draw the background
    black = palette[0]
    main_screen.'fill_rect'( rect, black )
    main_screen.'update_rect'( rect )
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

# create a 9x9x9 palette, also return raw_palette with surface colors
.sub create_palette
    .param pmc main_screen
    .local pmc palette, col
    .local int r, g, b, color_type
    find_type  color_type, 'SDL::Color'
    palette = new .ResizablePMCArray
    r = -1
loop_r:
    $I0 = r
    if $I0 > 0 goto r0
    $I0 = 0
r0:
    g = -1
loop_g:    
    $I1 = g
    if $I1 > 0 goto g0
    $I1 = 0
g0:
    b = -1
loop_b:    
    $I2 = b
    if $I2 > 0 goto b0
    $I2 = 0
b0:
    col = new color_type
#    print_item $I0
#    print_item $I1
#    print_item $I2
#    print_newline
    col.'init'( 'r' => $I0, 'g' => $I1, 'b' => $I2 )
    push palette, col
    b += 36
    if b <= 255 goto loop_b
    g += 36
    if g <= 255 goto loop_g
    r += 36
    if r <= 255 goto loop_r
    .const .Sub by_bright = "bright"
    # palette.'sort'(by_bright)
    .local int i, n, raw_c
    n = elements palette
    .local pmc raw_palette
    raw_palette = new .FixedIntegerArray
    raw_palette = n
    i = 0
loop:    
    col = palette[i]
    raw_c = col.'color_for_surface'( main_screen )
    raw_palette[i] = raw_c
    inc i
    if i < n goto loop
    .return (palette, raw_palette)
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

=head2 Parrot based optimizations

Optimized build

  [2] plain runcore 64 bit                    3.0s
  [2] -C    runcore 64 bit                    1.5s
  [2] plain runcore 32 bit                    3.6s
  [2] -C    runcore 32 bit                    1.6s
  [1] -j                                      1.1s
  [2] -j                                      0.8s

=head1 SEE ALSO

L<http://en.wikipedia.org/wiki/Mandelbrot_set>

If you want faster mandelbrot with iteractive zooming use Xaos:

L<http://xaos.sourceforge.net/english.php>

=cut
