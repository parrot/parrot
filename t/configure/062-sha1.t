#! perl
# Copyright (C) 2010, Parrot Foundation.
# 062-sha1.t

use strict;
use warnings;

use Test::More;
if (-e 'DEVELOPING' and ! -e 'Makefile') {
    plan tests =>  7;
}
else {
    plan skip_all =>
        q{Relevant only when working in a development repo and prior to configuration};
}
use Carp;
use Cwd;
use File::Copy;
use File::Path ();
use File::Temp qw| tempdir |;
use lib qw( lib );

my $cwd = cwd();
{
    my $tdir = tempdir( CLEANUP => 1 );
    ok( chdir $tdir, "Changed to temporary directory for testing" );
    my $libdir = qq{$tdir/lib};
    ok( (File::Path::mkpath( [ $libdir ], 0, 0777 )), "Able to make libdir");
    local @INC;
    unshift @INC, $libdir;
    ok( (File::Path::mkpath( [ qq{$libdir/Parrot} ], 0, 0777 )), "Able to make Parrot dir");
    ok( (copy qq{$cwd/lib/Parrot/SHA1.pm},
            qq{$libdir/Parrot}), "Able to copy Parrot::SHA1");
    chdir $cwd;
    require Parrot::SHA1;
    {
        no warnings 'once';
        TODO: {
            like($Parrot::SHA1::current, qr/^[0-9a-f]{40}$/,
                "Got git hash for sha1 number");
        };
    }

    chdir $tdir;
    unlink qq{$libdir/Parrot/SHA1.pm}
        or croak "Unable to delete file after testing";
    ok( chdir $cwd, "Able to change back to starting directory");
}

pass("Completed all tests in $0");

=head1 NAME

062-sha1.t - test Parrot::SHA1

=head1 SYNOPSIS

    % prove t/configure/062-sha1.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test Parrot::SHA1 (F<lib/Parrot/SHA1.pm>).

=head1 AUTHOR

Jonathan "Duke" Leto

=head1 SEE ALSO

Parrot::Configure, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
