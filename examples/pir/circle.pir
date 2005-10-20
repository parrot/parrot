# Copyright (C) 2005 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/pir/circle.pir - Draw a circle on any VT100-compatible screen

=head1 SYNOPSIS

    % ./parrot examples/pir/circle.pir

=head1 DESCRIPTION

This draws an ASCII-art representation of a circle (or oval) using only
integer arithmetic and no trig.

The algorithm is based on:

  cos(theta+delta) =
            cos(theta) -
            [alpha*cos(theta) + beta*sin(theta)]

and

  sin(theta+delta) =
            sin(theta) -
            [alpha*sin(theta) - beta*cos(theta)]

where

  alpha = 2*sin^2(delta/2) and beta = sin(delta)

(See Numerical Recipes in C / The Art of Scientific Computing)

In this program the value of delta is chosen to be 1/(1<<n) such
that it is small enough that

=over 4

=item * alpha is approximately 0

=item * beta is approximately delta

=back

=head1 AUTHOR

Written for parrot by Nick Glencross <nick.glencross@gmail.com>. Adapted
from a machine code program that I wrote for a BBC micro.

=head1 COPYRIGHT

Same as parrot.

=cut

.sub circle :main

    # These are configurable depending on your screen size
    .local int width, height
    width  = 80
    height = 24

    # Calculate screen scaling and offset constants
    .local int offset_x, offset_y, scale_x, scale_y
    offset_x = width  / 2
    offset_y = height / 2

    scale_x  = 140000 / width
    scale_y  = 140000 / height

     # Clear the screen
    print  "\033[H\033[2J"

     # Initialise values
    .local int x, y, counter
    x = 0
    y = 65536
    counter = 0

LOOP:

    # Calculate screen coordinates
    .local int screen_x, screen_y
    screen_x  = x / scale_x
    screen_x += offset_x

    screen_y  = y / scale_y
    screen_y += offset_y

    print  "\033["
    print  screen_y
    print  ";"
    print  screen_x
    print  "H*"

    # The magic to compute the next position
    .local int temp1, temp2
    temp1 = x >> 6
    temp2 = y >> 6
    x += temp2
    y -= temp1

    # Loop again
    inc counter
    if counter < 404 goto LOOP

    # Place cursor back at bottom of screen
    print  "\033["
    print  height
    print  ";0H"
    print "\n"

    # Done!
    end

.end

# vim: ft=imc sw=4:
