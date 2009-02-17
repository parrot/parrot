#! perl
# Copyright (C) 2007-2008, Parrot Foundation.
# $Id$
# 00-qualify.t

use strict;
use warnings;
use Test::More tests => 11;
use FindBin;
use lib ( "$FindBin::Bin/../../../lib", );
use_ok('Parrot::Ops2pm');

ok( -f "$FindBin::Bin/../../../Makefile",              "Makefile located" );
ok( -f "$FindBin::Bin/../../../myconfig",              "myconfig located" );
ok( -f "$FindBin::Bin/../../../lib/Parrot/OpsFile.pm", "lib/Parrot/OpsFile.pm located" );
ok( -f "$FindBin::Bin/../../../src/ops/core.ops",      "src/ops/core.ops located" );
ok( -f "$FindBin::Bin/../../../src/ops/ops.num",       "src/ops/ops.num located" );
ok( -f "$FindBin::Bin/../../../src/ops/ops.skip",      "src/ops/ops.skip located" );
ok(
    !-e "$FindBin::Bin/../../../lib/Parrot/OpLib/core.pm",
    "lib/Parrot/OpLib/core.pm correctly does not yet exist"
);
ok(
    !-e "$FindBin::Bin/../../../include/parrot/oplib/ops.h",
    "include/parrot/oplib/ops.h correctly does not yet exist"
);

my $message = <<END_OF_MESSAGE;


The files in this directory test the publicly callable methods and
subroutines of Parrot::Ops2pm and Parrot::Ops2pm::Auxiliary.
By doing so, they test the functionality of the ops2pm.pl utility.

Since ops2pm.pl is invoked only once during 'make' -- very near the
beginning of the build process -- and since its purpose is to create files
used later in that process, tests of its functionality can give meaningful
results only if you run them when your file system under the top-level
Parrot directory is in a 'pre-make' state, i.e., *before* you have run 'perl
Configure.pl' but *after* you have run 'make'.  These tests should pass
if run at that point in the build process, but if you have already
executed 'make', some of these tests will necessarily fail. Hence, they
should *not* be included in the set of tests run by 'make test'.

In short, these are tests of Parrot::Ops2pm and
Parrot::Ops2pm::Auxiliary but are *not* tests of Parrot itself.

END_OF_MESSAGE
pass($message);
pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

00-qualify.t - Is this the right point to test Parrot build tools?

=head1 SYNOPSIS

    % prove t/tools/ops2pm/00-qualify.t

=head1 DESCRIPTION

The files in this directory test the publicly callable subroutines of
F<lib/Parrot/Ops2pm.pm>and F<lib/Parrot/Ops2pm/Auxiliary.pm>.
By doing so, they test the functionality of the F<ops2pm.pl> utility.
That functionality has largely been extracted
into the methods of F<Utils.pm>.

Since F<ops2pm.pl> is invoked near the beginning of the build process,
tests of its functionality can give meaningful results only if they
are run in a way that simulates the status of the file system at the point
at which F<make> invokes F<ops2pm.pl>.  The tests in F<00-qualify.t> attempt
to confirm that you are at that point.  They test for the presence or
absence of certain files to form a judgment as to whether F<Configure.pl>
has been run (it should have been) and whether F<make> has been run
(it should I<not> have been).  The tests make certain assumptions
about what files should be present or not -- assumptions which may be
invalid if the Parrot build process changes in the future.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

Parrot::Ops2pm, F<ops2pm.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
