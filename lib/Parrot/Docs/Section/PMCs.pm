# Copyright: 2004 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::Docs::Section::PMCs - PMCs documentation section

=head1 SYNOPSIS

	use Parrot::Docs::Section::PMCs;

=head1 DESCRIPTION

A documentation section describing all the PMCs.

=head2 Class Methods

=over

=cut

package Parrot::Docs::Section::PMCs;

use strict;
use Parrot::Distribution;

use Parrot::Docs::Section;
@Parrot::Docs::Section::PMCs::ISA = qw(Parrot::Docs::Section);

=item C<new()>

Returns a new section.

=cut

sub new
{
	my $self = shift;
	my $dist = Parrot::Distribution->new;
    my $dir = $dist->existing_directory_with_name('classes');
	my @tools_items = ();
	
	foreach my $file ($dir->files_with_suffix('pl'))
	{
	    push(@tools_items, $self->new_item('', $dist->relative_path($file)));
	}
	
	my @concrete_items = ();
	my @abstract_items = ();
	
	foreach my $file ($dir->files_with_suffix('pmc'))
	{
	    my $code = $file->read;
	    
	    if ( $code =~ /^pmclass\s+[A-Z]/smo )
	    {
	        push(@concrete_items, 
	            $self->new_item('', $dist->relative_path($file)));
	    }
	    elsif ( $code =~ /^pmclass\s+[a-z]/smo )
	    {
	        push(@abstract_items, 
	            $self->new_item('', $dist->relative_path($file)));
	    }
	}
	
	return $self->SUPER::new(
		'PMCs', 'pmc.html', 
		'PMCs are Parrot\'s internal "classes". There are currently ' .
		    scalar(@abstract_items) .
		    ' abstract PMCs and ' .
		    scalar(@concrete_items) .
		    ' concrete PMCs.',
		$self->new_group('Tools', 'PMC-related tools.', @tools_items),
		$self->new_group(
	        'Abstract PMCs', 
	        'These PMCs are not instantiated.', 
	        @abstract_items
	    ),
		$self->new_group(
	        'Concrete PMCs', 
	        'These PMCs are instantiated.', 
	        @concrete_items
	    )
	);
}

=back

=cut

1;