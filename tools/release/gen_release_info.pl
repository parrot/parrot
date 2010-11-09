#! perl
# Copyright (C) 2008, Parrot Foundation.

use strict;
use warnings;

=head1 NAME

tools/release/gen_release_info.pl - generate release info for graphs and charts

=head1 DESCRIPTION

This utility generates release information from git in csv format,
suitable for graphs, charts, and reports.

=cut

##  create a release information data structure
my $r = {
    map { $_->{number} => $_ }
    map { m{^(RELEASE_)([0-9_]+)}
            ? {
                tag => "$1$2",
                number => sub{$a = shift; $a =~ y/_/./; $a }->($2),
            }
            : ()
        }
    qx  { git tag -l 'RELEASE_*' }
};

##  gather interesting release-related information from the tag
map {
    ##  ask git for info about the tag
    my $tag       = $r->{$_}{tag};
    my $commit_id = qx{ git rev-parse $tag };
    chomp $commit_id;
    my $info      = qx{ git show $commit_id --quiet --format="Author: %an%nCommit: %H%nDate: %ai" };

    ##  pull the interesting items
    $info =~ m{Author: (\S+)} and $r->{$_}{author} = $1;
    $info =~ m{Commit: (\S+)} and $r->{$_}{commit} = $1;
    $info =~ m{Date: (\S+)}   and $r->{$_}{date}   = $1;
} keys %{ $r };


##  output info in csv format
print
    map { "$_\n" }
    map { my $n = $_; join ',' =>
        map { $r->{$n}{$_} || '' }
        qw{ tag number author commit date  }
    }
    sort keys %$r;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
