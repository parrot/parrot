#!perl
# Copyright (C) 2006-2007, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 3;

=head1 NAME

t/op/load_bytecode.t - loading bytecode tests

=head1 SYNOPSIS

        % prove t/op/load_bytecode.t

=head1 DESCRIPTION

Tests the C<load_bytecode> operation.

TODO: Can we find a way to test this stuff without regex matching on error
message literals?

=cut

pir_error_output_like( <<'CODE', <<'OUTPUT', "load_bytecode on NULL" );
.sub main :main
    load_bytecode $S0
.end
CODE
/No file name/
OUTPUT

pir_error_output_like( <<'CODE', <<'OUTPUT', "load_bytecode on directory" );
.sub main :main
    load_bytecode 't'
.end
CODE
/is not a regular file/
OUTPUT

pir_error_output_like( <<'CODE', <<'OUTPUT', "load_bytecode on non-existent file" );
.sub main :main
        load_bytecode 'no_file_by_this_name'
.end
CODE
/Cannot find bytecode file/
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
