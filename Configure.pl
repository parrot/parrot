#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Configure.pl - Parrot Configure

=head1 SYNOPSIS

    % perl Configure.pl [options]

=head1 DESCRIPTION

This is Parrot's configuration script.

=head3 General Options

=over

=item C<--help>

Prints out a description of the options and exits.

=item C<--version>

Prints out the version number of Configure.pl and exits.

=item C<--verbose>

Tells Configure.pl to output extra information about the configuration
data it is setting.

=item C<--nomanicheck>

Tells Configure.pl not to run the MANIFEST check.

=item C<--maintainer>

Use this option if you want imcc's parser and lexer files to be
generated. Needs a working parser and lexer.

=item C<--miniparrot>

Build parrot assuming only pure ANSI C is available.

=item C<--buildicu>

Build Parrot and ICU. Runs F<icu/source/configure> with the options in
F<icu/README.parrot>.

=back

=head3 Parrot Configuration Options

You can add and remove option values with C<<:rem{<opt>}>> and
C<<:add{<opt>}>>. For example:

    perl Configure.pl --ccflags="rem{-g} :add{-O2}"

=over

=item C<--ask>

This turns on the user prompts.

=item C<--debugging=0>

Debugging is turned on by default. Use this to disable it.

=item C<--optimize>

Tell the compiler to do an optimization phase.

=item C<--inline>

Tell Configure that the compiler supports C<inline>.

=item C<--expnetwork>

Enable experimental networking. This is an unused option and should
probably be removed.

=item C<--cc=(compiler)>

Specify which compiler to use.

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

=item C<--ld=(linker)>

Specify which loader to use for shared libraries.

=item C<--ldflags=(flags)>

Use the given loader flags for shared libraries

=item C<--lex=(lexer)>

Specify which lexer to use.

=item C<--yacc=(parser)>

Specify which parser to use.

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

Determine the type of garbage collection. The value for C<type> should
be one of: C<gc>, C<libc>, C<malloc> or C<malloc-trace>. The default is
C<gc>.

=item C<--define=val1[,val2]>

Generate "#define PARROT_DEF_VAL1 1" ... entries in has_header.h.
Currently needed to use inet_aton for systems that lack inet_pton:

  --define=inet_aton

=back

=head2 Parrot Configuration System

Configure is broken up into I<steps>.  Each step contains several related
I<prompts>, I<probes>, or I<generations>.  Steps should be mostly of a single
type, though some overlap is allowed (for example, allowing a probe to ask
the user what to do in an exceptional situation).

The directory F<config> contains subdirectories for each type of step.  Each
step should consist of I<exactly one> .pl file and any number of supporting
.c, .in, etc. files.  Any supporting files should be in a folder whose name
is the same as the basename of the step's .pl file; for example, if F<foo.pl>
uses F<bar_c.in>, F<bar_c.in> should be in a directory called F<foo>; the
full path might be F<config/auto/foo/bar_c.in>.

Generally, when adding a new test you should add a new step unless a test
I<clearly> belongs in a current step.  For example, if we added a new
user-configurable type called C<FOOVAL>, you should add the test for its size
in F<auto/sizes.pl>; however, if you were testing what dynaloading
capabilities are available, you should create a new step.

=head2 Initialization Steps

I<Initialization steps> are run before any other steps.  They do tasks such
as preparing Configure's data structures and checking the MANIFEST.  These
will rarely be added; when they are, it usually means that Configure is
getting significant new capabilities. They're kept in the directory
F<config/init>.

Initialization steps usually do not output anything under normal circumstances.

=head2 Prompts

Prompts ask the user for some information.  These should be used sparingly.
A step containing prompts is an I<interactive step>.  Interactive steps
should be in the F<config/inter> folder.

Interactive steps often include simple probes to determine good guesses of
what the user will answer.  See L</Prompt or Probe?> for more information.

Interactive steps virtually always output something.

Note that, by default, these prompts are turned off. To enable them run Configure with the "--ask" option.

=head2 Probes

Probes are automated tests of some feature of the computer. These should be
used wherever a value will not often need to be modified by the user.  A step
containing probes is an I<automatic step>. Automatic steps should be in the
F<config/auto> folder.

Automatic steps usually do not output anything under normal circumstances.

=head2 Generations

Generations create files needed after Configure has completed, such as
Makefiles and configuration headers.  A step containing generations is a
I<generation step>.  Generation steps should be in the F<config/gen> folder.

Generation steps usually do not output anything under normal circumstances.

=head2 Prompt or Probe?

It can sometimes be hard to decide whether a given step should be an
automatic or an interactive step.  The guiding question is I<Would a user
ever want to change this?>, or conversely, I<Is this something that can be
completely determined without user intervention?>  A step figuring out what
the compiler's command is would probably be an interactive step; conversely,
a step figuring out if that command is connected to a specific compiler
(like gcc) would be an automatic step.

=head2 Adding Steps

New steps should be added in one of the three folders mentioned above. They
should include the C<Parrot::Configure::Step> module, described below.

All steps are really modules; they should start with a declaration setting
the current package to C<Configure::Step>.  They should define the following:

=over 4

=item C<$description>

A short descriptive message that should be printed before the step executes.
Usually, interactive steps have long, friendly descriptions and other steps
have terse descriptions ending in "...".

Some example descriptions:

=over 4

=item F<inter/progs.pl>

    Okay, I'm going to start by asking you a couple questions about your
    compiler and linker.  Default values are in square brackets;
    you can hit ENTER to accept them.  If you don't understand a question,
    the default will usually work--they've been intuited from your Perl 5
    configuration.

=item F<auto/cgoto.pl>

    Determining if your compiler supports computed goto...

=item F<gen/config_h.pl>

    Generating config.h...

=back

Note that on non-interactive steps, the text C<"done."> will be printed after
the description when the step finishes executing; for example, the user will
see:

    Determining if your compiler supports computed goto...done.

=item C<@args>

This contains the names of any command-line arguments the step cares about.
Command-line arguments are standardized in Configure; this will be described
later in more detail.

=item C<Configure::Step::runstep>

This is called to actually execute the step.  The command-line arguments that
your module said it cared about are passed in; they come in the same order as
in C<@args>, and any that weren't specified are passed as C<undef>.

=back

Configure won't execute your step by default unless it's specifically told to.
To do this, edit the C<Parrot::Configure::RunSteps> module's C<@steps> array.
Steps are run in the sequence in which they appear in C<@steps>.

A template for a new step might look like this:

    package Configure::Step;

    use strict;
    use vars qw($description @args);
    use Parrot::Configure::Step;

    $description="<description>";
    @args=qw(<args>);

    sub runstep {
        <code>
    }

=head2 Command-line Arguments

Command-line arguments look like C</--\w+(=.*)?/>; the equals sign separates
the name and the value. If the value is omitted, it's assumed to be 1. The
options C<--help> and C<--version> are built in to Configure; any others are
defined by steps.

If you add a new option, don't forget to add it to this documentation and the "--help" listing in F<Configure.pl>.

Steps use the C<@args> array to list any options they're interested in. They
should be listed without the dashes.

=head2 Building Up Configuration Data

The second step is F<config/init/data.pl>, which sets up a C<Configure::Data>
package.  You get and set Configure's data by calling methods on this
package.  The methods are listed below.

=over 4

=item C<< Configure::Data->get(keys) >>

Returns the values for the given keys.

=item C<< Configure::Data->set(key, value, key, value, ...) >>

Sets the given keys to the given values.

=item C<< Configure::Data->keys() >>

Returns a list of all keys.

=item C<< Configure::Data->dump() >>

Returns a string that can be C<eval>ed by Perl to create a hash representing
Configure's data.

=back

=head2 C<Parrot::Configure::Step>

The C<Parrot::Configure::Step> module contains utility functions for steps to
use.  They include the following:

=over 4

=item C<prompt(message, default)>

Prints out "message [default] " and waits for the user's response.  Returns
the response, or the default if the user just hit ENTER.

=item C<cc_gen(file)>

Calls C<genfile(file, 'test.c')>.

=item C<cc_build()>

Calls the compiler and linker on F<test.c>.

=item C<cc_run()>

Calls the F<test> (or F<test.exe>) executable.

=item C<cc_clean()>

Cleans up all files in the root folder that match the glob I<test.*>.

=item C<genfile(infile, outfile)>

Takes the given I<infile>, substitutes any sequences matching C</\$\{\w+\}/>
for the given key's value in Configure's data, and writes the results to
I<outfile>.

=back

=head1 AUTHOR

Brent Dax

=cut

use 5.005_02;

use strict;
use vars qw($parrot_version @parrot_version);
use lib 'lib';

use Parrot::BuildUtil;
use Parrot::Configure::RunSteps;

$| = 1;

$parrot_version = parrot_version();
@parrot_version = parrot_version();

# Handle options

my %args;

for(@ARGV) {
  my($key, $value)=/--(\w+)(?:=(.*))?/;
  $key   = 'help' unless defined $key;
  $value = 1      unless defined $value;

  for($key) {
    /version/ && do {
      my $cvsid='$Id$';
      print <<"END";
Parrot Version $parrot_version Configure 2.0
$cvsid
END
      exit;
    };

    /help/    && do {
      print <<"EOT";
$0 - Parrot Configure 2.0

General Options:

   --help               Show this text
   --version            Show version information
   --verbose            Output extra information
   --nomanicheck        Don't check the MANIFEST
   --maintainer         Create imcc's parser and lexer files. Needs a working
                        parser and lexer.
   --miniparrot         Build parrot assuming only pure ANSI C is available
   --buildicu           Build Parrot and ICU

Parrot Configuration Options:

You can add and remove option values with :rem{<opt>} and :add{<opt>}
e.g. : --ccflags="rem{-g} :add{-O2}"

   --ask                Have Configure ask for commonly-changed info
   --debugging=0        Disable debugging, default = 1
   --optimize           Optimized compile
   --inline             Compiler supports inline
   --expnetwork         Enable experimental networking (unused)

   --cc=(compiler)      Use the given compiler
   --ccflags=(flags)    Use the given compiler flags
   --ccwarn=(flags)     Use the given compiler warning flags
   --libs=(libs)        Use the given libraries
   --link=(linker)      Use the given linker
   --linkflags=(flags)  Use the given linker flags
   --ld=(linker)        Use the given loader for shared libraries
   --ldflags=(flags)    Use the given loader flags for shared libraries
   --lex=(lexer)        Use the given lexical analyzer generator
   --yacc=(parser)       Use the given parser generator

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

   --define=inet_aton   Quick hack to use inet_aton instead of inet_pton

EOT
      exit;
    };
    $args{$key}=$value;
  }
}

$args{debugging} = 1 unless ((exists $args{debugging}) && !$args{debugging});

print <<"END";
Parrot Version $parrot_version Configure 2.0
Copyright (C) 2001-2003 The Perl Foundation.  All Rights Reserved.

Hello, I'm Configure.  My job is to poke and prod your system to figure out
how to build Parrot.  The process is completely automated, unless you passed in
the `--ask' flag on the command line, in which case it'll prompt you for a few
pieces of info.

Since you're running this script, you obviously have Perl 5--I'll be pulling
some defaults from its configuration.
END


#Run the actual steps
Parrot::Configure::RunSteps->runsteps(%args);



print <<"END";

Okay, we're done!

You can now use `make' (or your platform's equivalent to `make') to build your
Parrot. After that, you can use `make test' to run the test suite.

Happy Hacking,
        The Parrot Team

END

exit(0);


