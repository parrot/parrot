# Copyright (C) 2005, The Perl Foundation.
# $Id$

=head1 NAME

config/auto/python - Check whether python is there

=head1 DESCRIPTION

Determines whether python is there. Checks also whether we have Python 2.4.

=head1 TODO

Store version of Python.

=cut

package auto::python;

use strict;
use vars qw($description @args);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step ':auto';

$description = 'Determining whether python is installed';

@args = qw();

sub runstep
{
    my ($self, $conf) = @_;

    my ($out, $err) = capture_output('python', '-V');
    my $output = join('', $out || '', $err || '');
    my ($python, $major, $minor, $revision) = $output =~ m/(Python)\s+(\d+).(\d+)(?:.(\d+))?/;
    $revision = 0 unless defined $revision;
    my $has_python = $python ? 1 : 0;

    $conf->data->set(has_python => $has_python);

    my $has_python_2_4 = 0;
    if ($has_python) {
        $has_python_2_4 = ($major eq '2' && $minor eq '4') ? 1 : 0;
        $self->set_result("yes, $major.$minor.$revision");
    } else {
        $self->set_result('no');
    }
    $conf->data->set(has_python_2_4 => $has_python_2_4);

    return $self;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
