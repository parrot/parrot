# Copyright (C) 2005-2007, The Perl Foundation.
# $Id$

=head1 NAME

config/auto/fink.pm - Determine Fink location on Darwin

=head1 DESCRIPTION

If the operating system is Darwin, this class determines whether and where
Fink is installed.

=cut

package auto::fink;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':auto';
use Parrot::BuildUtil;


sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Determine Fink location on Darwin};
    $data{result}      = q{};
    # Per fink(8), this is location for Fink configuration file, presumably
    # regardless of where Fink itself is installed.
    $data{fink_conf}    = q{/sw/etc/fink.conf};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = ( shift, shift );
    my $osname = $conf->data->get_p5( 'OSNAME' );
    my $verbose = $conf->options->get( 'verbose' );
    unless ($osname =~ /darwin/) {
        print "Operating system is $osname; Fink is Darwin only\n"
            if $verbose;
        $self->set_result('skipped');
        return 1;
    }
    # Per fink(8), this is location for Fink configuration file, presumably
    # regardless of where Fink itself is installed.
    my $fink_conf = $self->{fink_conf};
    unless (-f $fink_conf) {
        print "Fink configuration file not located\n"
            if $verbose;
        $self->set_result('Fink not installed');
        return 1;
    }
    my $fink_conf_str = Parrot::BuildUtil::slurp_file($fink_conf);
    my @lines = split /\n/, $fink_conf_str;
    my $fink_base_dir;
    while (defined (my $l = shift @lines) ) {
        chomp $l;
        next unless $l =~ /^Basepath:\s(.*)/;
        $fink_base_dir = $1;
        last;
    }
    unless (defined $fink_base_dir) {
        print "Fink configuration file defective:  no 'Basepath'\n"
            if $verbose;
        $self->set_result('failed');
        return;
    }
    my $fink_lib_dir = qq{$fink_base_dir/lib};
    my $fink_include_dir = qq{$fink_base_dir/include};
    my @unlocateables;
    foreach my $dir ($fink_base_dir, $fink_lib_dir, $fink_include_dir) {
        push @unlocateables, $dir unless (-d $dir);
    }
    if (@unlocateables) {
        print "Could not locate Fink directories:  @unlocateables\n"
            if $verbose;
        $self->set_result('failed');
        return;
    }
    else {
        $conf->data->set(
            fink_base_dir       => $fink_base_dir,
            fink_lib_dir        => $fink_lib_dir,
            fink_include_dir    => $fink_include_dir,
        );
        $self->set_result('Fink located');
        return 1;
    }
}

1;

=head1 AUTHOR

James E Keenan

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
