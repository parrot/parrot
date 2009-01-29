#! perl
# Copyright (C) 2007-2008, The Perl Foundation.
# $Id$

=head1 NAME

tools/dev/mk_language_shell.pl -- create initial files for a new language

=head1 SYNOPSIS

% perl tools/dev/mk_language_shell.pl Xyz [path]

=head1 DESCRIPTION

This script populates a directory with files for building a
new language translator in Parrot.  The first argument is the
name of the language to be built.  The C<path> argument
says where to populate the directory, if no C<path> is specified
then it is taken to be a subdirectory in F<languages/> (with the
name of the directory converted to lowercase).

For a language 'Xyz', this script will create the following
files and directories (relative to C<path>, which defaults
to F<languages/xyz> if an explicit C<path> isn't given):

    README
    Configure.pl
    xyz.pir
    config/makefiles/root.in
    src/parser/grammar.pg
    src/parser/grammar-oper.pg
    src/parser/actions.pm
    src/builtins/say.pir
    t/harness
    t/00-sanity.t

Any files that already exist are skipped, so this script can
be used to repopulate a language directory with omitted files.

After populating the language directory, the script attempts to
run Configure.pl to automatically generate the Makefile
from config/makefiles/root.in . This step is only executed if the
optional C<path> argument is not specified.

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
use Parrot::Config qw/ %PConfig /;

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
my $path = $ARGV[1] ||
           "$PConfig{build_dir}$PConfig{slash}languages$PConfig{slash}$lclang";

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
    if (/^__(.*)__$/) { start_new_file("$path$PConfig{slash}$1"); }
    elsif ($fh) { print $fh $_; }
}
##  close the last file
close($fh) if $fh;

##  build the initial makefile if no path was specified on command line
unless ($ARGV[1]) {
  my $reconfigure = "$PConfig{perl} Configure.pl";
  system("cd languages && cd $lclang && $reconfigure");
}

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
# @Id@

use strict;
use warnings;
use 5.008;

my $build_dir = '../..';
my $hll       = '@lclang@';
my $cmd       = qq{$^X -Ilib tools/dev/reconfigure.pl --step=gen::languages --languages=$hll};

print "Running '$cmd' in $build_dir\n";
chdir $build_dir;
`$cmd`

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

__config/makefiles/root.in__
## @Id@

## arguments we want to run parrot with
PARROT_ARGS =

## configuration settings
BUILD_DIR     = @build_dir@
LOAD_EXT      = @load_ext@
O             = @o@

## Setup some commands
PERL          = @perl@
RM_F          = @rm_f@
CP            = @cp@
CAT           = $(PERL) -MExtUtils::Command -e cat
PARROT        = ../../parrot@exe@
BUILD_DYNPMC  = $(PERL) $(BUILD_DIR)/tools/build/dynpmc.pl
#IF(darwin):
#IF(darwin):# MACOSX_DEPLOYMENT_TARGET must be defined for OS X compilation/linking
#IF(darwin):export MACOSX_DEPLOYMENT_TARGET := @osx_version@

## places to look for things
PARROT_DYNEXT = $(BUILD_DIR)/runtime/parrot/dynext
PGE_LIBRARY   = $(BUILD_DIR)/runtime/parrot/library/PGE
PERL6GRAMMAR  = $(PGE_LIBRARY)/Perl6Grammar.pbc
NQP           = $(BUILD_DIR)/compilers/nqp/nqp.pbc
PCT           = $(BUILD_DIR)/runtime/parrot/library/PCT.pbc

PMC_DIR       = src/pmc

all: @lclang@.pbc

@UCLANG@_GROUP = $(PMC_DIR)/@lclang@_group$(LOAD_EXT)

SOURCES = @lclang@.pir \
  src/gen_grammar.pir \
  src/gen_actions.pir \
  src/gen_builtins.pir \
#  $(@UCLANG@_GROUP)

BUILTINS_PIR = \
  src/builtins/say.pir \

# PMCS = @lclang@
# PMC_SOURCES = $(PMC_DIR)/@lclang@.pmc

# the default target
@lclang@.pbc: $(PARROT) $(SOURCES)
	$(PARROT) $(PARROT_ARGS) -o @lclang@.pbc @lclang@.pir

src/gen_grammar.pir: $(PERL6GRAMMAR) src/parser/grammar.pg src/parser/grammar-oper.pg
	$(PARROT) $(PARROT_ARGS) $(PERL6GRAMMAR) \
	    --output=src/gen_grammar.pir \
	    src/parser/grammar.pg \
	    src/parser/grammar-oper.pg \

src/gen_actions.pir: $(NQP) $(PCT) src/parser/actions.pm
	$(PARROT) $(PARROT_ARGS) $(NQP) --output=src/gen_actions.pir \
	    --target=pir src/parser/actions.pm

src/gen_builtins.pir: $(BUILTINS_PIR)
	$(CAT) $(BUILTINS_PIR) >src/gen_builtins.pir

$(@UCLANG@_GROUP): $(PARROT) $(PMC_SOURCES)
	cd $(PMC_DIR) && $(BUILD_DYNPMC) generate $(PMCS)
	cd $(PMC_DIR) && $(BUILD_DYNPMC) compile $(PMCS)
	cd $(PMC_DIR) && $(BUILD_DYNPMC) linklibs $(PMCS)
	cd $(PMC_DIR) && $(BUILD_DYNPMC) copy --destination=$(PARROT_DYNEXT) $(PMCS)

# regenerate the Makefile
Makefile: config/makefiles/root.in
	$(PERL) Configure.pl

# This is a listing of all targets, that are meant to be called by users
help:
	@echo ""
	@echo "Following targets are available for the user:"
	@echo ""
	@echo "  all:               @lclang@.pbc"
	@echo "                     This is the default."
	@echo "Testing:"
	@echo "  test:              Run the test suite."
	@echo "  testclean:         Clean up test results."
	@echo ""
	@echo "Cleaning:"
	@echo "  clean:             Basic cleaning up."
	@echo "  realclean:         Removes also files generated by 'Configure.pl'"
	@echo "  distclean:         Removes also anything built, in theory"
	@echo ""
	@echo "Misc:"
	@echo "  help:              Print this help message."
	@echo ""

test: all
	$(PERL) t/harness

# this target has nothing to do
testclean:

CLEANUPS = \
  @lclang@.pbc \
  "src/gen_*.pir"

PMC_CLEANUPS = \
  "$(PMC_DIR)/*.h" \
  "$(PMC_DIR)/*.c" \
  "$(PMC_DIR)/*.dump" \
  "$(PMC_DIR)/*$(O)" \
#IF(win32):  "$(PMC_DIR)/*.exp" \
#IF(win32):  "$(PMC_DIR)/*.ilk" \
#IF(win32):  "$(PMC_DIR)/*.manifest" \
#IF(win32):  "$(PMC_DIR)/*.pdb" \
#IF(win32):  "$(PMC_DIR)/*.lib" \
  "$(PMC_DIR)/*$(LOAD_EXT)"


clean: testclean
	$(RM_F) $(CLEANUPS)
#	$(RM_F) $(PMC_CLEANUPS)

realclean: clean
	$(RM_F) Makefile

distclean: realclean

# Local variables:
#   mode: makefile
# End:
# vim: ft=make:

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

__src/parser/grammar.pg__
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

__src/parser/grammar-oper.pg__
# @Id@

##  expressions and operators
proto 'term:'     is precedence('=')     is parsed(&term)      { ... }

## multiplicative operators
proto infix:<*>   is looser(term:)       is pirop('mul')     { ... }
proto infix:</>   is equiv(infix:<*>)    is pirop('div')     { ... }

## additive operators
proto infix:<+>   is looser(infix:<*>)   is pirop('add')     { ... }
proto infix:<->   is equiv(infix:<+>)    is pirop('sub')     { ... }

__src/parser/actions.pm__
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
    my $past := PAST::Block.new( :blocktype('declaration'), :node( $/ ), :hll('@lclang@') );
    for $<statement> {
        $past.push( $( $_ ) );
    }
    make $past;
}


method statement($/) {
    my $past := PAST::Op.new( :name('say'), :pasttype('call'), :node( $/ ) );
    for $<expression> {
        $past.push( $( $_ ) );
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
        make $($<expr>);
    }
    else {
        my $past := PAST::Op.new( :name($<type>),
                                  :pasttype($<top><pasttype>),
                                  :pirop($<top><pirop>),
                                  :lvalue($<top><lvalue>),
                                  :node($/)
                                );
        for @($/) {
            $past.push( $($_) );
        }
        make $past;
    }
}


##  term:
##    Like 'statement' above, the $key has been set to let us know
##    which term subrule was matched.
method term($/, $key) {
    make $( $/{$key} );
}


method value($/, $key) {
    make $( $/{$key} );
}


method integer($/) {
    make PAST::Val.new( :value( ~$/ ), :returns('Integer'), :node($/) );
}


method quote($/) {
    make PAST::Val.new( :value( $($<string_literal>) ), :node($/) );
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

# @Id@

# pragmata
use strict;
use warnings;
use 5.008;

use lib qw( . lib ../lib ../../lib ../../lib );
use Parrot::Test::Harness language => '@lang@',
                          compiler => '@lclang@.pbc';

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

