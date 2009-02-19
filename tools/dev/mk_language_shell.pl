#! perl
# Copyright (C) 2007-2008, Parrot Foundation.
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

    MAINTAINER
    README
    STATUS
    Configure.pl
    xyz.pir
    config/makefiles/root.in
    doc/running.pod
    doc/Xyz.pod
    src/builtins/say.pir
    src/parser/grammar.pg
    src/parser/grammar-oper.pg
    src/parser/actions.pm
    src/pmc/xyz.pmc
    src/ops/xyz.ops
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

See doc/@lang@.pod for the documentation, and
doc/running.pod for the command-line options.

__MAINTAINER__
# @Id@

N: My Name
E: My Email

__STATUS__
Number of tests passing:
Percentage of implementation finished:
TODO:

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
PARROT_ARGS   =

## configuration settings
BUILD_DIR     = @build_dir@
LOAD_EXT      = @load_ext@
O             = @o@
BIN_DIR       = @bin_dir@
LIB_DIR       = @lib_dir@
DOC_DIR       = @doc_dir@
MANDIR        = @mandir@
PARROT_DYNEXT = $(BUILD_DIR)/runtime/parrot/dynext

## Setup some commands
PERL          = @perl@
RM_F          = @rm_f@
CP            = @cp@
CAT           = @cat@
MKPATH        = @mkpath@
POD2MAN       = pod2man
#IF(parrot_is_shared and not(cygwin or win32)):export LD_RUN_PATH := @blib_dir@:$(LD_RUN_PATH)
PARROT        = ../../parrot@exe@
PBC_TO_EXE    = ../../pbc_to_exe@exe@
PMCBUILD      = $(PERL) $(BUILD_DIR)/tools/build/dynpmc.pl
OPSBUILD      = $(PERL) $(BUILD_DIR)/tools/build/dynoplibs.pl
RECONFIGURE   = $(PERL) $(BUILD_DIR)/tools/dev/reconfigure.pl
#IF(darwin):
#IF(darwin):# MACOSX_DEPLOYMENT_TARGET must be defined for OS X compilation/linking
#IF(darwin):export MACOSX_DEPLOYMENT_TARGET := @osx_version@

## places to look for things
PGE_LIBRARY   = $(BUILD_DIR)/runtime/parrot/library/PGE
PCT           = $(BUILD_DIR)/runtime/parrot/library/PCT.pbc
PERL6GRAMMAR  = $(PGE_LIBRARY)/Perl6Grammar.pbc
NQP           = $(BUILD_DIR)/compilers/nqp/nqp.pbc

PMC_DIR       = src/pmc
OPS_DIR       = src/ops
OPSLIB        = @lclang@

@UCLANG@_GROUP = $(PMC_DIR)/@lclang@_group$(LOAD_EXT)
@UCLANG@_OPS = $(OPS_DIR)/@lclang@_ops$(LOAD_EXT)

build: $(@UCLANG@_GROUP) $(@UCLANG@_OPS) @lclang@.pbc

all: $(@UCLANG@_GROUP) $(@UCLANG@_OPS) @lclang@.pbc @lclang@@exe@ installable

SOURCES = @lclang@.pir \
  src/gen_grammar.pir \
  src/gen_actions.pir \
  src/gen_builtins.pir \
  $(@UCLANG@_GROUP)

BUILTINS_PIR = \
  src/builtins/say.pir

PMCS = @lclang@
PMC_SOURCES = $(PMC_DIR)/@lclang@.pmc
OPS_SOURCES = $(OPS_DIR)/@lclang@.ops
DOCS = MAINTAINER README TODO

# the default target
@lclang@.pbc: $(SOURCES)
	$(PARROT) $(PARROT_ARGS) -o @lclang@.pbc @lclang@.pir

@lclang@@exe@: @lclang@.pbc
	$(PBC_TO_EXE) @lclang@.pbc

src/gen_grammar.pir: $(PERL6GRAMMAR) src/parser/grammar.pg src/parser/grammar-oper.pg
	$(PARROT) $(PARROT_ARGS) $(PERL6GRAMMAR) \
	    --output=src/gen_grammar.pir \
	    src/parser/grammar.pg \
	    src/parser/grammar-oper.pg

src/gen_actions.pir: $(NQP) $(PCT) src/parser/actions.pm
	$(PARROT) $(PARROT_ARGS) $(NQP) --output=src/gen_actions.pir \
	    --target=pir src/parser/actions.pm

src/gen_builtins.pir: $(BUILTINS_PIR)
	$(CAT) $(BUILTINS_PIR) > src/gen_builtins.pir

$(@UCLANG@_GROUP): $(PMC_SOURCES)
	@cd $(PMC_DIR) && $(PMCBUILD) generate $(PMCS)
	@cd $(PMC_DIR) && $(PMCBUILD) compile  $(PMCS)
	@cd $(PMC_DIR) && $(PMCBUILD) linklibs $(PMCS)
	@cd $(PMC_DIR) && $(PMCBUILD) copy "--destination=$(PARROT_DYNEXT)" $(PMCS)

$(@UCLANG@_OPS): $(OPS_SOURCES)
	@cd $(OPS_DIR) && $(OPSBUILD) generate $(OPSLIB)
	@cd $(OPS_DIR) && $(OPSBUILD) compile  $(OPSLIB)
	@cd $(OPS_DIR) && $(OPSBUILD) linklibs $(OPSLIB)
	@cd $(OPS_DIR) && $(OPSBUILD) copy "--destination=$(PARROT_DYNEXT)" $(OPSLIB)

installable: installable_@lclang@@exe@

installable_@lclang@@exe@: @lclang@.pbc
	$(PBC_TO_EXE) @lclang@.pbc --install

# regenerate the Makefile
Makefile: config/makefiles/root.in
	$(PERL) Configure.pl

# This is a listing of all targets, that are meant to be called by users
help:
	@echo ""
	@echo "Following targets are available for the user:"
	@echo ""
	@echo "  build:             @lclang@.pbc"
	@echo "                     This is the default."
	@echo "  @lclang@@exe@      Self-hosting binary not to be installed."
	@echo "  all:               @lclang@.pbc @lclang@@exe@ installable Makefile"
	@echo "  installable:       Create libs and self-hosting binaries to be installed."
	@echo "  install:           Install the installable targets and docs."
	@echo ""
	@echo "Testing:"
	@echo "  test:              Run the test suite."
	@echo "  test-installable:  Test self-hosting targets."
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

test: build
	$(PERL) t/harness

# TODO: rename build_dir. basic run for missing libs
test-installable: installable
	echo "1" | ./installable_@lclang@@exe@

install: installable
	$(CP) installable_@lclang@@exe@ $(DESTDIR)$(BIN_DIR)/parrot-@lclang@@exe@
	@cd $(OPS_DIR) && $(OPSBUILD) copy "--destination=$(DESTDIR)$(LIB_DIR)/parrot/dynext" $(OPSLIB)
	@cd $(PMC_DIR) && $(PMCBUILD) copy "--destination=$(DESTDIR)$(LIB_DIR)/parrot/dynext" $(PMCS)
	-$(MKPATH) $(LIB_DIR)/parrot/languages/@lclang@
	$(CP) @lclang@.pbc $(DESTDIR)$(LIB_DIR)/parrot/languages/@lclang@/@lclang@.pbc
	-$(MKPATH) $(DESTDIR)$(MANDIR)/man1
	$(POD2MAN) doc/running.pod > $(DESTDIR)$(MANDIR)/man1/parrot-@lclang@.1
	-$(MKPATH) $(DESTDIR)$(DOC_DIR)/languages/@lclang@
	$(CP) $(DOCS) $(DESTDIR)$(DOC_DIR)/languages/@lclang@

win32-inno-installer: installable
	-$(MKPATH) man/man1
	$(POD2MAN) doc/running.pod > man/man1/parrot-@lclang@.1
	-$(MKPATH) man/html
	pod2html --infile doc/running.pod --outfile man/html/parrot-@lclang@.html
	$(CP) installable_@lclang@@exe@ parrot-@lclang@@exe@
	cd @build_dir@ && $(PERL) tools/dev/mk_inno_language.pl @lclang@
	cd @build_dir@ && iscc parrot-@lclang@.iss

# clean intermediate test files
testclean:

CLEANUPS = \
  @lclang@.pbc \
  "src/gen_*.pir" \
  @lclang@@exe@ \
  installable_@lclang@@exe@

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

OPS_CLEANUPS = \
  "$(OPS_DIR)/*.c" \
  "$(OPS_DIR)/*.h" \
  "$(OPS_DIR)/*$(O)" \
  "$(OPS_DIR)/*$(LOAD_EXT)"

clean: testclean
	$(RM_F) $(CLEANUPS)
	$(RM_F) $(PMC_CLEANUPS)
	$(RM_F) $(OPS_CLEANUPS)

realclean: clean
	$(RM_F) Makefile

distclean: realclean

# Local variables:
#   mode: makefile
# End:
# vim: ft=make:

__doc/@lang@.pod__
# @Id@

=head1 @lang@

=head1 Design

=head1 SEE ALSO

=cut

# Local Variables:
#   fill-column:78
# End:
# vim: expandtab shiftwidth=4:
__doc/running.pod__
# @Id@

=head1 Running

This document describes how to use the command line @lclang@ program, which
...

=head2 Usage

  parrot @lclang@.pbc [OPTIONS] <input>

or

  parrot-@lclang@@exe [OPTIONS] <input>

A number of additional options are available:

  -q  Quiet mode; suppress output of summary at the end.

=cut

# Local Variables:
#   fill-column:78
# End:
# vim: expandtab shiftwidth=4:
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

.namespace [ '@lang@::Compiler' ]

.loadlib '@lclang@_group'

.sub 'onload' :anon :load :init
    load_bytecode 'PCT.pbc'

    $P0 = get_hll_global ['PCT'], 'HLLCompiler'
    $P1 = $P0.'new'()
    $P1.'language'('@lang@')
    $P1.'parsegrammar'('@lang@::Grammar')
    $P1.'parseactions'('@lang@::Grammar::Actions')
.end

=item main(args :slurpy)  :main

Start compilation by passing any command line C<args>
to the @lang@ compiler.

=cut

.sub 'main' :main
    .param pmc args

    $P0 = compreg '@lang@'
    $P1 = $P0.'command_line'(args)
.end

.include 'src/gen_builtins.pir'
.include 'src/gen_grammar.pir'
.include 'src/gen_actions.pir'

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
    my $past := PAST::Block.new( :blocktype('declaration'), :node( $/ ) );
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

__src/pmc/@lclang@.pmc__
/*
Copyright (C) 20xx, Parrot Foundation.
@Id@

=head1 NAME

src/pmc/@lang@.pmc - @lang@

=head1 DESCRIPTION

These are the vtable functions for the @lang@ class.

=cut

=head2 Helper functions

=over 4

=item INTVAL size(INTERP, PMC, PMC)

*/

#include "parrot/parrot.h"

static INTVAL
size(Interp *interp, PMC* self, PMC* obj)
{
    INTVAL retval;
    INTVAL dimension;
    INTVAL length;
    INTVAL pos;

    if (!obj || PMC_IS_NULL(obj)) {
        /* not set, so a simple 1D */
        return VTABLE_get_integer(interp, self);
    }

    retval = 1;
    dimension = VTABLE_get_integer(interp, obj);
    for (pos = 0; pos < dimension; pos++)
    {
        length = VTABLE_get_integer_keyed_int(interp, obj, pos);
        retval *= length;
    }
    return retval;
}

/*

=back

=head2 Methods

=over 4

=cut

*/

pmclass @lang@
    extends ResizablePMCArray
    provides array
    group   @lclang@_group

    need_ext
    dynpmc
    {
/*

=item C<void class_init()>

initialize the pmc class. Store some constants, etc.

=cut

*/

    /* RT#48194: move any constant string declarations here so we just do them once. */
    void class_init() {
    }


/*

=item C<PMC* init()>

initialize the instance.

=cut

*/

void init() {
    SUPER();
};

=item C<PMC* get()>

Returns a vector-like PMC.

=cut

*/

    METHOD PMC* get() {
        PMC* property;
        INTVAL array_t;
        STRING* property_name;

        property_name = string_from_literal(INTERP, "property");
        shape = VTABLE_getprop(INTERP, SELF, property_name);
        if (PMC_IS_NULL(property)) {
           /*
            * No property has been set yet. This means that we are
            * a simple vector
            *
            * we use our own type here. Perhaps a better way to
            * specify it?
            */
            /*
            array_t = pmc_type(INTERP,
                string_from_literal(INTERP, "@lang@"));
            */
            property = pmc_new(INTERP, VTABLE_type(INTERP, SELF));

            VTABLE_set_integer_native(INTERP, property, 1);
            VTABLE_set_integer_keyed_int(INTERP, property, 0,
                VTABLE_get_integer(INTERP, SELF));
            VTABLE_setprop(INTERP, SELF, property_name, property);
        }
        RETURN(PMC* property);
    }

/*

=item C<PMC* set()>

Change the existing @lang@ by passing in an existing vector.

If the new property is larger than our old property, pad the end of the APLv
with elements from the beginning.

If the new property is shorter than our old property, truncate elements from
the end of the APLv.

=cut

*/

    METHOD set(PMC *new_property) {
        STRING* property_name;
        PMC*    old_property;
        INTVAL  old_size, new_size, pos;

        /* save the old property momentarily, set the new property */
        property_name = string_from_literal(INTERP, "property");
        old_property = VTABLE_getprop(INTERP, SELF, property_name);
        VTABLE_setprop(INTERP, SELF, property_name, new_property);

        /* how big are these property? */
        old_size = size(INTERP, SELF, old_property);
        new_size = size(INTERP, SELF, new_property);

        if (old_size > new_size) {
            for (; new_size != old_size; new_size++) {
                VTABLE_pop_pmc(INTERP, SELF);
            }
        } else if (new_size > old_size) {
            pos = 0;
            for (; new_size != old_size; old_size++, pos++) {
                /* RT#48196 clone this? */
                VTABLE_push_pmc(INTERP, SELF,
                    VTABLE_get_pmc_keyed_int(INTERP, SELF, pos));
            }
        }
    }

/*

=back

=cut

*/

}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
__src/ops/@lclang@.ops__
/*
 * @id@
 * Copyright (C) 20xx, Parrot Foundation.
 */

#include "parrot/dynext.h"
VERSION = PARROT_VERSION;

/* Op to get the address of a PMC. */
inline op @lclang@_pmc_addr(out INT, invar PMC) :base_core {
    $1 = (int) $2;
    goto NEXT();
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
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

