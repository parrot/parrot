# Copyright (C) 2001-2007, The Perl Foundation.
# $Id$

=head1 NAME

config/init/install.pm - autoconf compatabile installation paths

=head1 DESCRIPTION

Sets up the installation paths

=cut

# taken from:
#
# autoconf (GNU Autoconf) 2.59
# Written by David J. MacKenzie and Akim Demaille.
#
# Copyright (C) 2003 Free Software Foundation, Inc.
# This is free software; see the source for copying conditions.  There is NO
# warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# Installation directories:
#   --prefix=PREFIX         install architecture-independent files in PREFIX
#                           [/usr/local]
#   --exec-prefix=EPREFIX   install architecture-dependent files in EPREFIX
#                           [PREFIX]
#
# By default, `make install' will install all the files in
# `/usr/local/bin', `/usr/local/lib' etc.  You can specify
# an installation prefix other than `/usr/local' using `--prefix',
# for instance `--prefix=$HOME'.
#
# For better control, use the options below.
#
# Fine tuning of the installation directories:
#  --bindir=DIR           user executables [EPREFIX/bin]
#  --sbindir=DIR          system admin executables [EPREFIX/sbin]
#  --libexecdir=DIR       program executables [EPREFIX/libexec]
#  --datadir=DIR          read-only architecture-independent data [PREFIX/share]
#  --sysconfdir=DIR       read-only single-machine data [PREFIX/etc]
#  --sharedstatedir=DIR   modifiable architecture-independent data [PREFIX/com]
#  --localstatedir=DIR    modifiable single-machine data [PREFIX/var]
#  --libdir=DIR           object code libraries [EPREFIX/lib]
#  --includedir=DIR       C header files [PREFIX/include]
#  --oldincludedir=DIR    C header files for non-gcc [/usr/include]
#  --infodir=DIR          info documentation [PREFIX/info]
#  --mandir=DIR           man documentation [PREFIX/man]

package init::install;

use strict;
use warnings;
use vars qw($description @args);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step;

$description = q{Setting up installation paths};

@args = qw( prefix exec-prefix bindir sbindir libexecdir datadir sysconfdir
    sharedstatedir localstatedir libdir includedir oldincludedir infodir
    mandir );

sub runstep {
    my ( $self, $conf ) = @_;

    my $prefix  = $conf->options->get('prefix')      || "/usr/local";
    my $ep = $conf->options->get('exec-prefix');
    my $eprefix = $ep ? $ep : $prefix;

    #  --bindir=DIR           user executables [EPREFIX/bin]
    my $bindir = assign_dir($conf, 'bindir', $eprefix, '/bin');

    #  --sbindir=DIR          system admin executables [EPREFIX/sbin]
    my $sbindir = assign_dir($conf, 'sbindir', $eprefix, '/sbin');

    #  --libexecdir=DIR       program executables [EPREFIX/libexec]
    my $libexecdir = assign_dir($conf, 'libexecdir', $eprefix, '/libexec');

    #  --datadir=DIR          read-only architecture-independent data [PREFIX/share]
    my $datadir = assign_dir($conf, 'datadir', $prefix, '/share');

    #  --sysconfdir=DIR       read-only single-machine data [PREFIX/etc]
    my $sysconfdir = assign_dir($conf, 'sysconfdir', $prefix, '/etc');

    #  --sharedstatedir=DIR   modifiable architecture-independent data [PREFIX/com]
    my $sharedstatedir = assign_dir($conf, 'sharedstatedir', $prefix, '/com');

    #  --localstatedir=DIR    modifiable single-machine data [PREFIX/var]
    my $localstatedir = assign_dir($conf, 'localstatedir', $prefix, '/var');

    #  --libdir=DIR           object code libraries [EPREFIX/lib]
    my $libdir = assign_dir($conf, 'libdir', $eprefix, '/lib');

    #  --includedir=DIR       C header files [PREFIX/include]
    my $includedir = assign_dir($conf, 'includedir', $prefix, '/include');

    #  --oldincludedir=DIR    C header files f|| non-gcc [/usr/include]
    my $oldincludedir = assign_dir($conf, 'oldincludedir', q{}, '/usr/include');

    #  --infodir=DIR          info documentation [PREFIX/info]
    my $infodir = assign_dir($conf, 'infodir', $prefix, '/info');

    #  --mandir=DIR           man documentation [PREFIX/man]
    my $mandir = assign_dir($conf, 'mandir', $prefix, '/man');

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

        # parrot internal use only
        doc_dir => $datadir . "/doc/parrot",
    );

    return $self;
}

sub assign_dir {
  my ($conf, $dir_str, $fix, $ext) = @_;
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
