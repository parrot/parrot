# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$
package Parrot::Configure::Options;
use strict;
use warnings;
use base qw( Exporter );
our @EXPORT_OK = qw(
    process_options
    get_valid_options
);

sub get_valid_options {
    return qw(ask bindir cage cc ccflags ccwarn cgoto cxx datadir
        debugging define exec-prefix execcapable floatval gc help icu-config
        icudatadir icuheaders icushared includedir infodir inline intval
        jitcapable ld ldflags lex libdir libexecdir libs link linkflags
        localstatedir m maintainer mandir miniparrot nomanicheck oldincludedir
        opcode ops optimize parrot_is_shared pmc prefix profile sbindir
        sharedstatedir step sysconfdir test verbose verbose-step version 
        without-gdbm without-gmp without-icu yacc);
}

sub process_options {
    my $optionsref = shift;
    my @valid_opts = get_valid_options();
    $optionsref->{argv} = []
        unless defined $optionsref->{argv};
    $optionsref->{script} = q{Configure.pl}
        unless defined $optionsref->{script};
    die "Must provide argument 'parrot_version'"
        unless $optionsref->{parrot_version};
    die "Must provide argument 'svnid'"
        unless $optionsref->{svnid};
    my %args;
    for ( @{ $optionsref->{argv} } ) {
        my ( $key, $value ) = m/--([-\w]+)(?:=(.*))?/;
        $key   = 'help' unless defined $key;
        $value = 1      unless defined $value;

        unless ( grep $key eq $_, @valid_opts ) {
            die qq/Invalid option $key. See "perl Configure.pl --help" for valid options\n/;
        }

        for ($key) {
            if ( $key =~ m/version/ ) {
                print_version_info($optionsref);
                return;
            }

            if ( $key =~ m/help/ ) {
                print_help($optionsref);
                return;
            }
            $args{$key} = $value;
        }
    }

    $args{debugging} = 1
        unless ( ( exists $args{debugging} ) && !$args{debugging} );
    $args{maintainer} = 1 if defined $args{lex} or defined $args{yacc};
    return \%args;
}

################### SUBROUTINES ###################

sub print_version_info {
    my $argsref = shift;
    print "Parrot Version $argsref->{parrot_version} Configure 2.0\n";
    print "$argsref->{svnid}\n";
    return 1;
}

sub print_help {
    my $argsref = shift;
    print <<"EOT";
$argsref->{script} - Parrot Configure 2.0

General Options:

   --help               Show this text
   --version            Show version information
   --verbose            Output extra information
   --verbose=2          Output every setting change
   --verbose-step=N     Set verbose for step N only
   --verbose-step=regex Set verbose for step matching description
   --nomanicheck        Don't check the MANIFEST
   --step=(gen::languages)
                        Execute a single configure step

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
   --m=32               Build 32bit executable on 64-bit architecture.
   --profile            Turn on profiled compile (gcc only for now)
   --cage               [CAGE] compile includes many additional warnings

   --cc=(compiler)      Use the given compiler
   --ccflags=(flags)    Use the given compiler flags
   --ccwarn=(flags)     Use the given compiler warning flags
   --cxx=(compiler)     Use the given C++ compiler
   --libs=(libs)        Use the given libraries
   --link=(linker)      Use the given linker
   --linkflags=(flags)  Use the given linker flags
   --ld=(linker)        Use the given loader for shared libraries
   --ldflags=(flags)    Use the given loader flags for shared libraries
   --lex=(lexer)        Use the given lexical analyzer generator
   --yacc=(parser)      Use the given parser generator

   --define=inet_aton   Quick hack to use inet_aton instead of inet_pton

Parrot Options:

   --intval=(type)      Use the given type for INTVAL
   --floatval=(type)    Use the given type for FLOATVAL
   --opcode=(type)      Use the given type for opcodes
   --ops=(files)        Use the given ops files
   --pmc=(files)        Use the given PMC files

   --cgoto=0            Don't build cgoto core - recommended when short of mem
   --jitcapable         Use JIT
   --execcapable        Use JIT to emit a native executable
   --gc=(type)          Determine the type of garbage collection
                        type=(gc|libc|malloc|malloc-trace) default is gc

External Library Options:

   --without-gmp        Build parrot without GMP support
   --without-gdbm       Build parrot without GDBM support

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
   --icudatadir=(path)  Directory to locate ICU's data file(s)

Other Options (may not be implemented):

   --maintainer         Create imcc's parser and lexer files. Needs a working
                        parser and lexer.
   --miniparrot         Build parrot assuming only pure ANSI C is available

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

Parrot::Configure::Options - Process command-line options to F<Configure.pl>

=head1 SYNOPSIS

    use Parrot::Configure::Options qw( process_options );

    $args = process_options( {
        argv            => [ @ARGV ],
        script          => $0,
        parrot_version  => $parrot_version,
        svnid           =>
            '$Id$',
    } );

    @valid_options = get_valid_options();

=head1 DESCRIPTION

Parrot::Configure::Options exports on demand two subroutines:
C<process_options()>, which processes the command-line options provided to
F<Configure.pl>; and C<get_valid_options()>, which returns the list of
currently valid options.

If you provide F<Configure.pl> with either C<--help> or C<--version>,
C<process_options()>  will print out the appropriate message and perform a
bare C<return>, I<i.e.>, the return value will be C<undef>.  The calling
script -- whether F<Configure.pl> or a test file -- can then check for the
definedness of C<process_options()>'s return value and proceed appropriately.

An array of valid command-line option names stored internally is consulted;
the program will die if an invalid option is called.

=head1 SUBROUTINES

=head2 C<process_options()>

=over 4

=item * Purpose

Process command-line options provided to F<Configure.pl> and proceed
appropriately.

=item * Arguments

One argument:  Reference to a hash holding the following key-value pairs:

    argv            : reference to @ARGV; defaults to []
    script          : Perl's $0:  the calling program;
                      defaults to 'Configure.pl'
    parrot_version  : string holding Parrot version number
                      (currently supplied by
                      Parrot::BuildUtil::parrot_version())
    svnid           : string holding Subversion Id string

=item * Return Value

=over 4

=item * C<--version> or C<--help>

Bare return (C<undef>).

=item * All other options

Reference to a hash of option names and values.

=back

=item * Comment

=back

=head2 C<get_valid_options()>

=over 4

=item * Purpose

Get a list of options currently valid for F<Configure.pl>.

=item * Arguments

None.

=item * Return Value

List of currently valid options.

=item * Comment

=back

=head1 NOTES

The functionality in this package was transferred from F<Configure.pl> by Jim
Keenan.

=head1 SEE ALSO

F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
