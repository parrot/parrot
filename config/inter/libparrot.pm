# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/inter/libparrot.pm - Determines build information for libparrot

=head1 DESCRIPTION

libparrot is the library containing the parrot VM. This configuration
step determines whether it should be build static or shared.

=cut

package inter::libparrot;

use strict;
use vars qw($description @args);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step ':inter';

$description = 'Determine if parrot should be linked against a shared library...';

@args = qw(ask parrot_is_shared);

sub runstep {
    my ($self, $conf) = @_;
    my $parrot_is_shared = $conf->options->get('parrot_is_shared');

    $parrot_is_shared =
        integrate($conf->data->get('parrot_is_shared'),
            $parrot_is_shared);

    $parrot_is_shared = 0 unless $conf->data->get('has_dynamic_linking');

    if ($conf->options->get('ask') && $conf->data->get('has_dynamic_linking'))
    {
        $parrot_is_shared=
            prompt("\nShould parrot be built using a shared library?",
                $parrot_is_shared ? 'y' : 'n');

        $parrot_is_shared = lc($parrot_is_shared) eq 'y';
    }

    $conf->data->set(
        parrot_is_shared => $parrot_is_shared,  

        libparrot => $parrot_is_shared         
            ? '$(LIBPARROT_SHARED)'      
            : '$(LIBPARROT_STATIC)',
    );                       

    $conf->data->set(
        rpath_blib => ($parrot_is_shared && $conf->data->get('rpath'))
        ? $conf->data->get('rpath')
          .  $conf->data->get('build_dir')
          .  $conf->data->get('slash')
          .  $conf->data->get('blib_dir')
        : ''
    );

    unless (defined($conf->data->get('libparrot_ldflags'))) {
        $conf->data->set(
            libparrot_ldflags => ($parrot_is_shared)
            ? '-L' . $conf->data->get('build_dir')
                   . $conf->data->get('slash')
                   . $conf->data->get('blib_dir') . ' -lparrot'
            : $conf->data->get('libparrot')
        );
    }

    $self->set_result($parrot_is_shared ? 'yes' : 'no');

    return $self;
}

1;
