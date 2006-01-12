#! perl
# Copyright: 2001-2006 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 4;
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
  # XXX - FIXME - Use Tempfir

  # Clean up environment on exit
  unlink  "otpx" if -f "otpx";
  unlink "lotpx" if -l "lotpx";
  rmdir  "xpto"  if -d "xpto";
  unlink "xptol" if -l "xptol";
}

mkdir "xpto" unless -d "xpto";
open X, ">otpx" or die $!;
print X "xpto";
close X;

# test is_dir
pir_output_is(<<'CODE', <<"OUT", "Test is_dir");
.sub main :main
        $P1 = new .File

        $S1 = "xpto"
        $I1 = $P1."is_dir"($S1)

        if $I1 goto ok1
        print "not "

ok1:
        print "ok 1\n"

        $S1 = "otpx"
        $I1 = $P1."is_dir"($S1)
        $I1 = !$I1

        if $I1 goto ok2
        print "not "

ok2:
        print "ok 2\n"

        end
.end
CODE
ok 1
ok 2
OUT


# test is_file
pir_output_is(<<'CODE', <<"OUT", "Test is_file");
.sub main :main
        $P1 = new .File

        $S1 = "xpto"
        $I1 = $P1."is_file"($S1)
        $I1 = !I1

        if $I1 goto ok1
        print "not "

ok1:
        print "ok 1\n"

        $S1 = "otpx"
        $I1 = $P1."is_file"($S1)

        if $I1 goto ok2
        print "not "

ok2:
        print "ok 2\n"

        end
.end
CODE
ok 1
ok 2
OUT


SKIP: {
    skip "Links not available under Windows", 1 if $MSWin32;

    symlink "otpx", "lotpx";

    # test is_link
    pir_output_is(<<'CODE', <<"OUT", "Test is_link with links to files");
.sub main :main
        $P1 = new .File

        $S1 = "lotpx"
        $I1 = $P1."is_link"($S1)

        if $I1 goto ok1
        print "not "
ok1:
        print "ok 1\n"

        $S1 = "otpx"
        $I1 = $P1."is_link"($S1)
        $I1 = !$I1
        if $I1 goto ok2
        print "not "
ok2:
        print "ok 2\n"
        end
.end
CODE
ok 1
ok 2
OUT

}

SKIP: {
    skip "Links not available under Windows", 1 if $MSWin32;

    symlink "xpto", "xptol";

    # test is_link
    pir_output_is(<<'CODE', <<"OUT", "Test is_link with links to directories");
.sub main :main
        $P1 = new .File

        $S1 = "xptol"
        $I1 = $P1."is_link"($S1)

        if $I1 goto ok1
        print "not "
ok1:
        print "ok 1\n"

        $S1 = "xpto"
        $I1 = $P1."is_link"($S1)
        $I1 = !$I1
        if $I1 goto ok2
        print "not "
ok2:
        print "ok 2\n"
        end
.end
CODE
ok 1
ok 2
OUT

}
