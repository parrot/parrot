#! perl
# Copyright (C) 2011, Parrot Foundation.

use strict;
use warnings;
use autodie qw/:all/;

=head1 NAME

tools/dev/merge_pull_request.pl - Merge Github Pull Requests

=head1 SYNOPSIS

  # merge pull request #123 into current branch
  $ perl tools/dev/merge_pull_request.pl 123
  # this creates the branch pull_request_123
  $ make test # etc...

  # If the pull request is ready to be merged to master
  $ git checkout master
  $ git merge --no-ff pull_request_123
  $ git push
  $ git branch -d pull_request_123

  # If working copy changed were stashed (the script will notify you)
  # pop those back off the stash
  $ git stash pop

=cut

my $num  = shift or die "Must give a pull request number to merge!";
my $repo = shift || 'parrot';

merge_pull_request($num, $repo);

sub merge_pull_request {
    my ($num) = @_;

    chomp( my $branch = qx{ git rev-parse --symbolic-full-name HEAD } );
    my $status = qx{ git status -u };
    system("git checkout -b pull_request_$num");

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
