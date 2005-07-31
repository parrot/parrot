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

.namespace [ 'Test::Builder::Output' ]

.sub _initialize @LOAD
	.local pmc   tbo_class
	newclass     tbo_class, 'Test::Builder::Output'
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

.sub __init method
	.param pmc args

	.local pmc output
	.local pmc diag_output

	output = args['output']
	if output goto CHECK_ERROR_OUTPUT
	getstdout output

  CHECK_ERROR_OUTPUT:
	diag_output = args['diag_output']
	if diag_output goto SET_OUTPUT
	getstderr diag_output

  SET_OUTPUT:
  	.local int offset
	classoffset offset, self, 'Test::Builder::Output'
	setattribute self, offset, output
	inc offset
	setattribute self, offset, diag_output
.end

.sub output method
	.local pmc output
	.local int offset

	classoffset offset, self, 'Test::Builder::Output'
	getattribute output, self, offset

	.return( output )
.end

.sub diag_output method
	.local pmc diag_output
	.local int offset

	classoffset offset, self, 'Test::Builder::Output'
	getattribute diag_output, self, offset

	.return( diag_output )
.end

=item C<write( message )>

Writes the string C<message> to the output filehandle, TAP-escaping any
unescaped newlines.

=cut

.sub write method
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

.sub escape_newlines method
	.param string message
	.local pmc lines
	lines = new ResizableStringArray

	.local int newline_index
	.local string line

  SPLIT_LOOP:
  	newline_index = index message, "\n"
	if newline_index == -1 goto END_LOOP
	line = substr message, 0, newline_index, ''
	push lines, line
	if message goto SPLIT_LOOP

  END_LOOP:
  	push lines, message
	.local int num_lines
	num_lines = lines

	# loop from 0 to index of final element
	dec num_lines

	.local int i
	i = 0

	.local string first_char
	.local string line

  LOOP:
    if i == 0 goto LINE_OK
  	line       = lines[i]
  	first_char = substr line, 0, 1
	eq_str first_char, '#', LINE_OK

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

=item C<diag( message )>

Writes the string C<message> to the diagnostic filehandle, TAP-escaping any
unescaped newlines.

=cut

.sub diag method
	.param string message

	.local int message_length
	message_length = length message
	if message_length > 0 goto HAVE_MESSAGE
	.return()

  HAVE_MESSAGE:
	message = self.'escape_newlines'( message )

	.local string first_char
	first_char = substr message, 0, 1
	eq_str first_char, '#', WRITE_MESSAGE

	first_char = '# '
	concat first_char, message
	message = first_char

  WRITE_MESSAGE:
	.local pmc diag_output
	diag_output = self.'diag_output'()
	diag_output.'puts'( message )
.end

=back

=head1 AUTHOR

Written and maintained by chromatic, C<< chromatic at wgz dot org >>, based on
the Perl 6 port he wrote, based on the original Perl 5 version he wrote with
ideas from Michael G. Schwern.  Please send patches, feedback, and suggestions
to the Perl 6 internals mailing list.

=head1 COPYRIGHT

Copyright (c) 2005, the Perl Foundation.

=cut
