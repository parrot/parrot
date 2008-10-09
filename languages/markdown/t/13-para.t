#! perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/13-para.t - Markdown para

=head1 SYNOPSIS

    % perl -I../lib -Imarkdown/t markdown/t/13-para.t

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 2;
use Test::More;

language_output_is( 'markdown', <<'CODE', <<'OUT', 'Para 1' );

This is a paragraph. It has two sentences.

This is another paragraph. It also has two sentences.

CODE
<p>This is a paragraph. It has two sentences.</p>

<p>This is another paragraph. It also has two sentences.</p>

OUT

language_output_is( 'markdown', <<'CODE', <<'OUT', 'Para multi-line' );

This is a paragraph.
It has two sentences.

CODE
<p>This is a paragraph.
It has two sentences.</p>

OUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
