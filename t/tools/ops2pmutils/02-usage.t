#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 02-usage.t

use strict;
use warnings;

BEGIN {
    use FindBin qw($Bin);
    use Cwd qw(cwd realpath);
    realpath($Bin) =~ m{^(.*\/parrot)\/[^/]*\/[^/]*\/[^/]*$};
    our $topdir = $1;
    if ( defined $topdir ) {
        print "\nOK:  Parrot top directory located\n";
    }
    else {
        $topdir = realpath($Bin) . "/../../..";
    }
    unshift @INC, qq{$topdir/lib};
}
use Test::More tests => 14;
use Carp;
use Cwd;
use lib ("$main::topdir/t/tools/ops2pmutils/testlib");
use_ok("Capture");

use_ok( 'Parrot::Ops2pm::Auxiliary', qw| Usage getoptions | );

ok( chdir $main::topdir, "Positioned at top-level Parrot directory" );
my $cwd = cwd();
my ( $msg, $tie, @lines );
{
    $tie = tie *STDERR, "Capture" or croak "Unable to tie";
    Usage();
    $msg = $tie->READLINE;
    untie *STDERR or croak "Unable to untie";
    like(
        $msg,
qr|^usage: tools/build/ops2pm\.pl \[--help\] \[--no-lines\] input\.ops \[input2\.ops \.\.\.\]|,
        "Got expected usage message"
    );
}

{
    local @ARGV = qw( --no-lines );
    my $flagsref = getoptions();
    ok( $flagsref->{nolines},        "no-lines option detected" );
    ok( !defined $flagsref->{help},  "help option not defined" );
    ok( !defined $flagsref->{renum}, "renum option not defined" );
}

{
    local @ARGV = ();
    my $flagsref = getoptions();
    ok( !defined $flagsref->{nolines}, "no-lines option not defined" );
    ok( !defined $flagsref->{help},    "help option not defined" );
    ok( !defined $flagsref->{renum},   "renum option not defined" );
}

{
    local @ARGV = qw( --no-lines --help --renum );
    my $flagsref = getoptions();
    ok( $flagsref->{nolines}, "no-lines option detected" );
    ok( $flagsref->{help},    "help option detected" );
    ok( $flagsref->{renum},   "renum option detected" );
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

02-usage.t - test C<Parrot::Ops2pm::Utils::Usage()>

=head1 SYNOPSIS

    % prove t/tools/ops2pmutils/02-usage.t

=head1 DESCRIPTION

The files in this directory test the publicly callable subroutines of
F<lib/Parrot/Ops2pm/Utils.pm> and F<lib/Parrot/Ops2pm/Auxiliary.pm>.
By doing so, they test the functionality of the F<ops2pm.pl> utility.
That functionality has largely been extracted
into the methods of F<Utils.pm>.

F<02-usage.t> tests whether C<Parrot::Ops2pm::Auxiliary::Usage()>
works properly.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

Parrot::Ops2pm::Auxiliary, F<ops2pm.pl>.

=cut


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
