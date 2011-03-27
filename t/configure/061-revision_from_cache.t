#! perl
# Copyright (C) 2007, Parrot Foundation.
# 061-revision_from_cache.t

use strict;
use warnings;

use Test::More;
if (-e 'DEVELOPING' and ! -e 'Makefile') {
    plan tests => 25;
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
use Parrot::Revision ();
use Parrot::Configure::Utils qw( :cache );

my $cwd = cwd();
{   # revision undef
    my $rev = 16000;
    my ($cache, $libdir) = setup_cache($rev, $cwd);
    my $prev = 34567;
    my $revision = undef;
    my $current = 12345;
    my $ret = Parrot::Revision::_handle_update( {
        prev        => $prev,
        revision    => $revision,
        cache       => $cache,
        current     => $current,
    } );
    is($ret, q{unknown}, "Got expected return value from _handle_update");
    unlink qq{$libdir/Parrot/Revision.pm}
        or croak "Unable to delete file after testing";
    ok( chdir $cwd, "Able to change back to starting directory");
}

{   # prev undef
    my $rev = 16000;
    my ($cache, $libdir) = setup_cache($rev, $cwd);
    my $revision = 67890;
    my $current = 12345;
    my $ret = Parrot::Revision::_handle_update( {
        prev        => undef,
        revision    => $revision,
        cache       => $cache,
        current     => $current,
    } );
    is($ret, $current, "Got expected return value from _handle_update");
    unlink qq{$libdir/Parrot/Revision.pm}
        or croak "Unable to delete file after testing";
    ok( chdir $cwd, "Able to change back to starting directory");
}

{   # prev and revision both defined and identical
    my $rev = 16000;
    my ($cache, $libdir) = setup_cache($rev, $cwd);
    my $prev = 67890;
    my $revision = 67890;
    my $current = 12345;
    my $ret = Parrot::Revision::_handle_update( {
        prev        => $prev,
        revision    => $revision,
        cache       => $cache,
        current     => $current,
    } );
    is($ret, $current, "Got expected return value from _handle_update");
    unlink qq{$libdir/Parrot/Revision.pm}
        or croak "Unable to delete file after testing";
    ok( chdir $cwd, "Able to change back to starting directory");
}

{   # prev and revision both defined but not  identical
    my $rev = 16000;
    my ($cache, $libdir) = setup_cache($rev, $cwd);
    my $prev = 67890;
    my $revision = 67891;
    my $current = 12345;
    my $ret = Parrot::Revision::_handle_update( {
        prev        => $prev,
        revision    => $revision,
        cache       => $cache,
        current     => $current,
    } );
    is($ret, $revision, "Got expected return value from _handle_update");
    unlink qq{$libdir/Parrot/Revision.pm}
        or croak "Unable to delete file after testing";
    ok( chdir $cwd, "Able to change back to starting directory");
}

pass("Completed all tests in $0");


##### SUBROUTINES #####

sub setup_cache {
    my ($rev, $cwd) = @_;
    my $tdir = tempdir( CLEANUP => 1 );
    ok( chdir $tdir, "Changed to temporary directory for testing" );
    my $libdir = qq{$tdir/lib};
    ok( (File::Path::mkpath( [ $libdir ], 0, 0777 )), "Able to make libdir");
    local @INC;
    unshift @INC, $libdir;
    ok( (File::Path::mkpath( [ qq{$libdir/Parrot} ], 0, 0777 )), "Able to make Parrot dir");
    ok( (copy qq{$cwd/lib/Parrot/Revision.pm},
            qq{$libdir/Parrot}), "Able to copy Parrot::Revision");
    my $cache = q{.parrot_current_rev};
    print_to_cache($cache, $rev);
    return ($cache, $libdir);
}

################### DOCUMENTATION ###################

=head1 NAME

061-revision_from_cache.t - test Parrot::Revision

=head1 SYNOPSIS

    % prove t/configure/061-revision_from_cache.t

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
