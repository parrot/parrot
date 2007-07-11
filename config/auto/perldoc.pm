# Copyright (C) 2001-2007, The Perl Foundation.
# $Id$

=head1 NAME

config/auto/perldoc - Check whether perldoc works

=head1 DESCRIPTION

Determines whether perldoc exists on the system.

=cut

package auto::perldoc;

use strict;
use warnings;
use vars qw($description @args);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step ':auto', 'capture_output';

$description = 'Determining whether perldoc is installed';

@args = qw();

sub runstep {
    my ( $self, $conf ) = @_;

    my $version = 0;
    my $content = capture_output('perldoc -ud c99da7c4.tmp perldoc') || undef;

    if ( defined $content ) {
        if ( $content =~ m/^Unknown option:/ ) {
            $content = capture_output('perldoc perldoc') || '';
            $version = 1;
            $self->set_result('yes, old version');
        }
        else {
            if ( open my $FH, '<', 'c99da7c4.tmp' ) {
                local $/;
                $content = <$FH>;
                close $FH;
                $version = 2;
                $self->set_result('yes');
            }
            else {
                $content = undef;
            }
        }
        unless ( defined $content && $content =~ m/perldoc/ ) {
            $version = 0;
            $self->set_result('failed');
        }
    }
    else {
        $self->set_result('no');
    }
    unlink 'c99da7c4.tmp';

    $conf->data->set(
        has_perldoc => $version != 0 ? 1 : 0,
        new_perldoc => $version == 2 ? 1 : 0
    );

    return $self;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
