#!perl
# Copyright 2005, The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Test::More;
use Parrot::Test;


=head1 NAME

t/parser.t - TGE::Parser tests

=head1 SYNOPSIS

	$ prove t/parser.t

=cut


pir_output_is(<<'CODE', <<'OUT', "parse a basic attribute grammar");

.sub _main :main
    load_bytecode "compilers/tge/TGE.pir"

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
    start_rule = find_global "TGE::Parser", "start"
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


## remember to change the number of tests :-)
BEGIN { plan tests => 1; }
