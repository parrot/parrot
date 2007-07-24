# $Id: system.t 19624 2007-07-05 19:47:20Z bernhard $

=head1 NAME

lisp/t/read.t - test reader macros

=head1 DESCRIPTION

Reader macros and their error reporting.

=cut

# pragmata
use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib", "$FindBin::Bin/../../../lib";

# core Perl modules
use Test::More;

# Parrot modules
use Parrot::Test;

Test::More::plan( tests => 1 );

language_error_output_like(
    'Lisp',
    " ( \n",
    qr/EOF on input stream reached\./,
    '_left_paren_macro() with missing right parenthesis'
);
