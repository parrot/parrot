#! perl
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use vars qw( %docs $n_docs );
use Parrot::Config;

BEGIN {
    eval "use Pod::Find";
    if ($@) {
        print "1..1\nok 1 # skip Pod::Find not installed\n";
        exit;
    }
    # XXX this should really be using src_dir insetad of build_dir but it
    # doesn't exist (yet)
    %docs = Pod::Find::pod_find(
        { -verbose => 0, -inc => 0 },
        $PConfig{build_dir} # search path(s)
    );

    $n_docs = scalar keys %docs;
}


use Test::More tests => $n_docs;


=head1 NAME

t/doc/pod.t - Pod Document tests

=head1 SYNOPSIS

	% prove t/doc/pod.t

=head1 DESCRIPTION

Tests Pod formatting for all files containing Pod.

=cut


eval "use Test::Pod 0.95";
SKIP: {
    skip "Test::Pod 0.95 not installed.", $n_docs if $@;
    Test::Pod::pod_file_ok( $_ ) foreach keys %docs;
}
