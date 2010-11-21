#! perl
# Copyright (C) 2010, Parrot Foundation.
# $Id$
# 01_functions.t

use strict;
use warnings;
use Test::More qw(no_plan); # tests => 15;
use Cwd;
use File::Temp qw( tempdir );
use lib qw( lib );
use Parrot::Config;
use Parrot::Headerizer::Functions qw(
    print_headerizer_warnings
    read_file
    write_file
    qualify_sourcefile
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
    chdir $cwd or die "Unable to chdir: $!";
}
    
my $warnings = {
    'file1' => {
        'func_alpha'    => [
            'alpha warning 1',
            'alpha warning 2',
            'alpha warning 3',
        ],
        'func_beta'      => [
            'beta warning 1',
            'beta warning 2',
        ],
    },
    'file2' => {
        'func_gamma'    => [
            'gamma warning 1',
            'gamma warning 2',
            'gamma warning 3',
        ],
    },
};

{
    my ($stdout, $stderr);
    capture(
        sub { print_headerizer_warnings($warnings); },
        \$stdout,
        \$stderr,
    );
    for my $func( qw| alpha gamma | ) {
        for (1..3) {
            like( $stdout, qr/func_alpha: alpha warning $_/s,
                "Got expected output" );
        }
    }
    for (1..2) {
        like( $stdout, qr/func_beta: beta warning $_/s,
            "Got expected output" );
    }
    like( $stdout, qr/8 warnings in 3 funcs in 2 C files/,
        "Got expected summary of headerizer warnings" );
}

my ($ofile, $is_yacc);
my ($sourcefile, $source_code, $hfile);
$ofile = 'foobar.xyz';
eval {
    my ($sourcefile, $source_code, $hfile) =
        qualify_sourcefile( {
            ofile           => $ofile,
            PConfig         => \%PConfig,
            is_yacc         => 0,
        } );
};
like($@, qr/$ofile doesn't look like an object file/,
    "Got expected die message for non-object, non-yacc file" );
    
pass("Completed all tests in $0");

#sub touch_parrot {
#    open my $FH, '>', q{parrot}
#        or die "Unable to open handle for writing: $!";
#    print $FH "\n";
#    close $FH or die "Unable to close handle after writing: $!";
#}

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
