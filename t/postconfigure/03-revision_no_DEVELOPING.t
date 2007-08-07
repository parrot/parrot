#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 02-revision_no_DEVELOPING.t

use strict;
use warnings;

use Test::More tests => 15;
use Carp;
use_ok( 'Cwd' );
use_ok( 'File::Copy' );
use_ok( 'File::Temp', qw| tempdir | );
use lib qw( . lib ../lib ../../lib );

my ($current, $config);

# Case 2:  DEVELOPING's non-existence is faked;  Parrot::Config available. #'
my $cwd = cwd();
my $reason =
    'Either file DEVELOPING does not exist or configuration has not completed (as evidenced by non-existence of Parrot::Config::Generated';

SKIP: {
    skip $reason, 11 if (
        (not -e 'DEVELOPING')
        or
        (not -e q{lib/Parrot/Config/Generated.pm} )
    );
    my $tdir = tempdir();
    ok(chdir $tdir, "Changed to temporary directory for testing");
    ok((mkdir "lib"), "Able to make directory lib");
    ok((mkdir "lib/Parrot"), "Able to make directory lib/Parrot");
    ok((mkdir "lib/Parrot/Config"),
        "Able to make directory lib/Parrot/Config");
    ok(copy ("$cwd/lib/Parrot/Revision.pm", "lib/Parrot/"),
        "Able to copy Parrot::Revision for testing");
    ok(copy ("$cwd/lib/Parrot/Config.pm", "lib/Parrot/"),
        "Able to copy Parrot::Config for testing");
    ok(copy ("$cwd/lib/Parrot/Config/Generated.pm", "lib/Parrot/Config/"),
        "Able to copy Parrot::Config::Generated for testing");
    unshift(@INC, "lib");
    require Parrot::Revision;
    no warnings qw(once);
    $current = $Parrot::Revision::current;
    like($current, qr/^\d+$/, "current revision is all numeric");
    is($current, 0,
        "If DEVELOPING does not exist (release version), \$current is set to zero.");
    $config = $Parrot::Revision::config;
    use warnings;
    like($config, qr/^\d+$/, "current revision is all numeric");
    ok(chdir $cwd, "Able to change back to directory after testing");
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

02-revision_no_DEVELOPING.t - test Parrot::Revision

=head1 SYNOPSIS

    % prove t/postconfigure/02-revision_no_DEVELOPING.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.
Certain of the modules C<use>d by F<Configure.pl> have functionality which is
only meaningful I<after> F<Configure.pl> has actually been run and
Parrot::Config::Generated has been created.  So certain tests need to be run
when your Parrot filesystem is in a "pre-F<make>, post-F<Configure.pl>" state.

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
