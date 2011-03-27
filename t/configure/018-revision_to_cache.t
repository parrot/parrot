#! perl
# Copyright (C) 2007, Parrot Foundation.
# 018-revision_to_cache.t

use strict;
use warnings;

use Test::More;
if (-e 'DEVELOPING' and ! -e 'Makefile') {
    plan tests => 13;
}
else {
    plan skip_all =>
        q{Relevant only when working in checkout from repository and prior to configuration};
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

    ok( (File::Path::mkpath( [ qq{$libdir/Parrot} ], 0, 0777 )),
        "Able to make Parrot dir");
    ok( (copy qq{$cwd/lib/Parrot/Revision.pm},
        qq{$libdir/Parrot}),
        "Able to copy Parrot::Revision");
    ok( (File::Path::mkpath( [ qq{$libdir/File} ], 0, 0777 )),
        "Able to make File dir");
    ok( (copy qq{$cwd/lib/File/Which.pm},
        qq{$libdir/File/Which.pm}),
        "Able to copy File::Which");
    ok( (File::Path::mkpath( [ qq{$libdir/Parrot/Configure} ], 0, 0777 )),
        "Able to make Parrot dir");
    ok( (copy qq{$cwd/lib/Parrot/Configure/Utils.pm},
        qq{$libdir/Parrot/Configure/Utils.pm}),
        "Able to copy Parrot::Configure::Utils");
    ok( (copy qq{$cwd/lib/Parrot/BuildUtil.pm},
        qq{$libdir/Parrot/BuildUtil.pm}),
        "Able to copy Parrot::BuildUtil");
    
    require Parrot::Revision;
    no warnings 'once';
    TODO: {
        local $TODO = "doesn't work at the moment - git migration";
        like($Parrot::Revision::current, qr/^[0-9a-f]{40}$/,
            "Got git hash for revision number");
    };
    use warnings;
    my $cache = q{.parrot_current_rev};
    ok( ( -e $cache ), "Cache for revision number was created");
    unlink qq{$libdir/Parrot/Revision.pm}
        or croak "Unable to delete file after testing";
    ok( chdir $cwd, "Able to change back to starting directory");
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

018-revision_to_cache.t - test Parrot::Revision

=head1 SYNOPSIS

    % prove t/configure/018-revision_to_cache.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test Parrot::Revision (F<lib/Parrot/Revision.pm>).

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

Parrot::Configure, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
