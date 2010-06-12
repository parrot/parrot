#! perl
# Copyright (C) 2010, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 4;
use Parrot::Test::Util 'create_tempfile';

=head1 NAME

t/pmc/io.t - IO Ops

=head1 SYNOPSIS

    % prove t/pmc/io.t

=head1 DESCRIPTION

Tests the Parrot IO operations.

=cut

my ($FOO, $temp_file) = create_tempfile( UNLINK => 1 );
close $FOO;

pasm_error_output_like( <<"CODE", <<'OUTPUT', '32bit seek: exception (ops)' );
.loadlib 'io_ops'
   open P0, "$temp_file", 'w'
   seek P0, -1, 0
   say "error!"
   end
CODE
/seek failed \(32bit\)/
OUTPUT

pasm_error_output_like( <<"CODE", <<'OUTPUT', '64bit seek: exception (ops)' );
.loadlib 'io_ops'
   open P0, "$temp_file", 'w'
   seek P0, -1, -1, 0
   say "error!"
   end
CODE
/seek failed \(64bit\)/
OUTPUT

pasm_output_is( <<"CODE", <<'OUTPUT', "peek (ops)" );
.loadlib 'io_ops'
    open P0, "$temp_file", 'w'
    print P0, "a line\\n"
    close P0
    open P0, "$temp_file", 'r'
    peek S0, P0
    print S0
    peek S1, P0
    print S1
    print "\\n"
    read S2, P0, 2
    peek S3, P0
    print S3
    print "\\n"
    end
CODE
aa
l
OUTPUT

pasm_output_is( <<"CODE", <<'OUTPUT', "peek on an empty file (ops)" );
.loadlib 'io_ops'
    open P0, "$temp_file", 'w'
    close P0
    open P0, "$temp_file", 'r'
    peek S0, P0
    eq S0, "", OK1
    print "not "
OK1:
    say "ok 1"
    end
CODE
ok 1
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
