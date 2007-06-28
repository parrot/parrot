#! perl

# Copyright (C) 2001-2007, The Perl Foundation.
# $Id$

=head1 NAME

Configure.pl - Parrot's Configuration Script

=head1 SYNOPSIS

    % perl Configure.pl [options]

=head1 DESCRIPTION

This is Parrot's configuration program. It should be run to create
the necessary system-specific files before building Parrot.

=head2 Command-line Options

General Options

=over

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

=item C<--nomanicheck>

Tells Configure.pl not to run the MANIFEST check.

=item C<--prefix>

Sets the location where parrot will be installed.

=item C<--step=>

Execute a single configure step.

=item C<--languages="list of languages">

Specify a list of languages to process (space separated.)
Used in combination with C<--step=gen::languages> to regenerate makefiles.

=item C<--ask>

This turns on the user prompts.

=item C<--test>

Run certain tests along with F<Configure.pl>:

=over 4

=item C<--test=configure>

Run tests found in F<t/configure/> I<before> beginning configuration.  These
tests demonstrate that Parrot's configuration tools will work properly once
configuration has begun.

=item C<--test=build>

Run tests found in F<t/postconfigure/>, F<t/tools/pmc2cutils/>,
F<t/tools/ops2cutils/> and F<t/tools/ops2pmutils/> I<after> configuration has
completed.  These tests demonstrate (a) that certain of Parrot's configuration
tools are working properly post-configuration; and (b) that certain of
Parrot's build tools will work properly once you call F<make>.

=item C<--test>

Run the tests described in C<--test=configure>, conduct configuration, then
run the tests described in C<--test=build>.

=back

=back

Compile Options

=over

=item C<--debugging=0>

Debugging is turned on by default. Use this to disable it.

=item C<--parrot_is_shared>

Link parrot dynamically.

=item C<--m=32>

Create a 32-bit executable on 64-architectures like x86_64. This
option appends -m32 to compiler and linker programs and does
s/lib64/lib/g on link flags.

This option is experimental. See F<config/init/defaults.pm> for more.

=item C<--profile>

Turn on profiled compile (gcc only for now)

=item C<--cage>

[CAGE] compile includes many additional warnings

=item C<--optimize>

Add perl5's $Config{optimize} to the compiler flags.

=item C<--optimize=flags>

Add C<flags> to the compiler flags.

=item C<--inline>

Tell Configure that the compiler supports C<inline>.

=item C<--cc=(compiler)>

Specify which compiler to use.

=item C<--ccflags=(flags)>

Use the given compiler flags.

=item C<--ccwarn=(flags)>

Use the given compiler warning flags.

=item C<--cxx=(compiler)>

Specify which C++ compiler to use (for ICU).

=item C<--libs=(libs)>

Use the given libraries.

=item C<--link=(linker)>

Specify which linker to use.

=item C<--linkflags=(flags)>

Use the given linker flags

=item C<--ld=(linker)>

Specify which loader to use for shared libraries.

=item C<--ldflags=(flags)>

Use the given loader flags for shared libraries

=item C<--lex=(lexer)>

Specify which lexer to use.

=item C<--yacc=(parser)>

Specify which parser to use.

=item C<--define=val1[,val2]>

Generate "#define PARROT_DEF_VAL1 1" ... entries in has_header.h. Currently
needed to use inet_aton for systems that lack inet_pton:

  --define=inet_aton

=back

Parrot Options

=over

=item C<--intval=(type)>

Use the given type for C<INTVAL>.

=item C<--floatval=(type)>

Use the given type for C<FLOATVAL>.

=item C<--opcode=(type)>

Use the given type for opcodes.

=item C<--ops=(files)>

Use the given ops files.

=item C<--pmc=(files)>

Use the given PMC files.

=item C<--cgoto=0>

Don't build cgoto core. This is recommended when you are short of memory.

=item C<--jitcapable>

Use JIT system.

=item C<--execcapable>

Use JIT to emit a native executable.

=item C<--gc=(type)>

Determine the type of garbage collection. The value for C<type> should be one
of: C<gc>, C<libc>, C<malloc> or C<malloc-trace>. The default is C<gc>.

=back

International Components For Unicode (ICU) Options

=over

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

Other Options

=over

=item C<--maintainer>

Use this option if you want imcc's parser and lexer files to be generated.
Needs a working parser and lexer.

=item C<--miniparrot>

Build parrot assuming only pure ANSI C is available.

=back

=head1 SEE ALSO

F<config/init/data.pl>, F<lib/Parrot/Configure/RunSteps.pm>,
F<lib/Parrot/Configure/Step.pm>, F<docs/configuration.pod>

=cut

use 5.008_000;
use strict;
use warnings;
use Data::Dumper;
$Data::Dumper::Indent = 1;
use lib 'lib';

use Parrot::BuildUtil;
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Options::Test;
use Parrot::Configure::Messages qw(
    print_introduction
    print_conclusion
);
use Parrot::Configure::Step::List qw( get_steps_list );

my $parrot_version = Parrot::BuildUtil::parrot_version();

$| = 1; # $OUTPUT_AUTOFLUSH = 1;

# Install Option text was taken from:
#
# autoconf (GNU Autoconf) 2.59
# Written by David J. MacKenzie and Akim Demaille.
#
# Copyright (C) 2003 Free Software Foundation, Inc.
# This is free software; see the source for copying conditions.  There is NO
# warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

# from Parrot::Configure::Options
my $args = process_options( {
    argv            => [ @ARGV ],
    script          => $0,
    parrot_version  => $parrot_version,
    svnid           => '$Id$',
} );
exit unless defined $args;
my %args = %{$args};

my $opttest = Parrot::Configure::Options::Test->new($args);
# configuration tests will only be run if you requested them
# as command-line option
$opttest->run_configure_tests();

# from Parrot::Configure::Messages
print_introduction($parrot_version) unless exists $args{step};

my $conf = Parrot::Configure->new;

# from Parrot::Configure::Step::List
$conf->add_steps(get_steps_list());

# from Parrot::Configure::Data
$conf->options->set(%args);

if ( exists $args{step} ) {
    # from Parrot::Configure::Data
    $conf->data()->slurp();
    $conf->data()->slurp_temp()
        if $args{step} =~ /gen::makefiles/;
    # from Parrot::Configure
    $conf->runstep( $args{step} );
    print "\n";
}
else {
    # Run the actual steps
    # from Parrot::Configure
    $conf->runsteps or exit(1);
}

# build tests will only be run if you requested them
# as command-line option
$opttest->run_build_tests();

# from Parrot::Configure::Messages
print_conclusion($conf->data->get('make')) unless exists $args{step};

exit(0);

################### DOCUMENTATION ###################


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

