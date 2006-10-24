package Parrot::Interpreter;

our $VERSION = '0.02';

use Parrot::Embed;

1;

__END__

=head1 NAME

Parrot::Interpreter - access a Parrot interpreter from Perl 5

=head1 VERSION

Version 0.02

=head1 SYNOPSIS

	# the first interpreter created in the program
	my $interp       = Parrot::Interpreter->new();

	# all subsequent interpreters need a parent
	my $child_interp = $interp->new( $interp );

	# load a file that Parrot can recognize as code
	$interp->load_file( 'some_parrot_file.pbc' );
	$interp->load_file( 'some_parrot_file.pir' );
	$interp->load_file( 'some_parrot_file.pasm' );

	# compile a string of Parrot code
	$interp->compile( $some_parrot_code );

	# find a subroutine to invoke
	my $sub_pmc       = $interp->find_global( 'some_parrot_sub' );
	my $other_sub_pmc = $interp->find_global( 'another_sub', 'NameSpace' );

	# invoke the subroutine
	my $result_pmc    = $sub_pmc->invoke( $signature, @args );

	# get the values out of it
	print "Invoking the Sub gave ", $result_pmc->get_string( $interp ), "!\n";

All Parrot access goes through an I<interpreter>, mediated through a
C<Parrot::Interpreter> object.  There is always one or more interpreters active
in a system.

An interpreter allows you to load code, to compile code, and to find and store
global symbols in Parrot.

=head3 Memory and Resource Implications

If you have multiple active interpreters, the second and subsequent
interpreters must each have an active interpreter as a parent.  In general,
this may not be an issue, but if you forget, you will receive strange error
messages.

Note that the parent interpreter must outlive its children, in Perl 5 terms.
In general, you do not need to worry about this.  However, if you cache these
objects, be aware that they do keep references to each other appropriately
internally.

As well, all C<Parrot::PMC> objects keep references to their parent
interpreters for similar reasons.

=head1 METHODS

This class provides several methods:

=over 4

=item * C<new( [ $parent ] )>

This class method creates and returns a new C<Parrot::Interpreter> object.  If
there is an existing and active C<Parrot::Interpreter> object, pass it as
C<$parent>.  Otherwise, pass no argument.

=item * C<load_file( $filename )>

Given the path to a file on disk, loads and compiles the code into the
interpreter.  This will throw an exception if Parrot could not load or compile
the code successfully.

=item * C<compile( $code )>

Given a string containing Parrot PIR code, compiles the code into the
interpreter.  This will return a C<Parrot::PMC> object representing the code.

A future version of this method may allow compiling other types of code.

=item * C<find_global( $name, [ $namespace ] )>

Given the name of a global and, optionally, the namespace of the global,
attempts to find a global PMC associated with that name in the invoking
interpreter.  This will return a C<Parrot::PMC> object if successful and
C<undef> if there is no PMC found.

This method right now supports only single-level string namespaces; this will
change in the future.

=back

=head1 AUTHOR

chromatic, C<< <chromatic at wgz.org> >>

=head1 BUGS

This code might be able to detect the presence or absence of a parent
interpreter and act appropriately.

This code needs to support more operations on interpreters.

Patches welcome.

Please report any bugs or feature requests to the Parrot Porters mailing list.
Someday there may be a CPAN version of this code.  Who knows?

=head1 COPYRIGHT & LICENSE

Copyright (c) 2006 The Perl Foundation / chromatic, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Parrot itself.
