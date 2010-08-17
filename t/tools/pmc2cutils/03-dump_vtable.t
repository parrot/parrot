#! perl
# Copyright (C) 2006-2007, Parrot Foundation.
# $Id$
# 03-dump_vtable.t

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
use Test::More tests => 8;
use_ok('Parrot::Pmc2c::Pmc2cMain');
use_ok('File::Basename');
use_ok( 'File::Temp', qw| tempdir | );

my ( %opt, @include, @args );
my $self;
my $dump_file;
my $cwd;

# basic test
{
    $cwd = cwd();
    my $tdir1 = tempdir( CLEANUP => 1 );
    ok( chdir $tdir1, 'changed to temp directory for testing' );

    $self = Parrot::Pmc2c::Pmc2cMain->new(
        {
            include => \@include,
            opt     => \%opt,
            args    => [@args],
            bin     => $Bin,
        }
    );
    $dump_file = $self->dump_vtable("$main::topdir/src/vtable.tbl");
    ok( -e $dump_file, "dump_vtable created vtable.dump" );

    is( dirname($dump_file), realpath($tdir1), "vtable.dump created in expected directory" );

    ok( chdir $cwd, "changed back to original directory" );
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

03-dump_vtable.t - test C<Parrot::Pmc2c::Pmc2cMain::dump_vtable()>

=head1 SYNOPSIS

    % prove t/tools/pmc2cutils/03-dump_vtable.t

=head1 DESCRIPTION

The files in this directory test the publicly callable methods of
F<lib/Parrot/Pmc2c/Pmc2cMain.pm>.  By doing so, they test the functionality
of the F<pmc2c.pl> utility.  That functionality has largely been extracted
into the methods of F<Pmc2cMain.pm>.

F<03-dump_vtable.t> tests the C<Parrot::Pmc2c::Pmc2cMain::dump_vtable()> method.
F<make> calls this method when it calls in C<tools/build/pmc2c.pl --vtable>.

When all of F<pmc2c.pl>'s functionality was contained within that program,
C<dump_vtable()> was a subroutine named C<dump_default()>.  That name was
confusing, because it suggested that what was being 'dumped' was
F<src/pmc/default.pmc> -- which was not the case.  The file which this method
takes as an argument is F<src/vtable.tbl>; hence, the method's renaming.

So as not to pollute the Parrot build directories with files created
during the testing process, all functions which create or modify
files should be called within a temporary directory.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

Parrot::Pmc2c, F<pmc2c.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
