#! perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/14-list.t - Markdown list

=head1 SYNOPSIS

    % perl t/14-list.t

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../lib", "$FindBin::Bin";

use Parrot::Test tests => 2;
use Test::More;

language_output_is( 'markdown', <<'CODE', <<'OUT', 'unordered' );

- An item in a bulleted (unordered) list
- Another item in a bulleted list

CODE
<ul>
<li>An item in a bulleted (unordered) list</li>
<li>Another item in a bulleted list</li>
</ul>

OUT

language_output_is( 'markdown', <<'CODE', <<'OUT', 'ordered' );

1. An item in a enumeradted (ordered) list
2. Another item in a enumeradted list

CODE
<ol>
<li>An item in a enumeradted (ordered) list</li>
<li>Another item in a enumeradted list</li>
</ol>

OUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
