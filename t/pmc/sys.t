#! perl
# Copyright (C) 2001-2008, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test::Util 'create_tempfile';

use Parrot::Test tests => 2;

=head1 NAME

t/pmc/sys.t - System Tests

=head1 SYNOPSIS

    % prove t/pmc/sys.t

=head1 DESCRIPTION

Tests system dependent stuff

=cut

my (undef, $temp_pir) = create_tempfile( SUFFIX => '.pir', UNLINK => 1 );

pir_output_is( <<"CODE", <<OUT, "spawnw, _config" );

.sub _test :main
     .local pmc O
     O = new ['FileHandle']
     O.'open'("$temp_pir", 'w')
     print O, ".sub _main :main\\n"
     print O, "\tsay \\"Hello, World!\\"\\n"
     print O, ".end\\n"
     O.'close'()
     load_bytecode 'config.pbc'
    .local pmc conf_hash
    conf_hash = _config()
    .local string slash
    slash = conf_hash["slash"]
    .local string parrot
    parrot = conf_hash["test_prog"]
    .local string cmd
    cmd = '.'
    cmd .= slash
    cmd .= parrot
    cmd .= " $temp_pir"
    spawnw \$I0, cmd
    say \$I0
.end

CODE
Hello, World!
0
OUT

pir_output_is( <<'CODE', <<'OUT', "conf_hash is read-only")
.sub _test :main
     load_bytecode 'config.pbc'
    .local pmc conf_hash
    conf_hash = _config()
    push_eh is_ro
    conf_hash['foo'] = 'bar'
    pop_eh
    goto end
is_ro:
    say 'hash is read-only'
end:
.end

CODE
hash is read-only
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
