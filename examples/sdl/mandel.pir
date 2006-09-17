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
    .local pmc app
    .local int w, h
    .local float scale
    app = new 'SDL::App'
    # mandelbrot set is witdh [-2, 0.25] heigth [ -1, 1]
    # round up, scale *200
    scale = 0.005 # 1/200 XXX
    w = 600
    h = 400
    app.'init'( 'height' => h, 'width' => w, 'bpp' => 0, 'flags' => 1 )

    # fetch the SDL::Surface representing the main window
    .local pmc main_screen
    main_screen = app.'surface'()

    # create an SDL::Rect representing the entire main screen
    .local pmc rect
    rect = new 'SDL::Rect'
    rect.'init'( 'height' => h, 'width' => w, 'x' => 0, 'y' => 0 )

    .local pmc palette, raw_palette, black
    (palette, raw_palette) = create_palette(main_screen)
    # draw the background
    black = palette[0]
    main_screen.'fill_rect'( rect, black )
    main_screen.'update_rect'( rect )
    # lock the raw framebuffer
    main_screen.'lock'()
    .local int x, y, pal_elems, raw_c, k
    pal_elems = elements raw_palette
    y = 0
    .local float r, i, z, Z, t, c, C
    # surface prefetch opt
    .local pmc raw_surface
    .local int offset, offs_y
    raw_surface = main_screen.'surface'()
    offset = main_screen.'width'()
loop_y:
    offs_y = offset * y
    x = 0
    C = y * scale	# Im c part
    C -= 1.0        # ystart
    # draw hoizontal lines
loop_x:
    c = x * scale   # re c part
    c -= 2.0        # xstart 
    z = 0
    Z = 0
    r = c
    i = C
    k = 0
    # iteration loop, calculate
    # Z(k+1) = Z(k)^2 + c
    # bailout if abs(Z) > 2 or iteration limit of k is exceeded
loop_k:
    $N1 = z * z
    $N2 = Z * Z
    t = $N1 - $N2
    t += r

    # Z = 2*z*Z + i
    Z = 2 * Z
    Z = z * Z
    Z += i

    # z = t
    z = t

    # if (z*z + Z*Z > 4) break;
    $N1 = z * z
    $N2 = Z * Z
    $N1 += $N2
    if $N1 > 4 goto print
    inc k
    if k < 200 goto loop_k	# iterations
    k = 0
print:	
    $I0 = k % pal_elems
    raw_c = raw_palette[$I0]
    $I0 = offs_y + x
    # raw_pixels[$I0] = raw_c
    raw_surface[ 'pixels'; 'array'; $I0 ] = raw_c
    inc x
    if x < w goto loop_x
    # update the screen on each iteration
    main_screen.'update_rect'( rect )
    inc y
    if y < h goto loop_y

    main_screen.'unlock'()

    # show off for a bit then exit
    sleep 2
    app.'quit'()
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
    b += 32
    if b <= 255 goto loop_b
    g += 32
    if g <= 255 goto loop_g
    r += 32
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

Runtimes w/ unoptimized parrot,  plain runcore x86_64 AMD X2@2000
600 x 400 pixels,  200 iterations, 2s delay subtracted

=head2 Algorithm optimizations

  Original version based on sdl/raw_pixels   21s
  Create raw_palette                         12s
  Prefetch raw_surface                        6s

=head1 SEE ALSO

L<http://en.wikipedia.org/wiki/Mandelbrot_set>

If you want faster mandelbrot with iteractive zooming use Xaos:

L<http://xaos.sourceforge.net/english.php>

=cut
