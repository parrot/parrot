#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/op/debuginfo.t - Debugging Info

=head1 SYNOPSIS

	% perl -Ilib t/op/debuginfo.t

=head1 DESCRIPTION

Tests the various set and get operations for line, package and file info.

=cut

use Parrot::Test tests => 3;

SKIP:
{
  skip("getline/setline changes not finished", 3);
output_is( <<'CODE', <<OUTPUT, "set/getline" );
	setline 1
	setline 2
	getline I0
	print I0
	print "\n"
	setline 1
	getline I0
	print I0
	print "\n"
	end
CODE
2
1
OUTPUT

output_is( <<'CODE', <<OUTPUT, "set/getpackage" );
	setpackage "foo"
	setpackage "bar"
	getpackage S0
	print S0
	print "\n"
	setpackage "foo"
	getpackage S0
	print S0
	print "\n"
	end
CODE
bar
foo
OUTPUT

output_is( <<'CODE', <<OUTPUT, "set/getfile" );
	setfile "foo"
	setfile "bar"
	getfile S0
	print S0
	print "\n"
	setfile "foo"
	getfile S0
	print S0
	print "\n"
	end
CODE
bar
foo
OUTPUT

}
