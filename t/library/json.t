#! perl -w
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id $

=head1 NAME

t/library/json.t - test JSON library

=head1 SYNOPSIS

	% perl -Ilib t/library/json.t

=head1 DESCRIPTION

Tests JSON->Parrot and Parrot->JSON conversions.

=cut

use strict;

use Parrot::Test tests => 2;
use Test::More;

use vars qw($SKIP);

SKIP: {
    local $SKIP = "Not implemented yet.";

# no. 1
pir_output_is(<<'CODE', <<'OUT', 'Create JSON of an empty string');

.sub test :main
    $S0 =_json( '', 1 )
    print $S0
.end
.include 'library/JSON.imc'
CODE
""
OUT

# no. 2
pir_output_is(<<'CODE', <<'OUT', 'Create JSON of an array');

.sub test :main
    .local pmc array

    new array, .PerlArray
    push array, 0
    push array, 1
    push array, 2
    push array, 3
    push array, 4
    push array, 5
    push array, 6
    push array, 7
    push array, 8
    push array, 9

    $S0 = _json( array, 1 )
    print $S0
.end
.include 'library/JSON.imc'
CODE
[
  0,
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9
]
OUT
}
