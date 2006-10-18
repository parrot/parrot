#! perl
# Copyright (C) 2001-2005, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 1;

=head1 NAME

t/pmc/sys.t - System Tests

=head1 SYNOPSIS

    % prove t/pmc/sys.t

=head1 DESCRIPTION

Tests system dependend stuff

=cut

END {
  unlink "temp.pir";
};

pir_output_is(<<'CODE', <<OUT, "spawnw, _config");

.sub _test :main
     .local pmc O
     open O, "temp.pir", ">"
     print O, ".sub _main :main\n"
     print O, "\tprint \"Hello, World!\\n\"\n"
     print O, ".end\n"
     close O
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
    cmd .= " temp.pir"
    spawnw $I0, cmd
    print $I0
    print "\n"
.end

.include "library/config.pir"
CODE
Hello, World!
0
OUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
