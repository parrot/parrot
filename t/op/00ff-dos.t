#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/op/00ff-dos.t - DOS File Format

=head1 SYNOPSIS

	% perl -Ilib t/op/00ff-dos.t

=head1 DESCRIPTION

Tests file formats.

=cut

use strict;

use Parrot::Test tests => 2;

my $code = qq(print "ok\\n"\r\nend\r\n);
output_is($code, <<'OUT', "fileformat dos");
ok
OUT

$code = qq(print "ok\\n"\r\nend\r\n\cZ\r\n);
output_is($code, <<'OUT', "fileformat dos w ctrl-z");
ok
OUT
