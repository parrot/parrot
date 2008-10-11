#! perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/markdown.t - Markdown library

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/markdown.t

=head1 DESCRIPTION

Tests Markdown
(implemented in F<languages/lua/src/lib/markdown.pir>).

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test;
use Test::More;
use Parrot::Test::Lua;

my $test_prog = Parrot::Test::Lua::get_test_prog();
if ( $test_prog eq 'lua' ) {
    plan skip_all => "parrot only";
}
else {
    plan tests => 2;
}

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'require' );
local m = require "markdown"
print(type(m))
CODE
table
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'markdown' );
require "markdown"

local html = markdown.markdown [=[
# Title

Some text.

]=]

print(html)
CODE
<h1>Title</h1>

<p>Some text.</p>


OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
