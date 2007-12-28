# Copyright (C) 2001-2007, The Perl Foundation.
# $Id$

=head1 NAME

config/auto/perldoc - Check whether perldoc works

=head1 DESCRIPTION

Determines whether F<perldoc> exists on the system and, if so, which
version of F<perldoc> it is.

=cut

package auto::perldoc;

use strict;
use warnings;

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step ':auto';


sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Determining whether perldoc is installed};
    $data{args}        = [ qw(  ) ];
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $cmd = $conf->data->get_p5('scriptdir') . q{/perldoc};
    my $tmpfile = q{c99da7c4.tmp};
    my $content = capture_output("$cmd -ud $tmpfile perldoc") || undef;

    my $rv = _initial_content_check($conf, $content);
    return 1 if $rv;

    my $version = $self->_analyze_perldoc($cmd, $tmpfile, $content);

    $conf->data->set(
        has_perldoc => $version != 0 ? 1 : 0,
        new_perldoc => $version == 2 ? 1 : 0
    );

    return 1;
}

sub _initial_content_check {
    my ($conf, $content) = @_;
    if (! defined $content) {
        $conf->data->set(
            has_perldoc => 0,
            new_perldoc => 0,
        );
        return 1;
    } else {
        return;
    }
}

sub _analyze_perldoc {
    my $self = shift;
    my ($cmd, $tmpfile, $content) = @_;
    my $version = 0;
    if ( defined $content ) {
        if ( $content =~ m/^Unknown option:/ ) {
            $content = capture_output("$cmd perldoc") || '';
            $version = 1;
            $self->set_result('yes, old version');
        }
        else {
            if ( open my $FH, '<', $tmpfile ) {
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
    unlink $tmpfile;
    return $version;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
