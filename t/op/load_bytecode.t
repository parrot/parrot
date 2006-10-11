#!perl
# Copyright (C) 2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 2;

=head1 NAME

t/op/load_bytecode.t - loading bytecode tests

=head1 SYNOPSIS

	% prove t/op/load_bytecode.t

=head1 DESCRIPTION

Tests the C<load_bytecode> operation.

=cut

pir_output_like(<<'CODE', <<'OUTPUT', "load_bytecode on directory");
.sub main :main
    load_bytecode 't'
.end
CODE
/t' is a directory/
OUTPUT

pir_output_like(<<'CODE', <<'OUTPUT', "load_bytecode on non-existent file");
.sub main :main
	load_bytecode 'no_file_by_this_name'
.end
CODE
/Couldn't find file 'no_file_by_this_name'/
OUTPUT
