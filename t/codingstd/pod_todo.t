#! perl
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

use strict;
use warnings;

use Carp;
use Test::More;
use lib qw( lib );
BEGIN {
    eval 'use Parrot::Test::Pod';
    if ($@) {
        plan skip_all => 'Prerequisites for Parrot::Test::Pod not satisfied';
        exit;
    }
}

plan tests => 2;

my $self = Parrot::Test::Pod->new( {
    argv => [ @ARGV ],
} );
ok( defined $self, "Parrot::Test::Pod returned defined value" );

my $need_testing_ref = $self->identify_files_for_POD_testing( {
    second_analysis => 'no_pod_todo',
} );

my $bad_files = join( "\n", sort @{ $need_testing_ref } );
my $nbad_files = scalar @{ $need_testing_ref };

# only ok if everything passed

is(
    $bad_files,
    q{},
    'No todo items found'
);

diag("\nFound $nbad_files files with 'todo', 'fixme' or 'XXX' items.\n")
    if $nbad_files;

=head1 NAME

t/doc/pod_todo.t - find todo items in pod files

=head1 SYNOPSIS

    # test all files
    % prove t/doc/pod_todo.t

    # test specific files
    % perl t/doc/pod_todo.t perl_module.pm perl_file.pl

=head1 DESCRIPTION

Tests the all files listed in F<MANIFEST> and F<MANIFEST.generated> that
appear to contain Pod markup for any todo items. If any files contain the
string 'TODO', 'FIXME' or 'XXX', they are reported in the test output.

=head1 AUTHOR

Paul Cochrane <paultcochrane at gmail dot com>; stolen from t/doc/pod.t

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
