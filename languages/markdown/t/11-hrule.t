#! perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/10-hrule.t - Markdown horizontal rule

=head1 SYNOPSIS

    % perl -I../lib -Imarkdown/t markdown/t/10-hrule.t

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 3;
use Test::More;

language_output_is( 'markdown', <<'CODE', <<'OUT', 'rule *' );

******

CODE
<hr />

OUT

language_output_is( 'markdown', <<'CODE', <<'OUT', 'rule -' );

 -----

CODE
<hr />

OUT

language_output_is( 'markdown', <<'CODE', <<'OUT', 'rule _' );

 _ _ _ _

CODE
<hr />

OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
