#! perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/10-heading.t - Markdown heading

=head1 SYNOPSIS

    % perl -I../lib -Imarkdown/t markdown/t/10-heading.t

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 2;
use Test::More;

language_output_is( 'markdown', <<'CODE', <<'OUT', 'SetextHeading1' );

First-level heading
===================

CODE
<h1>First-level heading</h1>

OUT

language_output_is( 'markdown', <<'CODE', <<'OUT', 'SetextHeading2' );

Second-level heading
--------------------

CODE
<h2>Second-level heading</h2>

OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
