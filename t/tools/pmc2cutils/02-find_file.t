#! perl
# Copyright (C) 2006-2007, Parrot Foundation.
# $Id$
# 02-find_file.t

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
use Test::More tests => 7;
use_ok('Parrot::Pmc2c::Pmc2cMain');

my ( %opt, @include, @args );
my $self;

my $pmcdir = qq{$main::topdir/src/pmc};
@include = ($pmcdir);
$self    = Parrot::Pmc2c::Pmc2cMain->new(
    {
        include => \@include,
        opt     => \%opt,
        args    => [@args],
        bin     => $Bin,
    }
);

my ( $file, $path );
$file = q{array.pmc};

$path = $self->find_file($file);
ok( -f $path, "$file found" );

$path = $self->find_file(qq{$pmcdir/$file});
ok( -f $path, "absolute path; $file found" );

$file = q{dskflajsdfghjdshfg};

$path = $self->find_file($file);
ok( !defined $path, "nonexistent file correctly returned undef" );

$path = $self->find_file(qq{$pmcdir/$file});
ok( !defined $path, "absolute path but nonexistent file correctly returned undef" );

eval { $path = $self->find_file( $file, 1 ); };
like(
    $@,
    qr/^cannot find file '$file' in path/,
    "program correctly died when 'die_unless_found' flag is set"
);

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

02-find_file.t - test C<Parrot::Pmc2c::Pmc2cMain::find_file()>

=head1 SYNOPSIS

    % prove t/tools/pmc2cutils/02-find_file.t

=head1 DESCRIPTION

The files in this directory test the publicly callable methods of
F<lib/Parrot/Pmc2c/Pmc2cMain.pm>.  By doing so, they test the functionality
of the F<pmc2c.pl> utility.  That functionality has largely been extracted
into the methods of F<Pmc2cMain.pm>.

F<02-find_file.t> tests C<Parrot::Pmc2c::Pmc2cMain::find_file()>, which is
called within other Parrot::Pmc2c::Util methods.  The tests assume a certain
file structure in the Parrot tarball; they may no longer be valid if that
structure changes in the future.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

Parrot::Pmc2c, pmc2c.pl.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
