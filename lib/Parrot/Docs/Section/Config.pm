# Copyright: 2004 The Perl Foundation.  All Rights Reserved.
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

use Parrot::Docs::Section;
@Parrot::Docs::Section::Config::ISA = qw(Parrot::Docs::Section);

use Parrot::Configure::RunSteps;

=item C<config_groups()>

Dynamically creates the Configuration section's groups by studying the
contents of C<@Parrot::Configure::RunSteps::steps>.

=cut

sub config_groups
{
	my $self = shift;
    my %groups = ();
    
    foreach my $path (@Parrot::Configure::RunSteps::steps)
    {
        my ($dir) = $path =~ m|^([^/]+)|o;
        
        push @{$groups{$dir}}, "config/$path";
    }
    
    my @groups = ();
    my %titles = (
        'init' => 'Initialization Steps',
        'inter' => 'User Dialogue Steps',
        'auto' => 'System Test Steps',
        'gen' => 'File Creation Steps',
    );
    
    foreach my $dir (qw(init inter auto gen))
    {
        push @groups,
            $self->new_group(
                $titles{$dir}, '',
                map {$self->new_item('', $_)} @{$groups{$dir}});
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
<code>Parrot::Configure::RunSteps</code>. The steps are listed below in the order in
which they are performed.',
		$self->new_item('', 'Configure.pl'),
		$self->config_groups,
        $self->new_group('Documentation', '',
		    $self->new_item('How to add new configuration steps.', 
		        'docs/configuration.pod')
		),
		$self->new_group('Library', '',
		    $self->new_item('PASM/IMC access to Parrot configuration data.', 
		        'library/config.imc')
		),
	);
}

=back

=cut

1;