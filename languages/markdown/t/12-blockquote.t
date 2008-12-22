#! perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/12-blockquote.t - Markdown blockquote

=head1 SYNOPSIS

    % perl t/12-blockquote.t

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../lib", "$FindBin::Bin";

use Parrot::Test tests => 1;
use Test::More;

language_output_is( 'markdown', <<'CODE', <<'OUT', 'BlockQuote 1' );

> This text will be enclosed in an HTML blockquote element.

CODE
<blockquote>
  <p>This text will be enclosed in an HTML blockquote element.</p>
</blockquote>

OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
