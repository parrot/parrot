#! perl
# Copyright (C) 2010, Parrot Foundation.
# $Id$
# 01_functions.t

use strict;
use warnings;
use Test::More qw(no_plan); # tests => 60;
use Cwd;
use File::Basename;
use File::Copy;
use File::Temp qw( tempdir );
use lib qw( lib );
use Parrot::Headerizer::Functions qw(
    print_headerizer_warnings
    read_file
    write_file
);
use IO::CaptureOutput qw| capture |;


pass("Completed all tests in $0");

sub touch_parrot {
    open my $FH, '>', q{parrot}
        or die "Unable to open handle for writing: $!";
    print $FH "\n";
    close $FH or die "Unable to close handle after writing: $!";
}

################### DOCUMENTATION ###################

=head1 NAME

01_functions.t - Test functions in Parrot::Headerizer::Functions.

=head1 SYNOPSIS

    % prove t/tools/dev/headerizer/01_functions.t

=head1 DESCRIPTION

The files in this directory test the publicly callable subroutines found in 
F<lib/Parrot/Headerizer/Functions.pm>.  By doing so, they help test the functionality
of the F<tools/dev/headerizer.pl> utility.


=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

F<tools/dev/headerizer.pl>; F<lib/Parrot/Headerizer/Functions.pm>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
