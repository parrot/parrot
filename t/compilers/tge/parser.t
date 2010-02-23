#!parrot
# Copyright (C) 2005-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/parser.t

=head1 SYNOPSIS

        $ prove t/compilers/tge/parser.t

=head1 DESCRIPTION

TGE::Parser tests

=cut

.sub main :main
    load_bytecode 'TGE.pbc'
    .include 'test_more.pir'
    plan(2)

    test_parse_a_basic_attribute_grammar()
    test_parse_failure()
.end

.sub test_parse_a_basic_attribute_grammar
    .local string source
    source = <<'GRAMMAR'
    transform min (Leaf) {
        $P1 = getattribute node, "value"
        .return ($P1)
    }
    # A test comment
    transform gmin (Branch) :applyto('left') {
        .local pmc gmin
        gmin = tree.get('gmin', node)
        .return (gmin)
    }
GRAMMAR

    # Match against the source
    .local pmc match
    .local pmc start_rule
    start_rule = get_global ['TGE';'Parser'], "start"
    match = start_rule(source)

    # Verify the match
    unless match goto match_fail           # if match fails stop
    ok(1, "parse a basic attribute grammar" )
    .return()

  match_fail:
    ok(0, "parse a basic attribute grammar" )

.end

.sub test_parse_failure
    $S0 = "Syntax error at line 4, near \"transform \"\n"
    throws_substring(<<'CODE', $S0, 'parse failure')
.sub main
    load_bytecode 'TGE.pbc'
    .local string source
    source = <<'GRAMMAR'
    transform min (Leaf) {
      # nothing to see here.
    }
    transform max {  # missing ()'s
    }

GRAMMAR
    .local pmc match
    .local pmc start_rule
    start_rule = get_global ['TGE';'Parser'], "start"
    match = start_rule(source, 'grammar'=>'TGE::Parser') # should throw.
.end
CODE
.end

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 filetype=pir:
