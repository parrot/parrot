#! perl
# Copyright: 2001-2006 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 1;
use Parrot::Config;
use Cwd;
use File::Spec;

our ($MSWin32, $cygwin);
$MSWin32 = 1 if $^O =~ m!MSWin32!;
$cygwin  = 1 if $^O =~ m!cygwin!;

=head1 NAME

t/pmc/file.t - Files functions

=head1 SYNOPSIS

	% prove t/pmc/file.t

=head1 DESCRIPTION

Tests the C<File> PMC.

=cut

END {
  # Clean up environment on exit
  rmdir "xpto"  if -d "xpto";
  unlink "xpto" if -f "xpto";
}

# test is_dir
mkdir "xpto" unless -d "xpto";
pir_output_is(<<'CODE', <<"OUT", "Test is_dir in a directory");
.sub main :main
        $P1 = new .File

        $S1 = "xpto"
        $I1 = $P1."is_dir"($S1)

        if $I1 goto ok
        print "not "

ok:
        print "ok\n"
        end
.end
CODE
ok
OUT

