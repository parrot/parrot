# Copyright (C) 2001-2005, The Perl Foundation.
# $Id: defaults.pm 13597 2006-07-27 16:31:35Z leo $

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
use vars qw($description @args);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step;

$description = q{Setting up installation paths};

@args = qw( prefix exec-prefix bindir sbindir libexecdir datadir sysconfdir
        sharedstatedir localstatedir libdir includedir oldincludedir infodir
        mandir );

sub runstep
{
    my ($self, $conf) = @_;

    my $prefix = $conf->options->get('prefix') || "/usr/local";
    my $eprefix = $conf->options->get('exec-prefix') || $prefix;
#  --bindir=DIR           user executables [EPREFIX/bin]
    my $bindir = $conf->options->get('bindir') || $eprefix . "/bin";
#  --sbindir=DIR          system admin executables [EPREFIX/sbin]
    my $sbindir = $conf->options->get('sbindir') || $eprefix . "/sbin";
#  --libexecdir=DIR       program executables [EPREFIX/libexec]
    my $sbindir = $conf->options->get('sbindir') || $eprefix . "/libexec";
#  --datadir=DIR          read-only architecture-independent data [PREFIX/share]
    my $datadir = $conf->options->get('datadir') || $prefix . "/share";
#  --sysconfdir=DIR       read-only single-machine data [PREFIX/etc]
    my $sysconfdir = $conf->options->get('sysconfdir') || $prefix . "/etc";
#  --sharedstatedir=DIR   modifiable architecture-independent data [PREFIX/com]
    my $sharedstatedir = $conf->options->get('sharedstatedir')
        || $prefix . "/com";
#  --localstatedir=DIR    modifiable single-machine data [PREFIX/var]
    my $localstatedir = $conf->options->get('localstatedir')
        || $prefix . "/var";
#  --libdir=DIR           object code libraries [EPREFIX/lib]
    my $libdir = $conf->options->get('libdir') || $eprefix . "/lib";
#  --includedir=DIR       C header files [PREFIX/include]
    my $includedir = $conf->options->get('includedir') || $prefix . "/include";
#  --oldincludedir=DIR    C header files f|| non-gcc [/usr/include]
    my $oldincludedir = $conf->options->get('oldincludedir') || "/usr/include";
#  --infodir=DIR          info documentation [PREFIX/info]
    my $infodir = $conf->options->get('infodir') || $prefix . "/info";
#  --mandir=DIR           man documentation [PREFIX/man]
    my $mandir = $conf->options->get('mandir') || $prefix . "/man";

    $conf->data->set(
        prefix          => $prefix,
        exec_prefix     => $eprefix,
        bin_dir         => $bindir, # deprecated
        bindir          => $bindir,
        sbindir         => $sbindir,
        datadir         => $datadir,
        sysconfdir      => $sysconfdir,
        sharedstatedir  => $sharedstatedir,
        localstatedir   => $localstatedir,
        libdir          => $libdir,
        lib_dir         => $libdir, # deprecated
        includedir      => $includedir,
        include_dir     => $includedir, # deprecated
        oldincludedir   => $oldincludedir,
        infodir         => $infodir,
        mandir          => $mandir,
        # parrot internal use only
        doc_dir         => $datadir . "/doc/parrot",
    );

    return $self;
}

1;
