# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::Revision - SVN Revision

=head1 SYNOPSIS

    use Parrot::Revision;

    print $Parrot::Revision::current;
    print $Parrot::Revision::config;

=head1 DESCRIPTION

Get parrot's current and configure time revision.

=cut

package Parrot::Revision;
use strict;
use 5.006;

our $svn_entries = undef;

sub __get_revision {
    return 0 unless (-e ".svn/entries");
    $svn_entries = ".svn/entries";

    # code taken from pugs/util/version_h.pl rev 859
    if (-r $svn_entries) {
        open FH, $svn_entries or die $!;
        while (<FH>) {
            /^ *committed-rev=.(\d+)./ or next;
            return $1;
        }
    }
    return 0;
}

our $current = __get_revision();
our $config = $current;

# check if Parrot::Config is available
eval 'use Parrot::Config; $config = $PConfig{revision};';

1;
