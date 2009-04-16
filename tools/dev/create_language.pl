#! perl
# Copyright (C) 2007-2009, Parrot Foundation.
# $Id$

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
    xyz.pir
    build/Makefile.in
    build/gen_builtins_pir.pl
    build/gen_parrot.pl
    src/pct/grammar.pg
    src/pct/grammar-oper.pg
    src/pct/actions.pm
    src/builtins/say.pir
    t/harness
    t/00-sanity.t

Any files that already exist are skipped, so this script can
be used to repopulate a language directory with omitted files.

If all goes well, after creating the language shell one can simply
change to the language directory and type

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

##  determine the language we're trying to build
my $lang = $ARGV[0];
my $lclang = lc $lang;
my $uclang = uc $lang;

## the name and revision of the script, for use in the generated README
my $script = $0;
my $rev = '$Revision$';
$rev =~ s/^\D*(\d+)\D*$/r$1/;

##  get the path from the command line, or if not supplied then
##  use languages/$lclang.
my $path = $ARGV[1] || $lclang;

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
    s{\@Id\@}     {\$Id\$}ig;
    s{\@script\@} {$script}ig;
    s{\@rev\@}    {$rev}ig;
    if (/^__(.*)__$/) { start_new_file("$path/$1"); }
    elsif ($fh) { print $fh $_; }
}
##  close the last file
close($fh) if $fh;

print <<"END";

Your new language has been created in the $path directory.
To do an initial build and test of the language:

    cd $path
    perl Configure.pl
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
        mkpath($filedir);
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
Language '@lang@' was created with @script@, @rev@.

__Configure.pl__
#! perl
use 5.008;
use strict;
use warnings;
use Getopt::Long;

MAIN: {
    my %options;
    GetOptions(\%options, 'help!', 'parrot-config=s',
               'gen-parrot!', 'gen-parrot-option=s@');

    # Print help if it's requested
    if ($options{'help'}) {
        print_help();
        exit(0);
    }

    # Update/generate parrot build if needed
    if ($options{'gen-parrot'}) {
        my @opts    = @{ $options{'gen-parrot-option'} || [] };
        my @command = ($^X, "build/gen_parrot.pl", @opts);

        print "Generating Parrot ...\n";
        print "@command\n\n";
        system @command;
    }

    # Get a list of parrot-configs to invoke.
    my @parrot_config_exe = qw(
        parrot/parrot_config
        ../../parrot_config
        parrot_config
    );

    if ($options{'parrot-config'} && $options{'parrot-config'} ne '1') {
        @parrot_config_exe = ($options{'parrot-config'});
    }

    #  Get configuration information from parrot_config
    my %config = read_parrot_config(@parrot_config_exe);
    unless (%config) {
        die <<'END';
Unable to locate parrot_config.
To automatically checkout (svn) and build a copy of parrot,
try re-running Configure.pl with the '--gen-parrot' option.
Or, use the '--parrot-config' option to explicitly specify
the location of parrot_config.
END
    }

#  Create the Makefile using the information we just got
    create_makefile(%config);

    my $make = $config{'make'};
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


#  Generate a Makefile from a configuration
sub create_makefile {
    my %config = @_;

    my $maketext = slurp( 'build/Makefile.in' );

    $config{'win32_libparrot_copy'} = $^O eq 'MSWin32' ? 'copy $(BUILD_DIR)\libparrot.dll .' : '';
    $maketext =~ s/@(\w+)@/$config{$1}/g;
    if ($^O eq 'MSWin32') {
        $maketext =~ s{/}{\\}g;
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


#  Print some help text.
sub print_help {
    print <<'END';
Configure.pl - @lang@ Configure

General Options:
    --help             Show this text
    --parrot-config=(config)
                       Use configuration information from config
    --gen-parrot       Download and build a copy of Parrot to use
    --gen-parrot-option='--option=value'
                       Set parrot config option when using --gen-parrot
END

    return;
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

__build/PARROT_REVISION__
@rev@
__build/Makefile.in__
# $Id$

# arguments we want to run parrot with
PARROT_ARGS =

# values from parrot_config
BUILD_DIR     = @build_dir@
LOAD_EXT      = @load_ext@
O             = @o@
EXE           = @exe@
MAKE          = @make_c@
PERL          = @perl@
RM_F          = @rm_f@
HAS_ICU       = @has_icu@

# Various paths
PARROT_DYNEXT = $(BUILD_DIR)/runtime/parrot/dynext
PERL6GRAMMAR  = $(BUILD_DIR)/runtime/parrot/library/PGE/Perl6Grammar.pbc
NQP           = $(BUILD_DIR)/compilers/nqp/nqp.pbc
PCT           = $(BUILD_DIR)/runtime/parrot/library/PCT.pbc
PMC_DIR       = src/pmc
OPSDIR        = src/ops
OPSLIB        = @lclang@
OPS_FILE      = src/ops/@lclang@.ops

# Setup some commands
PARROT        = $(BUILD_DIR)/parrot$(EXE)
CAT           = $(PERL) -MExtUtils::Command -e cat
BUILD_DYNPMC  = $(PERL) $(BUILD_DIR)/tools/build/dynpmc.pl
BUILD_DYNOPS  = $(PERL) $(BUILD_DIR)/tools/build/dynoplibs.pl
PBC_TO_EXE    = $(BUILD_DIR)/pbc_to_exe$(EXE)

SOURCES = @lclang@.pir \
  src/gen_grammar.pir \
  src/gen_actions.pir \
  src/gen_builtins.pir \
  $(@uclang@_GROUP)

BUILTINS_PIR = \
  src/builtins/say.pir \

# PMCS        = @lclang@
# PMC_SOURCES = $(PMC_DIR)/@lclang@.pmc
# @uclang@_GROUP  = $(PMC_DIR)/@lclang@_group$(LOAD_EXT)

CLEANUPS = \
  @lclang@.pbc \
  @lclang@.c \
  *.manifest \
  *.pdb \
  @lclang@$(O) \
  @lclang@$(EXE) \
  src/gen_*.pir \
  src/gen_*.pm \
  $(PMC_DIR)/*.h \
  $(PMC_DIR)/*.c \
  $(PMC_DIR)/*.dump \
  $(PMC_DIR)/*$(O) \
  $(PMC_DIR)/*$(LOAD_EXT) \
  $(PMC_DIR)/*.exp \
  $(PMC_DIR)/*.ilk \
  $(PMC_DIR)/*.manifest \
  $(PMC_DIR)/*.pdb \
  $(PMC_DIR)/*.lib \
  $(PMC_DIR)/objectref.pmc \
  $(OPSDIR)/*.h \
  $(OPSDIR)/*.c \
  $(OPSDIR)/*$(O) \
  $(OPSDIR)/*$(LOAD_EXT) \

HARNESS = $(PERL) t/harness --keep-exit-code --icu=$(HAS_ICU)
HARNESS_JOBS = $(HARNESS) --jobs

# the default target
all: @lclang@$(EXE)

##  targets for building a standalone executable
@lclang@$(EXE): @lclang@.pbc
	$(PBC_TO_EXE) @lclang@.pbc
	@win32_libparrot_copy@

# the compiler .pbc
@lclang@.pbc: Makefile $(PARROT) $(SOURCES) $(BUILTINS_PIR)
	$(PARROT) $(PARROT_ARGS) -o @lclang@.pbc @lclang@.pir

src/gen_grammar.pir: $(PARROT) $(PERL6GRAMMAR) src/pct/grammar.pg src/pct/grammar-oper.pg
	$(PARROT) $(PARROT_ARGS) $(PERL6GRAMMAR) \
	    --output=src/gen_grammar.pir \
	    src/pct/grammar.pg src/pct/grammar-oper.pg

src/gen_actions.pir: $(PARROT) $(NQP) $(PCT) src/pct/actions.pm
	$(PARROT) $(PARROT_ARGS) $(NQP) --output=src/gen_actions.pir \
	    --encoding=fixed_8 --target=pir src/pct/actions.pm

src/gen_builtins.pir: Makefile build/gen_builtins_pir.pl
	$(PERL) build/gen_builtins_pir.pl $(BUILTINS_PIR) > src/gen_builtins.pir

$(@uclang@_GROUP): Makefile $(PARROT) $(PMC_SOURCES)
	cd $(PMC_DIR) && $(BUILD_DYNPMC) generate $(PMCS)
	cd $(PMC_DIR) && $(BUILD_DYNPMC) compile $(PMCS)
	cd $(PMC_DIR) && $(BUILD_DYNPMC) linklibs $(PMCS)
	cd $(PMC_DIR) && $(BUILD_DYNPMC) copy --destination=$(PARROT_DYNEXT) $(PMCS)

src/ops/@lclang@_ops$(LOAD_EXT) : $(PARROT) $(OPS_FILE)
	@cd $(OPSDIR) && $(BUILD_DYNOPS) generate $(OPSLIB)
	@cd $(OPSDIR) && $(BUILD_DYNOPS) compile $(OPSLIB)
	@cd $(OPSDIR) && $(BUILD_DYNOPS) linklibs $(OPSLIB)
	@cd $(OPSDIR) && $(BUILD_DYNOPS) copy "--destination=$(PARROT_DYNEXT)" $(OPSLIB)

##  local copy of Parrot
parrot: parrot/parrot_config build/PARROT_REVISION
	$(PERL) build/gen_parrot.pl

parrot/parrot_config:
	@echo "Don't see parrot/parrot_config."

test: @lclang@$(EXE)
	$(PERL) t/harness t/

# Run a single test
t/*.t t/*/*.t t/*/*/*.t: all Test.pir
	@$(HARNESS_WITH_FUDGE) --verbosity=1 $@

##  cleaning
clean:
	$(RM_F) $(CLEANUPS)

distclean: realclean

realclean: clean
	$(RM_F) src/utils/Makefile Makefile

testclean:


##  miscellaneous targets
# a listing of all targets meant to be called by users
help:
	@echo ""
	@echo "Following targets are available for the user:"
	@echo ""
	@echo "  all:               @lclang@.exe"
	@echo "                     This is the default."
	@echo ""
	@echo "Testing:"
	@echo "  test:              Run Rakudo's sanity tests."
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

Makefile: build/Makefile.in
	@echo ""
	@echo "warning: Makefile is out of date... re-run Configure.pl"
	@echo ""

manifest:
	echo MANIFEST >MANIFEST
	git ls-files | $(PERL) -ne '/^\./ || print' >>MANIFEST

release: manifest
	[ -n "$(VERSION)" ] || ( echo "\nTry 'make release VERSION=yyyymm'\n\n"; exit 1 )
	[ -d @lclang@-$(VERSION) ] || ln -s . @lclang@-$(VERSION)
	$(PERL) -ne 'print "@lclang@-$(VERSION)/$$_"' MANIFEST | \
	    tar -zcv -T - -f @lclang@-$(VERSION).tar.gz
	rm @lclang@-$(VERSION)

__build/gen_builtins_pir.pl__
#!/usr/bin/perl
# $Id$

use strict;
use warnings;

my @files = @ARGV;

print <<"END_PRELUDE";
# This file automatically generated by $0.

END_PRELUDE

foreach my $file (@files) {
    print ".include '$file'\n";
}


__build/gen_parrot.pl__
#! perl

=head1 TITLE

gen_parrot.pl - script to obtain and build Parrot

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
my $required = <$REQ>; chomp $required;
close $REQ;

{
    no warnings;
    if (open my $REV, '-|', "parrot${slash}parrot_config revision") {
        my $revision = <$REV>;
        close $REV;
        chomp $revision;
        if ($revision >= $required) {
            print "Parrot r$revision already available (r$required required)\n";
            exit(0);
        }
    }
}

print "Checking out Parrot r$required via svn...\n";
system(qw(svn checkout -r),  $required , qw(https://svn.parrot.org/parrot/trunk parrot));

chdir('parrot');


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
system($make);

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

__@lclang@.pir__
=head1 TITLE

@lclang@.pir - A @lang@ compiler.

=head2 Description

This is the base file for the @lang@ compiler.

This file includes the parsing and grammar rules from
the src/ directory, loads the relevant PGE libraries,
and registers the compiler under the name '@lang@'.

=head2 Functions

=over 4

=item onload()

Creates the @lang@ compiler using a C<PCT::HLLCompiler>
object.

=cut

.HLL '@lclang@'

.namespace [ '@lang@';'Compiler' ]

.loadlib '@lclang@_group'

.sub '' :anon :load :init
    load_bytecode 'PCT.pbc'
    .local pmc parrotns, hllns, exports
    parrotns = get_root_namespace ['parrot']
    hllns = get_hll_namespace
    exports = split ' ', 'PAST PCT PGE'
    parrotns.'export_to'(hllns, exports)
.end

.include 'src/gen_grammar.pir'
.include 'src/gen_actions.pir'

.sub 'onload' :anon :load :init
    $P0 = get_hll_global ['PCT'], 'HLLCompiler'
    $P1 = $P0.'new'()
    $P1.'language'('@lclang@')
    $P0 = get_hll_namespace ['@lang@';'Grammar']
    $P1.'parsegrammar'($P0)
    $P0 = get_hll_namespace ['@lang@';'Grammar';'Actions']
    $P1.'parseactions'($P0)
.end

=item main(args :slurpy)  :main

Start compilation by passing any command line C<args>
to the @lang@ compiler.

=cut

.sub 'main' :main
    .param pmc args

    $P0 = compreg '@lclang@'
    $P1 = $P0.'command_line'(args)
.end

.include 'src/gen_builtins.pir'

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

__src/pct/grammar.pg__
# @Id@

=begin overview

This is the grammar for @lang@ written as a sequence of Perl 6 rules.

=end overview

grammar @lang@::Grammar is PCT::Grammar;

rule TOP {
    <statement>*
    [ $ || <panic: 'Syntax error'> ]
    {*}
}

##  this <ws> rule treats # as "comment to eol"
##  you may want to replace it with something appropriate
token ws {
    <!ww>
    [ '#' \N* \n? | \s+ ]*
}

rule statement {
    'say' <expression> [ ',' <expression> ]* ';'
    {*}
}

rule value {
    | <integer> {*}                              #= integer
    | <quote> {*}                                #= quote
}

token integer { \d+ {*} }

token quote {
    [ \' <string_literal: '\'' > \' | \" <string_literal: '"' > \" ]
    {*}
}

##  terms
token term {
    | <value> {*}                                #= value
}

rule expression is optable { ... }

__src/pct/grammar-oper.pg__
# @Id@

##  expressions and operators
proto 'term:'     is precedence('=')     is parsed(&term)      { ... }

## multiplicative operators
proto infix:<*>   is looser(term:)       is pirop('mul')     { ... }
proto infix:</>   is equiv(infix:<*>)    is pirop('div')     { ... }

## additive operators
proto infix:<+>   is looser(infix:<*>)   is pirop('add')     { ... }
proto infix:<->   is equiv(infix:<+>)    is pirop('sub')     { ... }

__src/pct/actions.pm__
# @Id@

=begin comments

@lang@::Grammar::Actions - ast transformations for @lang@

This file contains the methods that are used by the parse grammar
to build the PAST representation of an @lang@ program.
Each method below corresponds to a rule in F<src/parser/grammar.pg>,
and is invoked at the point where C<{*}> appears in the rule,
with the current match object as the first argument.  If the
line containing C<{*}> also has a C<#= key> comment, then the
value of the comment is passed as the second argument to the method.

=end comments

class @lang@::Grammar::Actions;

method TOP($/) {
    my $past := PAST::Block.new( :blocktype('declaration'), :node( $/ ), :hll('@lang@') );
    for $<statement> {
        $past.push( $_.ast );
    }
    make $past;
}


method statement($/) {
    my $past := PAST::Op.new( :name('say'), :pasttype('call'), :node( $/ ) );
    for $<expression> {
        $past.push( $_.ast );
    }
    make $past;
}

##  expression:
##    This is one of the more complex transformations, because
##    our grammar is using the operator precedence parser here.
##    As each node in the expression tree is reduced by the
##    parser, it invokes this method with the operator node as
##    the match object and a $key of 'reduce'.  We then build
##    a PAST::Op node using the information provided by the
##    operator node.  (Any traits for the node are held in $<top>.)
##    Finally, when the entire expression is parsed, this method
##    is invoked with the expression in $<expr> and a $key of 'end'.
method expression($/, $key) {
    if ($key eq 'end') {
        make $<expr>.ast;
    }
    else {
        my $past := PAST::Op.new( :name($<type>),
                                  :pasttype($<top><pasttype>),
                                  :pirop($<top><pirop>),
                                  :lvalue($<top><lvalue>),
                                  :node($/)
                                );
        for @($/) {
            $past.push( $_.ast );
        }
        make $past;
    }
}


##  term:
##    Like 'statement' above, the $key has been set to let us know
##    which term subrule was matched.
method term($/, $key) {
    make $/{$key}.ast;
}


method value($/, $key) {
    make $/{$key}.ast;
}


method integer($/) {
    make PAST::Val.new( :value( ~$/ ), :returns('Integer'), :node($/) );
}


method quote($/) {
    make PAST::Val.new( :value( $<string_literal>.ast ), :node($/) );
}


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

__src/builtins/say.pir__
# @Id@

=head1

say.pir -- simple implementation of a say function

=cut

.namespace []

.sub 'say'
    .param pmc args            :slurpy
    .local pmc iter
    iter = new 'Iterator', args
  iter_loop:
    unless iter goto iter_end
    $P0 = shift iter
    print $P0
    goto iter_loop
  iter_end:
    print "\n"
    .return ()
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

__t/harness__
#! perl

# $Id$

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
        exec      => ['./perl6'],
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

