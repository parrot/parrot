# Copyright (C) 2007-2009, Parrot Foundation.
package Parrot::Configure::Options::Conf::Shared;

use strict;
use warnings;
use base qw( Exporter );
our @EXPORT_OK = qw(
    @shared_valid_options
);

our @shared_valid_options = qw{
    ar
    arflags
    bindir
    cage
    cc
    ccflags
    ccwarn
    configure_trace
    coveragedir
    cxx
    darwin_no_fink
    darwin_no_macports
    datadir
    debugging
    define
    disable-rpath
    exec-prefix
    fatal
    fatal-step
    floatval
    gc
    help
    hintsfile
    llvm-config
    icu-config
    icuheaders
    icushared
    includedir
    infodir
    inline
    intval
    ld
    ldflags
    lex
    libdir
    libexecdir
    libs
    link
    linkflags
    localstatedir
    m
    make
    maintainer
    mandir
    nomanicheck
    no-line-directives
    oldincludedir
    opcode
    ops
    optimize
    parrot_is_shared
    prefix
    profile
    sbindir
    sharedstatedir
    silent
    sysconfdir
    test
    verbose
    verbose-step
    version
    with-llvm
    without-crypto
    without-core-nci-thunks
    without-extra-nci-thunks
    without-gdbm
    without-gettext
    without-gmp
    without-icu
    without-opengl
    without-libffi
    without-readline
    without-pcre
    without-threads
    without-zlib
    yacc
};

################### DOCUMENTATION ###################

=head1 NAME

Parrot::Configure::Options::Conf::Shared - Configuration options shared by
both Command-Line and Configuration-File configuration modes

=head1 SYNOPSIS

    use Parrot::Configure::Options::Conf::Shared qw(
        @shared_valid_options
    );
    our @valid_options = ( 'ask', @shared_valid_options );

=head1 DESCRIPTION

This package exports a single variable, C<@shared_valid_options()>, which
holds the list of options which may be used either on:

=over 4

=item *

the L<Configure.pl>
command-line (corresponding to use of C<mode =E<gt> configure> in
C<Parrot::Configure::Options::process_options()>); or

=item *

inside a configuration file where L<Configure.pl> is called with the
C<--file=path/to/configfile> option (corresponding to use of C<mode =E<gt> file>
in C<Parrot::Configure::Options::process_options()>).

=back

=head1 AUTHOR

Refactored from earlier code by James E Keenan.

Parrot::Configure::Options.  Parrot::Configure::Options::Conf::CLI.
Parrot::Configure::Options::Conf::File.  Configure.pl.

=head1 SEE ALSO

=cut

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
