#! perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/22-escape.t - Markdown escapes

=head1 SYNOPSIS

    % perl -I../lib -Imarkdown/t markdown/t/22-escape.t

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 1;
use Test::More;

language_output_is( 'markdown', <<'CODE', <<'OUT', 'asterisk' );

\*literal astericks\*

CODE
<p>*literal astericks*</p>

OUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
