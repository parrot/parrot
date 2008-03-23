# Copyright (C) 2005-2007, The Perl Foundation.
# $Id$

=head1 NAME

Parrot::Revision - SVN Revision

=head1 SYNOPSIS

    use Parrot::Revision;

    print $Parrot::Revision::current;

=head1 DESCRIPTION

Get parrot's current and configure time revision.

=cut

package Parrot::Revision;

use strict;
use warnings;
use File::Spec;

our $cache = q{.parrot_current_rev};

our $current = _get_revision();

sub _get_revision {
    my $revision;
    if (-f $cache and ! -f 'Makefile') {
        eval {
            open my $FH, "<", $cache;
            chomp($revision = <$FH>);
            close $FH;
        };
        return $revision unless $@;
    }

    $revision = _analyze_sandbox();

    if (! -f $cache and ! -f 'Makefile') {
        eval {
            open my $FH, ">", $cache;
            print $FH "$revision\n";
            close $FH;
        };
    }
    return $revision;
}

sub _analyze_sandbox {
    my $revision = 0;
    # code taken from pugs/util/version_h.pl rev 14410
    my $nul = File::Spec->devnull;
    if ( my @svn_info = qx/svn --xml info 2>$nul/ and $? == 0 ) {
        if ( my ($line) = grep /^\s*revision=/, @svn_info ) {
            ($revision) = $line =~ /(\d+)/;
        }
    }
    elsif ( -d '.git' && (my @git_info = qx/git log -1 --grep=^git-svn-id: 2>$nul/ and $? == 0) ) {
        ($revision) =
            $git_info[-1] =~ m[git-svn-id: https://svn.perl.org/parrot/trunk@(\d+) ];
    }
    elsif ( my @svk_info = qx/svk info 2>$nul/ and $? == 0 ) {
        if ( my ($line) = grep /(?:file|svn|https?)\b/, @svk_info ) {
            ($revision) = $line =~ / (\d+)$/;
        }
        elsif ( my ($source_line) = grep /^(Copied|Merged) From/, @svk_info ) {
            if ( my ($source_depot) = $source_line =~ /From: (.*?), Rev\. \d+/ ) {

                # convert /svk/trunk to //svk/trunk or /depot/svk/trunk
                my ($depot_root) = map { m{Depot Path: (/[^/]*)} } @svk_info;
                $depot_root ||= q{/};
                $source_depot = $depot_root . $source_depot;
                if ( my @svk_info = qx/svk info $source_depot/ and $? == 0 ) {
                    if ( my ($line) = grep /(?:file|svn|https?)\b/, @svk_info ) {
                        ($revision) = $line =~ / (\d+)$/;
                    }
                }
            }
        }
    }
    return $revision;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
