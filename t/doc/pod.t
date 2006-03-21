#! perl
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/doc/pod.t - Pod document syntax tests

=head1 SYNOPSIS

	% prove t/doc/pod.t

=head1 DESCRIPTION

Tests the Pod syntax for all files listed in F<MANIFEST> and
F<MANIFEST.generated> that appear to contain Pod markup.

=cut

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Config;
use ExtUtils::Manifest qw(maniread);

use vars qw(@docs);

BEGIN {
    eval "use Pod::Find";
    if ($@) {
        print "1..1\nok 1 # skip Pod::Find not installed\n";
        exit;
    }
    eval "use Test::Pod";
    if ($@) {
        print "1..1\nok 1 # skip Test::Pod not installed\n";
        exit;
    }
}

# XXX this should really be using src_dir insetad of build_dir but it
# doesn't exist (yet)
my $build_dir = $PConfig{build_dir};
my $manifest     = maniread("$build_dir/MANIFEST");
my $manifest_gen = maniread("$build_dir/MANIFEST.generated");

diag "finding files with pod, this may take a minute.";

foreach my $file (keys(%$manifest), keys(%$manifest_gen)) {
    $file = "$build_dir/$file";
    # skip binary files (including .pbc files)
    next if -B $file;
    # skip missing MANIFEST.generated files
    next unless -e $file;
    push @docs, $file if Pod::Find::contains_pod($file, 0);
}

plan tests => scalar @docs;
Test::Pod::pod_file_ok( $_ ) foreach @docs;
