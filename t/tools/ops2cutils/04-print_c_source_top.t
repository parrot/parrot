#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# 04-print_c_source_top.t

use strict;
use warnings;

BEGIN {
    use FindBin qw($Bin);
    use Cwd qw(cwd realpath);
    realpath($Bin) =~ m{^(.*\/parrot)\/[^/]*\/[^/]*\/[^/]*$};
    our $topdir = $1;
    if ( defined $topdir ) {
        print "\nOK:  Parrot top directory located\n";
    }
    else {
        $topdir = realpath($Bin) . "/../../..";
    }
    unshift @INC, qq{$topdir/lib};
}
use Test::More tests => 10;
use Carp;
use Cwd;
use File::Copy;
use File::Temp (qw| tempdir |);
use_ok('Parrot::Ops2pm');
use lib ("$main::topdir/t/tools/ops2cutils/testlib");
use GenerateCore qw|
    generate_core
    @srcopsfiles
    $num
    $skip
|;

ok( chdir $main::topdir, "Positioned at top-level Parrot directory" );
my $cwd = cwd();

{
    my $tdir = tempdir( CLEANUP => 1 );
    ok( chdir $tdir, 'changed to temp directory for testing' );

    my $tlib = generate_core( $cwd, $tdir, \@srcopsfiles, $num, $skip );

    ok( -d $tlib, "lib directory created under tempdir" );
    unshift @INC, $tlib;
    require Parrot::Ops2c::Utils;

    test_print_c_source_top( [qw( C )] );

    ok( chdir($cwd), "returned to starting directory" );
}

sub test_print_c_source_top {
    my $local_argv_ref = shift;
    {
        my $self = Parrot::Ops2c::Utils->new(
            {
                argv => $local_argv_ref,
                flag => { core => 1 },
            }
        );
        ok( defined $self,
            "Constructor correctly returned when provided with argument(s): @{$local_argv_ref}" );

        my $c_header_file = $self->print_c_header_file();
        ok( -e $c_header_file, "$c_header_file created" );
        ok( -s $c_header_file, "$c_header_file has non-zero size" );

        my $source = IO::File->new('>' . $$self{source});
        $self->print_c_source_top($source);
        ok( -s $source, "print_c_source_top printed something to the file" );
    }
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

04-print_c_source_top.t - test C<Parrot::Ops2c::Utils::print_c_source_top()>

=head1 SYNOPSIS

    % prove t/tools/ops2cutils/04-print_c_source_top.t

=head1 DESCRIPTION

The files in this directory test the publicly callable subroutines of
F<lib/Parrot/Ops2c/Utils.pm> and F<lib/Parrot/Ops2c/Auxiliary.pm>.
By doing so, they test the functionality of the F<ops2c.pl> utility.
That functionality has largely been extracted
into the methods of F<Utils.pm>.

All the files in this directory are intended to be run B<after>
F<Configure.pl> has been run but before F<make> has been called.  Hence, they
are B<not> part of the test suite run by F<make test>.   Once you have run
F<Configure.pl>, however, you may run these tests as part of F<make
buildtools_tests>.

F<04-print_c_source_top.t> tests whether
C<Parrot::Ops2c::Utils::print_c_source_top()> work properly.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

Parrot::Ops2c::Auxiliary, F<ops2c.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
