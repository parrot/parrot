# Copyright (C) 2005-2007, The Perl Foundation.
# $Id$

=head1 NAME

config/auto/macports.pm - Determine Macports location on Darwin

=head1 DESCRIPTION

If the operating system is Darwin, this class determines whether or not
Macports is installed in the default location.

B<Note:>  No provision is yet made for Macports installation in non-default
locations.

B<Note:>  This step is currently Darwin/Macports-specific because it
consolidates code previously found in multiple configuration step classes.
With some modification it may be suitable for application to BSD F<ports>
programs in general, but as there was no BSD-specific code in the
configuration step classes, that modification has not yet been made.

=cut

package auto::macports;

use strict;
use warnings;

use File::Spec;
use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':auto';
use Parrot::BuildUtil;

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Determine Macports location on Darwin};
    $data{result}      = q{};
    my $optlocal = File::Spec->catdir( '/', 'opt', 'local' );
    $data{ports_root} = (defined $ENV{TEST_MACPORTS})
        ? $ENV{TEST_MACPORTS}
        : (-d $optlocal)
            ? $optlocal
            : undef;
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = ( shift, shift );
    my $osname = $conf->data->get_p5( 'OSNAME' );
    my $verbose = $conf->options->get( 'verbose' );
    unless ($osname =~ /darwin/) {
        print "Operating system is $osname; Macports is Darwin only\n"
            if $verbose;
        $self->set_result('skipped');
        return 1;
    }
    if (! defined $self->{ports_root}) {
        print "Could not locate Macports root directory\n"
            if $verbose;
        $self->set_result('no');
        return 1;
    }

    my $ports_base_dir = $self->{ports_root};
    my $ports_lib_dir = qq{$ports_base_dir/lib};
    my $ports_include_dir = qq{$ports_base_dir/include};
    my @unlocateables;
    foreach my $dir ($ports_base_dir, $ports_lib_dir, $ports_include_dir) {
        push @unlocateables, $dir unless (-d $dir);
    }
    if (@unlocateables) {
        print "Could not locate Macports directories:  @unlocateables\n"
            if $verbose;
        $self->set_result('no');
        return 1;
    }
    else {
        $conf->data->set(
            ports_base_dir       => $ports_base_dir,
            ports_lib_dir        => $ports_lib_dir,
            ports_include_dir    => $ports_include_dir,
        );
        $self->set_result('yes');
        return 1;
    }
}

1;

=head1 AUTHOR

James E Keenan, consolidating code written by Alberto Sim√es, Leopold Toetsch
and others.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
