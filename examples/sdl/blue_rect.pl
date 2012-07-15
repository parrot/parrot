# Copyright (C) 2001-2012, Parrot Foundation.

=head1 NAME

blue_rect.pl - draw a blue rectangle using the SDL library and NQP

=head1 SYNOPSIS

To run this file, execute the following command from the Parrot
directory:

    $ ./parrot compilers/nqp/nqp.pbc examples/sdl/blue_rect.pl

=head1 DESCRIPTION

This is a Perl script which draws a blue rectangle, using the SDL library
and NQP.

=cut

# load the SDL class libraries
PIR  q<  load_bytecode 'SDL/App.pir'   >;
PIR  q<  load_bytecode 'SDL/Rect.pir'  >;
PIR  q<  load_bytecode 'SDL/Color.pir' >;

# make sure NQP has class protoobjects for the SDL classes
Protomaker.new_proto('SDL::App');
Protomaker.new_proto('SDL::Rect');
Protomaker.new_proto('SDL::Color');

# create an SDL::App object
my $app := SDL::App.new();
$app.init( :height(480), :width(640), :bpp(0), :flags(1) );

# fetch the SDL::Surface representing the main window
my $main_screen := $app.surface();

# create an SDL::Rect object
my $rect := SDL::Rect.new();
$rect.init( :height(100), :width(100), :x(270), :y(190) );

# create an SDL::Color object
my $color := SDL::Color.new();
$color.init( :r(0), :g(0), :b(255) );

# draw the rectangle to the surface and update it
$main_screen.fill_rect( $rect, $color );
$main_screen.update_rect( $rect );

# pause for people to see it
PIR  q<  sleep 2  >;

# and that's it!
$app.quit();


=head1 AUTHOR

blue_rect.pl created by Patrick R. Michaud (pmichaud@pobox.com)
based on blue_rect.pir by chromatic (chromatic at wgz dot org).

=head1 COPYRIGHT

Copyright (C) 2004-2007, Parrot Foundation.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
