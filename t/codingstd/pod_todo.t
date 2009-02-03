#! perl
# Copyright (C) 2001-2009, The Perl Foundation.
# $Id$

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

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Config;
use ExtUtils::Manifest qw(maniread);

use vars qw(@failed);

BEGIN {
    eval 'use Pod::Find';
    if ($@) {
        plan skip_all => 'Pod::Find not installed';
        exit;
    }
    eval 'use Pod::Simple';
    if ($@) {
        plan skip_all => 'Pod::Simple not installed';
        exit;
    }
    eval 'use Pod::Simple::Text';
    if ($@) {
        plan skip_all => 'Pod::Simple::Text not installed';
        exit;
    }
}

plan tests => 1;

# RT #44437 this should really be using src_dir insetad of build_dir but it
# doesn't exist (yet)
my $build_dir    = $PConfig{build_dir};
my $manifest     = maniread("$build_dir/MANIFEST");
my $manifest_gen = maniread("$build_dir/MANIFEST.generated");

# if we have files passed in at the command line, use them
my @files;
if (@ARGV) {
    @files = <@ARGV>;
}
else {
    diag "finding files with pod, this might take a while.";
    @files = ( sort keys(%$manifest), sort keys(%$manifest_gen) );
}

foreach my $file (@files) {
    $file = "$build_dir/$file";

    # skip test files looking for todo items as their docs definitely contain
    # todo items: this is how they explain what they're doing.
    next if $file =~ m/pod_todo\.t|fixme\.t/;

    # skip binary files (including .pbc files)
    next if -B $file;

    # skip missing MANIFEST.generated files
    next unless -e $file;

    # skip files without POD
    next unless Pod::Find::contains_pod( $file, 0 );

    # skip files without todo items
    next if no_pod_todo($file);
    push @failed, $file;
}

my $bad_files = join( "\n", @failed );
is( $bad_files, q{}, 'No todo items found' );    # only ok if everything passed

# Pulled from Test::Pod
sub no_pod_todo {
    my $file    = shift;
    my $checker = Pod::Simple::Text->new;

    my $text;
    $checker->output_string( \$text );
    $checker->parse_file($file);

    # if the text contains todo items return false
    if ( $text =~ m/TODO|FIXME|XXX/ ) {
        return 0;
    }
    else {
        return 1;
    }
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
