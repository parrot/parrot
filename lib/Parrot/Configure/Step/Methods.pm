# Copyright (C) 2001-2007, The Perl Foundation.
# $Id$

package Parrot::Configure::Step::Methods;
use strict;
use warnings;

=head1 NAME

Parrot::Configure::Step::Methods - Methods for selected configuration steps

=head1 DESCRIPTION

The Parrot::Configure::Step::Methods module provides methods inherited by
Parrot::Configure::Step which are used internally by the C<runstep()> method
of more than one configuration step class but which are not intended for
general use in all configuration step classes.

The methods in this module should not be considered
part of the public interface of Parrot::Configure::Step.  They merely refactor
code which at one point was repeated in multiple configuration step classes
and which need access to the data in the Parrot::Configure::Step object.

Since the methods are not part of the public interface, their names should
begin with an underscore 'C<_>'.

=head2 Methods

=over 4

=item C<_recheck_settings()>

    $self->_recheck_settings($conf, $libs, $ccflags, $linkflags, $verbose);

Currently used in configuration step classes auto::gmp, auto::readline and
auto::gdbm.

=cut

sub _recheck_settings {
    my ($self, $conf, $libs, $ccflags, $linkflags, $verbose) = @_;
    $conf->data->set( 'libs',      $libs );
    $conf->data->set( 'ccflags',   $ccflags );
    $conf->data->set( 'linkflags', $linkflags );
    print " (no) " if $verbose;
    $self->set_result('no');
}

=item C<_handle_darwin_for_fink()>

    $self->_handle_darwin_for_fink($conf, $libs, $osname, $file);

Currently used in configuration step classes auto::gmp, auto::readline and
auto::gdbm.

Modifies settings for C<linkflags>, C<ldflags> and C<ccflags> in the
Parrot::Configure object's data structure.

=cut

sub _handle_darwin_for_fink {
    my ($self, $conf, $osname, $file) = @_;
    if ( $osname =~ /darwin/ ) {
        my $fink_lib_dir        = $conf->data->get('fink_lib_dir');
        my $fink_include_dir    = $conf->data->get('fink_include_dir');
        if ( (defined $fink_lib_dir) && (defined $fink_include_dir) ) {
            if ( -f "$fink_include_dir/$file" ) {
                my %intended = (
                    linkflags => "-L$fink_lib_dir",
                    ldflags   => "-L$fink_lib_dir",
                    ccflags   => "-I$fink_include_dir",
                );
                foreach my $flag (keys %intended) {
                    my $flagstr = $conf->data->get($flag);
                    my @elements = split /\s+/, $flagstr;
                    my %seen = map {$_, 1} @elements;
                    $conf->data->add( ' ', $flag => $intended{$flag} )
                        unless $seen{$intended{$flag}};
                }
            }
        }
    }
    return 1;
}

=back

=head1 SEE ALSO

Parrot::Configure::Step.

=cut

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
