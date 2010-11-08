#! perl
# Copyright (C) 2010, Parrot Foundation.
# $Id$
# 01_functions.t

use strict;
use warnings;
use Test::More qw(no_plan); # tests => 60;
use Cwd;
#use File::Basename;
#use File::Copy;
use File::Temp qw( tempdir );
use Tie::File;
use lib qw( lib );
use Parrot::Headerizer::Functions qw(
    print_headerizer_warnings
    read_file
    write_file
);
use IO::CaptureOutput qw| capture |;

my $cwd = cwd();
{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir;
    my $file = "filename$$";
    my @lines_to_write = (
        "Goodbye\n",
        "cruel\n",
        "world\n",
    );
    my $text = join( '' => @lines_to_write );
    write_file($file, $text);
    ok(-f $file, "File was written");

    my $text_returned = read_file($file);
    ok($text_returned, "Got non-empty string back from read_file()");
    my @lines_read = split /\n/, $text_returned;
    is($lines_read[0], 'Goodbye', "Got first line");
    is($lines_read[1], 'cruel', "Got second line");
    is($lines_read[2], 'world', "Got third line");
}
    

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
