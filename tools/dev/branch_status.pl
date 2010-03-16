#! perl
# $Id$
# Copyright (C) 2009, Parrot Foundation.

=head1 NAME

tools/dev/branch_status.pl

=head1 DESCRIPTION

Generate a report to help developers determine status of repository branches.

Defaults to generating wiki-friendly output. Override to human readable
output with C<-H>.

This program uses modules that are not intended to be parrot requirements.

Assumes that you have a command line svn in your path, but doesn't have
to be run in a working copy.

=cut

use v5.10.0;
use strict;
use warnings;

use Perl6::Form;
use Time::Format qw(%time);
use XML::Twig;

my $human;
$human = 1 if @ARGV && $ARGV[0] eq '-H';

my $time_format = 'dd Mon yyyy - hh:mm:ss';

my $repo = 'https://svn.parrot.org/parrot/';

my @branches = map {chomp; chop; $_} `svn ls $repo/branches`;

if (!$human) {
    print '||';
    say join ('||', map { "'''$_'''" } qw (
        Branch Revisions Creator Authors Created
        Updated Components Commits LastMergeRev
    ));
} 


foreach my $branch (@branches) {
    my $t = XML::Twig->new();
    my $xml = `svn log --stop-on-copy --xml -v $repo/branches/$branch`;
    $t->parse($xml);

    my $newest = $t->root->first_child('logentry');
    my $oldest = $t->root->last_child('logentry');
    my $creator = $oldest->first_child('author')->xml_text;

    my (%authors, %components, $merge_log, $merge_rev, $author_txt);

    foreach my $entry ($t->root->children('logentry')) {
        $authors{$entry->first_child('author')->xml_text}++;
        my $msg = $entry->first_child('msg')->xml_text;
        $msg =~ s/\s+$//;
        $msg =~ s/^\s+//;
        if (!defined($merge_log) && $msg =~ /merge/i) {
            $merge_log = $msg;
            $merge_rev = 'r' . $entry->atts->{revision};
        }
        while ($msg =~ m/\[(.+?)\]/g) {
            my $component = $1;
            $component =~ s/\s+$//;
            $component =~ s/^\s+//;
            if ($component ne '') {
                $components{$1} = undef;
                }
        }
    }
    $merge_log //= 'N/A';
    $merge_rev //= 'N/A';

    my $first = $oldest->atts->{revision};
    my $last  = $newest->atts->{revision};

    my $revisions_human = "r$first:$last";
    my $revisions_wiki  = "r$first-r$last";

    my $created_date = $oldest->first_child('date')->xml_text;
    $created_date =~ s/Z//; # workaround Time::Format bug
    $created_date = $time{$time_format, $created_date};
    my $updated_date = $newest->first_child('date')->xml_text;
    $updated_date =~ s/Z//; # workaround Time::Format bug
    $updated_date = $time{$time_format, $updated_date};

    if (scalar keys %authors != 1) {
        my @counts;
        foreach my $author (sort {$authors{$b} <=> $authors{$a}} keys %authors) {
            push @counts, $author . "($authors{$author})";
        }
        $author_txt = join ($human ? ', ' : '[[BR]]', @counts);
    }
    $author_txt //='';
    my $components = join (', ', sort {lc $a cmp lc $b} keys %components);
    my $number_commits = scalar $t->root->children('logentry');
    my $initial_log = $oldest->first_child('msg')->xml_text;
    $initial_log =~ s/\s+$//;
    $initial_log =~ s/^\s+//;
    $merge_log =~ s/\n/ /g;
    $initial_log =~ s/\n/ /g;

    if ($human) {
        print form
'+====================================================================+',
'|        branch: {<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<} |',
                  $branch,
'|     revisions: {<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<} |',
                  $revisions_human,
'|       creator: {<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<} |',
                  $creator,
($author_txt ne '') ?
(
'|       authors: {<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<} |',
                  $author_txt,
): (),
'|    created on: {<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<} |',
                  $created_date,
'|    updated on: {<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<} |',
                  $updated_date,
'|    components: {<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<} |',
                  $components,
'|  # of commits: {<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<} |',
                  $number_commits,
{bullet => 'initial log:'},
'|   initial log: {[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[} |',
                  $initial_log,
{bullet => 'last merge log:'},
'|last merge log: {[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[} |',
                  $merge_log;
    }
    else {
        say join('||','',
            "[source:/branches/$branch $branch]", $revisions_wiki, $creator,
            $author_txt, $created_date, $updated_date, $components,
            "[log:/branches/$branch $number_commits]", $merge_rev
        );
    }
}

say '+', '=' x 68, '+' if $human;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
