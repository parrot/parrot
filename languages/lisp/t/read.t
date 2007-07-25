# $Id$

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
use Parrot::Test tests => 7;

language_error_output_like(
    'Lisp',
    " ( \n",
    qr/EOF on input stream reached\./,
    '_left_paren_macro() with missing right parenthesis'
);

language_error_output_like(
    'Lisp',
    " ) something else \n",
    qr/An object cannot start with/,
    '_right_paren_macro() without a left paren'
);

language_output_is(
    'Lisp',
    "(print '( + 2 3 ))",
    "(+ . (2 . (3 . NIL)))\n",
    '_single_quote_macro'
);

language_output_is(
    'Lisp',
    "(print ; Servus  \n 1 \n ); comment till end of file",
    "1\n",
    '_semicolon_macro'
);

language_error_output_like(
    'Lisp',
    ' " something else \n',
    qr/EOF on input stream reached\./,
    '_double_quote_macro(), no closing double quote'
);

language_error_output_like(
    'Lisp',
    ' ` something else after backquote',
    qr/The backquote macro has not yet been implemented\./,
    '_backquote_macro(), not yet implemented'
);

language_error_output_like(
    'Lisp',
    ' , something else after comma',
    qr/Comma is illegal outside of backquote\./,
    '_comma_macro(), illegal almost everywhere'
);



