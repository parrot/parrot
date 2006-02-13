# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/inter/types.pm - Sizes for Parrot Types

=head1 DESCRIPTION

Asks the user which size integer, floating-point number and opcode types should
be.

=cut

package inter::types;

use strict;
use vars qw($description $result @args);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step ':inter';

$description = 'Determining what types Parrot should use...';

@args = qw(ask intval opcode floatval);

sub runstep
{
    my ($self, $conf) = @_;

    my $intval   = $conf->options->get('intval')   || 'long';
    my $floatval = $conf->options->get('floatval') || 'double';
    my $opcode   = $conf->options->get('opcode')   || 'long';

    if ($conf->options->get('ask')) {
        $intval   = prompt("\n\nHow big would you like your integers to be?", $intval);
        $floatval = prompt("And your floats?",                                $floatval);
        $opcode   = prompt("What's your native opcode type?",                 $opcode);
        print "\n";
    }

    $conf->data->set(
        iv       => $intval,
        nv       => $floatval,
        opcode_t => $opcode
    );

    return $self;
}

1;
