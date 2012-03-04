

=head1 NAME

SDL::App - Parrot extension for SDL Applications

=head1 SYNOPSIS

    # load this library
    load_bytecode 'SDL/App.pir'

    # create a new SDL::App object
    .local pmc app

    app = new ['SDL'; 'App']

    # set the app's arguments
    .local pmc app_args
    app_args = new 'Hash'
    app_args[ 'height' ] = 480
    app_args[ 'width'  ] = 640
    app_args[ 'bpp'    ] =   0
    app_args[ 'flags'  ] =   1

    # initialize the object and get the main surface
    .local pmc main_surface
    main_surface = app.'BUILD'( app_args )

    # go to town filling, blitting, and updating the app
    # for example:
    main_surface.update()

    ...

    # then, shut down cleanly
    app.'quit'()

=head1 DESCRIPTION

The parrot SDL libraries require the C SDL library: See
L<http://www.libsdl.org/> for information on how to obtain and install
this library.

SDL::App is the entry point for all SDL Applications.  It handles most of the
other setup for you.  Trust me, there's a little bit -- if you care, it will
initialize the SDL library.

This object represents the main window and the associated drawing surface.
There should only be one of those per program.  As this represents an
L<SDL::Surface> object, you can call any method of that class on objects of
this class.

B<Note:> It's not yet complete.  Please let me know if you have added or would
like someone to add missing features.

=head1 METHODS

The SDL::App object has the following methods:

=over 4

=cut

.namespace [ 'SDL'; 'App' ]

.sub _initialize :tag('load')

    .include 'datatypes.pasm'
    load_bytecode 'SDL.pir'
    load_bytecode 'SDL/Surface.pir'
    load_bytecode 'SDL/Constants.pir'

    .local pmc app_class

    newclass     app_class, ['SDL'; 'App']
    addattribute app_class, 'height'
    addattribute app_class, 'width'
    addattribute app_class, 'bpp'
    addattribute app_class, 'flags'
    addattribute app_class, 'surface'

    .return()
.end

=item init( [ width => xxx ], [ height => xxx ], [ bpp => xx ], [ flags => xx ])

Initialize the new object with the necessary arguments.  The named arguments
areas follows:

=over 4

=item C<width>

the width of the main window, in pixels

=item C<height>

the height of the main window, in pixels

=item C<bpp>

the ideal bit depth of the screen to create.  Note that you may receive a
screen of different (possibly lesser) capabilities, as that's what SDL does.
If you pass C<0> here, you'll receive the recommended bit depth.

=item C<flags>

an integer value representing the proper SDL constants from C<SDL::Constants>.
See that module for ideas on what to pass here, or give me a better suggestion
about the interface here.

=back

=cut

.sub 'init' :method
    .param int width  :named('width')
    .param int height :named('height')
    .param int bpp    :named('bpp')
    .param int flags  :named('flags')

    .local pmc SetVideoMode
    SetVideoMode = get_hll_global ['SDL'; 'NCI'], 'SetVideoMode'

    .local pmc screen
    screen = SetVideoMode( width, height, bpp, flags )
    # XXX - need to check this here somehow
    # defined $I0, screen

    .local pmc main_surface
    new main_surface, ['SDL'; 'Surface']

    main_surface.'wrap_surface'( screen )

    .local pmc intvalue

    intvalue = new 'Integer'
    set intvalue, height
    setattribute self, 'height', intvalue

    intvalue = new 'Integer'
    set intvalue, width
    setattribute self, 'width', intvalue

    intvalue = new 'Integer'
    set intvalue, bpp
    setattribute self, 'bpp', intvalue

    intvalue = new 'Integer'
    set intvalue, flags
    setattribute self, 'flags', intvalue

    setattribute self, 'surface', main_surface

    .return()
.end

=item surface()

Returns the main surface.  This is an L<SDL::Surface>.

=cut

.sub surface :method
    .local pmc surface
    getattribute surface, self, 'surface'

    .return( surface )
.end

=item quit()

Quits the main window and shuts down SDL.  You probably only have one shot at
this.

=cut

.sub quit :method
    .local pmc SDL_Quit
    SDL_Quit = get_hll_global ['SDL'; 'NCI'], 'Quit'
    SDL_Quit()
.end

=item height()

Returns the height of the main window, in pixels.  This will likely move to
L<SDL::Surface>.

=cut

.sub height :method
    .local pmc height
    .local int result

    getattribute height, self, 'height'
    set result, height

    .return( result )
.end

=item width()

Returns the width of the main window, in pixels.  This will likely move to
L<SDL::Surface>.

=cut

.sub width :method
    .local pmc width
    .local int result

    getattribute width, self, 'width'
    set result, width

    .return( result )
.end

=item bpp()

Returns the bit depth of the main window, in pixels.

=cut

.sub bpp :method
    .local pmc bpp
    .local int result

    getattribute bpp, self, 'bpp'
    set result, bpp

    .return( result )
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
