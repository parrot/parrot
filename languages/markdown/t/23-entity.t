#! perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/23-entity.t - Markdown entities

=head1 SYNOPSIS

    % perl -I../lib -Imarkdown/t markdown/t/23-entity.t

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 2;
use Test::More;

language_output_is( 'markdown', <<'CODE', <<'OUT', 'CharEntity' );

4 &lt; 5

CODE
<p>4 &lt; 5</p>

OUT

language_output_is( 'markdown', <<'CODE', <<'OUT', 'HexEntity' );

20 &#x20ac;.

CODE
<p>20 &#x20ac;.</p>

OUT



# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
