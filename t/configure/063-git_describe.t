#! perl
# Copyright (C) 2010-2011, Parrot Foundation.
# 063-git_describe.t

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

    # Cannot get it to work with this. Why do we need it?
    #local @INC;

    unshift @INC, $libdir;
    ok( (File::Path::mkpath( [ qq{$libdir/Parrot/Git} ], 0, 0777 )), "Able to make Parrot dir");
    chdir $cwd;

    require Parrot::Git::Describe;
    {
        no warnings 'once';
        TODO: {
        ok( (copy qq{$cwd/lib/Parrot/Git/Describe.pm},
                qq{$libdir/Parrot/Git}), "Able to copy Parrot::Git::Describe");

            like($Parrot::Git::Describe::current,
                qr/^(RELEASE_|REL_)\d+\_\d+\_\d+(\-\d+\-g[a-z0-9]+)?$/i,
                "Got a describe string",
            );
        };
    }

    chdir $tdir;
    unlink qq{$libdir/Parrot/Git/Describe.pm}
        or croak "Unable to delete file after testing";
    ok( chdir $cwd, "Able to change back to starting directory");
}

pass("Completed all tests in $0");

=head1 NAME

063-git_describe.t - test caching in Parrot::Git::Describe

=head1 SYNOPSIS

    % prove t/configure/063-git_describe.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test Parrot::Git::Describe (F<lib/Parrot/Git::Describe.pm>).

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
