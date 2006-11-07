# Copyright (C) 2005, The Perl Foundation.
# $Id$

=head1 NAME

config/auto/bc.pm - Check whether GNU bc works

=head1 DESCRIPTION

Determines whether GNU bc, the basic calculator, exists on the system. It is OK
when it doesn't exist. Currently GNU bc is only used for doublechecking Parrot
bc.

=cut

package auto::bc;

use strict;
use vars qw($description @args);

use base qw(Parrot::Configure::Step::Base);

use Config;
use Parrot::Configure::Step ':auto', 'capture_output';

$description = 'Determining whether GNU bc is installed';

@args = qw();

sub runstep
{
    my ($self, $conf) = @_;

    my $has_gnu_bc;
    my $osname = $Config{osname};

    # There were some problems with a hanging bc reported.
    # So check for bc only on selected platforms.
    # Linux should be a safe bet.
    # For Win32 bc is available on http://gnuwin32.sourceforge.net/
    my %bc_does_not_hang = (
        linux   => 1,
        MSWin32 => 1,
    );

    if ($bc_does_not_hang{$osname}) {

        # This seems to work for GNU bc 1.06
        my $answer = capture_output('bc', '-v') || '';
        $has_gnu_bc =
            ($answer =~ m/^bc / && $answer =~ m/Free Software Foundation/) ? 1 : 0;

    } else {
        $has_gnu_bc = 0;
    }

    $conf->data->set(has_gnu_bc => $has_gnu_bc);
    $self->set_result($has_gnu_bc ? 'yes' : 'no');

    return $self;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
