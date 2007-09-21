#! perl
# Copyright (C) 2006-2007, The Perl Foundation.
# $Id$
# 00-qualify.t

use strict;
use warnings;
use Test::More tests => 10;
use FindBin;
use lib ( "$FindBin::Bin/../..", "$FindBin::Bin/../../lib", "$FindBin::Bin/../../../lib", );
use_ok('Parrot::Pmc2c::Pmc2cMain');

ok( -f "$FindBin::Bin/../../../Makefile",          "Makefile located" );
ok( -f "$FindBin::Bin/../../../myconfig",          "myconfig located" );
ok( -f "$FindBin::Bin/../../../lib/Parrot/PMC.pm", "lib/Parrot/PMC.pm located" );

my ( @files, %sfx );
@files = glob("$FindBin::Bin/../../../src/pmc/*");
for my $f (@files) {
    if ( $f =~ m/.*\.(.*)$/ ) {
        my $s = $1;
        $sfx{$s}++;
    }
}

# In src/pmc, we should have only .pmc files (81+ of them), 1 .num file,
# and >= .h files none of whose names may begin 'pmc_' (lest they be left over
# from a previous build).
my $suffixqty = scalar( keys %sfx );
ok( ( ( 2 <= $suffixqty ) and ( $suffixqty <= 3 ) ), "only 2 or 3 file suffixes in src/pmc" );

ok( $sfx{'num'}, ".num suffix correctly located" );
ok( $sfx{'pmc'}, ".pmc suffix correctly located" );
if ( $sfx{'h'} ) {
    my $pmc_leftovers = 0;
    foreach my $f (@files) {
        $pmc_leftovers++ if $f =~ m/^pmc_.*\.h$/;
    }
    is( $pmc_leftovers, 0, "No left-over 'pmc_*.h' files in src/pmc/" );
}
else {
    pass("No .h files in src/pmc/");
}

my $message = <<END_OF_MESSAGE;


The files in this directory test the publicly callable methods of
Parrot::Pmc2c::Pmc2cMain.  By doing so, they test the functionality
of the pmc2c.pl utility.

Since pmc2c.pl is invoked many times during 'make', tests of its
functionality can give meaningful results only if you run them
when your file system under the top-level Parrot directory is in
a 'pre-make' state, i.e., you have run 'perl Configure.pl' but
have *not* yet run 'make'.  These tests should pass if run at
that point in the build process, but some will necessarily fail
if 'make' has already been executed.  Hence, they should not be
included in the set of tests run by 'make test'.

In short, these are tests of Parrot::Pmc2c::Pmc2cMain but are *not*
tests of Parrot itself.

END_OF_MESSAGE
pass($message);
pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

00-qualify.t - Is this the right point to test Parrot build tools?

=head1 SYNOPSIS

    % prove t/tools/pmc2cutils/00-qualify.t

=head1 DESCRIPTION

The files in this directory test the publicly callable methods of
F<lib/Parrot/Pmc2c/Pmc2cMain.pm>.  By doing so, they test the functionality
of the F<pmc2c.pl> utility.  That functionality has largely been extracted
into the methods of F<Pmc2cMain.pm>.

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

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
