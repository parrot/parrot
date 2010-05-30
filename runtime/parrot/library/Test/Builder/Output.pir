# $Id$

=head1 NAME

Test::Builder::Output - manages output for Test::Builder

=head1 SYNOPSIS

See L<Test::Builder>.

=head1 DESCRIPTION

This class controls the output filehandles for Test::Builder.  You probably do
not need to use it directly.

=head1 METHODS

This class defines the following methods:

=over 4

=cut

.namespace [ 'Test'; 'Builder'; 'Output' ]

.sub _initialize :load
	.local pmc   tbo_class
	newclass     tbo_class, [ 'Test'; 'Builder'; 'Output' ]
	addattribute tbo_class, 'output'
	addattribute tbo_class, 'diag_output'
.end

=item C<new( args_hash )>

Initializes a new Test::Builder::Output object (when you create it with
C<new>), passing optional arguments in C<args_hash>.  They are:

=over 4

=item C<output>

An IO PMC for the filehandle to which normal output should go.  This uses
STDOUT by default.

=item C<diag_output>

An IO PMC for the filehandle to which diagnostic output should go.  This uses
STDERR by default.

=back

=cut

.sub init_pmc :vtable :method
	.param pmc args

	.local pmc output
	.local pmc diag_output

	output = args['output']
	unless null output goto CHECK_ERROR_OUTPUT
        $P0 = getinterp
        output = $P0.'stdhandle'(1)

  CHECK_ERROR_OUTPUT:
	diag_output = args['diag_output']
	unless null diag_output goto SET_OUTPUT
        $P0 = getinterp
        diag_output = $P0.'stdhandle'(1)

  SET_OUTPUT:
	setattribute self, "output", output
	setattribute self, "diag_output", diag_output
.end

.sub output :method
	.local pmc output

	getattribute output, self, "output"

	.return( output )
.end

.sub diag_output :method
	.local pmc diag_output

	getattribute diag_output, self, "diag_output"

	.return( diag_output )
.end

=item C<write( message )>

Writes the string C<message> to the output filehandle, TAP-escaping any
unescaped newlines.

=cut

.sub write :method
	.param string message

	.local int message_length
	message_length = length message
	if message_length > 0 goto HAVE_MESSAGE
	.return()

  HAVE_MESSAGE:
	message = self.'escape_newlines'( message )

	.local pmc output
	output = self.'output'()
	output.'puts'( message )
.end

.sub escape_newlines :method
	.param string message
	.local pmc lines
	lines = new 'ResizableStringArray'

	.local int newline_index
	.local string line

  SPLIT_LOOP:
  	newline_index = index message, "\n"
	if newline_index == -1 goto END_LOOP
	inc newline_index
	line    = substr message, 0, newline_index
	message = replace message, 0, newline_index, ''
	push lines, line
	if message goto SPLIT_LOOP

  END_LOOP:
  	push lines, message

	# loop from 0 to index of final element,
	# so keep i less than num_lines
	.local int num_lines
	num_lines = lines

	.local int i
	i = 0

	.local string first_char

  LOOP:
    if i == 0 goto LINE_OK
  	line       = lines[i]
  	first_char = substr line, 0, 1
	if first_char == '#' goto LINE_OK

	.local string new_line
	new_line = '# '
	concat new_line, line
	lines[i] = new_line

  LINE_OK:

  	inc i
	if i < num_lines goto LOOP

	message = join '', lines
	concat message, "\n"

	.return( message )
.end

=item C<diag( message, ... )>

Writes the string C<message> to the diagnostic filehandle, TAP-escaping any
unescaped newlines.

=cut

.sub diag :method
	.param pmc args :slurpy
	.local string message
	message = join '', args

	.local int message_length
	message_length = length message
	if message_length > 0 goto HAVE_MESSAGE
	.return()

  HAVE_MESSAGE:
	message = self.'escape_newlines'( message )

	.local string first_char
	first_char = substr message, 0, 1
	if first_char == '#' goto WRITE_MESSAGE

	first_char = '# '
	concat first_char, message
	message = first_char

  WRITE_MESSAGE:
	.local pmc diag_output
	diag_output = self.'diag_output'()
	.tailcall diag_output.'puts'( message )
.end

=back

=head1 AUTHOR

Written and maintained by chromatic, C<< chromatic at wgz dot org >>, based on
the Perl 6 port he wrote, based on the original Perl 5 version he wrote with
ideas from Michael G. Schwern.  Please send patches, feedback, and suggestions
to the Perl 6 internals mailing list.

=head1 COPYRIGHT

Copyright (C) 2005-2008, Parrot Foundation.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
