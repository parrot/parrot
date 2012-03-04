

=head1 NAME

SDL::Image - Parrot class representing images in Parrot SDL

=head1 SYNOPSIS

    # load this library
    load_bytecode 'SDL/Image.pir'

    # create a new SDL::Image object
    .local pmc image
    image = new ['SDL'; 'Image']
    image.'init'( file => 'examples/sdl/parrot_small.png' )

    # blit and update this object as you like!

=head1 DESCRIPTION

SDL::Image objects represent images loaded from external files.  You'll need to
have the C<SDL_image> library installed to use this.

This class extends SDL::Surface, so any operations you can do on objects of
that class you can do on SDL::Image objects.

=head1 METHODS

An SDL::Image object has the following methods:

=over 4

=cut

.namespace [ 'SDL'; 'Image' ]

.sub _initialize :tag('load')
    .local pmc image_class

    image_class = get_class ['SDL'; 'Image']
    if_null image_class, create_class
    .return()

  create_class:
    .local pmc init_image
    init_image = get_hll_global ['SDL'], '_init_image'
    init_image()

    subclass image_class, ['SDL'; 'Surface'], ['SDL'; 'Image']
    .return()
.end

=item init( file => 'xxx' )

Given the string C<file> containing the path to a file to load, loads the
image.

=cut

.sub 'init' :method
    .param string filename :named( 'file' )

    .local pmc IMG_Load
    IMG_Load = get_hll_global ['SDL'; 'NCI'], 'IMG_Load'

    .local pmc image

    image = IMG_Load( filename )

    self.'wrap_surface'( image )

    .return()
.end

=back

=head1 AUTHOR

Written and maintained by chromatic, E<lt>chromatic at wgz dot orgE<gt>, with
suggestions from Jens Rieks.  Please send patches, feedback, and suggestions to
the Perl 6 Internals mailing list.

=head1 COPYRIGHT

Copyright (C) 2004-2008, Parrot Foundation.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
