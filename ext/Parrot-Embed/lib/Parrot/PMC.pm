package Parrot::PMC;

our $VERSION = '0.02';

use Parrot::Embed;

1;

__END__

=head1 NAME

Parrot::PMC - access to a Parrot PMC from Perl 5

=head1 VERSION

Version 0.02

=head1 SYNOPSIS

	# find a subroutine to invoke
	my $sub_pmc       = $interp->find_global( 'some_parrot_sub' );
	my $other_sub_pmc = $interp->find_global( 'another_sub', 'NameSpace' );

	# invoke the subroutine
	my $result_pmc    = $interp->invoke( $sub_pmc, $signature, @args );

	# get the values out of it
	my $string_val    = $result_pmc->get_string( $interp );

=head1 AUTHOR

chromatic, C<< <chromatic at wgz.org> >>

=head1 BUGS

Please report any bugs or feature requests to the Parrot Porters mailing list.
Someday there may be a CPAN version of this code.  Who knows?

=head1 COPYRIGHT & LICENSE

Copyright (c) 2006 The Perl Foundation / chromatic, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Parrot itself.
