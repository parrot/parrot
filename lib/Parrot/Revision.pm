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
    my $ent = ".svn/entries";

    my $revision;
    # code taken from pugs/util/version_h.pl rev 859
    if (-r $ent) {
        $svn_entries = $ent;
        open my $FH, '<', $svn_entries or die $!;
        while (<$FH>) {
            /^ *committed-rev=.(\d+)./ or next;
            $revision = $1;
            last;
        }
        close $FH;
    }
    elsif (my @info = qx/svk info/ and $? == 0) {
        if (my ($line) = grep /(?:file|svn|https?)\b/, @info) {
            ($revision) = $line =~ / (\d+)$/;
        } else {
	    my ($source_line) = grep /^(Copied|Merged) From/, @info;
	    my ($depot_line)  = grep /^Depot Path/, @info;

            if (    my ($source_depot) = $source_line =~ m{From: (.*?), Rev\. \d+}
		and my ($depot_root)   = $depot_line  =~ m{^Depot Path: (/[^/]*)} )
	    {
                $source_depot = $depot_root.$source_depot; # convert /svk/trunk to //svk/trunk
                if (my @info = qx/svk info $source_depot/ and $? == 0) {
                    if (my ($line) = grep /(?:file|svn|https?)\b/, @info) {
                        ($revision) = $line =~ / (\d+)$/;
                    }
                }
            }
        }
    }
    return ($revision || 0);
}

our $current = __get_revision();
our $config = $current;

# check if Parrot::Config is available
eval 'use Parrot::Config; $config = $PConfig{revision};';

1;
