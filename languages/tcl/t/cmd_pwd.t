#!perl

# Copyright (C) 2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw(tcl/lib ./lib ../lib ../../lib ../../../lib);

use Parrot::Test tests => 2;
use Test::More;
use File::Spec;
use Cwd;

language_output_is( "tcl", <<'TCL', <<OUT, "pwd too many args" );
 pwd fish
TCL
wrong # args: should be "pwd"
OUT

## tclsh on windows shows unix slashies, so use unix canonpath to get them
my $dir = File::Spec::Unix->canonpath( getcwd );

TODO: {
    local $TODO;
    $TODO = 'pwd is broken on windows' if $^O eq 'MSWin32';

    language_output_is( "tcl", <<'TCL', <<"OUT", "pwd simple" );
 puts [pwd]
TCL
$dir
OUT
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
