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
  plan tests => 8
}

=head1 NAME

t/pmc/os.t - Files and Dirs

=head1 SYNOPSIS

	% prove t/pmc/os.t

=head1 DESCRIPTION

Tests the C<OS> PMC.

=cut

END {
  # Clean up environment on exit
  rmdir "xpto"  if -d "xpto";
  unlink "xpto" if -f "xpto";
}

# test 'cwd'
my $cwd = getcwd;
pir_output_is(<<'CODE', <<"OUT", "Test cwd");
.sub main :main
        $P1 = new .OS
        $S1 = $P1."cwd"()
        print $S1
        print "\n"
        end
.end
CODE
$cwd
OUT



#  TEST cd
chdir "src";
my $upcwd = getcwd;
chdir "..";

pir_output_is(<<'CODE', <<"OUT", "Test cd");
.sub main :main
        $P1 = new .OS

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

        end
.end
CODE
$upcwd
$cwd
OUT


# Test mkdir

my $xpto = $upcwd;
$xpto =~ s/src/xpto/;

pir_output_is(<<'CODE', <<"OUT", "Test mkdir");
.sub main :main
        $P1 = new .OS

        $S1 = "xpto"
        $I1 = 0o555
        $P1."mkdir"($S1,$I1)
        $P1."cd"($S1)

        $S1 = $P1."cwd"()
        print $S1
        print "\n"

        $S1 = ".."
        $P1."cd"($S1)

        $S1 = $P1."cwd"()
        print $S1
        print "\n"

        end
.end
CODE
$xpto
$cwd
OUT

# Test remove on a directory

pir_output_is(<<'CODE', <<"OUT", "Test rm call in a directory");
.sub main :main
        $P1 = new .OS

        $S1 = "xpto"
        $P1."rm"($S1)

        print "ok\n"

        end
.end
CODE
ok
OUT

ok(!-d $xpto, "Test that rm removed the directory");
rmdir $xpto if -d $xpto; # this way next test doesn't fail if this one does



# test stat

open X, ">xpto";
print X "xpto";
close X;

my $stat = join("\n",stat("xpto"))."\n";

pir_output_is(<<'CODE', $stat, "Test OS.stat");
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


# Test remove on a file

pir_output_is(<<'CODE', <<"OUT", "Test rm call in a file");
.sub main :main
        $P1 = new .OS

        $S1 = "xpto"
        $P1."rm"($S1)

        print "ok\n"

        end
.end
CODE
ok
OUT

ok(!-d $xpto, "Test that rm removed file");
rmdir $xpto if -f $xpto; # this way next test doesn't fail if this one does

