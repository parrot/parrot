#!/usr/bin/perl
# Copyright (C) 2008, Parrot Foundation.
# $Id$

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

use Parrot::Test tests => 2;

language_output_is( 'JS', <<'CODE', <<'OUT', 'version builtin' );
function a() {
}
print(typeof version);
print(version(150));
print(version);
print((typeof version) == (typeof a));
CODE
function
0
version
true
OUT

todo: {
language_output_is( 'JS', <<'CODE', <<'OUT', 'version global', todo => 'need to wrap parrot subs');
print(version);
CODE
function version() {
    [native code]
}
OUT
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
