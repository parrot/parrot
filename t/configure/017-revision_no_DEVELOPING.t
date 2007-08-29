#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 017-revision_no_DEVELOPING.t

use strict;
use warnings;

use Test::More tests => 13;
use Carp;
use_ok( 'Cwd' );
use_ok( 'File::Copy' );
use_ok( 'File::Temp', qw| tempdir | );
use lib qw( lib );

my ($current, $config);

# Case 2:  DEVELOPING's non-existence is faked;  Parrot::Config not yet available. #'
my $cwd = cwd();
my $reason =
    'Either file DEVELOPING does not exist or configuration has completed (as evidenced by existence of Parrot::Config::Generated';

SKIP: {
    skip $reason,  9 if (
        (not -e 'DEVELOPING')
        or
        ( -e q{lib/Parrot/Config/Generated.pm} )
    );
    my $tdir = tempdir(CLEANUP => 1);
    ok(chdir $tdir, "Changed to temporary directory for testing");
    ok((mkdir "lib"), "Able to make directory lib");
    ok((mkdir "lib/Parrot"), "Able to make directory lib/Parrot");
    ok(copy ("$cwd/lib/Parrot/Revision.pm", "lib/Parrot/"),
        "Able to copy Parrot::Revision for testing");
    unshift(@INC, "lib");
    require Parrot::Revision;
    no warnings qw(once);
    $current = $Parrot::Revision::current;
    like($current, qr/^\d+$/, "current revision is all numeric");
    $config = $Parrot::Revision::config;
    use warnings;
    like($config, qr/^\d+$/, "current revision is all numeric");
    is($current, $config, "current and config are identical");
    is($current, 0, 'current is zero as expected');
    ok(chdir $cwd, "Able to change back to directory after testing");
}

# Case 3:  DEVELOPING exists; Parrot::Config available.
pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

017-revision_no_DEVELOPING.t - test Parrot::Revision

=head1 SYNOPSIS

    % prove t/configure/017-revision_no_DEVELOPING.t

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
