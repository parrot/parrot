#!perl
# Copyright (C) 2001-2005, The Perl Foundation.

use strict;
use warnings;
use lib qw( t . .. lib ../lib ../../lib ../../../lib ../../../../lib );
use Test::More;
use Parrot::Test;
use Parrot::Config;

use Data::Dumper;

=head1 NAME

XXX

=head1 DESCRIPTION

XXX

=head1 SYNOPSIS

XXX

=cut

# abc build directory
my $abcdir = "$PConfig{'build_dir'}/languages/abc";

# files to load tests from
my @files = qw( abc_basic );

# for each test file given calculate full path
my @test_files;
foreach (@files) {
    push @test_files, "$abcdir/t/$_";
}

# calculate total number of tests
my $numtests = 0;
foreach my $f (@test_files) {
    open F, $f;
    while(<F>) { $numtests++ unless $_ =~ m/^#/; }
    close F;
}

# set plan
plan tests => $numtests;

# main loop
foreach my $file (@test_files) {
    open TEST, "<$file" or die "can't open file";
    while (<TEST>) {
        chomp;
        s/\r//g;
        # skip comment lines
        $_ =~ /^#/ and next;

        # split by tabs or 3+ spaces
        my ($expr, $expect, $description ) = split /\t+|\s{3,}/, $_;
        $expect =~ s/\\n/\n/g; # hack to solve \n dilema

        # build pir code
        my $pir_code = abc_template();
        $pir_code =~ s/<<EXPR>>/$expr/g;

        pir_output_is($pir_code, $expect, $description);
    }
}

# end
exit;


sub abc_template {
    return <<"PIR";
.sub 'main' :main
    load_bytecode '$abcdir/abc.pbc'
    .local pmc compiler, code
    compiler = compreg 'ABC'
    code = compiler.'compile'("<<EXPR>>")
    code()
.end
PIR
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
