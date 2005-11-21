#! perl -w
# Copyright 2005, The Perl Foundation.

=head1 NAME

t/parser.t - TGE::Parser tests

=head1 SYNOPSIS

        $ perl t/parser.t

=cut

use strict;

use lib qw(t . lib ../lib ../../lib ../../../lib);

use Parrot::Test tests => 1;

pir_output_is(<<'CODE', <<'OUT', "parse a basic attribute grammar");

.sub _main :main
    load_bytecode "compilers/tge/TGE/Parser.pir"

    .local string source
    source = <<'GRAMMAR'
    Leaf:   min(.) = {
        $P1 = getattribute node, "value"
        .return ($P1)
    }
    # A test comment
    Branch: gmin(.left)  = {
        .local pmc gmin
        gmin = tree.get('gmin', node)
        .return (gmin)
    }
GRAMMAR

    # Match against the source
    .local pmc match
    .local pmc start_rule
    start_rule = find_global "TGE::Parser", "input"
    print "loaded start rule\n"
    match = start_rule(source)
    print "matched start rule\n"

    # Verify the match
    $I0 = match.__get_bool()
    unless $I0 goto match_fail           # if match fails stop
    print "parse succeeded\n"
    goto cleanup

  match_fail:
    print "parse failed\n"

  cleanup:
    end
.end

CODE
loaded start rule
matched start rule
parse succeeded
OUT
