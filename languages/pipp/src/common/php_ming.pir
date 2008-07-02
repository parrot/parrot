# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_ming.pir - PHP ming  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<int ming_keypress(string str)>

Returns the action flag for keyPress(char)

NOT IMPLEMENTED.

=cut

.sub 'ming_keypress'
    not_implemented()
.end

=item C<void ming_setcubicthreshold(int threshold)>

Set cubic threshold (?)

NOT IMPLEMENTED.

=cut

.sub 'ming_setcubicthreshold'
    not_implemented()
.end

=item C<void ming_setscale(int scale)>

Set scale (?)

NOT IMPLEMENTED.

=cut

.sub 'ming_setscale'
    not_implemented()
.end

=item C<void ming_useconstants(int use)>

Use constant pool (?)

NOT IMPLEMENTED.

=cut

.sub 'ming_useconstants'
    not_implemented()
.end

=item C<void ming_useswfversion(int version)>

Use SWF version (?)

NOT IMPLEMENTED.

=cut

.sub 'ming_useswfversion'
    not_implemented()
.end

=item C<void swfaction::__construct(string)>

Creates a new SWFAction object, compiling the given script

NOT IMPLEMENTED.

=cut

.sub 'swfaction::__construct'
    not_implemented()
.end

=item C<void swfbitmap::__construct(mixed file [, mixed maskfile])>

Creates a new SWFBitmap object from jpg (with optional mask) or dbl file

NOT IMPLEMENTED.

=cut

.sub 'swfbitmap::__construct'
    not_implemented()
.end

=item C<float swfbitmap::getHeight()>

Returns the height of this bitmap

NOT IMPLEMENTED.

=cut

.sub 'swfbitmap::getHeight'
    not_implemented()
.end

=item C<float swfbitmap::getWidth()>

Returns the width of this bitmap

NOT IMPLEMENTED.

=cut

.sub 'swfbitmap::getWidth'
    not_implemented()
.end

=item C<void swfbutton::__construct()>

Creates a new SWFButton object

NOT IMPLEMENTED.

=cut

.sub 'swfbutton::__construct'
    not_implemented()
.end

=item C<SWFSoundInstance swfbutton::addASound(SWFSound sound, int flags)>

associates a sound with a button transition
NOTE: the transitions are all wrong _UP, _OVER, _DOWN _HIT

NOT IMPLEMENTED.

=cut

.sub 'swfbutton::addASound'
    not_implemented()
.end

=item C<void swfbutton::addAction(object SWFAction, int flags)>

Sets the action to perform when conditions described in flags is met

NOT IMPLEMENTED.

=cut

.sub 'swfbutton::addAction'
    not_implemented()
.end

=item C<void swfbutton::addShape(object SWFCharacter, int flags)>

Sets the character to display for the condition described in flags

NOT IMPLEMENTED.

=cut

.sub 'swfbutton::addShape'
    not_implemented()
.end

=item C<void swfbutton::setAction(object SWFAction)>

Sets the action to perform when button is pressed

NOT IMPLEMENTED.

=cut

.sub 'swfbutton::setAction'
    not_implemented()
.end

=item C<void swfbutton::setDown(object SWFCharacter)>

Sets the character for this button's down state

NOT IMPLEMENTED.

=cut

.sub 'swfbutton::setDown'
    not_implemented()
.end

=item C<void swfbutton::setHit(object SWFCharacter)>

Sets the character for this button's hit test state

NOT IMPLEMENTED.

=cut

.sub 'swfbutton::setHit'
    not_implemented()
.end

=item C<void swfbutton::setMenu(int flag)>

enable track as menu button behaviour

NOT IMPLEMENTED.

=cut

.sub 'swfbutton::setMenu'
    not_implemented()
.end

=item C<void swfbutton::setOver(object SWFCharacter)>

Sets the character for this button's over state

NOT IMPLEMENTED.

=cut

.sub 'swfbutton::setOver'
    not_implemented()
.end

=item C<void swfbutton::setUp(object SWFCharacter)>

Sets the character for this button's up state

NOT IMPLEMENTED.

=cut

.sub 'swfbutton::setUp'
    not_implemented()
.end

=item C<void swfdisplayitem::addAction(object SWFAction, int flags)>

Adds this SWFAction to the given SWFSprite instance

NOT IMPLEMENTED.

=cut

.sub 'swfdisplayitem::addAction'
    not_implemented()
.end

=item C<void swfdisplayitem::addColor(int r, int g, int b [, int a])>

Sets the add color part of this SWFDisplayItem's CXform to (r, g, b [, a]), a defaults to 0

NOT IMPLEMENTED.

=cut

.sub 'swfdisplayitem::addColor'
    not_implemented()
.end

=item C<void swfdisplayitem::endMask()>

another way of defining a MASK layer

NOT IMPLEMENTED.

=cut

.sub 'swfdisplayitem::endMask'
    not_implemented()
.end

=item C<void swfdisplayitem::move(float dx, float dy)>

Displaces this SWFDisplayItem by (dx, dy) in movie coordinates

NOT IMPLEMENTED.

=cut

.sub 'swfdisplayitem::move'
    not_implemented()
.end

=item C<void swfdisplayitem::moveTo(int x, int y)>

Moves this SWFDisplayItem to movie coordinates (x, y)

NOT IMPLEMENTED.

=cut

.sub 'swfdisplayitem::moveTo'
    not_implemented()
.end

=item C<void swfdisplayitem::multColor(float r, float g, float b [, float a])>

Sets the multiply color part of this SWFDisplayItem's CXform to (r, g, b [, a]), a defaults to 1.0

NOT IMPLEMENTED.

=cut

.sub 'swfdisplayitem::multColor'
    not_implemented()
.end

=item C<void swfdisplayitem::rotate(float degrees)>

Rotates this SWFDisplayItem the given (clockwise) degrees from its current orientation

NOT IMPLEMENTED.

=cut

.sub 'swfdisplayitem::rotate'
    not_implemented()
.end

=item C<void swfdisplayitem::rotateTo(float degrees)>

Rotates this SWFDisplayItem the given (clockwise) degrees from its original orientation

NOT IMPLEMENTED.

=cut

.sub 'swfdisplayitem::rotateTo'
    not_implemented()
.end

=item C<void swfdisplayitem::scale(float xScale, float yScale)>

Multiplies this SWFDisplayItem's current x scale by xScale, its y scale by yScale

NOT IMPLEMENTED.

=cut

.sub 'swfdisplayitem::scale'
    not_implemented()
.end

=item C<void swfdisplayitem::scaleTo(float xScale [, float yScale])>

Scales this SWFDisplayItem by xScale in the x direction, yScale in the y, or both to xScale if only one arg

NOT IMPLEMENTED.

=cut

.sub 'swfdisplayitem::scaleTo'
    not_implemented()
.end

=item C<void swfdisplayitem::setDepth(int depth)>

Sets this SWFDisplayItem's z-depth to depth.  Items with higher depth values are drawn on top of those with lower values

NOT IMPLEMENTED.

=cut

.sub 'swfdisplayitem::setDepth'
    not_implemented()
.end

=item C<void swfdisplayitem::setMaskLevel(int level)>

defines a MASK layer at level

NOT IMPLEMENTED.

=cut

.sub 'swfdisplayitem::setMaskLevel'
    not_implemented()
.end

=item C<void swfdisplayitem::setMatrix(float a, float b, float c, float d, float x, float y)>

Sets the item's transform matrix

NOT IMPLEMENTED.

=cut

.sub 'swfdisplayitem::setMatrix'
    not_implemented()
.end

=item C<void swfdisplayitem::setName(string name)>

Sets this SWFDisplayItem's name to name

NOT IMPLEMENTED.

=cut

.sub 'swfdisplayitem::setName'
    not_implemented()
.end

=item C<void swfdisplayitem::setRatio(float ratio)>

Sets this SWFDisplayItem's ratio to ratio.  Obviously only does anything if displayitem was created from an SWFMorph

NOT IMPLEMENTED.

=cut

.sub 'swfdisplayitem::setRatio'
    not_implemented()
.end

=item C<void swfdisplayitem::skewX(float xSkew)>

Adds xSkew to this SWFDisplayItem's x skew value

NOT IMPLEMENTED.

=cut

.sub 'swfdisplayitem::skewX'
    not_implemented()
.end

=item C<void swfdisplayitem::skewXTo(float xSkew)>

Sets this SWFDisplayItem's x skew value to xSkew

NOT IMPLEMENTED.

=cut

.sub 'swfdisplayitem::skewXTo'
    not_implemented()
.end

=item C<void swfdisplayitem::skewY(float ySkew)>

Adds ySkew to this SWFDisplayItem's y skew value

NOT IMPLEMENTED.

=cut

.sub 'swfdisplayitem::skewY'
    not_implemented()
.end

=item C<void swfdisplayitem::skewYTo(float ySkew)>

Sets this SWFDisplayItem's y skew value to ySkew

NOT IMPLEMENTED.

=cut

.sub 'swfdisplayitem::skewYTo'
    not_implemented()
.end

=item C<void swffill::__construct()>

Creates a new SWFFill object

NOT IMPLEMENTED.

=cut

.sub 'swffill::__construct'
    not_implemented()
.end

=item C<void swffill::moveTo(float x, float y)>

Moves this SWFFill to shape coordinates (x,y)

NOT IMPLEMENTED.

=cut

.sub 'swffill::moveTo'
    not_implemented()
.end

=item C<void swffill::rotateTo(float degrees)>

Rotates this SWFFill the given (clockwise) degrees from its original orientation

NOT IMPLEMENTED.

=cut

.sub 'swffill::rotateTo'
    not_implemented()
.end

=item C<void swffill::scaleTo(float xScale [, float yScale])>

Scales this SWFFill by xScale in the x direction, yScale in the y, or both to xScale if only one arg

NOT IMPLEMENTED.

=cut

.sub 'swffill::scaleTo'
    not_implemented()
.end

=item C<void swffill::skewXTo(float xSkew)>

Sets this SWFFill's x skew value to xSkew

NOT IMPLEMENTED.

=cut

.sub 'swffill::skewXTo'
    not_implemented()
.end

=item C<void swffill::skewYTo(float ySkew)>

Sets this SWFFill's y skew value to ySkew

NOT IMPLEMENTED.

=cut

.sub 'swffill::skewYTo'
    not_implemented()
.end

=item C<void swffont::__construct(string filename)>

Creates a new SWFFont object from given file

NOT IMPLEMENTED.

=cut

.sub 'swffont::__construct'
    not_implemented()
.end

=item C<void swffont::addChars(string)>

adds characters to a font required within textfields

NOT IMPLEMENTED.

=cut

.sub 'swffont::addChars'
    not_implemented()
.end

=item C<float swffont::getAscent()>

Returns the ascent of the font, or 0 if not available

NOT IMPLEMENTED.

=cut

.sub 'swffont::getAscent'
    not_implemented()
.end

=item C<float swffont::getDescent()>

Returns the descent of the font, or 0 if not available

NOT IMPLEMENTED.

=cut

.sub 'swffont::getDescent'
    not_implemented()
.end

=item C<float swffont::getLeading()>

Returns the leading of the font, or 0 if not available

NOT IMPLEMENTED.

=cut

.sub 'swffont::getLeading'
    not_implemented()
.end

=item C<string swffont::getShape(code)>

Returns the glyph shape of a char as a text string

NOT IMPLEMENTED.

=cut

.sub 'swffont::getShape'
    not_implemented()
.end

=item C<int swffont::getUTF8Width(string)>

Calculates the width of the given string in this font at full height

NOT IMPLEMENTED.

=cut

.sub 'swffont::getUTF8Width'
    not_implemented()
.end

=item C<int swffont::getWideWidth(string)>

Calculates the width of the given string in this font at full height

NOT IMPLEMENTED.

=cut

.sub 'swffont::getWideWidth'
    not_implemented()
.end

=item C<float swffont::getWidth(string str)>

Calculates the width of the given string in this font at full height

NOT IMPLEMENTED.

=cut

.sub 'swffont::getWidth'
    not_implemented()
.end

=item C<void swffontcha::raddChars(string)>

adds characters to a font for exporting font

NOT IMPLEMENTED.

=cut

.sub 'swffontcha::raddChars'
    not_implemented()
.end

=item C<void swffontchar::addChars(string)>

adds characters to a font for exporting font

NOT IMPLEMENTED.

=cut

.sub 'swffontchar::addChars'
    not_implemented()
.end

=item C<void swfgradient::__construct()>

Creates a new SWFGradient object

NOT IMPLEMENTED.

=cut

.sub 'swfgradient::__construct'
    not_implemented()
.end

=item C<void swfgradient::addEntry(float ratio, int r, int g, int b [, int a])>

Adds given entry to the gradient

NOT IMPLEMENTED.

=cut

.sub 'swfgradient::addEntry'
    not_implemented()
.end

=item C<void swfmorph::__construct()>

Creates a new SWFMorph object

NOT IMPLEMENTED.

=cut

.sub 'swfmorph::__construct'
    not_implemented()
.end

=item C<object swfmorph::getShape1()>

Return's this SWFMorph's start shape object

NOT IMPLEMENTED.

=cut

.sub 'swfmorph::getShape1'
    not_implemented()
.end

=item C<object swfmorph::getShape2()>

Return's this SWFMorph's start shape object

NOT IMPLEMENTED.

=cut

.sub 'swfmorph::getShape2'
    not_implemented()
.end

=item C<void swfmovie::__construct(int version)>

Creates swfmovie object according to the passed version

NOT IMPLEMENTED.

=cut

.sub 'swfmovie::__construct'
    not_implemented()
.end

=item C<object swfmovie::add(object SWFBlock)>



NOT IMPLEMENTED.

=cut

.sub 'swfmovie::add'
    not_implemented()
.end

=item C<void swfmovie::labelframe(string label)>

Labels frame

NOT IMPLEMENTED.

=cut

.sub 'swfmovie::labelframe'
    not_implemented()
.end

=item C<void swfmovie::namedanchor(string name)>



NOT IMPLEMENTED.

=cut

.sub 'swfmovie::namedanchor'
    not_implemented()
.end

=item C<void swfmovie::nextframe()>



NOT IMPLEMENTED.

=cut

.sub 'swfmovie::nextframe'
    not_implemented()
.end

=item C<int swfmovie::output([int compression])>



NOT IMPLEMENTED.

=cut

.sub 'swfmovie::output'
    not_implemented()
.end

=item C<void swfmovie::protect([ string pasword])>



NOT IMPLEMENTED.

=cut

.sub 'swfmovie::protect'
    not_implemented()
.end

=item C<void swfmovie::remove(object SWFBlock)>



NOT IMPLEMENTED.

=cut

.sub 'swfmovie::remove'
    not_implemented()
.end

=item C<int swfmovie::save(mixed where [, int compression])>

Saves the movie. 'where' can be stream and the movie will be saved there otherwise it is treated as string and written in file with that name

NOT IMPLEMENTED.

=cut

.sub 'swfmovie::save'
    not_implemented()
.end

=item C<int swfmovie::saveToFile(stream x [, int compression])>



NOT IMPLEMENTED.

=cut

.sub 'swfmovie::saveToFile'
    not_implemented()
.end

=item C<void swfmovie::setBackground(int r, int g, int b)>

Sets background color (r,g,b)

NOT IMPLEMENTED.

=cut

.sub 'swfmovie::setBackground'
    not_implemented()
.end

=item C<void swfmovie::setDimension(float x, float y)>

Sets movie dimension

NOT IMPLEMENTED.

=cut

.sub 'swfmovie::setDimension'
    not_implemented()
.end

=item C<void swfmovie::setFrames(int frames)>

Sets number of frames

NOT IMPLEMENTED.

=cut

.sub 'swfmovie::setFrames'
    not_implemented()
.end

=item C<void swfmovie::setRate(float rate)>

Sets movie rate

NOT IMPLEMENTED.

=cut

.sub 'swfmovie::setRate'
    not_implemented()
.end

=item C<int swfmovie::streamMP3(mixed file [, float skip])>

Sets sound stream of the SWF movie. The parameter can be stream or string. Retuens the number of frames.

NOT IMPLEMENTED.

=cut

.sub 'swfmovie::streamMP3'
    not_implemented()
.end

=item C<class swfprebuiltclip_init([file])>

Returns a SWFPrebuiltClip object

NOT IMPLEMENTED.

=cut

.sub 'swfprebuiltclip_init'
    not_implemented()
.end

=item C<void swfshape::__construct()>

Creates a new SWFShape object

NOT IMPLEMENTED.

=cut

.sub 'swfshape::__construct'
    not_implemented()
.end

=item C<object swfshape::addfill(mixed arg1, int arg2, [int b [, int a]])>

Returns a fill object, for use with swfshape_setleftfill and swfshape_setrightfill. If 1 or 2 parameter(s) is (are) passed first should be object (from gradient class) and the second int (flags). Gradient fill is performed. If 3 or 4 parameters are passed : r, g, b [, a]. Solid fill is performed.

NOT IMPLEMENTED.

=cut

.sub 'swfshape::addfill'
    not_implemented()
.end

=item C<void swfshape::drawarc(float r, float startAngle, float endAngle)>

Draws an arc of radius r centered at the current location, from angle startAngle to angle endAngle measured clockwise from 12 o'clock

NOT IMPLEMENTED.

=cut

.sub 'swfshape::drawarc'
    not_implemented()
.end

=item C<void swfshape::drawcircle(float r)>

Draws a circle of radius r centered at the current location, in a counter-clockwise fashion

NOT IMPLEMENTED.

=cut

.sub 'swfshape::drawcircle'
    not_implemented()
.end

=item C<void swfshape::drawcubic(float bx, float by, float cx, float cy, float dx, float dy)>

Draws a cubic bezier curve using the current position and the three given points as control points

NOT IMPLEMENTED.

=cut

.sub 'swfshape::drawcubic'
    not_implemented()
.end

=item C<void swfshape::drawcubic(float bx, float by, float cx, float cy, float dx, float dy)>

Draws a cubic bezier curve using the current position and the three given points as control points

NOT IMPLEMENTED.

=cut

.sub 'swfshape::drawcubic'
    not_implemented()
.end

=item C<void swfshape::drawcurve(float adx, float ady, float bdx, float bdy [, float cdx, float cdy])>

Draws a curve from the current pen position (x, y) to the point (x+bdx, y+bdy) in the current line style, using point (x+adx, y+ady) as a control point or draws a cubic bezier to point (x+cdx, x+cdy) with control points (x+adx, y+ady) and (x+bdx, y+bdy)

NOT IMPLEMENTED.

=cut

.sub 'swfshape::drawcurve'
    not_implemented()
.end

=item C<void swfshape::drawcurveto(float ax, float ay, float bx, float by [, float dx, float dy])>

Draws a curve from the current pen position (x,y) to the point (bx, by) in the current line style, using point (ax, ay) as a control point. Or draws a cubic bezier to point (dx, dy) with control points (ax, ay) and (bx, by)

NOT IMPLEMENTED.

=cut

.sub 'swfshape::drawcurveto'
    not_implemented()
.end

=item C<void swfshape::drawglyph(SWFFont font, string character [, int size])>

Draws the first character in the given string into the shape using the glyph definition from the given font

NOT IMPLEMENTED.

=cut

.sub 'swfshape::drawglyph'
    not_implemented()
.end

=item C<void swfshape::drawline(float dx, float dy)>

Draws a line from the current pen position (x, y) to the point (x+dx, y+dy) in the current line style

NOT IMPLEMENTED.

=cut

.sub 'swfshape::drawline'
    not_implemented()
.end

=item C<void swfshape::drawlineto(float x, float y)>

Draws a line from the current pen position to shape coordinates (x, y) in the current line style

NOT IMPLEMENTED.

=cut

.sub 'swfshape::drawlineto'
    not_implemented()
.end

=item C<void swfshape::movepen(float x, float y)>

Moves the pen from its current location by vector (x, y)

NOT IMPLEMENTED.

=cut

.sub 'swfshape::movepen'
    not_implemented()
.end

=item C<void swfshape::movepento(float x, float y)>

Moves the pen to shape coordinates (x, y)

NOT IMPLEMENTED.

=cut

.sub 'swfshape::movepento'
    not_implemented()
.end

=item C<void swfshape::setleftfill(int arg1 [, int g ,int b [,int a]])>

Sets the left side fill style to fill in case only one parameter is passed. When 3 or 4 parameters are passed they are treated as : int r, int g, int b, int a . Solid fill is performed in this case before setting left side fill type.

NOT IMPLEMENTED.

=cut

.sub 'swfshape::setleftfill'
    not_implemented()
.end

=item C<void swfshape::setleftfill(int arg1 [, int g ,int b [,int a]])>

Sets the right side fill style to fill in case only one parameter is passed. When 3 or 4 parameters are passed they are treated as : int r, int g, int b, int a . Solid fill is performed in this case before setting right side fill type.

NOT IMPLEMENTED.

=cut

.sub 'swfshape::setleftfill'
    not_implemented()
.end

=item C<void swfshape::setline(int width, int r, int g, int b [, int a])>

Sets the current line style for this SWFShape

NOT IMPLEMENTED.

=cut

.sub 'swfshape::setline'
    not_implemented()
.end

=item C<void swfsound::__construct(string filename, int flags)>

Creates a new SWFSound object from given file

NOT IMPLEMENTED.

=cut

.sub 'swfsound::__construct'
    not_implemented()
.end

=item C<void swfsprite::__construct()>

Creates a new SWFSprite object

NOT IMPLEMENTED.

=cut

.sub 'swfsprite::__construct'
    not_implemented()
.end

=item C<object swfsprite::add(object SWFCharacter)>

Adds the character to the sprite, returns a displayitem object

NOT IMPLEMENTED.

=cut

.sub 'swfsprite::add'
    not_implemented()
.end

=item C<void swfsprite::labelFrame(string label)>

Labels frame

NOT IMPLEMENTED.

=cut

.sub 'swfsprite::labelFrame'
    not_implemented()
.end

=item C<void swfsprite::nextFrame()>

Moves the sprite to the next frame

NOT IMPLEMENTED.

=cut

.sub 'swfsprite::nextFrame'
    not_implemented()
.end

=item C<void swfsprite::remove(object SWFDisplayItem)>

Remove the named character from the sprite's display list

NOT IMPLEMENTED.

=cut

.sub 'swfsprite::remove'
    not_implemented()
.end

=item C<void swfsprite::setFrames(int frames)>

Sets the number of frames in this SWFSprite

NOT IMPLEMENTED.

=cut

.sub 'swfsprite::setFrames'
    not_implemented()
.end

=item C<void swftext::__construct()>

Creates new SWFText object

NOT IMPLEMENTED.

=cut

.sub 'swftext::__construct'
    not_implemented()
.end

=item C<void swftext::addString(string text)>

Writes the given text into this SWFText object at the current pen position, using the current font, height, spacing, and color

NOT IMPLEMENTED.

=cut

.sub 'swftext::addString'
    not_implemented()
.end

=item C<void swftext::addUTF8String(string text)>

Writes the given text into this SWFText object at the current pen position,
using the current font, height, spacing, and color

NOT IMPLEMENTED.

=cut

.sub 'swftext::addUTF8String'
    not_implemented()
.end

=item C<void swftext::addWideString(string text)>

Writes the given text into this SWFText object at the current pen position,
using the current font, height, spacing, and color

NOT IMPLEMENTED.

=cut

.sub 'swftext::addWideString'
    not_implemented()
.end

=item C<float swftext::getAscent()>

Returns the ascent of the current font at its current size, or 0 if not available

NOT IMPLEMENTED.

=cut

.sub 'swftext::getAscent'
    not_implemented()
.end

=item C<float swftext::getDescent()>

Returns the descent of the current font at its current size, or 0 if not available

NOT IMPLEMENTED.

=cut

.sub 'swftext::getDescent'
    not_implemented()
.end

=item C<float swftext::getLeading()>

Returns the leading of the current font at its current size, or 0 if not available

NOT IMPLEMENTED.

=cut

.sub 'swftext::getLeading'
    not_implemented()
.end

=item C<double swftext::getUTF8Width(string)>

calculates the width of the given string in this text objects current font and size

NOT IMPLEMENTED.

=cut

.sub 'swftext::getUTF8Width'
    not_implemented()
.end

=item C<double swftext::getWideWidth(string)>

calculates the width of the given string in this text objects current font and size

NOT IMPLEMENTED.

=cut

.sub 'swftext::getWideWidth'
    not_implemented()
.end

=item C<float swftext::getWidth(string str)>

Calculates the width of the given string in this text objects current font and size

NOT IMPLEMENTED.

=cut

.sub 'swftext::getWidth'
    not_implemented()
.end

=item C<void swftext::moveTo(float x, float y)>

Moves this SWFText object's current pen position to (x, y) in text coordinates

NOT IMPLEMENTED.

=cut

.sub 'swftext::moveTo'
    not_implemented()
.end

=item C<void swftext::setColor(int r, int g, int b [, int a])>

Sets this SWFText object's current color to the given color

NOT IMPLEMENTED.

=cut

.sub 'swftext::setColor'
    not_implemented()
.end

=item C<void swftext::setFont(object font)>

Sets this SWFText object's current font to given font

NOT IMPLEMENTED.

=cut

.sub 'swftext::setFont'
    not_implemented()
.end

=item C<void swftext::setHeight(float height)>

Sets this SWFText object's current height to given height

NOT IMPLEMENTED.

=cut

.sub 'swftext::setHeight'
    not_implemented()
.end

=item C<void swftext::setSpacing(float spacing)>

Sets this SWFText object's current letterspacing to given spacing

NOT IMPLEMENTED.

=cut

.sub 'swftext::setSpacing'
    not_implemented()
.end

=item C<void swftextfield::__construct([int flags])>

Creates a new SWFTextField object

NOT IMPLEMENTED.

=cut

.sub 'swftextfield::__construct'
    not_implemented()
.end

=item C<void swftextfield::addChars(string)>

adds characters to a font that will be available within a textfield

NOT IMPLEMENTED.

=cut

.sub 'swftextfield::addChars'
    not_implemented()
.end

=item C<void swftextfield::addString(string str)>

Adds the given string to this textfield

NOT IMPLEMENTED.

=cut

.sub 'swftextfield::addString'
    not_implemented()
.end

=item C<void swftextfield::align(int alignment)>

Sets the alignment of this textfield

NOT IMPLEMENTED.

=cut

.sub 'swftextfield::align'
    not_implemented()
.end

=item C<void swftextfield::setBounds(float width, float height)>

Sets the width and height of this textfield

NOT IMPLEMENTED.

=cut

.sub 'swftextfield::setBounds'
    not_implemented()
.end

=item C<void swftextfield::setColor(int r, int g, int b [, int a])>

Sets the color of this textfield

NOT IMPLEMENTED.

=cut

.sub 'swftextfield::setColor'
    not_implemented()
.end

=item C<void swftextfield::setFont(object font)>

Sets the font for this textfield

NOT IMPLEMENTED.

=cut

.sub 'swftextfield::setFont'
    not_implemented()
.end

=item C<void swftextfield::setHeight(float height)>

Sets the font height of this textfield

NOT IMPLEMENTED.

=cut

.sub 'swftextfield::setHeight'
    not_implemented()
.end

=item C<void swftextfield::setIndentation(float indentation)>

Sets the indentation of the first line of this textfield

NOT IMPLEMENTED.

=cut

.sub 'swftextfield::setIndentation'
    not_implemented()
.end

=item C<void swftextfield::setLeftMargin(float margin)>

Sets the left margin of this textfield

NOT IMPLEMENTED.

=cut

.sub 'swftextfield::setLeftMargin'
    not_implemented()
.end

=item C<void swftextfield::setLineSpacing(float space)>

Sets the line spacing of this textfield

NOT IMPLEMENTED.

=cut

.sub 'swftextfield::setLineSpacing'
    not_implemented()
.end

=item C<void swftextfield::setMargins(float left, float right)>

Sets both margins of this textfield

NOT IMPLEMENTED.

=cut

.sub 'swftextfield::setMargins'
    not_implemented()
.end

=item C<void swftextfield::setName(string var_name)>

Sets the variable name of this textfield

NOT IMPLEMENTED.

=cut

.sub 'swftextfield::setName'
    not_implemented()
.end

=item C<void swftextfield::setPadding(float padding)>

Sets the padding of this textfield

NOT IMPLEMENTED.

=cut

.sub 'swftextfield::setPadding'
    not_implemented()
.end

=item C<void swftextfield::setRightMargin(float margin)>

Sets the right margin of this textfield

NOT IMPLEMENTED.

=cut

.sub 'swftextfield::setRightMargin'
    not_implemented()
.end

=item C<class swfvideostream_init([file])>

Returns a SWVideoStream object

NOT IMPLEMENTED.

=cut

.sub 'swfvideostream_init'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
