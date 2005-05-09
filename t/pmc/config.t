#! perl -w
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/config.t - Builtin Config

=head1 SYNOPSIS

	% perl -Ilib t/pmc/config.t

=head1 DESCRIPTION

Tests the parrot config interface.

=cut

use Parrot::Test tests => 3;
use Parrot::Config;
use Cwd qw(cwd);

pir_output_is(<<'CODE', <<'OUT', "get config hash");
.sub main @MAIN
    .include "iglobals.pasm"
    .local pmc config_hash, interp
    interp = getinterp
    config_hash = interp[.IGLOBALS_CONFIG_HASH]
    typeof $S0, config_hash
    print $S0
    print "\n"
.end
CODE
Hash
OUT

pir_output_is(<<'CODE', cwd, "prefix");
.sub main @MAIN
    .include "iglobals.pasm"
    .local pmc config_hash, interp
    interp = getinterp
    config_hash = interp[.IGLOBALS_CONFIG_HASH]
    $S0 = config_hash["prefix"]
    print $S0
.end
CODE

pir_output_is(<<'CODE', <<'OUT', "load src/pbc from library path");
.sub main @MAIN
    load_bytecode "config.imc"
    print "ok 1\n"
    load_bytecode "config.pbc"
    print "ok 2\n"
.end
CODE
ok 1
ok 2
OUT

