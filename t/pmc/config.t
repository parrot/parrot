#! perl
# Copyright (C) 2005-2007, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 3;
use Parrot::Config;
use Cwd qw(cwd);
use MSYS::MinGW;

=head1 NAME

t/pmc/config.t - Builtin Config

=head1 SYNOPSIS

    % prove t/pmc/config.t

=head1 DESCRIPTION

Tests the parrot config interface.

=cut

pir_output_is( <<'CODE', <<'OUT', "get config hash" );
.sub main :main
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

pir_output_is( <<'CODE', ($^O eq 'MSWin32' ? lc(cwd) : cwd), "prefix" );
.sub main :main
    load_bytecode "config.pbc"
    .include "iglobals.pasm"
    .local pmc config_hash, interp, cfg
    interp = getinterp
    config_hash = interp[.IGLOBALS_CONFIG_HASH]
    $S0 = config_hash["prefix"]
    cfg = _config()
    $S1 = cfg['osname']
    if $S1 != 'MSWin32' goto sayit
    $S0 = downcase $S0
  sayit:
    print $S0
.end
CODE

pir_output_is( <<'CODE', <<'OUT', "load src/pbc from library path" );
.sub main :main
    load_bytecode "config.pir"
    print "ok 1\n"
    load_bytecode "config.pbc"
    print "ok 2\n"
.end
CODE
ok 1
ok 2
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
