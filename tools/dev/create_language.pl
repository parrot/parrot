#! perl
# Copyright (C) 2007-2010, Parrot Foundation.

=head1 NAME

create_language.pl -- create initial files for a new language

=head1 SYNOPSIS

% perl tools/dev/create_language.pl Xyz [path]

=head1 DESCRIPTION

This script populates a directory with files for building a
new language translator in Parrot.  The first argument is the
name of the language to be built.  The C<path> argument
says where to populate the directory, if not given then the
lowercase version of the language name is used.

For a language 'Xyz', this script will create the following
files and directories in C<path>:

    README
    Configure.pl
    build/Makefile.in
    build/gen_parrot.pl
    src/Xyz.pir
    src/Xyz/Grammar.pm
    src/Xyz/Actions.pm
    src/Xyz/Compiler.pm
    src/Xyz/Runtime.pm
    src/gen/.gitignore
    t/harness
    t/00-sanity.t

Any files that already exist are skipped, so this script can
be used to repopulate a language directory with omitted files.

If all goes well, after creating the language shell one can simply
change to the language directory and type

    $ perl Configure.pl [--gen-parrot]
    $ make
    $ make test

to verify that the new language compiles and configures properly.

=cut

use strict;
use warnings;
use lib 'lib';
use File::Path;
use File::Spec;

unless (@ARGV) {
    die "usage: $0 language [path]\n";
}

if ($ARGV[0] eq '--help') {
    print <<HELP;
usage: $0 language [PATH]
Use perldoc $0 to read the documentation.
HELP
    exit 0;
}

##  determine the language we're trying to build
my $lang = $ARGV[0];
my $lclang = lc $lang;
my $uclang = uc $lang;

## the name of the script, for use in the generated README and "reverse"
my $script = $0;

##  get the path from the command line, or if not supplied then
##  use languages/$lclang.
my $path = $ARGV[1] || $lclang;

my $option = $ARGV[2] || '';

if ($option eq 'reverse') {
    ## instead of using this script to generate the files into $path,
    ## use the files in $path to generate a new version of this script.
    open my $fh0, '<', $script or die "Unable to read $script";
    while (<$fh0>) {
        print $_;
        last if /^__DATA__/;
    }
    while (<$fh0>) {
        last if /^__DATA__$/;
        if (/^__(.*?)__$/) {
            print;
            $_ = $1;
            s{\@lang\@}   {$lang}g;
            s{\@lclang\@} {$lclang}ig;
            s{\@UCLANG\@} {$uclang}ig;
            open my $fh, '<', "$path/$_" or die "Unable to read $path/$_";
            while (<$fh>) {
                s{$lang}   {\@lang\@}g;
                s{$lclang} {\@lclang\@}g;
                s{$uclang} {\@UCLANG\@}g;
                s{$script} {\@script\@}g;
                print;
            }
            close $fh;
        }
    }
    print;
    while (<$fh0>) { print; }
    close $fh0;
    exit 0;
}

##  now loop through the file information (see below), substituting
##  any instances of @lang@, @lclang@, @UCLANG@, and @Id@ with
##  the language name or the svn id tag.  If the line has the form
##  __filepath__, then start a new file.
my $fh;
while (<DATA>) {
    last if /^__DATA__$/;
    s{\@lang\@}   {$lang}g;
    s{\@lclang\@} {$lclang}ig;
    s{\@UCLANG\@} {$uclang}ig;
    s{\@script\@} {$script}ig;
    if (/^__(.*)__$/) { start_new_file("$path/$1"); }
    elsif ($fh) { print $fh $_; }
}

## generate build/PARROT_REVISION
start_new_file("$path/build/PARROT_REVISION");
my $rev = '$Revision$';
$rev =~ s/^\D*(\d+)\D*$/$1/;
print $fh "$rev\n";
close($fh) if $fh;

print <<"END";

Your new language has been created in the $path directory.
To do an initial build and test of the language:

    cd $path
    perl Configure.pl [--gen-parrot]
    make
    make test

END

##  we're done
1;


##  this function closes any previous opened file, and determines
##  if we're creating a new file.  It also calls C<mkpath> to
##  create any needed parent subdirectories.
sub start_new_file {
    my ($filepath) = @_;
    if ($fh) { close $fh; undef $fh; }
    if (-e $filepath) { print "skipping $filepath\n"; return; }
    my ($volume, $dir, $base) = File::Spec->splitpath($filepath);
    my $filedir = File::Spec->catpath($volume, $dir);
    unless (-d $filedir) {
        print "creating $filedir\n";
        mkpath( [ $filedir ], 0, 0777 );
    }
    print "creating $filepath\n";
    open $fh, '>', $filepath;
}



###  The section below contains the text of the files to be created.
###  The name of the file to be created is given as C<__filepath__>,
###  and all subsequent lines up to the next C<__filepath__> are
###  placed in the file (performing substitutions on @lang@, @lclang@,
###  @UCLANG@, and @Id@ as appropriate).

__DATA__
__README__
=head1 @lang@

This is @lang@, a compiler for the Parrot virtual machine.

=head2 Build requirements (installing from source)

For building @lang@ you need at least a C compiler, a C<make> utility,
and Perl 5.8 or newer.  To automatically obtain and build Parrot
you also need a git client.

=head2 Building and invoking @lang@

We generally recommend downloading @lang@ directly from
[XXX: fill in this information for @lang@].

Once you have a copy of @lang@, build it as follows:

    $ cd @lclang@
    $ perl Configure.pl --gen-parrot
    $ make

This will create a "@lclang@" or "@lclang@.exe" executable in the
current directory.  Programs can then be run from the build
directory using a command like:

    $ ./@lclang@ <source>

The C<--gen-parrot> option above tells Configure.pl to automatically
download and build the most appropriate version of Parrot into
a local "parrot/" subdirectory, install that Parrot into
the "parrot_install/" subdirectory, and use that for building
@lang@.  It's okay to use the C<--gen-parrot> option on later
invocations of Configure.pl; the configure system will re-build
Parrot only if a newer version is needed for whatever version
of @lang@ you're working with.

You can use C<--parrot-config=/path/to/parrot_config> instead
of C<--gen-parrot> to use an already installed Parrot for building
@lang@.  This installed Parrot must include its development
environment; typically this is done via Parrot's C<make install>
target or by installing prebuilt C<parrot-devel> and/or C<libparrot-dev>
packages.  The version of the already installed Parrot must satisfy a
minimum specified by @lang@ -- Configure.pl will verify this for you.

Once built, @lang@'s C<make install> target will install @lang@
and its libraries into the Parrot installation that was used to
create it.  Until this step is performed, the "@lclang@" executable
created by C<make> above can only be reliably run from the root of
@lang@'s build directory.  After C<make install> is performed,
the installed executable can be run from any directory (as long as
the Parrot installation that was used to create it remains intact).

If the @lang@ compiler is invoked without an explicit script to
run, it enters a small interactive mode that allows statements
to be executed from the command line.  Each line entered is treated
as a separate compilation unit, however (which means that subroutines
are preserved after they are defined, but variables are not).

=head2 Running the test suite

Entering C<make test> will run a test suite that comes bundled
with @lang@.  This is a simple suite of tests, designed to make sure
that the compiler is basically working and that it's capable of
running a simple test harness.

If you want to run the tests in parallel, you need to install a
fairly recent version of the Perl 5 module L<Test::Harness> (3.16
works for sure).

=head2 Where to get help or answers to questions

=head2 Reporting bugs

=head2 Submitting patches

=head2 How the compiler works

See F<docs/compiler_overview.pod>.

=head1 AUTHOR

=cut

## vim: expandtab sw=4 ft=pod tw=70:
__Configure.pl__
#! perl
# Copyright (C) 2009 The Perl Foundation

use 5.008;
use strict;
use warnings;
use Getopt::Long;
use Cwd;

MAIN: {
    my %options;
    GetOptions(\%options, 'help!', 'parrot-config=s',
               'gen-parrot!', 'gen-parrot-prefix=s', 'gen-parrot-option=s@');

    # Print help if it's requested
    if ($options{'help'}) {
        print_help();
        exit(0);
    }

    # Determine the revision of Parrot we require
    open my $REQ, "build/PARROT_REVISION"
      || die "cannot open build/PARROT_REVISION\n";
    my ($reqsvn, $reqpar) = split(' ', <$REQ>);
    $reqsvn += 0;
    close $REQ;

    # Update/generate parrot build if needed
    if ($options{'gen-parrot'}) {
        my @opts    = @{ $options{'gen-parrot-option'} || [] };
        my $prefix  = $options{'gen-parrot-prefix'} || cwd()."/parrot_install";
        # parrot's Configure.pl mishandles win32 backslashes in --prefix
        $prefix =~ s{\\}{/}g;
        my @command = ($^X, "build/gen_parrot.pl", "--prefix=$prefix", ($^O !~ /win32/i ? "--optimize" : ()), @opts);

        print "Generating Parrot ...\n";
        print "@command\n\n";
        system @command;
    }

    # Get a list of parrot-configs to invoke.
    my @parrot_config_exe = qw(
        parrot_install/bin/parrot_config
        ../../parrot_config
        parrot_config
    );
    if (exists $options{'gen-parrot-prefix'}) {
        unshift @parrot_config_exe,
                $options{'gen-parrot-prefix'} . '/bin/parrot_config';
    }

    if ($options{'parrot-config'} && $options{'parrot-config'} ne '1') {
        @parrot_config_exe = ($options{'parrot-config'});
    }

    # Get configuration information from parrot_config
    my %config = read_parrot_config(@parrot_config_exe);

    my $parrot_errors = '';
    if (!%config) {
        $parrot_errors .= "Unable to locate parrot_config\n";
    }
    elsif ($reqsvn > $config{'revision'} &&
            ($reqpar eq '' || version_int($reqpar) > version_int($config{'VERSION'}))) {
        $parrot_errors .= "Parrot revision r$reqsvn required (currently r$config{'revision'})\n";
    }

    if ($parrot_errors) {
        die <<"END";
===SORRY!===
$parrot_errors
To automatically checkout (svn) and build a copy of parrot r$reqsvn,
try re-running Configure.pl with the '--gen-parrot' option.
Or, use the '--parrot-config' option to explicitly specify
the location of parrot_config to be used to build @lang@.

END
    }

    # Verify the Parrot installation is sufficient for building @lang@
    verify_parrot(%config);

    # Create the Makefile using the information we just got
    create_makefile(%config);
    my $make = $config{'make'};

    {
        no warnings;
        print "Cleaning up ...\n";
        if (open my $CLEAN, '-|', "$make clean") {
            my @slurp = <$CLEAN>;
            close $CLEAN;
        }
    }

    print <<"END";

You can now use '$make' to build @lang@.
After that, you can use '$make test' to run some local tests.

END
    exit 0;

}


sub read_parrot_config {
    my @parrot_config_exe = @_;
    my %config = ();
    for my $exe (@parrot_config_exe) {
        no warnings;
        if (open my $PARROT_CONFIG, '-|', "$exe --dump") {
            print "\nReading configuration information from $exe ...\n";
            while (<$PARROT_CONFIG>) {
                if (/(\w+) => '(.*)'/) { $config{$1} = $2 }
            }
            close $PARROT_CONFIG or die $!;
            last if %config;
        }
    }
    return %config;
}


sub verify_parrot {
    print "Verifying Parrot installation...\n";
    my %config = @_;
    my $PARROT_VERSION = $config{'versiondir'};
    my $PARROT_BIN_DIR = $config{'bindir'};
    my $PARROT_LIB_DIR = $config{'libdir'}.$PARROT_VERSION;
    my $PARROT_SRC_DIR = $config{'srcdir'}.$PARROT_VERSION;
    my $PARROT_INCLUDE_DIR = $config{'includedir'}.$PARROT_VERSION;
    my $PARROT_TOOLS_DIR = "$PARROT_LIB_DIR/tools";
    my @required_files = (
        "$PARROT_BIN_DIR/parrot-nqp"
    );
    my @missing;
    for my $reqfile (@required_files) {
        push @missing, "    $reqfile" unless -e $reqfile;
    }
    if (@missing) {
        my $missing = join("\n", @missing);
        die <<"END";

===SORRY!===
I'm missing some needed files from the Parrot installation:
$missing
(Perhaps you need to use Parrot's "make install" or
install the "parrot-devel" package for your system?)

END
    }
}

#  Generate a Makefile from a configuration
sub create_makefile {
    my %config = @_;

    my $maketext = slurp( 'build/Makefile.in' );

    $config{'win32_libparrot_copy'} = $^O eq 'MSWin32' ? 'copy $(PARROT_BIN_DIR)\libparrot.dll .' : '';
    $maketext =~ s/@(\w+)@/$config{$1}/g;
    if ($^O eq 'MSWin32') {
        $maketext =~ s{/}{\\}g;
        $maketext =~ s{\\\*}{\\\\*}g;
        $maketext =~ s{http:\S+}{ do {my $t = $&; $t =~ s'\\'/'g; $t} }eg;
    }

    my $outfile = 'Makefile';
    print "\nCreating $outfile ...\n";
    open(my $MAKEOUT, '>', $outfile) ||
        die "Unable to write $outfile\n";
    print {$MAKEOUT} $maketext;
    close $MAKEOUT or die $!;

    return;
}

sub slurp {
    my $filename = shift;

    open my $fh, '<', $filename or die "Unable to read $filename\n";
    local $/ = undef;
    my $maketext = <$fh>;
    close $fh or die $!;

    return $maketext;
}

sub version_int {
    sprintf('%d%03d%03d', split(/\./, $_[0]))
}


#  Print some help text.
sub print_help {
    print <<'END';
Configure.pl - @lang@ Configure

General Options:
    --help             Show this text
    --gen-parrot       Download and build a copy of Parrot to use
    --gen-parrot-option='--option=value'
                       Set parrot config option when using --gen-parrot
    --parrot-config=(config)
                       Use configuration information from config
END

    return;
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
__build/Makefile.in__
# Copyright (C) 2006-2009, The Perl Foundation.

PARROT_ARGS      =

# values from parrot_config
PARROT_BIN_DIR     = @bindir@
PARROT_VERSION     = @versiondir@
PARROT_INCLUDE_DIR = @includedir@$(PARROT_VERSION)
PARROT_LIB_DIR     = @libdir@$(PARROT_VERSION)
PARROT_SRC_DIR     = @srcdir@$(PARROT_VERSION)
PARROT_LIBRARY_DIR = $(PARROT_LIB_DIR)/library
HAS_ICU            = @has_icu@

CC            = @cc@
CFLAGS        = @ccflags@ @cc_shared@ @cc_debug@ @ccwarn@ @cg_flag@
EXE           = @exe@
LD            = @ld@
LDFLAGS       = @ldflags@ @ld_debug@
LD_LOAD_FLAGS = @ld_load_flags@
LIBPARROT     = @inst_libparrot_ldflags@
O             = @o@
LOAD_EXT      = @load_ext@
PERL          = @perl@
CP            = @cp@
MV            = @mv@
RM_F          = @rm_f@
MKPATH        = $(PERL) -MExtUtils::Command -e mkpath
CHMOD         = $(PERL) -MExtUtils::Command -e chmod

# locations of parrot resources
PARROT           = $(PARROT_BIN_DIR)/parrot$(EXE)
PARROT_NQP       = $(PARROT_BIN_DIR)/parrot-nqp$(EXE)
PBC_TO_EXE       = $(PARROT_BIN_DIR)/pbc_to_exe$(EXE)
PARROT_TOOLS_DIR = $(PARROT_LIB_DIR)/tools
PARROT_PERL_LIB  = $(PARROT_TOOLS_DIR)/lib

@UCLANG@_LANG_DIR     = $(PARROT_LIB_DIR)/languages/@lclang@

@UCLANG@_EXE     = @lclang@$(EXE)
@UCLANG@_PBC     = @lclang@.pbc
@UCLANG@_G_PIR   = src/gen/@lclang@-grammar.pir
@UCLANG@_A_PIR   = src/gen/@lclang@-actions.pir
@UCLANG@_C_PIR   = src/gen/@lclang@-compiler.pir
@UCLANG@_R_PIR   = src/gen/@lclang@-runtime.pir

@UCLANG@_SOURCES = \
    src/@lang@.pir \
    $(@UCLANG@_G_PIR) \
    $(@UCLANG@_A_PIR) \
    $(@UCLANG@_C_PIR) \
    $(@UCLANG@_R_PIR) \

CLEANUPS = \
  *.manifest \
  *.pdb \
  *.c\
  *.o\
  $(@UCLANG@_EXE) \
  $(@UCLANG@_PBC) \
  src/gen/*.pir \

default: $(@UCLANG@_EXE)

all: $(@UCLANG@_EXE)

$(@UCLANG@_EXE) : $(@UCLANG@_SOURCES)
	$(PARROT) -o $(@UCLANG@_PBC) src/@lang@.pir
	$(PBC_TO_EXE) $(@UCLANG@_PBC)

$(@UCLANG@_G_PIR): src/@lang@/Grammar.pm
	$(PARROT_NQP) --target=pir -o $(@UCLANG@_G_PIR) src/@lang@/Grammar.pm
$(@UCLANG@_A_PIR): src/@lang@/Actions.pm
	$(PARROT_NQP) --target=pir -o $(@UCLANG@_A_PIR) src/@lang@/Actions.pm
$(@UCLANG@_C_PIR): src/@lang@/Compiler.pm
	$(PARROT_NQP) --target=pir -o $(@UCLANG@_C_PIR) src/@lang@/Compiler.pm
$(@UCLANG@_R_PIR): src/@lang@/Runtime.pm
	$(PARROT_NQP) --target=pir -o $(@UCLANG@_R_PIR) src/@lang@/Runtime.pm

## testing

test: $(@UCLANG@_EXE)
	$(PERL) t/harness t

## installation

install: all
	$(MKPATH)        $(DESTDIR)$(@UCLANG@_LANG_DIR)
	$(CP) $(@UCLANG@_PBC) $(DESTDIR)$(@UCLANG@_LANG_DIR)
	$(CP) $(@UCLANG@_EXE) $(DESTDIR)$(PARROT_BIN_DIR)
	$(CHMOD) 755     $(DESTDIR)$(PARROT_BIN_DIR)/$(@UCLANG@_EXE)

## cleaning

clean:
	$(RM_F) $(CLEANUPS)

distclean: realclean

realclean: clean
	$(RM_F) Makefile

testclean:

##  miscellaneous targets
# a listing of all targets meant to be called by users
help:
	@echo ""
	@echo "Following targets are available for the user:"
	@echo ""
	@echo "  all:               $(@UCLANG@_EXE)"
	@echo "                     This is the default."
	@echo "  $(@UCLANG@_EXE):        The @lang@ compiler."
	@echo "  install:           Install compiler into Parrot."
	@echo ""
	@echo "Testing:"
	@echo "  test:              Run tests."
	@echo ""
	@echo "Cleaning:"
	@echo "  clean:             Basic cleaning up."
	@echo "  distclean:         Removes also anything built, in theory."
	@echo "  realclean:         Removes also files generated by 'Configure.pl'."
	@echo "  testclean:         Clean up test results."
	@echo ""
	@echo "Misc:"
	@echo "  help:              Print this help message."
	@echo ""

__build/gen_parrot.pl__
#! perl
# Copyright (C) 2009 The Perl Foundation

=head1 TITLE

gen_parrot.pl - script to obtain and build Parrot for Rakudo

=head2 SYNOPSIS

    perl gen_parrot.pl [--parrot --configure=options]

=head2 DESCRIPTION

Maintains an appropriate copy of Parrot in the parrot/ subdirectory.
The revision of Parrot to be used in the build is given by the
build/PARROT_REVISION file.

=cut

use strict;
use warnings;
use 5.008;

#  Work out slash character to use.
my $slash = $^O eq 'MSWin32' ? '\\' : '/';

##  determine what revision of Parrot we require
open my $REQ, "build/PARROT_REVISION"
  || die "cannot open build/PARROT_REVISION\n";
my ($reqsvn, $reqpar) = split(' ', <$REQ>);
$reqsvn += 0;
close $REQ;

{
    no warnings;
    if (open my $REV, '-|', "parrot_install${slash}bin${slash}parrot_config revision") {
        my $revision = 0+<$REV>;
        close $REV;
        if ($revision >= $reqsvn) {
            print "Parrot r$revision already available (r$reqsvn required)\n";
            exit(0);
        }
    }
}

print "Cloning the Parrot git repo...\n";
system(qw(git clone), qw(http://github.com/parrot/parrot.git));

chdir('parrot') or die "Can't chdir to parrot: $!";

system("git checkout $reqsvn");

# TODO: error checking



##  If we have a Makefile from a previous build, do a 'make realclean'
if (-f 'Makefile') {
    my %config = read_parrot_config();
    my $make = $config{'make'};
    if ($make) {
        print "\nPerforming '$make realclean' ...\n";
        system($make, "realclean");
    }
}

print "\nConfiguring Parrot ...\n";
my @config_command = ($^X, 'Configure.pl', @ARGV);
print "@config_command\n";
system @config_command;

print "\nBuilding Parrot ...\n";
my %config = read_parrot_config();
my $make = $config{'make'} or exit(1);
my @make_opts;
if ($ENV{GNU_MAKE_JOBS}) {
    push @make_opts, '-j', $ENV{GNU_MAKE_JOBS}
}
system($make, 'install-dev', @make_opts);

sub read_parrot_config {
    my %config = ();
    if (open my $CFG, "config_lib.pasm") {
        while (<$CFG>) {
            if (/P0\["(.*?)"], "(.*?)"/) { $config{$1} = $2 }
        }
        close $CFG;
    }
    %config;
}

__src/@lang@.pir__
.HLL '@lclang@'

.namespace []

.sub '' :anon :load :init
    load_bytecode 'HLL.pbc'

    .local pmc hllns, parrotns, imports
    hllns = get_hll_namespace
    parrotns = get_root_namespace ['parrot']
    imports = split ' ', 'PAST PCT HLL Regex Hash'
    parrotns.'export_to'(hllns, imports)
.end

.include 'src/gen/@lclang@-grammar.pir'
.include 'src/gen/@lclang@-actions.pir'
.include 'src/gen/@lclang@-compiler.pir'
.include 'src/gen/@lclang@-runtime.pir'

.namespace []
.sub 'main' :main
    .param pmc args

    $P0 = compreg '@lang@'
    # Cannot tailcall here. (TT #1029)
    $P1 = $P0.'command_line'(args)
    .return ($P1)
.end
__src/@lang@/Grammar.pm__
=begin overview

This is the grammar for @lang@ in Perl 6 rules.

=end overview

grammar @lang@::Grammar is HLL::Grammar;

token TOP {
    <statementlist>
    [ $ || <.panic: "Syntax error"> ]
}

## Lexer items

# This <ws> rule treats # as "comment to eol".
token ws {
    <!ww>
    [ '#' \N* \n? | \s+ ]*
}

## Statements

rule statementlist { [ <statement> | <?> ] ** ';' }

rule statement {
    | <statement_control>
    | <EXPR>
}

proto token statement_control { <...> }
rule statement_control:sym<say>   { <sym> [ <EXPR> ] ** ','  }
rule statement_control:sym<print> { <sym> [ <EXPR> ] ** ','  }

## Terms

token term:sym<integer> { <integer> }
token term:sym<quote> { <quote> }

proto token quote { <...> }
token quote:sym<'> { <?[']> <quote_EXPR: ':q'> }
token quote:sym<"> { <?["]> <quote_EXPR: ':qq'> }

## Operators

INIT {
    @lang@::Grammar.O(':prec<u>, :assoc<left>',  '%multiplicative');
    @lang@::Grammar.O(':prec<t>, :assoc<left>',  '%additive');
}

token circumfix:sym<( )> { '(' <.ws> <EXPR> ')' }

token infix:sym<*>  { <sym> <O('%multiplicative, :pirop<mul>')> }
token infix:sym</>  { <sym> <O('%multiplicative, :pirop<div>')> }

token infix:sym<+>  { <sym> <O('%additive, :pirop<add>')> }
token infix:sym<->  { <sym> <O('%additive, :pirop<sub>')> }
__src/@lang@/Actions.pm__
class @lang@::Actions is HLL::Actions;

method TOP($/) {
    make PAST::Block.new( $<statementlist>.ast , :hll<@lclang@>, :node($/) );
}

method statementlist($/) {
    my $past := PAST::Stmts.new( :node($/) );
    for $<statement> { $past.push( $_.ast ); }
    make $past;
}

method statement($/) {
    make $<statement_control> ?? $<statement_control>.ast !! $<EXPR>.ast;
}

method statement_control:sym<say>($/) {
    my $past := PAST::Op.new( :name<say>, :pasttype<call>, :node($/) );
    for $<EXPR> { $past.push( $_.ast ); }
    make $past;
}

method statement_control:sym<print>($/) {
    my $past := PAST::Op.new( :name<print>, :pasttype<call>, :node($/) );
    for $<EXPR> { $past.push( $_.ast ); }
    make $past;
}

method term:sym<integer>($/) { make $<integer>.ast; }
method term:sym<quote>($/) { make $<quote>.ast; }

method quote:sym<'>($/) { make $<quote_EXPR>.ast; }
method quote:sym<">($/) { make $<quote_EXPR>.ast; }

method circumfix:sym<( )>($/) { make $<EXPR>.ast; }

__src/@lang@/Compiler.pm__
class @lang@::Compiler is HLL::Compiler;

INIT {
    @lang@::Compiler.language('@lang@');
    @lang@::Compiler.parsegrammar(@lang@::Grammar);
    @lang@::Compiler.parseactions(@lang@::Actions);
}
__src/@lang@/Runtime.pm__
# language-specific runtime functions go here

sub print(*@args) {
    pir::print(pir::join('', @args));
    1;
}

sub say(*@args) {
    pir::say(pir::join('', @args));
    1;
}
__src/gen/.gitignore__
*
__t/harness__
#! perl

use strict;
use warnings;

use FindBin;
use File::Spec;
use Getopt::Long qw(:config pass_through);

$ENV{'HARNESS_PERL'} = './@lclang@';
use Test::Harness;
$Test::Harness::switches = '';

GetOptions(
    'tests-from-file=s' => \my $list_file,
    'verbosity=i'       => \$Test::Harness::verbose,
    'jobs:3'            => \my $jobs,
    'icu:1'             => \my $do_icu,
);

my @pass_through_options = grep m/^--?[^-]/, @ARGV;
my @files = grep m/^[^-]/, @ARGV;

my $slash = $^O eq 'MSWin32' ? '\\' : '/';

if ($list_file) {
    open(my $f, '<', $list_file)
        or die "Can't open file '$list_file' for reading: $!";
    while (<$f>) {
        next if m/^\s*#/;
        next unless m/\S/;
        chomp;
        my ($fn, $flags) = split /\s+#\s*/;
        next if ($flags && ($flags =~ m/icu/) && !$do_icu);
        $fn = "t/spec/$fn" unless $fn =~ m/^t\Q$slash\Espec\Q$slash\E/;
        $fn =~ s{/}{$slash}g;
        if ( -r $fn ) {
            push @files, $fn;
        }
        else {
            warn "Missing test file: $fn\n";
        }
    }
    close $f or die $!;
}

my @tfiles = map { all_in($_) } sort @files;

if (eval { require TAP::Harness; 1 }) {
    my %harness_options = (
        exec      => ['./@lclang@'],
        verbosity => 0+$Test::Harness::verbose,
        jobs      => $jobs || 1,
    );
    TAP::Harness->new( \%harness_options )->runtests(@tfiles);
}
else {
    runtests(@tfiles);
}

# adapted to return only files ending in '.t'
sub all_in {
    my $start = shift;

    return $start unless -d $start;

    my @skip = ( File::Spec->updir, File::Spec->curdir, qw( .svn CVS .git ) );
    my %skip = map {($_,1)} @skip;

    my @hits = ();

    if ( opendir( my $dh, $start ) ) {
        my @files = sort readdir $dh;
        closedir $dh or die $!;
        for my $file ( @files ) {
            next if $skip{$file};

            my $currfile = File::Spec->catfile( $start, $file );
            if ( -d $currfile ) {
                push( @hits, all_in( $currfile ) );
            }
            else {
                push( @hits, $currfile ) if $currfile =~ /\.t$/;
            }
        }
    }
    else {
        warn "$start: $!\n";
    }

    return @hits;
}

__t/00-sanity.t__
# This just checks that the basic parsing and call to builtin say() works.
say '1..4';
say 'ok 1';
say 'ok ', 2;
say 'ok ', 2 + 1;
say 'ok', ' ', 4;
__DATA__


# Local Variables:
# mode: cperl
# cperl-indent-level: 4
# fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

