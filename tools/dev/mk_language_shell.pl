#! perl
# Copyright (C) 2007-2010, Parrot Foundation.
# $Id$

=head1 NAME

tools/dev/mk_language_shell.pl -- create initial files for a new language implementation

=head1 SYNOPSIS

 % perl tools/dev/mk_language_shell.pl [options] Xyz [path]

option:

 --with-doc
 --with-ops
 --with-pmc

=head1 DESCRIPTION

This script populates a directory with files for building a
new language translator in Parrot. The first argument is the
name of the language to be built. The C<path> argument
says where to populate the directory, if no C<path> is specified
then it is taken to be a subdirectory of the current directory
with the same name as the language (converted to lowercase).

For a language 'Xyz', this script will create the following
files and directories (relative to C<path>, which defaults
to F<xyz> if an explicit C<path> isn't given):

    PARROT_REVISION
    README
    setup.pir
    xyz.pir
    doc/running.pod
    doc/Xyz.pod
    src/Xyz.pir
    src/Xyz/Grammar.pm
    src/Xyz/Actions.pm
    src/Xyz/Compiler.pm
    src/Xyz/Runtime.pm
    src/pmc/xyz.pmc
    src/ops/xyz.ops
    src/xyz.pir
    t/00-sanity.t
    xyz/.ignore

Any files that already exist are skipped, so this script can
be used to repopulate a language directory with omitted files.

If all goes well, after creating the language shell one can simply
change to the language directory and type

    $ parrot setup.pir
    $ parrot setup.pir test

to verify that the new language compiles and configures properly.

=cut

use strict;
use warnings;

use FindBin qw($Bin);
use lib "$Bin/../lib";    # install location
use lib "$Bin/../../lib"; # build location

use File::Path;
use File::Spec;
use Getopt::Long;

use Parrot::Config qw/ %PConfig /;

my ($with_doc, $with_ops, $with_pmc);
GetOptions(
    'with-doc' => \$with_doc,
    'with-ops' => \$with_ops,
    'with-pmc' => \$with_pmc,
);

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
$rev =~ s/^\D*(\d+)\D*$/$1/;

my $no_doc = $with_doc ? '' : '#';
my $no_ops = $with_ops ? '' : '#';
my $no_pmc = $with_pmc ? '' : '#';

##  get the path from the command line, or if not supplied then
##  use $lclang.
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
    s{\@no_doc\@} {$no_doc}ig;
    s{\@no_ops\@} {$no_ops}ig;
    s{\@no_pmc\@} {$no_pmc}ig;
    s{\@rev\@}    {$rev}ig;
    if (/^__(.*)__$/) { start_new_file("$path$PConfig{slash}$1"); }
    elsif ($fh) { print $fh $_; }
}
##  close the last file
close($fh) if $fh;

##  we're done
1;


##  this function closes any previous opened file, and determines
##  if we're creating a new file.  It also calls C<mkpath> to
##  create any needed parent subdirectories.
sub start_new_file {
    my ($filepath) = @_;
    if ($fh) {
        close $fh;
        undef $fh;
    }
    if (-e $filepath) {
        print "skipping $filepath\n";
        return;
    }
    if (!$with_doc and $filepath =~ /doc/) {
        print "no doc: skipping $filepath\n";
        return;
    }
    if (!$with_ops and $filepath =~ /ops/) {
        print "no ops: skipping $filepath\n";
        return;
    }
    if (!$with_pmc and $filepath =~ /pmc/) {
        print "no pmc: skipping $filepath\n";
        return;
    }
    if (!$with_ops and!$with_pmc and $filepath =~ /dynext/) {
        print "no dynext: skipping $filepath\n";
        return;
    }
    my ($volume, $dir, $base) = File::Spec->splitpath($filepath);
    my $filedir = File::Spec->catpath($volume, $dir);
    unless (-d $filedir) {
        print "creating $filedir\n";
        mkpath( [ $filedir ], 0, 0777 );
    }
    print "creating $filepath\n";
    open $fh, '>', $filepath;

    return;
}



###  The section below contains the text of the files to be created.
###  The name of the file to be created is given as C<__filepath__>,
###  and all subsequent lines up to the next C<__filepath__> are
###  placed in the file (performing substitutions on @lang@, @lclang@,
###  @UCLANG@, and @Id@ as appropriate).

__DATA__
__README__
Language '@lang@' was created with @script@, r@rev@.

    $ parrot setup.pir
    $ parrot setup.pir test

__setup.pir__
#!/usr/bin/env parrot
# @Id@

=head1 NAME

setup.pir - Python distutils style

=head1 DESCRIPTION

No Configure step, no Makefile generated.

=head1 USAGE

    $ parrot setup.pir build
    $ parrot setup.pir test
    $ sudo parrot setup.pir install

=cut

.sub 'main' :main
    .param pmc args
    $S0 = shift args
    load_bytecode 'distutils.pbc'

    .local int reqsvn
    $P0 = new 'FileHandle'
    $P0.'open'('PARROT_REVISION', 'r')
    $S0 = $P0.'readline'()
    reqsvn = $S0
    $P0.'close'()

    .local pmc config
    config = get_config()
    $I0 = config['revision']
    unless $I0 goto L1
    unless reqsvn > $I0 goto L1
    $S1 = "Parrot revision r"
    $S0 = reqsvn
    $S1 .= $S0
    $S1 .= " required (currently r"
    $S0 = $I0
    $S1 .= $S0
    $S1 .= ")\n"
    print $S1
    end
  L1:

    $P0 = new 'Hash'
    $P0['name'] = '@lang@'
    $P0['abstract'] = 'the @lang@ compiler'
    $P0['description'] = 'the @lang@ for Parrot VM.'

    # build
@no_ops@    $P1 = new 'Hash'
@no_ops@    $P1['@lclang@_ops'] = 'src/ops/@lclang@.ops'
@no_ops@    $P0['dynops'] = $P1

@no_pmc@    $P2 = new 'Hash'
@no_pmc@    $P3 = split ' ', 'src/pmc/@lclang@.pmc'
@no_pmc@    $P2['@lclang@_group'] = $P3
@no_pmc@    $P0['dynpmc'] = $P2

    $P4 = new 'Hash'
    $P4['src/gen_actions.pir'] = 'src/@lang@/Actions.pm'
    $P4['src/gen_compiler.pir'] = 'src/@lang@/Compiler.pm'
    $P4['src/gen_grammar.pir'] = 'src/@lang@/Grammar.pm'
    $P4['src/gen_runtime.pir'] = 'src/@lang@/Runtime.pm'
    $P0['pir_nqp-rx'] = $P4

    $P5 = new 'Hash'
    $P6 = split "\n", <<'SOURCES'
src/@lclang@.pir
src/gen_actions.pir
src/gen_compiler.pir
src/gen_grammar.pir
src/gen_runtime.pir
SOURCES
    $S0 = pop $P6
    $P5['@lclang@/@lclang@.pbc'] = $P6
    $P5['@lclang@.pbc'] = '@lclang@.pir'
    $P0['pbc_pir'] = $P5

    $P7 = new 'Hash'
    $P7['parrot-@lclang@'] = '@lclang@.pbc'
    $P0['installable_pbc'] = $P7

    # test
    $S0 = get_parrot()
    $S0 .= ' @lclang@.pbc'
    $P0['prove_exec'] = $S0

    # install
    $P0['inst_lang'] = '@lclang@/@lclang@.pbc'

    # dist
    $P0['doc_files'] = 'README'

    .tailcall setup(args :flat, $P0 :flat :named)
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

__PARROT_REVISION__
@rev@
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

__dynext/.ignore__

__@lclang@/.ignore__

__@lclang@.pir__
# @Id@

=head1 TITLE

@lclang@.pir - A @lang@ compiler.

=head2 Description

This is the entry point for the @lang@ compiler.

=head2 Functions

=over 4

=item main(args :slurpy)  :main

Start compilation by passing any command line C<args>
to the @lang@ compiler.

=cut

.sub 'main' :main
    .param pmc args

    load_language '@lclang@'

    $P0 = compreg '@lang@'
    $P1 = $P0.'command_line'(args)
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

__src/@lclang@.pir__
# @Id@

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
@no_pmc@.loadlib '@lclang@_group'

.namespace []

.sub '' :anon :load
    load_bytecode 'HLL.pbc'

    .local pmc hllns, parrotns, imports
    hllns = get_hll_namespace
    parrotns = get_root_namespace ['parrot']
    imports = split ' ', 'PAST PCT HLL Regex Hash'
    parrotns.'export_to'(hllns, imports)
.end

.include 'src/gen_grammar.pir'
.include 'src/gen_actions.pir'
.include 'src/gen_compiler.pir'
.include 'src/gen_runtime.pir'

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

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
    auto_attrs
    dynpmc
    {
/*

=item C<void class_init()>

initialize the pmc class. Store some constants, etc.

=cut

*/

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
            array_t = Parrot_pmc_get_type_str(INTERP,
                string_from_literal(INTERP, "@lang@"));
            */
            property = Parrot_pmc_new(INTERP, VTABLE_type(INTERP, SELF));

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

If the new property is larger than our old property, pad the end of the vector
with elements from the beginning.

If the new property is shorter than our old property, truncate elements from
the end of the vector.

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

BEGIN_OPS_PREAMBLE

#include "parrot/dynext.h"

END_OPS_PREAMBLE

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

