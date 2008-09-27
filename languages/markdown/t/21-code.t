#! perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/21-code.t - Markdown code

=head1 SYNOPSIS

    % perl -I../lib -Imarkdown/t markdown/t/21-code.t

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 4;
use Test::More;

language_output_is( 'markdown', <<'CODE', <<'OUT', 'code' );

`code`

CODE
<p><code>code</code></p>

OUT

language_output_is( 'markdown', <<'CODE', <<'OUT', 'printf' );

Use the `printf()` function.

CODE
<p>Use the <code>printf()</code> function.</p>

OUT

language_output_is( 'markdown', <<'CODE', <<'OUT', 'literal backtick' );

``There is a literal backtick (`) here.``

CODE
<p><code>There is a literal backtick (`) here.</code></p>

OUT

language_output_is( 'markdown', <<'CODE', <<'OUT', 'with space' );

A single backtick in a code span: `` ` ``

A backtick-delimited string in a code span: `` `foo` ``

CODE
<p>A single backtick in a code span: <code>`</code></p>

<p>A backtick-delimited string in a code span: <code>`foo`</code></p>

OUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
