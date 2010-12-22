# Copyright (C) 2001-2008, Parrot Foundation.

=head1 NAME

config/auto/coverage- Check whether coverage analysis tools are present

=head1 DESCRIPTION

Coverage analysis is the measurement of the extent to which a program's source
code is exercised by its tests.

In Parrot, we can perform coverage analysis
on our Parrot source code (well, at least on F<.c> and F<.pmc> files) and on
the Perl 5 components used in our tools.

To conduct such analysis, we need
the C coverage utility F<gcov> and two utilities, F<cover> and F<gcov2perl>,
which are included in the Devel-Cover distribution from CPAN.  (Paul
Johnson++).  This configuration step determines whether those utilities are
present.

=cut

package auto::coverage;

use strict;
use warnings;

use File::Which;
use base qw(Parrot::Configure::Step);
use Parrot::Configure::Utils ':auto';


sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Are coverage analysis tools installed};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my %utils_needed = map { $_ => undef } qw( gcov gcov2perl cover );
    foreach my $util (keys %utils_needed) {
        my $which_util = which($util);
        if ($which_util) {
            $utils_needed{$util} = which($util);
        }
        else {
            $utils_needed{$util} = "echo '$util needed but not found' && exit 1";
        }
    }
    my @utils_lacking = grep { ! defined $utils_needed{$_} } keys %utils_needed;
    if (@utils_lacking) {
        $self->set_result("lacking @utils_lacking");
        $conf->data->set(
            "has_coverage_tools" => 0,
            %utils_needed,
        );
    }
    else {
        $conf->data->set(
            "has_coverage_tools" => 1,
            %utils_needed,
        );
        $self->set_result('yes');
    }
    return 1;
}

1;

=head1 REFERENCES

L<http://search.cpan.org/dist/Devel-Cover/>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
