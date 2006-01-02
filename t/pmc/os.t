#! perl
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test;
use Parrot::Config;
use Cwd;

if ($^O =~ m!MSWin32!) {
  plan skip_all => 'win32 implementation missing'
} else {
  plan tests => 3
}

=head1 NAME

t/pmc/os.t - Files and Dirs

=head1 SYNOPSIS

	% prove t/pmc/os.t

=head1 DESCRIPTION

Tests the C<OS> PMC.

=cut

my $cwd = getcwd;
chdir "src";
my $upcwd = getcwd;
chdir "..";
my $xpto = $upcwd;
$xpto =~ s/src/xpto/;

rmdir "xpto" if -d "xpto";
rmdir "xpto" if -f "xpto";

pir_output_is(<<'CODE', <<"OUT", "cwd, cd, mkdir");
.sub main :main
        $P1 = new .OS
        $S1 = $P1."cwd"()
        print $S1
        print "\n"

        $S1 = "src"
        $P1."cd"($S1)

        $S1 = $P1."cwd"()
        print $S1
        print "\n"

        $S1 = ".."
        $P1."cd"($S1)

        $S1 = $P1."cwd"()
        print $S1
        print "\n"

        $S1 = "xpto"
        $I1 = 0o555
        $P1."mkdir"($S1,$I1)
        $P1."cd"($S1)

        $S1 = $P1."cwd"()
        print $S1
        print "\n"

        $S1 = ".."
        $P1."cd"($S1)

        $S1 = "xpto"
        $P1."rm"($S1)

        end
.end
CODE
$cwd
$upcwd
$cwd
$xpto
OUT

ok(!-d $xpto, "rm");

open X, ">xpto";
print X "xpto";
close X;

my $stat = join("\n",stat("xpto"))."\n";

pir_output_is(<<'CODE', $stat, "stat");
.sub main :main
        $P1 = new .OS
        $S1 = "xpto"
        $P2 = $P1."stat"($S1)

        $I1 = 0
loop:
        $S1 = $P2[$I1]
        print $S1
        print "\n"
        $I1 += 1
        if $I1 == 13 goto done
        goto loop
done:
        end
.end
CODE

unlink $xpto if -f $xpto
