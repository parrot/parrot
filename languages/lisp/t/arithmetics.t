# $Id$

=head1 NAME

lisp/t/arithmetics.t - tests for Parrot Common Lisp

=head1 DESCRIPTION

Basic math.

=cut

# pragmata
use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib", "$FindBin::Bin/../../../lib";

# core Perl modules
use Test::More     tests => 1;

# Parrot modules
use Parrot::Test;

language_output_is( 'Lisp', <<'END_CODE', <<'END_OUT', 'integer 1' );
(print ( + 1 3 ) )
END_CODE
4
END_OUT
