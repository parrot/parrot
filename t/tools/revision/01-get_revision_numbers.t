#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 01-get_revision_numbers.t

use strict;
use warnings;

use Test::More tests => 11;
use Carp;
use Cwd;
use File::Path ();
use File::Temp qw( tempdir );
use lib qw( lib );
use Parrot::Revision::Utils qw(
    get_revision_numbers
);

my $cwd = cwd();
{
    my @testvals = (7399, 7390);
    my $tdir1 = tempdir( CLEANUP => 1 );
    ok( (chdir $tdir1), "Changed to temporary directory");
    my $libdir = qq{$tdir1/lib};
    ok( (File::Path::mkpath( $libdir )), "Able to make libdir");
    local @INC;
    unshift(@INC, $libdir);
    ok( (File::Path::mkpath( qq{$libdir/Parrot} )), "Able to make Parrot dir");

    my $DEVEL = q{DEVELOPING};
    open my $FH, ">", $DEVEL;
    print $FH "Hello world\n";
    close $FH;

    my $rev = qq{$libdir/Parrot/Revision.pm};
    open my $RVS, ">", $rev;
    print $RVS <<EOF;
package Parrot::Revision;
use strict;
use base qw( Exporter );
our \@EXPORT = qw( \$current );
our \$current = $testvals[0];
1;
EOF
    close $RVS;
    do $rev;

    my $conf = qq{$libdir/Parrot/Config.pm};
    open my $MOD, ">", $conf;
    print $MOD <<EOF;
package Parrot::Config;
use strict;
use base qw( Exporter );
our \@EXPORT = qw( \%PConfig );
our %PConfig;
\$PConfig{revision} = $testvals[1];
1;
EOF
    close $MOD;
    do $conf;

    my ($current, $config) = get_revision_numbers();
    is($current, $testvals[0], "Got expected value for current");
    is($config, $testvals[1], "Got expected value for config");

    foreach my $f (
        q{DEVELOPING},
        qq{$libdir/Parrot/Revision.pm},
        qq{$libdir/Parrot/Config.pm},
    ) {
        unlink $f
            or croak "Unable to unlink $f from tempdir after testing";
    }
    ok( (chdir $cwd), "Able to change back to starting directory");
}

{
    my $tdir2 = tempdir( CLEANUP => 1 );
    ok( (chdir $tdir2), "Changed to temporary directory");

    my ($current, $config) = get_revision_numbers();
    is($current, 0, "Got expected value for current under release");
    is($config, 0, "Got expected value for config under release");

    ok( (chdir $cwd), "Able to change back to starting directory");
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

01-get_revision_numbers.t - Test subroutines exported by Parrot::Revision::Utils.

=head1 SYNOPSIS

    % prove t/tools/revision/01-get_revision_numbers.t

=head1 DESCRIPTION

The files in this directory test functionality used by
F<tools/build/revision_c.pl>, a program invoked by Parrot's F<make>.

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

