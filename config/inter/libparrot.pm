# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id: libparrot.pm $

=head1 NAME

config/inter/libparrot.pm - Determines build information for libparrot

=head1 DESCRIPTION

libparrot is the library containing the parrot VM. This configuration
step determines whether it should be build static or shared.

=cut

package inter::libparrot;

use strict;
use vars qw($description $result @args);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step ':inter';

$description = 'Determine if libparrot should be a shared library...';

@args = qw(ask verbose libparrot_is_shared);

sub runstep {
    my ($self, $conf) = @_;
    my ($ask, $verbose, $libparrot_is_shared) = @_;

    $libparrot_is_shared =
	integrate($conf->data->get('libparrot_is_shared'),
		  $libparrot_is_shared);

    if ($conf->options->get('ask'))
    {
	$libparrot_is_shared=
	    prompt("\nShould libparrot be built as a shared library?",
		   $libparrot_is_shared ? 'y' : 'n');

	$libparrot_is_shared = lc($libparrot_is_shared) eq 'y';
    }

    $conf->data->set
	(libparrot_is_shared => $libparrot_is_shared,
	 
	 libparrot => $libparrot_is_shared
	 ? '$(LIBPARROT_SHARED)'
	 : '$(LIBPARROT_STATIC)',
	);

    $conf->data->set(
	 rpath_blib => ($libparrot_is_shared) 
     ?
         $conf->data->get('rpath') . 
         $conf->data->get('build_dir') . 
         $conf->data->get('slash') . 
         $conf->data->get('blib_dir')
     : ''
    );

    $conf->data->set(
     libparrot_ldflags => ($libparrot_is_shared)
     ? '-L' . $conf->data->get('blib_dir') . ' -lparrot'
     : ''
    );

    $result = $libparrot_is_shared ? 'yes' : 'no';
}

1;
