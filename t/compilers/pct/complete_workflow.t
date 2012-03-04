#!perl
# Copyright (C) 2008-2011, Parrot Foundation.

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);

use Test::More;

use Parrot::Test tests => 6 * 9;
use Parrot::Test::Util 'create_tempfile';
use Parrot::Config qw(%PConfig);

=head1 NAME

pct/complete_workflow.t - PCT tests

=head1 SYNOPSIS

    $ prove t/compilers/pct/complete_workflow.t

=head1 DESCRIPTION

Special cases in grammars and actions should be tested here.

This test script builds a parser from a grammar syntax file.
After that actions are added from a NQP class file.
After that the generated compiler is tested against a sample input.

=cut

{
    test_pct( 'sanity', <<'IN', <<'GRAMMAR', <<'ACTIONS', <<'OUT' );
thingy
IN
token TOP   { 'thingy' {*} }
GRAMMAR

method TOP($/) {
    my $past  := PAST::Stmts.new(
                     PAST::Op.new(
                         PAST::Val.new(
                             :value( ~$/ ),
                             :returns('String')
                         ),
                         :pirop('say'),
                     )
                 );

    make $past;
}
ACTIONS
thingy
OUT
}

{
    test_pct( 'key', <<'IN', <<'GRAMMAR', <<'ACTIONS', <<'OUT' );
thingy
IN
token TOP   { 'thingy' {*}  #= key_for_thingy
            | 'stuff'  {*}  #= key_for_stuff
            }
GRAMMAR

method TOP($/,$key) {
    my $past  := PAST::Stmts.new(
                     PAST::Op.new(
                         PAST::Val.new(
                             :value( ~$/ ~ " with key: '" ~ $key ~ "'" ),
                             :returns('String')
                         ),
                         :pirop('say'),
                     )
                 );

    make $past;
}
ACTIONS
thingy with key: 'key_for_thingy'
OUT
}

{
    test_pct( '"our" var in thingy()', <<'IN', <<'GRAMMAR', <<'ACTIONS', <<'OUT' );
thingy
IN
token TOP    { <thingy> {*} }
token thingy { 'thingy' {*} }
GRAMMAR

method TOP($/) {
    # thingy() is executed before TOP.
    # So setting $?MY_OUR_VAR here won't affect the generated PAST
    our $?MY_OUR_VAR := 'was set in method TOP';
    make $<thingy>.ast;
}

method thingy($/) {
    our $?MY_OUR_VAR := 'was set in method thingy';
    my $past  := PAST::Stmts.new(
                     PAST::Op.new(
                         PAST::Val.new(
                             :value( 'our var ' ~ $?MY_OUR_VAR ),
                             :returns('String')
                         ),
                         :pirop('say'),
                     )
                 );

    make $past;
}
ACTIONS
our var was set in method thingy
OUT
}

{
    test_pct( '"our" var passed up', <<'IN', <<'GRAMMAR', <<'ACTIONS', <<'OUT' );
thingy
IN
token TOP    { <thingy> {*} }
token thingy { 'thingy' {*} }
GRAMMAR

method TOP($/) {
    our $?MY_OUR_VAR;
    my $past := $<thingy>.ast; # $?MY_OUR_VAR has been set in thingy()
    $past[0][0].value( 'our var ' ~ $?MY_OUR_VAR );

    make $past;
}

method thingy($/) {
    our $?MY_OUR_VAR := 'was passed up';
    make PAST::Stmts.new(
             PAST::Op.new(
                 PAST::Val.new(
                     :value( 'will be overwritten' ),
                     :returns('String')
                 ),
                 :pirop('say'),
             )
         );
}
ACTIONS
our var was passed up
OUT
}

{
    test_pct( 'scoping', <<'IN', <<'GRAMMAR', <<'ACTIONS', <<'OUT' );
<a>thingy</a><b>thingy</b>
IN
token TOP {
    <scope_a> <scope_b> {*}
}
token scope_a {
    <.INIT_SCOPE_A>
    '<a>'
    <thingy>
    '</a>'  {*}
}
token scope_b {
    <.INIT_SCOPE_B>
    '<b>'
    <thingy>
    '</b>'  {*}
}
token INIT_SCOPE_A {
  {*}
}
token INIT_SCOPE_B {
  {*}
}
token thingy {
    'thingy' {*}
}
GRAMMAR

method TOP($/) {
    my $past := PAST::Stmts.new();
    $past.push( $<scope_a>.ast );
    $past.push( $<scope_b>.ast );

    make $past;
}

method scope_a($/) {
   make $<thingy>.ast;
}

method scope_b($/) {
   make $<thingy>.ast;
}

method INIT_SCOPE_A($/) {
   our $?MY_OUR_VAR := 'scope a';
}

method INIT_SCOPE_B($/) {
   our $?MY_OUR_VAR := 'scope b';
}

method thingy($/) {
    our $?MY_OUR_VAR;
    make PAST::Op.new(
             PAST::Val.new(
                 :value( '$?MY_OUR_VAR is in ' ~ $?MY_OUR_VAR ),
                 :returns('String')
             ),
             :pirop('say'),
         );
}
ACTIONS
$?MY_OUR_VAR is in scope a
$?MY_OUR_VAR is in scope b
OUT
}

{
    test_pct( 'our and key', <<'IN', <<'GRAMMAR', <<'ACTIONS', <<'OUT' );
thingy
IN
token TOP {
    <thingy_or_stuff>+
    {*}
}
token thingy_or_stuff {
      <THINGY> {*}  #= THINGY
    | <STUFF>  {*}  #= STUFF
}
token THINGY {
    'thingy'
    {*}
}
token STUFF {
    'stuff'
    {*}
}
GRAMMAR

method TOP($/) {
    my $past := PAST::Stmts.new();
    for $<thingy_or_stuff> {
        $past.push( $_.ast );
    }

    our $?MY_OUR_VAR;
    $past.unshift( $?MY_OUR_VAR );

    make $past;
}

method thingy_or_stuff($/,$key) {
    make $/{$key}.ast;
}

method THINGY($/) {
    our $?MY_OUR_VAR := PAST::Op.new(
                           PAST::Val.new(
                               :value( '$?MY_OUR_VAR was set in THINGY' ),
                               :returns('String')
                           ),
                           :pirop('say'),
                       );
    make PAST::Op.new(
             PAST::Val.new(
                 :value( 'matched: ' ~ ~$/ ),
                 :returns('String')
             ),
             :pirop('say'),
         );
}

method STUFF($/) {
    our $?MY_OUR_VAR := PAST::Op.new(
                           PAST::Val.new(
                               :value( '$?MY_OUR_VAR was set in THINGY' ),
                               :returns('String')
                           ),
                           :pirop('say'),
                       );
    make PAST::Op.new(
             PAST::Val.new(
                 :value( 'matched: ' ~ ~$/ ),
                 :returns('String')
             ),
             :pirop('say'),
         );
}

ACTIONS
$?MY_OUR_VAR was set in THINGY
matched: thingy
OUT
}


# 9 test cases in this sub
sub test_pct
{
    my ( $test_name, $in, $grammar, $actions, $out, @other ) = @_;

    # Do not assume that . is in $PATH
    # places to look for things
    my $BUILD_DIR     = $PConfig{build_dir};
    my $BD_CHARSET    = $BUILD_DIR =~ /[^[:ascii:]]/ ? "binary:" : q{};
    my $TEST_DIR      = "$BUILD_DIR/t/compilers/pct";
    my $PARROT        = "$BUILD_DIR/parrot$PConfig{exe}";
    my $PGE_LIBRARY   = "$BUILD_DIR/runtime/parrot/library/PGE";
    my $PERL6GRAMMAR  = "$PGE_LIBRARY/Perl6Grammar.pbc";
    my $NQP           = "$BUILD_DIR/parrot-nqp.pbc";

    my $tempfile_opts = {
         DIR      => $TEST_DIR,
         UNLINK   => 1,
    };

    # this will be passed to pir_output_is()
    my $pir_code = <<"EOT";
#------------------------------#
# The compiler mainline code   #
#------------------------------#

.namespace [ 'TestGrammar'; 'Compiler' ]

.sub 'onload' :anon :tag('load') :init
    load_bytecode 'PCT.pbc'
.end

.sub 'main' :main

    .local pmc args
    args = new 'ResizableStringArray'
    push args, "test_program"
    push args, $BD_CHARSET"$TEST_DIR/complete_workflow_sample_input.txt"

    \$P0 = new ['PCT'; 'HLLCompiler']
    \$P0.'language'('TestGrammar')
    \$P0.'parsegrammar'('TestGrammar::Grammar')
    \$P0.'parseactions'('TestGrammar::Grammar::Actions')

    \$P1 = \$P0.'command_line'(args)

    .return()
.end

EOT

    # set up a file with the grammar
    my (undef, $pg_fn) = create_tempfile( SUFFIX => '.pg', %$tempfile_opts );
    Parrot::Test::write_code_to_file( <<"EOT", $pg_fn );
# DO NOT EDIT.
# This file was generated by t/compilers/pct/complete_workflow.t

grammar TestGrammar::Grammar is PCT::Grammar;

$grammar

EOT

    ok( $pg_fn, "$test_name: got name of grammar file" );
    ok( -e $pg_fn, "$test_name: grammar file exists" );

    # compile the grammar
    # For easier debugging, the generated pir is appended to the PIR
    # that is passed to pir_output_is().
    ( my $gen_parser_fn = $pg_fn ) =~s/pg$/pir/;
    my $rv = Parrot::Test::run_command(
       qq{"$PARROT" "$PERL6GRAMMAR" --output="$gen_parser_fn" "$pg_fn"},
    );
    is( $rv, 0, "$test_name: generated PIR successfully" );
    ok( -e $gen_parser_fn, "$test_name: generated parser file exists" );
    my $gen_parser = slurp_file($gen_parser_fn);
    unlink $gen_parser_fn;

    $pir_code .= <<"EOT";
#------------------------------#
# The generated parser         #
#------------------------------#

$gen_parser

EOT


    # set up a file with the actions
    my (undef, $pm_fn) = create_tempfile( SUFFIX => '.pm', %$tempfile_opts );
    Parrot::Test::write_code_to_file( <<"EOT", $pm_fn );
# DO NOT EDIT.
# This file was generated by t/compilers/pct/complete_workflow.t

class TestGrammar::Grammar::Actions;

$actions

EOT

    ok( $pm_fn, "$test_name: got name of action file" );
    ok( -e $pm_fn, "$test_name: action file exists" );

    # compile the actions
    ( my $gen_actions_fn = $pm_fn ) =~s/pm$/pir/;
    $rv = Parrot::Test::run_command(
        qq{"$PARROT" "$NQP" --target=pir --output="$gen_actions_fn" "$pm_fn"},
    );
    is( $rv, 0, "$test_name: generated PIR successfully" );
    ok( -e $gen_actions_fn, "$test_name: generated actions file exists" );
    my $gen_actions = slurp_file($gen_actions_fn);
    unlink $gen_actions_fn;

    # Add the generated code to the driver,
    # so that everything is in one place
    $pir_code .= <<"EOT";

#------------------------------#
# The generated actions        #
#------------------------------#

$gen_actions

EOT

    # create the input file and run the compiled code
    my $sample_fn = "$TEST_DIR/complete_workflow_sample_input.txt";
    Parrot::Test::write_code_to_file( $in, $sample_fn );

    pir_output_is( $pir_code, $out, "$test_name: output of compiler", @other );

    unlink $sample_fn;

    return;
}


=head1 AUTHOR

Bernhard Schmalhofer <Bernhard.Schmalhofer@gmx.de>

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
