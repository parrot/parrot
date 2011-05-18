#! perl

# Copyright (C) 2001-2009, Parrot Foundation.

use 5.008;
use strict;
use warnings;
use Data::Dumper;$Data::Dumper::Indent=1;
use lib 'lib';

use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Options::Test;
use Parrot::Configure::Options::Test::Prepare qw(
    get_preconfiguration_tests
    get_postconfiguration_tests
);
use Parrot::Configure::Messages qw(
    print_introduction
    print_conclusion
);
use Parrot::Revision;

$| = 1;    # $OUTPUT_AUTOFLUSH = 1;

# Install Option text was taken from:
#
# autoconf (GNU Autoconf) 2.59
# Written by David J. MacKenzie and Akim Demaille.
#
# Copyright (C) 2003 Free Software Foundation, Inc.
# This is free software; see the source for copying conditions.  There is NO
# warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

# from Parrot::Configure::Options
my ($args, $steps_list_ref) = process_options(
    {
        mode => (defined $ARGV[0]  and $ARGV[0] =~ /^--file=/)
                    ? 'file'
                    : 'configure',
        argv => [@ARGV],
    }
);
exit(1) unless defined $args;
#print STDERR Dumper $args;

my $opttest = Parrot::Configure::Options::Test->new($args);

# configuration tests will only be run if you requested them
# as command-line option
$opttest->run_configure_tests( get_preconfiguration_tests() );

my $parrot_version = $Parrot::Configure::Options::Conf::parrot_version;

# from Parrot::Configure::Messages
print_introduction($parrot_version)
    unless $args->{silent};

# Update revision number if needed
Parrot::Revision::update();

my $conf = Parrot::Configure->new();

$conf->add_steps( @{ $steps_list_ref } );

# from Parrot::Configure::Data
$conf->options->set( %{$args} );
# save the command-line for make reconfig
$conf->data->set(configure_args => @ARGV
    ? '"'.join("\" \"", map {qq($_)} @ARGV).'"'
    : '');

# Log files created by Configure.pl in MANIFEST.configure.generated
$conf->{active_configuration} = 1;
unlink 'MANIFEST.configure.generated';

# Run the actual steps from Parrot::Configure
$conf->runsteps or exit(1);

# build tests will only be run if you requested them
# as command-line option
$opttest->run_build_tests( get_postconfiguration_tests() );

my $make = $conf->data->get('make');
# from Parrot::Configure::Messages
( print_conclusion( $conf, $make, $args ) ) ? exit 0 : exit 1;

################### DOCUMENTATION ###################

=head1 NAME

Configure.pl - Parrot's configuration script

=head1 SYNOPSIS

    % perl Configure.pl [options]

or:

    % perl Configure.pl --file=/path/to/configuration/directives

=head1 DESCRIPTION

This is Parrot's configuration program. It should be run to create
the necessary system-specific files before building Parrot.

We now offer two interfaces to configuration:

=over 4

=item * Command-Line Interface

All configuration options are placed on the command-line.  You may request
interactive configuration with the C<--ask> option.  You may not use the
C<--file> option, as that is reserved for the Configuration-File interface.

=item * Configuration-File Interface

All configuration options are placed in a special configuration file whose
full path is invoked on the command-line as
C<--file=/path/to/configuration/directives> as the sole command-line option.
You may not request interactive configuration.  For specific instructions, see
L</"CONFIGURATION-FILE INTERFACE"> below.

=back

=head2 General Options

=over 4

=item C<--help>

Prints out a description of the options and exits.

=item C<--version>

Prints out the version number of Configure.pl and exits.

=item C<--verbose>

Tells Configure.pl to output extra information about the configuration data it
is setting.

=item C<--verbose=2>

Tells Configure.pl to output information about i<every> setting added or
changed.

=item C<--verbose-step={N|regex}>

Run C<--verbose=2> for step number C<N> or matching description.

=item C<--fatal>

Tells Configure.pl to halt completely if any configuration step fails.

=item C<--fatal-step={init::alpha,inter::beta,auto::gamma}>

Tells Configure.pl to halt completely if any configuration step in
comma-delimited string individually fails.

=item C<--nomanicheck>

Tells Configure.pl not to run the MANIFEST check.

=item C<--prefix>

Sets the location where parrot will be installed.

=item C<--ask>

This turns on the user prompts during configuration.  Available only in
Command-Line interface.  Not available in Configuration-File interface.

=item C<--test>

Run certain tests along with F<Configure.pl>:

=over 4

=item C<--test=configure>

Run tests found in F<t/configure/> I<before> beginning configuration.  These
tests demonstrate that Parrot's configuration tools will work properly once
configuration has begun.

=item C<--test=build>

Run tests found in F<t/steps/>,  F<t/postconfigure/> and F<t/pharness>.

=item C<--test>

Run the tests described in C<--test=configure>, conduct configuration, then
run the tests described in C<--test=build>.

=back

=item C<--configure_trace>

Store the results of each configuration step in a Storable F<.sto> file on
disk, for later analysis by F<Parrot::Configure::Trace> methods.

=item C<--coveragedir>

In preparation for calling C<make cover> to perform coverage analysis,
provide a user-specified directory for top level of HTML output.

=item Operating system-specific configuration options

=over 4

=item C<--hintsfile=filename>

Use filename as the hints file.

=item C<--darwin_no_fink>

On Darwin, do not probe for Fink libraries.

=item C<--darwin_no_macports>

On Darwin, do not probe for Macports libraries.

=back

=back

=head2 Compile Options

=over 4

=item C<--debugging=0>

Debugging is turned on by default. Use this to disable it.

=item C<--parrot_is_shared>

Link parrot dynamically.

=item C<--m=32>

Create a 32-bit executable on 64-architectures like x86_64. This
option appends C<-m32> to compiler and linker programs and does
C<s/lib64/lib/g> on link flags.

This option is experimental. See F<config/init/defaults.pm> for more.

=item C<--profile>

Turn on profiled compile (gcc only for now)

=item C<--cage>

[CAGE] compile includes many additional warnings

=item C<--optimize>

Add Perl 5's C<$Config{optimize}> to the compiler flags.

=item C<--optimize=flags>

Add C<flags> to the compiler flags.

=item C<--inline>

Tell Configure that the compiler supports C<inline>.

=item C<--cc=(compiler)>

Specify which C compiler to use.

=item C<--cxx=(compiler)>

Specify which C++ compiler to use.

=item C<--ccflags=(flags)>

Use the given compiler flags.

=item C<--ccwarn=(flags)>

Use the given compiler warning flags.

=item C<--libs=(libs)>

Use the given libraries.

=item C<--link=(linker)>

Specify which linker to use.

=item C<--linkflags=(flags)>

Use the given linker flags

=item C<--ar=(archiver)>

Specify which librarian to use for static libraries

=item C<--arflags=(flags)>

Use the given librarian flags for static libraris

=item C<--ld=(linker)>

Specify which loader to use for shared libraries.

=item C<--ldflags=(flags)>

Use the given loader flags for shared libraries

=item C<--disable-rpath>

Specify that rpath should not be included in linking flags. With this
configuration option, you must append the library build directory
(usually blib/lib) to the LD_LIBRARY_PATH environment variable (or your
platform equivalent). This option is primarily used for building Linux
packages.

=item C<--lex=(lexer)>

Specify which lexer to use.

=item C<--yacc=(parser)>

Specify which parser to use.

=item C<--define=val1[,val2]>

Generate "#define PARROT_DEF_VAL1 1" ... entries in has_header.h. Currently
needed to use inet_aton for systems that lack inet_pton:

  --define=inet_aton

=item C<--no-line-directives>

Disables the creation of C #line directives when generating C from PMCs and
ops. Useful when debugging internals.

=back

=head2 Parrot Options

=over 4

=item C<--intval=(type)>

Use the given type for C<INTVAL>.

=item C<--floatval=(type)>

Use the given type for C<FLOATVAL>.

=item C<--opcode=(type)>

Use the given type for opcodes.

=item C<--ops=(files)>

Use the given ops files.

=back

=head2 International Components For Unicode (ICU) Options

=over 4

=item C<--icu-config=/path/to/icu-config>

Use the specified icu-config script to determine the necessary ICU options.

Use --icu-config=none to disable the autodetect feature. Parrot will then be
build without ICU.

B<Note:> If you specify another ICU option than --icu-config, the autodetection
functionality will be disabled.

=item C<--icushared=(linkeroption)>

Linker command to link against ICU library.

E.g.

   --icushared='-L /opt/openoffice/program -licudata -licuuc'

(The libs in openoffice are actually version 2.2 and do not work)

=item C<--icuheaders=(header_dir)>

Location of ICU header files without the /unicode suffix.

E.g.

--icuheaders='/home/lt/icu/'

=back

=head2 Other Options

=over 4

=item C<--maintainer>

Use this option if you want imcc's parser and lexer files to be generated.
Needs a working parser and lexer.

=item C<--with-llvm>

Use this option if you have a recent version of LLVM installed and wish Parrot
to link to it.

=back

=head1 CONFIGURATION-FILE INTERFACE

In the Configuration-File interface, unlike the Command-Line interface, you
may delete configuration steps or run them in an order different from that
listed in Parrot::Configure::Step::List.

A configuration file is a plain-text file located somewhere in or under your
top-level Parrot directory.  Unless indicated otherwise, all lines in this
file must have no leading whitespace.  As in Perl 5, lines beginning with C<#>
marks are comments and are ignored during parsing of the file.  Unlike Perl 5,
you may not begin comments in the middle of a line.

The configuration file must contain these three sections:

=over 4

=item * variables

=over 4

=item *

Section begins with line C<=variables> and must be followed by at least one
blank line.  All other content in this section is optional.

=item *

Section may contain one or more I<key=value> pairs which assign strings to
variables much in the way that you would do in a shell script wrapping around
F<Configure.pl>.

    =variables

    CC=/usr/bin/gcc
    CX=/usr/bin/g++

So if you typically invoked F<Configure.pl> by wrapping it in a shell script
for the purpose of setting environmental variables used in options, like this:

    CC="/usr/bin/gcc"
    CX="/usr/bin/g++"
    /usr/local/bin/perl Configure.pl \
        --cc="$CC" \
        --link="$CX" \
        --ld="$CX"

... you would now place the assignments to C<CC> and C<CX> in the
I<=variables> section of the configuration file (as above).

=back

=item * general

=over 4

=item *

Section begins with line C<=general> and must be followed by at least one
blank line.  All other content in this section is optional.

=item *

This section is the location recommended for listing options whose impact is
not conceptually limited to a single step.  It is also the location where the
variables defined in the I<=variables> section are assigned to particular
Parrot configuration options.  Entries in this section must be either
I<option=value> pairs or be options which will be assigned a true value.

    cc=$CC
    link=$CX
    ld=/usr/bin/g++
    verbose

Note that when the value is a variable defined in the I<=variables> section,
it must be preceded by a C<$> sign.

=item *

You I<may> list options here which are I<conceptually> limited to a single
configuration step.  For example, if you wished to skip validation of the
F<MANIFEST> during configuration and to configure without ICU, you I<could>,
in this section, say:

    nomanicheck
    without-icu

However, as we shall quickly see, it's conceptually clearer to place these
values next to those configuration steps that actually use them.

=back

=item * steps

=over 4

=item *

Section begins with line C<=steps> and must be followed by at least one
blank line, in turn followed by the list of configuration steps, followed by
another blank line followed by a line C<=cut> (just like POD).

=item *

The order in which you list the steps is the order in which they will be
executed.  If you delete a step from the canonical list or comment a step out,
it will not be executed.

    ...
    auto::snprintf
    # auto::perldoc
    auto::ctags
    ...

In the above example, step C<auto::perldoc> will be completely skipped.  You
will not see it listed as C<....skipped> in F<Configure.pl>'s output; it will
simply not be there at all.

=item *

This is the recommended location to call options whose impact is
I<conceptually> limited to a single configuration step.  Type the
configuration step's name, type a whitespace, type the option (with no leading
C<-->) and repeat as needed for additional step-specific options.

    init::manifest nomanicheck
    ...

=item *

This is also the location to call options whose impact is limited to one step
at a time but which may be applied to more than one configuration step.  The
C<fatal-step> and C<verbose-step> options are the best examples of this case.
Rather than requesting verbose output from all configuration steps, you may,
for example, wish to designate only a few steps for verbose output:

    ...
    init::hints verbose-step
    ...
    inter::progs fatal-step
    ...
    auto::gcc verbose-step
    ...

In the above example, F<Configure.pl> will grind to a halt if C<inter::progs>
does not complete successfully.  You will get verbose output only from
C<init::hints> and C<auto::gcc>; the other 60+ steps will be terse.

=item *

Nothing prevents you from listing general options anywhere in this section.

    init::manifest nomanicheck cc=$CC ld=/usr/bin/g++ verbose
    init::defaults
    ...

That will work -- but why would you want to do something that messy?

=back

=back

=head2 Example

Ignoring leading whitespace, this is an example of a correctly formed
configuration file.

    =variables

    CC=/usr/bin/gcc
    CX=/usr/bin/g++

    =general

    cc=$CC
    link=$CX
    ld=/usr/bin/g++

    =steps

    init::manifest nomanicheck
    init::defaults
    init::install
    init::hints verbose-step
    inter::progs
    inter::make
    inter::lex
    inter::yacc
    auto::gcc
    auto::glibc
    auto::backtrace
    auto::fink
    auto::macports
    auto::msvc
    auto::attributes
    auto::warnings
    init::optimize
    inter::shlibs
    inter::libparrot
    inter::types
    auto::ops
    auto::alignptrs
    auto::headers
    auto::sizes
    auto::byteorder
    auto::va_ptr
    auto::format
    auto::isreg
    auto::arch
    auto::jit
    auto::cpu
    auto::inline
    auto::gc
    auto::memalign
    auto::signal
    auto::socklen_t
    auto::env
    auto::gmp
    auto::readline
    auto::pcre
    auto::opengl
    auto::gettext
    auto::snprintf
    # auto::perldoc
    auto::ctags
    auto::revision
    auto::icu
    auto::platform
    gen::config_h
    gen::core_pmcs
    gen::opengl
    gen::makefiles
    gen::config_pm

    =cut

You may see how this works in practice by calling:

    perl Configure.pl --file=examples/config/file/configcompiler

or

    perl Configure.pl --file=examples/config/file/configwithfatalstep

=head1 SEE ALSO

F<lib/Parrot/Configure.pm>,
F<lib/Parrot/Configure/Step.pm>, F<docs/configuration.pod>

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

