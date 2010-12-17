# Copyright (C) 2001-2008, Parrot Foundation.

=head1 NAME

config/auto/coverage- Check whether coverage analysis tools are present

=head1 DESCRIPTION

Coverage analysis is the measurement of the extent to which a program's source
code is exercised by its tests.  In Parrot, we can perform coverage analysis
on our Parrot source code (well, at least on F<.c> and F<.pmc> files) and on
the Perl 5 components used in our tools.  To conduct such analysis, we need
the C coverage utility F<gcov> and two utilities, F<cover> and F<gcov2perl>,
which are included in the Devel-Cover distribution from CPAN.  (Paul
Johnson++).  This configuration step determines whether those utilities are
present.

=cut

package auto::coverage;

use strict;
use warnings;

use Data::Dumper;$Data::Dumper::Indent=1;
#use File::Temp qw (tempfile );
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

    my $cmd_stub =
        $conf->data->get('scriptdirexp_provisional') . $conf->data->get('slash');
   
    my @devel_cover_utilities = qw| cover gcov2perl |;
    my %utils_needed;
    foreach my $util ( @devel_cover_utilities ) {
        my $cmd = "$cmd_stub$util";
        my $content = capture_output("$cmd -h") || undef;
        $utils_needed{$util} =
            $self->_initial_content_check($conf, $content, $util);
    }
    my $cmd = 'gcov';
    my $content = capture_output("$cmd -h") || undef;
    $utils_needed{$cmd} =
        $self->_initial_content_check($conf, $content, $cmd);
#    print STDERR Dumper \%utils_needed;
    my @utils_lacking = ();
    foreach my $util (keys %utils_needed) {
        unless ($utils_needed{$util}) {
            push @utils_lacking, $util;
        }
    }
    if (@utils_lacking) {
        $self->set_result("lacking @utils_lacking");
    }
    else {
        foreach my $util (keys %utils_needed) {
            $conf->data->set( "has_$util" => 1 );
        }
        $self->set_result('yes');
    }
    return 1;

#    return 1 unless defined( $self->_initial_content_check($conf, $content,
#            $util) );
#
#    my $version = $self->_analyze_perldoc($cmd, $filename, $content);
#
#    _handle_version($conf, $version, $cmd);
#
#    my $TEMP_pod_build = <<'E_NOTE';
#
## the following part of the Makefile was built by 'config/auto/perldoc.pm'
#
#E_NOTE
#
#    opendir OPS, 'src/ops' or die "opendir ops: $!";
#    my @ops = sort grep { !/^\./ && /\.ops$/ } readdir OPS;
#    closedir OPS;
#
#    my $TEMP_pod = join q{ } =>
#        map { my $t = $_; $t =~ s/\.ops$/.pod/; "ops/$t" } @ops;
#
#    my $new_perldoc = $conf->data->get('new_perldoc');
#
#    foreach my $ops (@ops) {
#        my $pod = $ops;
#        $pod =~ s/\.ops$/.pod/;
#        if ( $new_perldoc ) {
#            $TEMP_pod_build .= <<"END"
#ops/$pod: ../src/ops/$ops
#\t\$(PERLDOC_BIN) -ud ops/$pod ../src/ops/$ops
#\t\$(CHMOD) 0644 ops/$pod
#
#END
#        }
#        else {
#            $TEMP_pod_build .= <<"END"
#ops/$pod: ../src/ops/$ops
#\t\$(PERLDOC_BIN) -u ../ops/$ops > ops/$pod
#\t\$(CHMOD) 0644 ../ops/$pod
#
#END
#        }
#    }
#
#    $conf->data->set(
#        TEMP_pod             => $TEMP_pod,
#        TEMP_pod_build       => $TEMP_pod_build,
#    );

    return 1;
}

sub _initial_content_check {
    my $self = shift;
    my ($conf, $content, $util) = @_;
    if (! defined $content) {
        $conf->data->set(
            "has_$util"             => 0,
            "TEMP_$util"            => '',
            "TEMP_${util}_build"    => '',
        );
#        $self->set_result('no');
        return;
    }
    else {
        return 1;
    }
}

#sub _analyze_perldoc {
#    my $self = shift;
#    my ($cmd, $tmpfile, $content) = @_;
#    my $version;
#    if ( $content =~ m/^Unknown option:/ ) {
#        $content = capture_output("$cmd perldoc") || '';
#        if ($content =~ m/perldoc/) {
#            $version = $self->_handle_old_perldoc();
#        }
#        else {
#            $version = $self->_handle_no_perldoc();
#        }
#    }
#    elsif ( open my $FH, '<', $tmpfile ) {
#        local $/;
#        $content = <$FH>;
#        close $FH;
#        $version = 2;
#        $self->set_result('yes');
#    }
#    else {
#        $version = $self->_handle_no_perldoc();
#    }
#    unlink $tmpfile;
#    return $version;
#}
#
#sub _handle_old_perldoc {
#    my $self = shift;
#    $self->set_result('yes, old version');
#    return 1;
#}
#
#sub _handle_no_perldoc {
#    my $self = shift;
#    $self->set_result('failed');
#    return 0;
#}
#
#sub _handle_version {
#    my ($conf, $version, $cmd) = @_;
#    $conf->data->set(
#        has_perldoc => $version != 0 ? 1 : 0,
#        new_perldoc => $version == 2 ? 1 : 0
#    );
#
#    $conf->data->set( perldoc => $cmd ) if $version;
#
#    return 1;
#}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
