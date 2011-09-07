#! perl
# Copyright (C) 2001-2006, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 9;

use Parrot::Config;

use Cwd;
use File::Temp;
use File::Spec::Functions;

my $tempdir = File::Temp::tempdir( CLEANUP => 1 );

our ( $MSWin32, $cygwin, $msys );
$MSWin32 = 1 if $^O =~ m!MSWin32!;
$cygwin  = 1 if $^O =~ m!cygwin!;
$msys    = 1 if $^O =~ m!msys!;

=head1 NAME

t/pmc/file.t - Files functions

=head1 SYNOPSIS

    % prove t/dynpmc/file.t

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
pir_output_is( <<"CODE", <<"OUT", "Test is_dir" );
.sub main :main
        \$P0 = loadlib 'file'
        \$P1 = new ['File']

        \$S1 = '$xpto'
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

# test is_dir
pir_error_output_like( <<"CODE", <<"OUT", "Test is_dir error" );
.sub main :main
        \$P0 = loadlib 'file'
        \$P1 = new ['File']

        #make a filename that's long enough to cause lstat to fail
        \$I0 = 1000
loop:
        \$S0 = concat \$S0, "1234567890"
        \$I0 = \$I0 - 1
        if \$I0 goto loop

        \$I1 = \$P1."is_dir"(\$S0)

        end
.end
CODE
/stat failed/
OUT

# test is_file
pir_output_is( <<"CODE", <<"OUT", "Test is_file" );
.sub main :main
        \$P0 = loadlib 'file'
        \$P1 = new ['File']

        \$S1 = '$xpto'
        \$I1 = \$P1."is_file"(\$S1)
        \$I1 = !\$I1

        if \$I1 goto ok1
        print "not "

ok1:
        print "ok 1\\n"

        \$S1 = '$otpx'
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

# test is_file
pir_error_output_like( <<"CODE", <<"OUT", "Test is_file error" );
.sub main :main
        \$P0 = loadlib 'file'
        \$P1 = new ['File']

        #make a filename that's long enough to cause lstat to fail
        \$I0 = 1000
loop:
        \$S0 = concat \$S0, "1234567890"
        \$I0 = \$I0 - 1
        if \$I0 goto loop

        \$I1 = \$P1."is_file"(\$S0)

        end
.end
CODE
/stat failed/
OUT

SKIP: {
    skip "Links not available under Windows", 1 if $MSWin32 || $msys;

    my $lotpx = catfile( $xpto, 'lotpx' );
    symlink $otpx, $lotpx;

    # test is_link
    pir_output_is( <<"CODE", <<"OUT", "Test is_link with links to files" );
.sub main :main
        \$P0 = loadlib 'file'
        \$P1 = new ['File']

        \$S1 = '$lotpx'
        \$I1 = \$P1."is_link"(\$S1)

        if \$I1 goto ok1
        print "not "
ok1:
        print "ok 1\\n"

        \$S1 = '$otpx'
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
    skip "Links not available under Windows", 1 if $MSWin32 || $msys;

    my $xptol = catdir( $xpto, 'xptol' );
    symlink $xpto, $xptol;

    # test is_link
    pir_output_is( <<"CODE", <<"OUT", "Test is_link with links to directories" );
.sub main :main
        \$P0 = loadlib 'file'
        \$P1 = new ['File']

        \$S1 = '$xptol'
        \$I1 = \$P1."is_link"(\$S1)

        if \$I1 goto ok1
        print "not "
ok1:
        print "ok 1\\n"

        \$S1 = '$xpto'
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
pir_output_is( <<"CODE", <<"OUT", "Test copy for files" );
.sub main :main
       \$S1 = '$otpx'
       \$S2 = '$otpxcopy'

       \$P0 = loadlib 'file'
       \$P0 = loadlib 'os'
       \$P1 = new ['File']
       \$P2 = new ['OS']

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
SKIP: {
    skip 'file exists', 1 if $MSWin32 || $msys;

    pir_output_is( <<"CODE", <<"OUT", "Test rename for files" );
.sub main :main
       \$S1 = '$otpx'
       \$S2 = '$otpxcopy'

       \$P0 = loadlib 'file'
       \$P0 = loadlib 'os'
       \$P1 = new ['File']
       \$P2 = new ['OS']

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
}

my $bad_file = catfile( $xpto, 'not a file' );

# test exists
pir_output_is( <<"CODE", <<"OUT", "Test rename for files" );
.sub main :main
       \$P0 = loadlib 'file'
       \$P1 = new ['File']
       \$I1 = \$P1.'exists'( '$otpxcopy' )

       if \$I1 goto file_exists
       print "not "

  file_exists:
       print "ok 1 - file exists\\n"

       \$I1 = \$P1.'exists'( '$xpto' )

       if \$I1 goto dir_exists
       print "not "

  dir_exists:
       print "ok 2 - directory exists\\n"

       \$I1 = \$P1.'exists'( '$bad_file' )

       if \$I1 == 0 goto file_does_not_exist
       print "not "

  file_does_not_exist:
       print "ok 3 - file does not exist\\n"

       end
.end
CODE
ok 1 - file exists
ok 2 - directory exists
ok 3 - file does not exist
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
