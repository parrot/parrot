

=head1 NAME

SDL::LCD - A LCD object

=head1 SYNOPSIS

    # create an LCD
    lcd = new ['SDL'; 'LCD']

    # set the LCD position
    lcd."xpos"( 10 )
    lcd."ypos"( 10 )

    # set the LCD content
    lcd = "-01:23.4"

    # draw the LCD
    lcd."draw"( screen )

=head1 DESCRIPTION

Displays a liquid crystal display (LCD) with a variable
number of digits. Supported are 0-9, a-f, ".", ":", "-" and blanks.

Each digit is 10 pixels width, plus 2 pixels space between the digits.
The height of each digit is 21 pixels.

=head1 METHODS

An SDL::LCD object has the following methods:

=over 4

=cut

.namespace ['SDL'; 'LCD']

.sub __onload :tag('load')
    .local pmc class
    class = get_class ['SDL'; 'LCD']
    if_null class, create_class
    .return()

  create_class:
    load_bytecode 'SDL/Image.pir'
    load_bytecode 'SDL/Rect.pir'

    .local pmc digits
    digits = new ['SDL'; 'Image']
    digits.'init'( 'runtime/parrot/library/SDL/LCD.png' )
    set_global 'digits', digits

    newclass class, ['SDL'; 'LCD']
    addattribute class, 'value'
    addattribute class, 'numdigits'
    addattribute class, 'xpos'
    addattribute class, 'ypos'
END:
.end

.sub init :vtable :method
    $P0 = new 'String'
    setattribute self, 'value', $P0

    $P0 = new 'Integer'
    $P0 = -1
    setattribute self, 'numdigits', $P0

    $P0 = new 'Integer'
    $P0 = 0
    setattribute self, 'xpos', $P0

    $P0 = new 'Integer'
    $P0 = 0
    setattribute self, 'ypos', $P0
.end

=item _digits( count )

Adjusts the minimum number of digits to display.

=cut

.sub _digits :method
    .param int val

    $P0 = getattribute self, 'numdigits'
    $P0 = val
.end

=item set_integer_native( val )

Sets the LCD content to display.

=cut

.sub set_integer_native :vtable :method
    .param int val

    $P0 = getattribute self, 'value'
    $P0 = val
.end

=item set_string_native( val )

Sets the LCD content to display.

=cut

.sub set_string_native :vtable :method
    .param string val

    $P0 = getattribute self, 'value'
    $P0 = val
.end

=item draw( screen )

Draws the LCD onto the specified screen.

=cut

.sub draw :method
    .param pmc screen

    .local string val
    .local int i
    .local int len
    .local pmc rect
    .local pmc drect
    .local pmc digits
    .local int xpos
    .local int ypos

    $P0 = getattribute self, 'value'
    val = $P0

    $P0 = getattribute self, 'numdigits'
    len = $P0

    $P0 = getattribute self, 'xpos'
    xpos = $P0

    $P0 = getattribute self, 'ypos'
    ypos = $P0

    if len != -1 goto NO_AUTOLEN
    len = length val
    branch LEN_OK
NO_AUTOLEN:

    val = clone val
    $I0 = length val
    $I0 = len - $I0
    if $I0 <= 0 goto LEN_OK
    $S0 = '0'
    repeat $S0, $S0, $I0
    concat $S0, val
    val = $S0
LEN_OK:

    rect           = new ['SDL'; 'Rect']
    rect.'init'()
    rect.'width'( 21 )
    rect.'height'( 21 )
    rect.'x'( 0 )
    rect.'y'( 0 )

    drect          = new ['SDL'; 'Rect']
    drect.'init'()
    drect.'width'( 10 )
    drect.'height'( 21 )
    drect.'x'( 0 )
    drect.'y'( 0 )

    digits         = get_global 'digits'

    i = 0
LOOP:
    if i >= len goto END
    $S0 = substr val, i, 1

    $I0 = $S0
    if $I0 != 0 goto OK

    $I1 = ord $S0

    $I0 = 0
    if $I1 == 48 goto OK

    $I0 = 10
    if $I1 == 65 goto OK
    if $I1 == 97 goto OK

    $I0 = 11
    if $I1 == 66 goto OK
    if $I1 == 98 goto OK

    $I0 = 12
    if $I1 == 67 goto OK
    if $I1 == 99 goto OK

    $I0 = 13
    if $I1 == 68 goto OK
    if $I1 == 100 goto OK

    $I0 = 14
    if $I1 == 69 goto OK
    if $I1 == 101 goto OK

    $I0 = 15
    if $I1 == 70 goto OK
    if $I1 == 102 goto OK

    $I0 = 16
    if $I1 == 46 goto OK

    $I0 = 17
    if $I1 == 58 goto OK

    $I0 = 18
    if $I1 == 32 goto OK

    $I0 = 19
OK:
    $I0 *= 10
    drect.'x'( $I0 )
    screen.'blit'( digits, drect, rect )

    $I0 = rect.'x'()
    add $I0, 12
    rect.'x'( $I0 )

    inc i
    branch LOOP
END:

    $I0 = len * 12
    $I0 -= 2
    rect.'x'( xpos )
    rect.'y'( ypos )
    rect.'width'( $I0 )
    rect.'height'( 21 )
    screen.'update_rect'( rect )
.end

=item xpos( val )

Sets the x position of the LCD.

=cut

.sub xpos :method
    .param int val

    $P0 = getattribute self, 'xpos'
    $P0 = val
.end

=item ypos( val )

Sets the y position of the LCD.

=cut

.sub ypos :method
    .param int val

    $P0 = getattribute self, 'ypos'
    $P0 = val
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
