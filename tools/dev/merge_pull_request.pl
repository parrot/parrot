#! perl
# Copyright (C) 2011, Parrot Foundation.

use strict;
use warnings;
use autodie qw/:all/;

=head1 NAME

tools/dev/merge_pull_request.pl - Merge Github Pull Requests

=head1 SYNOPSIS


Here is a typical workflow to merge a pull request into parrot.git

  # merge pull request #123 into current branch
  perl tools/dev/merge_pull_request.pl 123
  # this creates the branch pull_request_123
  make test # etc...

If the pull request has lots of extraneous commits, you may want
to "squash" them into one commit. If you want to squash the last
five commits:

  git rebase -i HEAD~5

This will open up your editor. Follow the instructions for squashing commits
together.

  # If the pull request is ready to be merged to master
  git checkout master
  git merge --no-ff pull_request_123
  git push
  git branch -d pull_request_123

  # If working copy changed were stashed (the script will notify you)
  # pop those back off the stash
  git stash pop

This script can be used to merge a pull request for any repo in the
Parrot Github Organization. For instance, to merge Cardinal Pull
request #4:

 perl $PARROT/tools/dev/merge_pull_request.pl 4 cardinal

If you do not want the default branch name, you can specify a third
argument to specify one:

 perl $PARROT/tools/dev/merge_pull_request.pl 4 cardinal awesome_feature

This will merge pull request #4 in the cardinal repo into a branch
called 'awesome_feature'.

=cut

my $num          = shift or die "Must give a pull request number to merge!";
my $repo         = shift || 'parrot';
my $merge_branch = shift;

merge_pull_request($num, $repo, $merge_branch);

sub merge_pull_request {
    my ($num, $repo, $merge_branch) = @_;
    $merge_branch ||= "pull_request_$num";

    chomp( my $branch = qx{ git rev-parse --symbolic-full-name HEAD } );
    my $status = qx{ git status -u };

    system("git checkout -b $merge_branch");

    my $stashed = stash_if_necessary($repo, $status);
    system("wget --no-check-certificate https://github.com/parrot/$repo/pull/$num.patch");
    system("git am --signoff $num.patch");
}

sub stash_if_necessary {
    my ($repo, $status) = @_;
    unless ($status =~ m/(nothing to commit|nothing added to commit)/) {
        print "Stashing work in $repo\n";
        system("git stash");
        return 1;
    }
    else {
        print  "Nothing to stash in $repo\n";
        return 0;
    }
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
