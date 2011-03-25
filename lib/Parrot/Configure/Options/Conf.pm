# Copyright (C) 2007-2011, Parrot Foundation.
package Parrot::Configure::Options::Conf;

use strict;
use warnings;
use base qw( Exporter );
our @EXPORT_OK = qw(
    $script
    $parrot_version
    print_help
    print_version
);
use lib qw( lib );
use Parrot::BuildUtil ();
use FindBin qw($Bin);

our $script         = q{Configure.pl};
our $parrot_version = Parrot::BuildUtil::parrot_version("$Bin/../../");

sub print_version {
    print "Parrot Version $parrot_version Configure 2.0\n";
    return 1;
}

sub print_help {
    print <<"EOT";
$script - Parrot Configure 2.0

General Options:

   --help               Show this text
   --version            Show version information
   --verbose            Output extra information
   --verbose=2          Output every setting change
   --verbose-step       Comma-delimited string of configuration steps
                        for which output will be verbose
   --fatal              Failure of any configuration step will cause
                        Configure.pl to halt
   --fatal-step         Comma-delimited string of configuration steps
                        which upon failure cause Configure.pl to halt
   --silent             Don't be verbose, interactive or fatal
   --nomanicheck        Don't check the MANIFEST

   --ask                Have Configure ask for commonly-changed info
   --test=configure     Run tests of configuration tools before configuring
   --test=build         Run tests of build tools after configuring but before
                        calling 'make'
   --test               Run configuration tools tests, configure, then run
                        build tools tests


Compile Options:

   --debugging=0        Disable debugging, default = 1
   --inline             Compiler supports inline
   --optimize           Optimized compile
   --optimize=flags     Add given optimizer flags
   --parrot_is_shared   Link parrot dynamically
   --disable-rpath      Link without rpath (user must set LD_LIBRARY_PATH)
   --m=32               Build 32bit executable on 64-bit architecture.
   --profile            Turn on profiled compile (gcc only for now)
   --cage               [CAGE] compile includes many additional warnings

   --cc=(compiler)      Use the given compiler
   --ccflags=(flags)    Use the given compiler flags
   --ccwarn=(flags)     Use the given compiler warning flags
   --libs=(libs)        Use the given libraries
   --link=(linker)      Use the given linker
   --linkflags=(flags)  Use the given linker flags
   --ar=(archiver)      Use the given librarian for static libraries
   --arflags=(flags)    Use the given flags for static libraries
   --ld=(linker)        Use the given loader for shared libraries
   --ldflags=(flags)    Use the given loader flags for shared libraries
   --lex=(lexer)        Use the given lexical analyzer generator
   --make=(make tool)   Use the given make utility
   --yacc=(parser)      Use the given parser generator

   --no-line-directives Disable creation of C #line directives
   --define=inet_aton   Quick hack to use inet_aton instead of inet_pton
   --gc=(type)          Which implementation of GC to use. One of ms, ms2 or gms.

Parrot Options:

   --intval=(type)      Use the given type for INTVAL
   --floatval=(type)    Use the given type for FLOATVAL
   --opcode=(type)      Use the given type for opcodes
   --ops=(files)        Use the given ops files

   --without-threads    Build parrot without thread support
   --without-core-nci-thunks
                        Build parrot without core-required
                        statically compiled NCI call frames
                        (useful for testing dynamic frame builders)
   --without-extra-nci-thunks
                        Build parrot without unnecessary
                        statically compiled NCI call frames

External Library Options:

   --with-llvm          Link to LLVM if it is available
   --without-gettext    Build parrot without gettext support
   --without-gmp        Build parrot without GMP support
   --without-libffi     Build parrot without libffi support
   --without-opengl     Build parrot without OpenGL support (GL/GLU/GLUT)
   --without-readline   Build parrot without readline support
   --without-pcre       Build parrot without pcre support
   --without-zlib       Build parrot without zlib support

LLVM Options: 

   --llvm-config=/path/to/llvm-config
                        Location of the script used for LLVM autodetection.
                        You just need to specify this option if llvm-config
                        is not in your PATH.

ICU Options:

   For using a system ICU, these options can be used:

   --icu-config=/path/to/icu-config
                        Location of the script used for ICU autodetection.
                        You just need to specify this option if icu-config
                        is not in your PATH.

   --icu-config=none    Can be used to disable the autodetection feature.
                        It will also be disabled if you specify any other
                        of the following ICU options.

   If you do not have a full ICU installation:

   --without-icu        Build parrot without ICU support
   --icuheaders=(path)  Location of ICU headers without /unicode
   --icushared=(flags)  Full linker command to create shared libraries

Other Options (may not be implemented):

   --maintainer         Create imcc's parser and lexer files. Needs a working
                        parser and lexer.

Install Options:

    --prefix=PREFIX         Install architecture-independent files in PREFIX
                            [/usr/local]
    --exec-prefix=EPREFIX   Install architecture-dependent files in EPREFIX
                            [PREFIX]

    By default, `make install' will install all the files in
    `/usr/local/bin', `/usr/local/lib' etc.  You can specify
    an installation prefix other than `/usr/local' using `--prefix',
    for instance `--prefix=\$HOME'.

    For better control, use the options below.

    Fine tuning of the installation directories:
    --bindir=DIR          user executables [EPREFIX/bin]
    --sbindir=DIR         system admin executables [EPREFIX/sbin]
    --libexecdir=DIR      program executables [EPREFIX/libexec]
    --datadir=DIR         read-only architecture-independent data [PREFIX/share]
    --sysconfdir=DIR      read-only single-machine data [PREFIX/etc]
    --sharedstatedir=DIR  modifiable architecture-independent data [PREFIX/com]
    --localstatedir=DIR   modifiable single-machine data [PREFIX/var]
    --libdir=DIR          object code libraries [EPREFIX/lib]
    --includedir=DIR      C header files [PREFIX/include]
    --oldincludedir=DIR   C header files for non-gcc [/usr/include]
    --infodir=DIR         info documentation [PREFIX/info]
    --mandir=DIR          man documentation [PREFIX/man]

EOT
    return 1;
}

1;

#################### DOCUMENTATION ####################

=head1 NAME

Parrot::Configure::Options::Conf - Functionality shared by all Parrot
configuration options processing modes

=head1 SYNOPSIS

    use Parrot::Configure::Options::Conf qw(
        $script
        $parrot_version
        print_help
        print_version
     );

=head1 DESCRIPTION

Parrot::Configure::Options::Conf exports on demand certain variables and
subroutines used in other packages which implement different modes of
configuration options processing.  Currently, these packages are:

=over 4

=item * Parrot::Configure:Options::Conf::CLI

... for the command-line interface to F<Configure.pl>; and

=item * Parrot::Configure::Options::Conf::File

... for the configuration-file interface to that same program.

=back

=head1 EXPORTED VARIABLES

Three variables are exported on demand.

=head2 C<$script>

Defaults to string 'Configure.pl', but may be overridden for testing purposes.

=head2 C<$parrot_version>

String which is return value of C<Parrot::BuildUtil::parrot_version()>; may be
overridden for testing purposes.

=head1 EXPORTED SUBROUTINES

Two subroutines are exported on demand.

=head2 C<print_help()>

Help message printed when C<perl Configure.pl --help>  is called.  Takes no
arguments; prints to STDOUT; implicitly returns true value upon success.

=head2 C<print_version()>

Version number printed when C<perl Configure.pl --version>  is called.  Takes
no arguments; prints to STDOUT; implicitly returns true value upon success.

=head1 NOTES

The functionality in this package originally appeared in F<Configure.pl>.  It
was transferred here and refactored by James E Keenan.

=head1 SEE ALSO

F<Configure.pl>. Parrot::Configure::Options::Conf.
Parrot::Configure::Options::Reconf.  Parrot::Configure::Options::Conf::CLI.
Parrot::Configure::Options::Conf::File.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
