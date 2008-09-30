#! perl
# Copyright (C) 2006-2007, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use File::Find qw( find );
use File::Basename qw( fileparse );
use File::Spec::Functions qw( catdir catfile );

use Parrot::Config;
#my $base_dir = "/home/raf/parrot";
my $base_dir = $PConfig{build_dir};
=head1 NAME

t/distro/test_file_coverage.t - make sure source files have matching tests

=head1 SYNOPSIS

    % prove t/distro/test_file_coverage.t

=head1 DESCRIPTION

Makes sure that specific source files have matching test files.
And discard files that are not meant to match 

=cut

## make sure PMC files match test files
# remember to change the number of tests :-)
#BEGIN { plan tests => 2; }

=head1 SET PARAMETERS

Parameters for matching are set in %tests hash where:


my %tests = (
    'dynpmc'    =>                     #Hash dynpmc is an identifier can be anyone 
                  ['src/dynpmc',       #Directory for PMC files
                  '.pmc',              #extension for pmc files
                  'PMC1',              #Text in output
                  't/dynpmc',          #Directory for test files
                  '.t',                #extension for test files
                  'test'               #Text in output
                 ],
            );

=cut

my %match_test = (
    dynpmc    => ['src/dynpmc','.pmc','PMC1','t/dynpmc','.t','test1'],
    dynoplibs => ['src/dynoplibs','.pmc','PMC2','t/dynoplibs','.t','test2'],
);

my $num = keys %match_test;
plan tests => $num * 2;

=head1 DISCARDED FILES


Discarded files(matching is not needed) are set in %dis_hash hash where

my %dis_hash = (
 'dynpmc'   => { 'pmc'   => ['digest'],},            #for digest file, pmc extension, dynpmc test
 'dynpmc'   => { 'test'  => ['rotest'],},            #for rotest file, test extension, dynpmc test
 'dynoplibs => { 'pmc'   => ['dan','myops']},        #for dan and myops files, pmc extension, dynoplibs test
);

=cut



my %dis_hash = (
# 'dynpmc' => { 'pmc' => ['digest'],},
# 'dynoplibs' => { 'pmc' => ['dan'],},
);



# Discard function
#
# Discard files not used in testing, use %dis_hash
# If tesre are not discarded files is better not to use this function 
#

sub discard {
my @temp_pmc  = @{$_[0]};
my @temp_test = @{$_[1]};
my $dis_key   = $_[2];

my @result_array_pmc  = ();
my @result_array_test = ();

    if (exists $dis_hash{$dis_key}{'pmc'}) {
        my %vals_pmc = ();
        %vals_pmc = map {  $_ => 1  } @{$dis_hash{$dis_key}{'pmc'}};
        my $i = $#temp_pmc;
        my $pmc_cont = 0;

        for (0 .. $i) {
            if (!exists $vals_pmc{$temp_pmc[$_]}) {
                $result_array_pmc[$pmc_cont] = $temp_pmc[$_];
                $pmc_cont += 1;
            } 
        }
    } else {
        @result_array_pmc = @temp_pmc;
    } 

    if (exists $dis_hash{$dis_key}{'test'}) {
        my %vals_test = ();
        %vals_test = map {  $_ => 1  } @{$dis_hash{$dis_key}{'test'}};
        my $j = $#temp_test;
        my $test_cont = 0;

        for (0 .. $j) {
            if (!exists $vals_test{$temp_test[$_]}) {
                $result_array_test[$test_cont] = $temp_test[$_];
                $test_cont += 1;
            } 
        }
    } else {
        @result_array_test = @temp_test;
    }
    return (\@result_array_pmc,\@result_array_test);
}


#function get_files 
#
# Obtains the result of te match 
#if is used the third parameter return the text of the comparison
#if is not used third parameters resturns a 1 or a 0 depending
#on te array result
#Array empty = all files match = 1
#Array with elements = some file(s) don't match = 0
sub get_files {
    my $test_key    = $_[0];
    my @tests_array = @{ $match_test{$test_key} };
    #my $test_key    = $_[1];
    my $test_type   = $_[1];
    my $out_type    = $_[2];
    #my $out_type    = $_[3];
    my $pmc_dir     = $tests_array[0];       
    my $pmc_suffix  = $tests_array[1];        
    my $pmc_string  = $tests_array[2];        
    my $test_dir    = $tests_array[3];       
    my $test_suffix = $tests_array[4];        
    my $test_string = $tests_array[5];       

    my $text = "";
    my ( @pmc_files, @test_files );

    # find pmc files
    find {
        no_chdir => 1,
        wanted => sub { files_of_type( \@pmc_files, $pmc_suffix ) },
    } => catdir( $base_dir, $pmc_dir );

    # find test files
    find {
        no_chdir => 1,
        wanted => sub { files_of_type( \@test_files, $test_suffix ) },
    } => catdir( $base_dir, $test_dir );

    my ( $pmc_miss, $test_miss ) = list_diff( \@pmc_files, \@test_files );
    
#   Used with discard function
    my ($temp_pmc,$temp_test) = discard($pmc_miss,$test_miss,$test_key);
    my @result_array_pmc =  @{$temp_pmc};
    my @result_array_test =  @{$temp_test};

#   Used without discard function
#    my @result_array_pmc  =  @{$pmc_miss};
#    my @result_array_test =  @{$test_miss};

    local $" = "\n\t";
    if ($test_type eq 'pmc') {
        if (@result_array_pmc) {
            if (defined $out_type) {
                $text = "files in $test_dir but not in $pmc_string dir:\n\t@result_array_pmc";
            } else {
                $text = 0;
            }
        } else {
            if (defined $out_type) {
                $text = "there are $pmc_string files for all $test_string files in $test_dir";
            } else {
                $text = 1;
            }
        }
    } else {
        if (@result_array_test) {
            if (defined $out_type) {
                $text = "files in $pmc_dir but not in $test_string dir:\n\t@result_array_test";
            } else {
                $text = 0;
            }
            } else {
            if (defined $out_type) {
                $text = "there are $pmc_string files for all $test_string files in $test_dir";
            } else {
                $text = 1;
            }
        }
    }
    return $text;
}
#}    # PMC

# RT#44457: DYNPMC, DYNOPS, etc.

sub files_of_type {
    my ( $listref, $ext ) = @_;

    return unless -f $File::Find::name && $File::Find::name =~ m/\Q$ext\E$/;

    my ( $name, $path, $suffix ) = fileparse( $File::Find::name, $ext );

    push @{$listref} => $name;
}

sub list_diff {
    my ( $a, $b ) = @_;

    my %elem;
    grep { $elem{$_}++ } @$a;
    grep { $elem{$_}-- } @$b;

    return ( [ sort grep { $elem{$_} < 0 } keys %elem ], [ sort grep { $elem{$_} > 0 } keys %elem ],
    );
}

#Main loop
=pod
    print get_files('dynpmc','pmc','print')."\n";
    print get_files('dynpmc','test','print')."\n";
    print get_files('dynoplibs','pmc','print')."\n";
    print get_files('dynoplibs','test','print')."\n";


    print get_files('dynpmc','pmc')."\n";
    print get_files('dynpmc','test')."\n";
    print get_files('dynoplibs','pmc')."\n";
    print get_files('dynoplibs','test')."\n";
=cut

    #ok( get_files('dynpmc','pmc') ,     get_files('dynpmc','pmc','print') );
    #ok( get_files('dynpmc','test') ,    get_files('dynpmc','test','print') );
    #ok( get_files('dynoplibs','pmc') ,  get_files('dynoplibs','pmc','print') );
    #ok( get_files('dynoplibs','test') , get_files('dynoplibs','test','print') );

#TODO: {
#    local $TODO = 'Not yet implemented';

    foreach (keys %match_test) {
        ok( get_files($_,'pmc')  ,     get_files($_,'pmc','print') );
        ok( get_files($_,'test') ,     get_files($_,'test','print') );
    }

#}


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
