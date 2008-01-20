#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 02-print_src.t

use strict;
use warnings;

use Test::More tests =>  4;
use Carp;
use Cwd;
use File::Path ();
use File::Temp qw( tempdir );
use lib qw( lib );
use Parrot::Revision::Utils qw(
    print_src_revision_c
);
use IO::CaptureOutput qw| capture |;

{
    my ($current, $config, $script);
    my ($stdout, $rv);
    $current = 7399;
    $config  = 7390;
    $script  = $0;

    capture (
        sub { $rv = print_src_revision_c($current, $config, $script); },
        \$stdout,
    );
    ok($rv, "print_src_revision_c() returned true value");
    like($stdout,
        qr/This file is generated automatically by $script/,
        "Got expected text"
    );
    like($stdout,
        qr/return $current.*return $config/s,
        "Got expected text"
    );
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

02-print_src.t - Test subroutines exported by Parrot::Revision::Utils.

=head1 SYNOPSIS

    % prove t/tools/revision/02-print_src.t

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

