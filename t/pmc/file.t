#! perl
# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 6;

use Parrot::Config;

use Cwd;
use File::Temp;
use File::Spec::Functions;

my $tempdir = File::Temp::tempdir( CLEANUP => 1 );

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

my $xpto = catdir( $tempdir, 'xpto' );
mkdir $xpto unless -d $xpto;

my $otpx = catfile( $xpto, 'otpx' );

open my $fh, '>', $otpx or die $!;
print $fh 'xpto';
close $fh;

# test is_dir
pir_output_is(<<"CODE", <<"OUT", "Test is_dir");
.sub main :main
        \$P1 = new .File

        \$S1 = "$xpto"
        \$I1 = \$P1."is_dir"(\$S1)

        if \$I1 goto ok1
        print "not "

ok1:
        print "ok 1\\n"

        \$S1 = '$otpx'
        \$I1 = \$P1."is_dir"(\$S1)
        \$I1 = !\$I1

        if \$I1 goto ok2
        print "not "

ok2:
        print "ok 2\\n"

        end
.end
CODE
ok 1
ok 2
OUT


# test is_file
pir_output_is(<<"CODE", <<"OUT", "Test is_file");
.sub main :main
        \$P1 = new .File

        \$S1 = "$xpto"
        \$I1 = \$P1."is_file"(\$S1)
        \$I1 = !\$I1

        if \$I1 goto ok1
        print "not "

ok1:
        print "ok 1\\n"

        \$S1 = "$otpx"
        \$I1 = \$P1."is_file"(\$S1)

        if \$I1 goto ok2
        print "not "

ok2:
        print "ok 2\\n"

        end
.end
CODE
ok 1
ok 2
OUT


SKIP: {
    skip "Links not available under Windows", 1 if $MSWin32;

	my $lotpx = catfile( $xpto, 'lotpx' );
    symlink $otpx, $lotpx;

    # test is_link
    pir_output_is(<<"CODE", <<"OUT", "Test is_link with links to files");
.sub main :main
        \$P1 = new .File

        \$S1 = "$lotpx"
        \$I1 = \$P1."is_link"(\$S1)

        if \$I1 goto ok1
        print "not "
ok1:
        print "ok 1\\n"

        \$S1 = "$otpx"
        \$I1 = \$P1."is_link"(\$S1)
        \$I1 = !\$I1
        if \$I1 goto ok2
        print "not "
ok2:
        print "ok 2\\n"
        end
.end
CODE
ok 1
ok 2
OUT

}

SKIP: {
    skip "Links not available under Windows", 1 if $MSWin32;

	my $xptol = catdir( $xpto, 'xptol' );
    symlink $xpto, $xptol;

    # test is_link
    pir_output_is(<<"CODE", <<"OUT", "Test is_link with links to directories");
.sub main :main
        \$P1 = new .File

        \$S1 = "$xptol"
        \$I1 = \$P1."is_link"(\$S1)

        if \$I1 goto ok1
        print "not "
ok1:
        print "ok 1\\n"

        \$S1 = "$xpto"
        \$I1 = \$P1."is_link"(\$S1)
        \$I1 = !\$I1
        if \$I1 goto ok2
        print "not "
ok2:
        print "ok 2\\n"
        end
.end
CODE
ok 1
ok 2
OUT
}

my $otpxcopy = catdir( $xpto, 'otpxcopy' );
# test copy
pir_output_is(<<"CODE", <<"OUT", "Test copy for files");
.sub main :main
       \$S1 = "$otpx"
       \$S2 = "$otpxcopy"

       \$P1 = new .File
       \$P2 = new .OS

       \$P1."copy"(\$S1,\$S2)
       print "ok\\n"

       \$P3 = \$P2."stat"(\$S1)
       \$P4 = \$P2."stat"(\$S2)

       \$I1 = \$P3[7]
       \$I2 = \$P4[7]

       if \$I1 == \$I2 goto ok
       print "not "
ok:
       print "ok\\n"

       end
.end
CODE
ok
ok
OUT

# test rename
pir_output_is(<<"CODE", <<"OUT", "Test rename for files");
.sub main :main
       \$S1 = "$otpx"
       \$S2 = "$otpxcopy"

       \$P1 = new .File
       \$P2 = new .OS

       \$P3 = \$P2."stat"(\$S1)
       \$I1 = \$P3[7]

       \$P1."rename"(\$S1,\$S2)
       print "ok\\n"

       \$P4 = \$P2."stat"(\$S2)
       \$I2 = \$P4[7]

       if \$I1 == \$I2 goto ok
       print "not "
ok:
       print "ok\\n"

       end
.end
CODE
ok
ok
OUT
