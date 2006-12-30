#! perl
# Copyright (C) 2006, The Perl Foundation.
# $Id: pmc2c.t 14964 2006-10-18 18:20:48Z particle $
# 00-qualify.t

use strict;
use warnings;
use Test::More tests =>  8;
use FindBin;
use lib (
    "$FindBin::Bin/../..",
    "$FindBin::Bin/../../lib",
    "$FindBin::Bin/../../../lib",
);
use_ok( 'Parrot::Pmc2c::Utils' );

ok(-f "$FindBin::Bin/../../../Makefile", "Makefile located");
ok(-f "$FindBin::Bin/../../../myconfig", "myconfig located");
ok(-f "$FindBin::Bin/../../../lib/Parrot/PMC.pm", "lib/Parrot/PMC.pm located");

my (@files, %sfx);
@files = glob("$FindBin::Bin/../../../src/pmc/*");
for my $f (@files) {
    if ($f =~ m/.*\.(.*)$/) {
        my $s = $1;
        $sfx{$s}++;
    }
}

is(scalar(keys %sfx), 2, "only 2 file suffixes in src/pmc");;
ok($sfx{'num'}, ".num suffix correctly located");
ok($sfx{'pmc'}, ".pmc suffix correctly located");

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

00-qualify.t - Is this the right point to test Parrot build tools?

=head1 SYNOPSIS

    % prove t/tools/pmc2cutils/00-qualify.t

=head1 DESCRIPTION

The files in this directory test the publicly callable methods of 
F<lib/Parrot/Pmc2c/Utils.pm>.  By doing so, they test the functionality 
of the F<pmc2c.pl> utility.  That functionality has largely been extracted 
into the methods of F<Utils.pm>.

Since F<pmc2c.pl> is invoked during C<make>, tests of its functionality can
give meaningful results only if they take into consideration the status of the
file structure at particular points in the build process:

=over 4

=item *

after F<Configure.pl> has run but before F<make> has run;

=item *

at various points while F<make> is running; or

=item *

once F<make> has completed.

=back

The tests in F<00-qualify.t> attempt to confirm that you are at the first of
these three stages.  It tests for the presence or absence of certain files to
form a judgment as to whether F<Configure.pl> has been run (it should have
been) and whether F<make> has been run (it should I<not> have been).  The
tests make certain assumptions about what files should be present or not --
assumptions which may be invalid if the Parrot build process changes in the
future.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

Parrot::Pmc2c, F<pmc2c.pl>.

=cut

