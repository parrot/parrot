#! perl -w
# Copyright: 2001-2004 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/sys.t - System Tests

=head1 SYNOPSIS

	% perl -Ilib t/pmc/sys.t

=head1 DESCRIPTION

Tests system dependend stuff

=cut

use Parrot::Test tests => 1;
use Test::More;

END {
  unlink "temp.imc";
};

output_is(<<'CODE', <<OUT, "spawnw, _config");
##PIR##
.sub _test @MAIN
     .local pmc O
     open O, "temp.imc", ">"
     print O, ".sub _main @MAIN\n"
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
    cmd .= " temp.imc"
    spawnw $I0, cmd
    print $I0
    print "\n"
.end

.include "library/config.imc"
CODE
Hello, World!
0
OUT

