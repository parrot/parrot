# Copyright (C) 2004, The Perl Foundation.
# $Id$

=head1 NAME

Parrot::Docs::Section::Config - Configuration documentation section

=head1 SYNOPSIS

	use Parrot::Docs::Section::Config;

=head1 DESCRIPTION

A documentation section describing Parrot's configuration system.

=head2 Class Methods

=over

=cut

package Parrot::Docs::Section::Config;

use strict;
use warnings;

use base qw( Parrot::Docs::Section );

=item C<config_groups()>

Dynamically creates the Configuration section's groups by studying the
contents of C<@Parrot::Configure::steps>.

=cut

sub config_groups
{
    my $self = shift;
    my $dist = Parrot::Distribution->new;
    
    my @groups = ();
    my %titles = (
        'init' => 'Initialization Steps',
        'inter' => 'User Dialogue Steps',
        'auto' => 'System Test Steps',
        'gen' => 'File Creation Steps',
    );
    
    foreach my $group (qw(init inter auto gen))
    {
        my $dir = $dist->existing_directory_with_name('config/' . $group);
        my @files = $dir->files_with_suffix('pm', 1);    
        push @groups,
            $self->new_group(
                $titles{$group}, '',
                map {$self->new_item('', $dist->relative_path($_))} @files);
    }
    
    return @groups;
}

=item C<new()>

Returns a new section.

=cut

sub new
{
	my $self = shift;
	
	return $self->SUPER::new(
		'Configuration', 'config.html', 'Parrot is configured by running
the <i>Configure.pl</i> script. This is essentially just a wrapper around
<code>Parrot::Configure</code>. The steps are listed below in the order in
which they are performed.',
		$self->new_item('', 'Configure.pl'),
		$self->config_groups,
        $self->new_group('Documentation', '',
		    $self->new_item('How to add new configuration steps.', 
		        'docs/configuration.pod')
		),
		$self->new_group('Library', '',
		    $self->new_item('PASM/IMC access to Parrot configuration data.', 
		        'runtime/parrot/library/config.pir')
		),
	);
}

=back

=cut

1;
