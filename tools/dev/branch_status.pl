#! perl
# $Id$
# Copyright (C) 2009, Parrot Foundation.

=head1 branch_status

Generate a report to help developers determine status of repository branches.

=cut

use v5.10.0;
use strict;
use warnings;

use XML::Twig;
use Perl6::Form;

my $repo = 'https://svn.parrot.org/parrot/';

my @branches = map {chomp; chop; $_} `svn ls $repo/branches`;

foreach my $branch (@branches) {
    my $t = XML::Twig->new();
    my $xml = `svn log --stop-on-copy --xml -v $repo/branches/$branch`;
    $t->parse($xml);

    my $newest = $t->root->first_child('logentry');
    my $oldest = $t->root->last_child('logentry');
    my $creator = $oldest->first_child('author')->xml_text;

    my (%authors,%components);
    my $merge_log;
    foreach my $entry ($t->root->children('logentry')) {
            $authors{$entry->first_child('author')->xml_text}++;
            my $msg = $entry->first_child('msg')->xml_text;
            $msg =~ s/\s+$//;
            $msg =~ s/^\s+//;
            if (!defined($merge_log) && $msg =~ /merge/i) {
                    $merge_log = $msg;
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

    my $revisions =  'r' .$oldest->atts->{revision} . ':' .
        $newest->atts->{revision};
    my $created_date = $oldest->first_child('date')->xml_text;
    my $updated_date = $newest->first_child('date')->xml_text;
    my $author_txt;
    if (scalar keys %authors == 1) {
         $author_txt = $creator;
    }
    else {
        my @counts;
        foreach my $author (sort {$authors{$b} <=> $authors{$a}} keys %authors) {
            push @counts, "$author [$authors{$author}]";
        }
        $author_txt = join (', ', @counts);
    }
    my $components = join (', ', sort {lc $a cmp lc $b} keys %components);
    my $number_commits = scalar $t->root->children('logentry');
    my $initial_log = $oldest->first_child('msg')->xml_text;
    $initial_log =~ s/\s+$//;
    $initial_log =~ s/^\s+//;
    $merge_log =~ s/\n/ /g;
    $initial_log =~ s/\n/ /g;


    print form
'+====================================================================+',
'|        branch: {<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<} |',
                  $branch,
'|     revisions: {<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<} |',
                  $revisions,
'|       creator: {<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<} |',
                  $creator,
'|       authors: {<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<} |',
                  $author_txt,
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

say '+', '=' x 68, '+';

__END__

=head1 Notes

This program uses modules that are not intended to be parrot requirements.

Assumes that you have a command line svn in your path, but doesn't have
to be run in a working copy.

=cut
