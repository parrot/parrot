#!perl
# Copyright (C) 2006-2011, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 1;
use Parrot::Test::Util 'create_tempfile';

=head1 NAME

t/pmc/pipe.t - test the Pipe PMC

=head1 SYNOPSIS

    % prove t/pmc/pipe.t

=head1 DESCRIPTION

Tests the Pipe PMC.

=cut

pir_output_is( <<'CODE', <<"OUTPUT", "exit status" );
.include 'iglobals.pasm'
.sub 'main' :main
    .local pmc pipe, conf, interp
    .local string cmd

    interp = getinterp
    conf = interp[.IGLOBALS_CONFIG_HASH]

    cmd = '"'

    .local string aux
    aux = conf['build_dir']
    cmd .= aux
    aux = conf['slash']
    cmd .= aux
    aux = conf['test_prog']
    cmd .= aux
    aux = conf['exe']
    cmd .= aux
    cmd .= '"'

    pipe = new ['Pipe']
    pipe.'open'(cmd, "r")
    pipe.'readall'()
    pipe.'close'()
    print "expect 0 exit status: "
    $I0 = pipe.'exit_status'()
    say $I0

    cmd .= ' --this_is_not_a_valid_option'
    pipe = new ['Pipe']
    pipe.'open'(cmd, "r")
    pipe.'readall'()
    pipe.'close'()
    print "expect 1 exit status: "
    $I0 = pipe.'exit_status'()
    $I0 = $I0 != 0
    say $I0

.end
CODE
expect 0 exit status: 0
expect 1 exit status: 1
OUTPUT
