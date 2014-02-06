# Copyright (C) 2001-2013, Parrot Foundation.

=head1 NAME

config/auto/perldoc - Check whether perldoc works

=head1 DESCRIPTION

Determines whether F<perldoc> exists on the system and, if so, which
version of F<perldoc> it is.

More specifically, we look for the F<perldoc> associated with the
instance of F<perl> with which F<Configure.pl> was invoked.

=cut

package auto::perldoc;

use strict;
use warnings;

use File::Temp qw (tempfile );
use File::Spec qw (catfile );
use base qw(Parrot::Configure::Step);
use Parrot::Configure::Utils ':auto';


sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Is perldoc installed};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $cmd = File::Spec->catfile($conf->data->get('scriptdirexp_provisional'), q{perldoc});
    my ( $fh, $filename ) = tempfile( UNLINK => 1 );
    # try to execute 'perldoc perldoc' || 'perldoc Pod::Perldoc' to
    # read the documentation of perldoc
    my $content = capture_output("$cmd -ud $filename perldoc") || capture_output("$cmd -ud $filename Pod::Perldoc") || undef;

    return 1 unless defined( $self->_initial_content_check($conf, $content) );

    my $version = $self->_analyze_perldoc($cmd, $filename, $content);

    _handle_version($conf, $version, $cmd);

    my $TEMP_pod_build = <<'E_NOTE';

# the following part of the Makefile was built by 'config/auto/perldoc.pm'

E_NOTE

    opendir my $OPS, 'src/ops' or die "opendir ops: $!";
    my @ops = sort grep { !/^\./ && /\.ops$/ } readdir $OPS;
    closedir $OPS;

    my $TEMP_pod = join q{ } =>
        map { my $t = $_; $t =~ s/\.ops$/.pod/; "ops/$t" } @ops;

    my $new_perldoc = $conf->data->get('new_perldoc');

    foreach my $ops (@ops) {
        my $pod = $ops;
        $pod =~ s/\.ops$/.pod/;
        $TEMP_pod_build .= <<"END";
ops/$pod: ../src/ops/$ops
\t\$(PODEXTRACT) ../src/ops/$ops ops/$pod
\t\$(CHMOD) 0644 ops/$pod
\t\$(ADDGENERATED) "docs/\$\@" "[doc]"
END
    }

    $conf->data->set(
        TEMP_pod             => $TEMP_pod,
        TEMP_pod_build       => $TEMP_pod_build,
    );

    return 1;
}

sub _initial_content_check {
    my $self = shift;
    my ($conf, $content) = @_;
    if (! defined $content) {
        $conf->data->set(
            has_perldoc => 0,
            new_perldoc => 0,
            perldoc     => 'echo',
            TEMP_pod        => '',
            TEMP_pod_build  => '',
        );
        $self->set_result('no');
        return;
    }
    else {
        return 1;
    }
}

sub _analyze_perldoc {
    my $self = shift;
    my ($cmd, $tmpfile, $content) = @_;
    my $version;
    if ( $content =~ m/^Unknown option:/ ) {
        $content = capture_output("$cmd perldoc") || '';
        if ($content =~ m/perldoc/) {
            $version = $self->_handle_old_perldoc();
        }
        else {
            $version = $self->_handle_no_perldoc();
        }
    }
    elsif ( open my $FH, '<', $tmpfile ) {
        local $/;
        $content = <$FH>;
        close $FH;
        $version = 2;
        $self->set_result('yes');
    }
    else {
        $version = $self->_handle_no_perldoc();
    }
    unlink $tmpfile;
    return $version;
}

sub _handle_old_perldoc {
    my $self = shift;
    $self->set_result('yes, old version');
    return 1;
}

sub _handle_no_perldoc {
    my $self = shift;
    $self->set_result('failed');
    return 0;
}

sub _handle_version {
    my ($conf, $version, $cmd) = @_;
    $conf->data->set(
        has_perldoc => $version != 0 ? 1 : 0,
        new_perldoc => $version == 2 ? 1 : 0
    );

    $conf->data->set( perldoc => $cmd ) if $version;

    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
