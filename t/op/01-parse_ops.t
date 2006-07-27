#! perl
# Copyright (C) 2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Parrot::Test;
use Parrot::Op;
use Parrot::OpLib::core;


=head1 NAME

t/op/01-parse_ops.t - Parse core opcodes

=head1 SYNOPSIS

    % prove t/op/01-parse_ops.t

=head1 DESCRIPTION

Tests that all parrot opcodes are parsed properly.

=cut


my $object_map = {
    i   => q<I0>,
    ic  => q<42>,
    k   => q<P0>,
    kc  => q<[ 'foo' ; 'bar' ]>,
    kic => q<[ 1 ]>,
    ks  => q<P0>,
    ksc => q<[ 'foo' ; 'bar' ]>,
    n   => q<N0>,
    nc  => q<13.013>,
    p   => q<P0>,
    pc  => undef,       ## TODO: figure out how to test this type
    s   => q<S0>,
    sc  => q<'foo'>,
};


my %cmds;

## extract the register types from each opcode
for my $op ( @$Parrot::OpLib::core::ops )
{
    my @regtypes = $op->arg_types;

    ## for now, avoid opcodes with regtypes i don't know how to represent
    next unless @regtypes == grep { defined $$object_map{$_} } @regtypes;

    ## extract the basename of the opcode
    my $basename = $op->name;

    ## create the argument list
    my $args = join ', ' => map $$object_map{$_}, @regtypes;

    ## store the test commands
    $cmds{$basename}{$basename . ' ' . $args}++;
    $cmds{$basename}{$op->full_name . ' ' . $args}++;
}

plan tests => scalar keys %cmds;

for my $cmd ( sort keys %cmds )
{
    pasm_output_like(
        ## retrieve the test commands, and trick imcc to parse only
        join( $/ => 'end', sort(keys %{ $cmds{$cmd} }), '' ),
        qr/^(?!error:imcc:syntax error,)/,
        "parsing: $cmd",
    );
}

## vim: expandtab sw=4
