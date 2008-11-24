#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 044-slurp_file.t

use strict;
use warnings;

use Test::More tests =>  9;
use Carp;
use File::Temp qw| tempfile |;
use lib qw( lib );
use Parrot::BuildUtil;

{
    my ( $fh, $tempfile ) = tempfile( UNLINK => 1 );
    open $fh, ">", $tempfile
        or croak "Unable to open tempfile for writing";
    print $fh "Testing Parrot::BuildUtil::slurp_file()\n";
    close $fh or croak "Unable to close tempfile after writing";

    ok( -f $tempfile, "tempfile created for testing" );
    my $str = Parrot::BuildUtil::slurp_file($tempfile);
    ok( $str, "slurpfile() returned true value" );
    like(
        $str,
        qr/Testing Parrot::BuildUtil::slurp_file/,
        "Main content of tempfile correctly slurped"
    );
}

{
    my ( $fh, $tempfile ) = tempfile( UNLINK => 1 );
    open $fh, ">", $tempfile
        or croak "Unable to open tempfile for writing";
    print $fh "Testing Parrot::BuildUtil::slurp_file()\cM\cJ\n";
    close $fh or croak "Unable to close tempfile after writing";

    ok( -f $tempfile, "tempfile created for testing" );
    my $str = Parrot::BuildUtil::slurp_file($tempfile);
    ok( $str, "slurpfile() returned true value" );
    like(
        $str,
        qr/Testing Parrot::BuildUtil::slurp_file/,
        "Main content of tempfile correctly slurped"
    );
    like( $str, qr/\n{2}/m, "DOS line endings correctly converted during slurp_file" );
}

{
    my $phony = $$;
    my $str;
    eval { $str = Parrot::BuildUtil::slurp_file($phony); };
    like(
        $@,
        qr/open '$phony'/,
        "Got error message expected upon attempting to slurp non-existent file"
    );
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

044-slurp_file.t - test C<Parrot::BuildUtil::slurp_file()>

=head1 SYNOPSIS

    % prove t/configure/044-slurp_file.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test C<Parrot::BuildUtil::slurp_file()>.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

Parrot::BuildUtil, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

