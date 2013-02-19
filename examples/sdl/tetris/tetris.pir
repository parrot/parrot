
=head1 DESCRIPTION

tetris.pir - a second tetris for parrot (with parrot's SDL bindings)

=head1 SYNOPSIS

To run this file, be in the Parrot directory and run the following command:

	$ parrot examples/sdl/tetris/tetris.pir
	$

=head1 FUNCTIONS

=over 4

=item _main( argv )

The entry point of SDL applications.

=over 4

=item parameter C<argv>

Array with commandline parameters.

=back

=cut

.sub _main :main
    .param pmc argv
    .local pmc app

    load_bytecode "examples/sdl/tetris/app.pir"

    # create the tetris app
    app = new "Tetris::App"

    app."flag"( "show blocksize", 1 )
    # run the tetris app
    app."run"()

    # shutdown the app
    app."shutdown"()

    end
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
