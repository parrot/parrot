package Parrot::PMC;

our $VERSION = '0.02';

use Parrot::Embed;

1;

__END__

=head1 NAME

Parrot::PMC - access a Parrot PMC from Perl 5

=head1 VERSION

Version 0.02

=head1 SYNOPSIS

	# find a subroutine to invoke
	my $sub_pmc       = $interp->find_global( 'some_parrot_sub' );
	my $other_sub_pmc = $interp->find_global( 'another_sub', 'NameSpace' );

	# invoke the subroutine
	my $result_pmc    = $sub_pmc->invoke( $signature, @args );

	# get the values out of it
	my $string_val    = $result_pmc->get_string( $interp );

=head1 METHODS

This object provides several methods:

=over 4

=item * C<invoke( $signature, $argument )>

Given a Sub PMC or derivative, calls the appropriate Parrot function, parsing
the C<$signature> and passing a single string C<$argument>.  The first
character of the C<$signature> string denotes the return value.  The remaining
characters are the argument values, per the list:

=over 4

=item v void (return only)

=item I integer

=item N float

=item S string

=item P PMC

=back

In the future, this method may handle this translation for you automatically,
though it may I<not> deduce the return type correctly.

=item * C<get_string()>

Retrieves the string value of the PMC.  Not all PMCs support this.

=back

=head1 AUTHOR

chromatic, C<< <chromatic at wgz.org> >>

=head1 BUGS

There are three known deficiencies.  First, there should be separate classes
for separate Parrot PMC types.  Second, there should be overloadings to handle
various types of getting and setting values on PMCs.  Third, the C<invoke()>
methods do not handle enough signatures.

Patches welcome.

Please report any bugs or feature requests to the Parrot Porters mailing list.
Someday there may be a CPAN version of this code.  Who knows?

=head1 COPYRIGHT & LICENSE

Copyright (c) 2006 The Perl Foundation / chromatic, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Parrot itself.
