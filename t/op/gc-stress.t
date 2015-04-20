#! perl
# Copyright (C) 2014-2015, Parrot Foundation.

=head1 NAME

t/op/gc-stress.t - Find possible garbage collection segfaults

=head1 SYNOPSIS

    % prove t/op/gc-stress.t

=head1 DESCRIPTION

Use common and stable 2 stress tests from t/stress/gc.t to find missing marks,
write barriers or other possible problems in the normal testsuite.

=cut

use strict;
use warnings;

use lib 'lib';
use Parrot::Test tests => 2;
use Test::More;
use Parrot::Config;
use File::Spec;

my $parrot = File::Spec->join( File::Spec->curdir(), 'parrot' . $PConfig{exe} );
my $JSONnqp = File::Spec->join( qw(compilers data_json JSON.nqp) );
my $opsc_03past = File::Spec->join( qw(t compilers opsc 03-past.t) );

sub gc_test {
    my ($cmd, $msg) = shift;
    my $exit_code;
    if ($exit_code = run_command($cmd,
                                 CD  => $PConfig{build_dir},
                                 STDOUT => "test_$$.out",
                                 STDERR => "test_$$.err" ))
    {
        diag("'$cmd' failed with exit code $exit_code.")
    }
    else {
        unlink("test_$$.out", "test_$$.err");
    }
    is($exit_code, 0, $msg);
}

# involving lots of strings and rpa's
# This times out at travis >10min
gc_test("$parrot -D1 --gc-debug --gc-nursery-size=0.01 -- parrot-nqp.pbc --target=pir $JSONnqp",
        "GC CallContext - GH #1159");

gc_test("$parrot -D1 --gc-debug --gc-nursery-size=0.01 -- parrot-nqp.pbc $opsc_03past",
        "GC opsc/03-past.t");

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
