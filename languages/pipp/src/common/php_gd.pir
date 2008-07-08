# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_gd.pir - PHP gd  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<array gd_info()>



NOT IMPLEMENTED.

=cut

.sub 'gd_info'
    not_implemented()
.end

=item C<bool image2wbmp(resource im [, string filename [, int threshold]])>

Output WBMP image to browser or file

NOT IMPLEMENTED.

=cut

.sub 'image2wbmp'
    not_implemented()
.end

=item C<bool imagealphablending(resource im, bool on)>

Turn alpha blending mode on or off for the given image

NOT IMPLEMENTED.

=cut

.sub 'imagealphablending'
    not_implemented()
.end

=item C<bool imageantialias(resource im, bool on)>

Should antialiased functions used or not

NOT IMPLEMENTED.

=cut

.sub 'imageantialias'
    not_implemented()
.end

=item C<bool imagearc(resource im, int cx, int cy, int w, int h, int s, int e, int col)>

Draw a partial ellipse

NOT IMPLEMENTED.

=cut

.sub 'imagearc'
    not_implemented()
.end

=item C<bool imagechar(resource im, int font, int x, int y, string c, int col)>

Draw a character

NOT IMPLEMENTED.

=cut

.sub 'imagechar'
    not_implemented()
.end

=item C<bool imagecharup(resource im, int font, int x, int y, string c, int col)>

Draw a character rotated 90 degrees counter-clockwise

NOT IMPLEMENTED.

=cut

.sub 'imagecharup'
    not_implemented()
.end

=item C<int imagecolorallocate(resource im, int red, int green, int blue)>

Allocate a color for an image

NOT IMPLEMENTED.

=cut

.sub 'imagecolorallocate'
    not_implemented()
.end

=item C<int imagecolorallocatealpha(resource im, int red, int green, int blue, int alpha)>

Allocate a color with an alpha level.  Works for true color and palette based images

NOT IMPLEMENTED.

=cut

.sub 'imagecolorallocatealpha'
    not_implemented()
.end

=item C<int imagecolorat(resource im, int x, int y)>

Get the index of the color of a pixel

NOT IMPLEMENTED.

=cut

.sub 'imagecolorat'
    not_implemented()
.end

=item C<int imagecolorclosest(resource im, int red, int green, int blue)>

Get the index of the closest color to the specified color

NOT IMPLEMENTED.

=cut

.sub 'imagecolorclosest'
    not_implemented()
.end

=item C<int imagecolorclosestalpha(resource im, int red, int green, int blue, int alpha)>

Find the closest matching colour with alpha transparency

NOT IMPLEMENTED.

=cut

.sub 'imagecolorclosestalpha'
    not_implemented()
.end

=item C<int imagecolorclosesthwb(resource im, int red, int green, int blue)>

Get the index of the color which has the hue, white and blackness nearest to the given color

NOT IMPLEMENTED.

=cut

.sub 'imagecolorclosesthwb'
    not_implemented()
.end

=item C<bool imagecolordeallocate(resource im, int index)>

De-allocate a color for an image

NOT IMPLEMENTED.

=cut

.sub 'imagecolordeallocate'
    not_implemented()
.end

=item C<int imagecolorexact(resource im, int red, int green, int blue)>

Get the index of the specified color

NOT IMPLEMENTED.

=cut

.sub 'imagecolorexact'
    not_implemented()
.end

=item C<int imagecolorexactalpha(resource im, int red, int green, int blue, int alpha)>

Find exact match for colour with transparency

NOT IMPLEMENTED.

=cut

.sub 'imagecolorexactalpha'
    not_implemented()
.end

=item C<bool imagecolormatch(resource im1, resource im2)>

Makes the colors of the palette version of an image more closely match the true color version

NOT IMPLEMENTED.

=cut

.sub 'imagecolormatch'
    not_implemented()
.end

=item C<int imagecolorresolve(resource im, int red, int green, int blue)>

Get the index of the specified color or its closest possible alternative

NOT IMPLEMENTED.

=cut

.sub 'imagecolorresolve'
    not_implemented()
.end

=item C<int imagecolorresolvealpha(resource im, int red, int green, int blue, int alpha)>

Resolve/Allocate a colour with an alpha level.  Works for true colour and palette based images

NOT IMPLEMENTED.

=cut

.sub 'imagecolorresolvealpha'
    not_implemented()
.end

=item C<void imagecolorset(resource im, int col, int red, int green, int blue)>

Set the color for the specified palette index

NOT IMPLEMENTED.

=cut

.sub 'imagecolorset'
    not_implemented()
.end

=item C<array imagecolorsforindex(resource im, int col)>

Get the colors for an index

NOT IMPLEMENTED.

=cut

.sub 'imagecolorsforindex'
    not_implemented()
.end

=item C<int imagecolorstotal(resource im)>

Find out the number of colors in an image's palette

NOT IMPLEMENTED.

=cut

.sub 'imagecolorstotal'
    not_implemented()
.end

=item C<int imagecolortransparent(resource im [, int col])>

Define a color as transparent

NOT IMPLEMENTED.

=cut

.sub 'imagecolortransparent'
    not_implemented()
.end

=item C<resource imageconvolution(resource src_im, array matrix3x3, double div, double offset)>

Apply a 3x3 convolution matrix, using coefficient div and offset

NOT IMPLEMENTED.

=cut

.sub 'imageconvolution'
    not_implemented()
.end

=item C<bool imagecopy(resource dst_im, resource src_im, int dst_x, int dst_y, int src_x, int src_y, int src_w, int src_h)>

Copy part of an image

NOT IMPLEMENTED.

=cut

.sub 'imagecopy'
    not_implemented()
.end

=item C<bool imagecopymerge(resource src_im, resource dst_im, int dst_x, int dst_y, int src_x, int src_y, int src_w, int src_h, int pct)>

Merge one part of an image with another

NOT IMPLEMENTED.

=cut

.sub 'imagecopymerge'
    not_implemented()
.end

=item C<bool imagecopymergegray(resource src_im, resource dst_im, int dst_x, int dst_y, int src_x, int src_y, int src_w, int src_h, int pct)>

Merge one part of an image with another

NOT IMPLEMENTED.

=cut

.sub 'imagecopymergegray'
    not_implemented()
.end

=item C<bool imagecopyresampled(resource dst_im, resource src_im, int dst_x, int dst_y, int src_x, int src_y, int dst_w, int dst_h, int src_w, int src_h)>

Copy and resize part of an image using resampling to help ensure clarity

NOT IMPLEMENTED.

=cut

.sub 'imagecopyresampled'
    not_implemented()
.end

=item C<bool imagecopyresized(resource dst_im, resource src_im, int dst_x, int dst_y, int src_x, int src_y, int dst_w, int dst_h, int src_w, int src_h)>

Copy and resize part of an image

NOT IMPLEMENTED.

=cut

.sub 'imagecopyresized'
    not_implemented()
.end

=item C<resource imagecreate(int x_size, int y_size)>

Create a new image

NOT IMPLEMENTED.

=cut

.sub 'imagecreate'
    not_implemented()
.end

=item C<resource imagecreatefromgd(string filename)>

Create a new image from GD file or URL

NOT IMPLEMENTED.

=cut

.sub 'imagecreatefromgd'
    not_implemented()
.end

=item C<resource imagecreatefromgd2(string filename)>

Create a new image from GD2 file or URL

NOT IMPLEMENTED.

=cut

.sub 'imagecreatefromgd2'
    not_implemented()
.end

=item C<resource imagecreatefromgd2part(string filename, int srcX, int srcY, int width, int height)>

Create a new image from a given part of GD2 file or URL

NOT IMPLEMENTED.

=cut

.sub 'imagecreatefromgd2part'
    not_implemented()
.end

=item C<resource imagecreatefromgif(string filename)>

Create a new image from GIF file or URL

NOT IMPLEMENTED.

=cut

.sub 'imagecreatefromgif'
    not_implemented()
.end

=item C<resource imagecreatefromjpeg(string filename)>

Create a new image from JPEG file or URL

NOT IMPLEMENTED.

=cut

.sub 'imagecreatefromjpeg'
    not_implemented()
.end

=item C<resource imagecreatefrompng(string filename)>

Create a new image from PNG file or URL

NOT IMPLEMENTED.

=cut

.sub 'imagecreatefrompng'
    not_implemented()
.end

=item C<resource imagecreatefromstring(string image)>

Create a new image from the image stream in the string

NOT IMPLEMENTED.

=cut

.sub 'imagecreatefromstring'
    not_implemented()
.end

=item C<resource imagecreatefromwbmp(string filename)>

Create a new image from WBMP file or URL

NOT IMPLEMENTED.

=cut

.sub 'imagecreatefromwbmp'
    not_implemented()
.end

=item C<resource imagecreatefromxbm(string filename)>

Create a new image from XBM file or URL

NOT IMPLEMENTED.

=cut

.sub 'imagecreatefromxbm'
    not_implemented()
.end

=item C<resource imagecreatefromxpm(string filename)>

Create a new image from XPM file or URL

NOT IMPLEMENTED.

=cut

.sub 'imagecreatefromxpm'
    not_implemented()
.end

=item C<resource imagecreatetruecolor(int x_size, int y_size)>

Create a new true color image

NOT IMPLEMENTED.

=cut

.sub 'imagecreatetruecolor'
    not_implemented()
.end

=item C<bool imagedashedline(resource im, int x1, int y1, int x2, int y2, int col)>

Draw a dashed line

NOT IMPLEMENTED.

=cut

.sub 'imagedashedline'
    not_implemented()
.end

=item C<bool imagedestroy(resource im)>

Destroy an image

NOT IMPLEMENTED.

=cut

.sub 'imagedestroy'
    not_implemented()
.end

=item C<bool imageellipse(resource im, int cx, int cy, int w, int h, int color)>

Draw an ellipse

NOT IMPLEMENTED.

=cut

.sub 'imageellipse'
    not_implemented()
.end

=item C<bool imagefill(resource im, int x, int y, int col)>

Flood fill

NOT IMPLEMENTED.

=cut

.sub 'imagefill'
    not_implemented()
.end

=item C<bool imagefilledarc(resource im, int cx, int cy, int w, int h, int s, int e, int col, int style)>

Draw a filled partial ellipse

NOT IMPLEMENTED.

=cut

.sub 'imagefilledarc'
    not_implemented()
.end

=item C<bool imagefilledellipse(resource im, int cx, int cy, int w, int h, int color)>

Draw an ellipse

NOT IMPLEMENTED.

=cut

.sub 'imagefilledellipse'
    not_implemented()
.end

=item C<bool imagefilledpolygon(resource im, array point, int num_points, int col)>

Draw a filled polygon

NOT IMPLEMENTED.

=cut

.sub 'imagefilledpolygon'
    not_implemented()
.end

=item C<bool imagefilledrectangle(resource im, int x1, int y1, int x2, int y2, int col)>

Draw a filled rectangle

NOT IMPLEMENTED.

=cut

.sub 'imagefilledrectangle'
    not_implemented()
.end

=item C<bool imagefilltoborder(resource im, int x, int y, int border, int col)>

Flood fill to specific color

NOT IMPLEMENTED.

=cut

.sub 'imagefilltoborder'
    not_implemented()
.end

=item C<bool imagefilter(resource src_im, int filtertype, [args] )>

Applies Filter an image using a custom angle

NOT IMPLEMENTED.

=cut

.sub 'imagefilter'
    not_implemented()
.end

=item C<int imagefontheight(int font)>

Get font height

NOT IMPLEMENTED.

=cut

.sub 'imagefontheight'
    not_implemented()
.end

=item C<int imagefontwidth(int font)>

Get font width

NOT IMPLEMENTED.

=cut

.sub 'imagefontwidth'
    not_implemented()
.end

=item C<array imageftbbox(float size, float angle, string font_file, string text [, array extrainfo])>

Give the bounding box of a text using fonts via freetype2

NOT IMPLEMENTED.

=cut

.sub 'imageftbbox'
    not_implemented()
.end

=item C<array imagefttext(resource im, float size, float angle, int x, int y, int col, string font_file, string text [, array extrainfo])>

Write text to the image using fonts via freetype2

NOT IMPLEMENTED.

=cut

.sub 'imagefttext'
    not_implemented()
.end

=item C<bool imagegammacorrect(resource im, float inputgamma, float outputgamma)>

Apply a gamma correction to a GD image

NOT IMPLEMENTED.

=cut

.sub 'imagegammacorrect'
    not_implemented()
.end

=item C<bool imagegd(resource im [, string filename])>

Output GD image to browser or file

NOT IMPLEMENTED.

=cut

.sub 'imagegd'
    not_implemented()
.end

=item C<bool imagegd2(resource im [, string filename, [, int chunk_size, [, int type]]])>

Output GD2 image to browser or file

NOT IMPLEMENTED.

=cut

.sub 'imagegd2'
    not_implemented()
.end

=item C<bool imagegif(resource im [, string filename])>

Output GIF image to browser or file

NOT IMPLEMENTED.

=cut

.sub 'imagegif'
    not_implemented()
.end

=item C<resource imagegrabscreen()>

Grab a screenshot

NOT IMPLEMENTED.

=cut

.sub 'imagegrabscreen'
    not_implemented()
.end

=item C<resource imagegrabwindow(int window_handle [, int client_area])>

Grab a window or its client area using a windows handle (HWND property in COM instance)

NOT IMPLEMENTED.

=cut

.sub 'imagegrabwindow'
    not_implemented()
.end

=item C<int imageinterlace(resource im [, int interlace])>

Enable or disable interlace

NOT IMPLEMENTED.

=cut

.sub 'imageinterlace'
    not_implemented()
.end

=item C<bool imageistruecolor(resource im)>

return true if the image uses truecolor

NOT IMPLEMENTED.

=cut

.sub 'imageistruecolor'
    not_implemented()
.end

=item C<bool imagejpeg(resource im [, string filename [, int quality]])>

Output JPEG image to browser or file

NOT IMPLEMENTED.

=cut

.sub 'imagejpeg'
    not_implemented()
.end

=item C<bool imagelayereffect(resource im, int effect)>

Set the alpha blending flag to use the bundled libgd layering effects

NOT IMPLEMENTED.

=cut

.sub 'imagelayereffect'
    not_implemented()
.end

=item C<bool imageline(resource im, int x1, int y1, int x2, int y2, int col)>

Draw a line

NOT IMPLEMENTED.

=cut

.sub 'imageline'
    not_implemented()
.end

=item C<int imageloadfont(string filename)>

Load a new font

NOT IMPLEMENTED.

=cut

.sub 'imageloadfont'
    not_implemented()
.end

=item C<void imagepalettecopy(resource dst, resource src)>

Copy the palette from the src image onto the dst image

NOT IMPLEMENTED.

=cut

.sub 'imagepalettecopy'
    not_implemented()
.end

=item C<bool imagepng(resource im [, string filename])>

Output PNG image to browser or file

NOT IMPLEMENTED.

=cut

.sub 'imagepng'
    not_implemented()
.end

=item C<bool imagepolygon(resource im, array point, int num_points, int col)>

Draw a polygon

NOT IMPLEMENTED.

=cut

.sub 'imagepolygon'
    not_implemented()
.end

=item C<array imagepsbbox(string text, resource font, int size [, int space, int tightness, int angle])>

Return the bounding box needed by a string if rasterized

NOT IMPLEMENTED.

=cut

.sub 'imagepsbbox'
    not_implemented()
.end

=item C<int imagepscopyfont(int font_index)>

Make a copy of a font for purposes like extending or reenconding

NOT IMPLEMENTED.

=cut

.sub 'imagepscopyfont'
    not_implemented()
.end

=item C<bool imagepsencodefont(resource font_index, string filename)>

To change a fonts character encoding vector

NOT IMPLEMENTED.

=cut

.sub 'imagepsencodefont'
    not_implemented()
.end

=item C<bool imagepsextendfont(resource font_index, float extend)>

Extend or or condense (if extend < 1) a font

NOT IMPLEMENTED.

=cut

.sub 'imagepsextendfont'
    not_implemented()
.end

=item C<bool imagepsfreefont(resource font_index)>

Free memory used by a font

NOT IMPLEMENTED.

=cut

.sub 'imagepsfreefont'
    not_implemented()
.end

=item C<resource imagepsloadfont(string pathname)>

Load a new font from specified file

NOT IMPLEMENTED.

=cut

.sub 'imagepsloadfont'
    not_implemented()
.end

=item C<bool imagepsslantfont(resource font_index, float slant)>

Slant a font

NOT IMPLEMENTED.

=cut

.sub 'imagepsslantfont'
    not_implemented()
.end

=item C<array imagepstext(resource image, string text, resource font, int size, int foreground, int background, int xcoord, int ycoord [, int space, int tightness, float angle, int antialias])>

Rasterize a string over an image

NOT IMPLEMENTED.

=cut

.sub 'imagepstext'
    not_implemented()
.end

=item C<bool imagerectangle(resource im, int x1, int y1, int x2, int y2, int col)>

Draw a rectangle

NOT IMPLEMENTED.

=cut

.sub 'imagerectangle'
    not_implemented()
.end

=item C<resource imagerotate(resource src_im, float angle, int bgdcolor [, int ignoretransparent])>

Rotate an image using a custom angle

NOT IMPLEMENTED.

=cut

.sub 'imagerotate'
    not_implemented()
.end

=item C<bool imagesavealpha(resource im, bool on)>

Include alpha channel to a saved image

NOT IMPLEMENTED.

=cut

.sub 'imagesavealpha'
    not_implemented()
.end

=item C<bool imagesetbrush(resource image, resource brush)>

Set the brush image to $brush when filling $image with the "IMG_COLOR_BRUSHED" color

NOT IMPLEMENTED.

=cut

.sub 'imagesetbrush'
    not_implemented()
.end

=item C<bool imagesetpixel(resource im, int x, int y, int col)>

Set a single pixel

NOT IMPLEMENTED.

=cut

.sub 'imagesetpixel'
    not_implemented()
.end

=item C<bool imagesetstyle(resource im, array styles)>

Set the line drawing styles for use with imageline and IMG_COLOR_STYLED.

NOT IMPLEMENTED.

=cut

.sub 'imagesetstyle'
    not_implemented()
.end

=item C<bool imagesetthickness(resource im, int thickness)>

Set line thickness for drawing lines, ellipses, rectangles, polygons etc.

NOT IMPLEMENTED.

=cut

.sub 'imagesetthickness'
    not_implemented()
.end

=item C<bool imagesettile(resource image, resource tile)>

Set the tile image to $tile when filling $image with the "IMG_COLOR_TILED" color

NOT IMPLEMENTED.

=cut

.sub 'imagesettile'
    not_implemented()
.end

=item C<bool imagestring(resource im, int font, int x, int y, string str, int col)>

Draw a string horizontally

NOT IMPLEMENTED.

=cut

.sub 'imagestring'
    not_implemented()
.end

=item C<bool imagestringup(resource im, int font, int x, int y, string str, int col)>

Draw a string vertically - rotated 90 degrees counter-clockwise

NOT IMPLEMENTED.

=cut

.sub 'imagestringup'
    not_implemented()
.end

=item C<int imagesx(resource im)>

Get image width

NOT IMPLEMENTED.

=cut

.sub 'imagesx'
    not_implemented()
.end

=item C<int imagesy(resource im)>

Get image height

NOT IMPLEMENTED.

=cut

.sub 'imagesy'
    not_implemented()
.end

=item C<void imagetruecolortopalette(resource im, bool ditherFlag, int colorsWanted)>

Convert a true colour image to a palette based image with a number of colours, optionally using dithering.

NOT IMPLEMENTED.

=cut

.sub 'imagetruecolortopalette'
    not_implemented()
.end

=item C<array imagettfbbox(float size, float angle, string font_file, string text)>

Give the bounding box of a text using TrueType fonts

NOT IMPLEMENTED.

=cut

.sub 'imagettfbbox'
    not_implemented()
.end

=item C<array imagettftext(resource im, float size, float angle, int x, int y, int col, string font_file, string text)>

Write text to the image using a TrueType font

NOT IMPLEMENTED.

=cut

.sub 'imagettftext'
    not_implemented()
.end

=item C<int imagetypes(void)>

Return the types of images supported in a bitfield - 1=GIF, 2=JPEG, 4=PNG, 8=WBMP, 16=XPM

NOT IMPLEMENTED.

=cut

.sub 'imagetypes'
    not_implemented()
.end

=item C<bool imagewbmp(resource im [, string filename, [, int foreground]])>

Output WBMP image to browser or file

NOT IMPLEMENTED.

=cut

.sub 'imagewbmp'
    not_implemented()
.end

=item C<int imagexbm(int im, string filename [, int foreground])>

Output XBM image to browser or file

NOT IMPLEMENTED.

=cut

.sub 'imagexbm'
    not_implemented()
.end

=item C<bool jpeg2wbmp(string f_org, string f_dest, int d_height, int d_width, int threshold)>

Convert JPEG image to WBMP image

NOT IMPLEMENTED.

=cut

.sub 'jpeg2wbmp'
    not_implemented()
.end

=item C<bool png2wbmp(string f_org, string f_dest, int d_height, int d_width, int threshold)>

Convert PNG image to WBMP image

NOT IMPLEMENTED.

=cut

.sub 'png2wbmp'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
