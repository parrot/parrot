# Copyright (C) 2001-2007, The Perl Foundation.
# $Id$

=head1 NAME

config/init/install.pm - autoconf compatabile installation paths

=head1 DESCRIPTION

Sets up the installation paths

=cut

package init::install;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Set up installation paths};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $prefix = $conf->options->get('prefix') || ($^O eq 'MSWin32' ? "C:/Parrot" : "/usr/local");
    $prefix =~ s{/\z}{};
    my $ep = $conf->options->get('exec-prefix');
    $ep =~ s{/\z}{} if defined $ep;
    my $eprefix = $ep ? $ep : $prefix;

    # Install in versioned subdirectories, "/usr/lib/parrot/1.5.0/...". Skip
    # the "/parrot" or "/1.5.0" subdirectories if these are included in the
    # prefix.
    my $versiondir = '';
    unless ($prefix =~ /parrot/) {
        $versiondir .= '/parrot';
    }
    my $version = $conf->option_or_data('VERSION');
    if ($version && $prefix !~ /$version/) {
        $versiondir .= "/$version";
        $versiondir .= $conf->option_or_data('DEVEL');
    }

    #  --bindir=DIR           user executables [EPREFIX/bin]
    my $bindir = assign_dir( $conf, 'bindir', $eprefix, '/bin' );

    #  --sbindir=DIR          system admin executables [EPREFIX/sbin]
    my $sbindir = assign_dir( $conf, 'sbindir', $eprefix, '/sbin' );

    #  --libexecdir=DIR       program executables [EPREFIX/libexec]
    my $libexecdir = assign_dir( $conf, 'libexecdir', $eprefix, '/libexec' );

    #  --datadir=DIR          read-only architecture-independent data [PREFIX/share]
    my $datadir = assign_dir( $conf, 'datadir', $prefix, '/share' );

    #  --sysconfdir=DIR       read-only single-machine data [PREFIX/etc]
    my $sysconfdir = assign_dir( $conf, 'sysconfdir', $prefix, '/etc' );

    #  --sharedstatedir=DIR   modifiable architecture-independent data [PREFIX/com]
    my $sharedstatedir = assign_dir( $conf, 'sharedstatedir', $prefix, '/com' );

    #  --localstatedir=DIR    modifiable single-machine data [PREFIX/var]
    my $localstatedir = assign_dir( $conf, 'localstatedir', $prefix, '/var' );

    #  --libdir=DIR           object code libraries [EPREFIX/lib]
    my $libdir = assign_dir( $conf, 'libdir', $eprefix, '/lib' );

    #  --includedir=DIR       C header files [PREFIX/include]
    my $includedir = assign_dir( $conf, 'includedir', $prefix, '/include' );

    #  --oldincludedir=DIR    C header files f|| non-gcc [/usr/include]
    my $oldincludedir = assign_dir( $conf, 'oldincludedir', q{}, '/usr/include' );

    #  --infodir=DIR          info documentation [PREFIX/info]
    my $infodir = assign_dir( $conf, 'infodir', $prefix, '/info' );

    #  --mandir=DIR           man documentation [PREFIX/man]
    my $mandir = assign_dir( $conf, 'mandir', $prefix, '/man' );

    #  --srcdir=DIR           source code files PREFIX/src]
    my $srcdir = assign_dir( $conf, 'srcdir', $prefix, '/src' );

    $conf->data->set(
        prefix         => $prefix,
        exec_prefix    => $eprefix,
        bin_dir        => $bindir,           # deprecated
        bindir         => $bindir,
        sbindir        => $sbindir,
        libexecdir     => $libexecdir,
        datadir        => $datadir,
        sysconfdir     => $sysconfdir,
        sharedstatedir => $sharedstatedir,
        localstatedir  => $localstatedir,
        libdir         => $libdir,
        lib_dir        => $libdir,           # deprecated
        includedir     => $includedir,
        include_dir    => $includedir,       # deprecated
        oldincludedir  => $oldincludedir,
        infodir        => $infodir,
        mandir         => $mandir,
        srcdir         => $srcdir,

        # parrot internal use only
        doc_dir        => $datadir . "/doc",
        versiondir     => $versiondir,
    );

    return 1;
}

sub assign_dir {
    my ( $conf, $dir_str, $fix, $ext ) = @_;
    my $d = $conf->options->get($dir_str);
    return $d ? $d : $fix . $ext;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
