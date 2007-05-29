# $Id: hello.t 18515 2007-05-12 12:19:34Z bernhard $

=head1 NAME

lisp/t/atoms.t - tests for Parrot Common Lisp

=head1 DESCRIPTION

Basic types.

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

language_output_is( 'Lisp', <<'END_CODE', '1', 'integer 1' );
1
END_CODE
