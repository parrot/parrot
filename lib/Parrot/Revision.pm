# Copyright (C) 2005, The Perl Foundation.
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
use warnings;


our $svn_entries = undef;

sub __get_revision {
    return 0 unless (-e 'DEVELOPING');
    $svn_entries = ".svn/entries";

    my $revision;
    # code taken from pugs/util/version_h.pl rev 859
    if (-r $svn_entries) {
        open my $FH, '<', $svn_entries or die $!;
        while (<$FH>) {
            /^ *committed-rev=.(\d+)./ or next;
            $revision = $1;
        }
    }
    elsif (my @info = qx/svk info/ and $? == 0) {
        if (my ($line) = grep /(?:file|svn|https?)\b/, @info) {
            ($revision) = $line =~ / (\d+)$/;
        } elsif (my ($source_line) = grep /^(Copied|Merged) From/, @info) {
            if (my ($source_depot) = $source_line =~ /From: (.*?), Rev\. \d+/) {
                $source_depot = '/'.$source_depot; # convert /svk/trunk to //svk/trunk
                if (my @info = qx/svk info $source_depot/ and $? == 0) {
                    if (my ($line) = grep /(?:file|svn|https?)\b/, @info) {
                        ($revision) = $line =~ / (\d+)$/;
                    }
                }
            }
        }
    }
    return($revision || 0);
}

our $current = __get_revision();
our $config = $current;

# check if Parrot::Config is available
eval 'use Parrot::Config; $config = $PConfig{revision};';

1;
