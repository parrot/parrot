# Copyright: 2004-2005 The Perl Foundation.  All Rights Reserved.
# $Id: Pmc2c.pm 7792 2005-04-08 10:17:16Z leo $

=head1 NAME

Parrot::Pmc2c - PMC to C Code Generation

=head1 SYNOPSIS

        use Parrot::Revision;

	print $Parrot::Revision::current;
	print $Parrot::Revision::config;

=head1 DESCRIPTION

Get parrot's current and configure time revision.

=cut

package Parrot::Revision;
use strict;

sub __get_revision {
    # code taken from pugs/util/version_h.pl rev 859
    my $svn_entries = ".svn/entries";

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
