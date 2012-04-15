#! perl

# Copyright (C) 2012, Parrot Foundation.

=head1 NAME

tools/release/parrot_github_release.pl - automates the 'parrot.github.com'
release process

=head1 SYNOPSIS

    $ perl tools/release/parrot_github_release.pl [OPTIONS]

=head1 DESCRIPTION

This script automates the packaging of the 'parrot.github.com' repository and
the archiving of the previous documentation release into the appropriate
'parrot-docsx' repository.

In short, this script automates Section X of the Release Manager Guide
(F<docs/project/release_manager_guide.pod>) as outlined in the Release Parrot
Github Guide (F<docs/project/release_parrot_github_guide.pod>).

=head1 OPTIONS

=over 4

=item B<-d>, B<--docs>=[/path_to/previous/docs/]

The path to the directory which contains the previous documentation release.
Specifically, the 'docs/' directory of the previous release of parrot.

=item B<-r>, B<--repos>=[/path_to/clone/repos/]

The path on your local file system in which to clone the 'parrot.github.com'
and the 'parrot-docsx' repositories.

=item B<--delete>

The default is to retain both the 'parrot.github.com' and the 'parrot-docsx'
repositories. This option deletes the repositories after pushing the updates.

=item B<-h>, B<--help>

Displays this help message and exits.

=item B<-v>, B<--version>

Displays the version and copyright information and exits.

=back

=head1 QUERY SYSTEM

If you do not apply the above options on the command-line, the script will
invoke a rather minimal query system with which to obtain the necessary
information.

=head1 LIMITATIONS

This script is limited to *nix (and related) systems.

=head1 NOTES

1. This script assumes you are the Release Manager, working on Section X of
the Release Manger Guide, and have, therefore, already cut the new Parrot
release.

2. You must use fully qualified paths for both the '-d' and the '-r' options.
This is true for the query system as well.

=head1 HISTORY

* [2012-03-21] Initial version written by Alvis Yardley <ac.yardley@gmail.com>

=head1 SEE ALSO

F<docs/project/release_manager_guide.pod>

F<docs/project/release_parrot_github_guide.pod>

=cut

use strict;
use warnings;

use Getopt::Long;
use Pod::Usage;
use System::Command;
use lib qw( ./lib );
use Parrot::Config;
use Cwd;

# Switches
my $docs;             # Path to the previous docs release
my $repos;            # Path in which to clone the repos
my $delete;           # Delete the repos
my $help;             # Displays help message
my $version;          # Displays version and copyright information

my $result = GetOptions('d|docs=s'  => \$docs,
                        'r|repos=s' => \$repos,
                        'delete'    => \$delete,
                        'h|help'    => \$help,
                        'v|version' => \$version);

# Catch unrecognized switches
pod2usage() unless $result;

# Display help message if '-h' was given
pod2usage(0) if $help;

# Display version and copyright information if '-v' was given
version() && exit(0) if $version;

# Explanatory display if the options are left unspecified
query_system() unless $docs and $repos and $delete;

# Get 'docs/' directory if not supplied
get_docs_directory() unless $docs;

# Get the directory in which to clone the repos if not supplied
get_repo_directory() unless $repos;

# Get VERSION
open my $FH, '<', 'VERSION' or stop("Unable to open 'VERSION' file");
$version = <$FH>;
close $FH;

# Parse version number
my ($major, $minor, $patch); # Quiet perlcritic
($major, $minor, $patch) = ($1, $2, $3) if $version =~ /^(\d+)\.(\d+)\.(\d+)$/;
stop("There is some problem with the major or the minor release numbers")
  unless $major and $minor;

# Set to the previous release version
if ($minor == 0) {
    $minor = 11;
    $major -= 1;
}
else {
    $minor -= 1;
}

# Get the current working directory
my $parrot_dir = getcwd();

# Release process
get_parrot_github();
get_parrot_docsx();
archive_parrot_docsx();
update_parrot_github();
delete_repos() if $delete;
exit(0);

##########################
# Subroutine definitions #
##########################

# Minimal query system
sub query_system {
    my $questions;
    if ((!defined $docs and !defined $repos) or
        (!defined $docs and  defined $repos) or
        ( defined $docs and !defined $repos)) {
        $questions = "a couple of questions";
    }
    else {
        $questions = "a question";
    }

    print "\nHello. I am the parrot_github_release.pl script. Because you ",
      "didn't employ all of the command line options, I need to ask you ",
      "$questions.\n\n";
}

# Get 'docs/' directory
sub get_docs_directory {
    while (1) {
        print "What is the path to the previous documentation release? ";
        $docs = <>;
        chomp $docs;

        last if -d $docs;
    }

    $docs .= '/' if $docs =~ /[a-zA-Z0-9]$/;
}

# Get the directory in which to clone the repos
sub get_repo_directory {
    while (1) {
        print "What is the path in which to clone the 'parrot.github.com' ",
          "and the 'parrot-docsx' repositories? ";
        $repos = <>;
        chomp $repos;

        last if -d $repos;
    }

    $repos .= '/' if $repos =~ /[a-zA-Z0-9]$/;
}

# Clone a local copy of 'parrot.github.com'
sub get_parrot_github {
    chdir $repos;

    print "\n== CLONING 'PARROT.GITHUB.COM' ==\n";
    system('git', 'clone', 'git@github.com:parrot/parrot.github.com.git') == 0
      or stop("Unable to clone 'parrot.github.com'");

    chdir $parrot_dir;
}

# Clone a local copy of 'parrot-docsx'
sub get_parrot_docsx {
    my $parrot_docsx = 'git@github.com:parrot/parrot-docs' . $major . '.git';
    chdir $repos;

    print "\n== CLONING 'PARROT-DOCSX' ==\n";
    system('git', 'clone', $parrot_docsx) == 0 or
      stop("Unable to clone the appropriate 'parrot-docsx' repo.");

    chdir $parrot_dir;
}

# Archive the previous documentation release to the 'parrot-docsx' repository
sub archive_parrot_docsx {
    my $parrot_docsx = $repos . 'parrot-docs' . $major . '/';
    chdir $parrot_docsx;

    print "\n== CHECKING OUT GH-PAGES BRANCH ==\n";
    system('git', 'checkout', 'gh-pages') == 0 or
      stop("Unable to switch to the 'gh-pages' branch");

    my $previous  = $major . '.' . $minor . '.' . $patch;
    my $copy_to   = $parrot_docsx . $previous . '/';
    my $copy_from = $docs . '*';

    print "\n== MAKING NEW DIRECTORY IN 'PARROT-DOCSX'  ==\n";
    mkdir($copy_to) or stop("Unable to make new directory in 'parrot-docsx'");

    print "\n== COPYING DOCS TO 'PARROT-DOCSX' ==\n";
    # Use shell globbing, for convenience.  (Should I rewrite this?)
    system("cp -r --target-directory=$copy_to $copy_from") == 0 or
      stop("Unable to copy 'docs/' to 'parrot-docsx'");

    print "\n== GIT ADD ('PARROT-DOCSX') ==\n";
    system('git', 'add', '.') == 0 or
      stop("Unable to add to 'parrot-docsx'");

    print "\n== GIT COMMIT ('PARROT-DOCSX') ==\n";
    system('git', 'commit', '-m', "'Archiving documentation release'") == 0 or
      stop("Unable to commit to 'parrot-docsx'");

    print "\n== PUSHING 'PARROT-DOCSX' ==\n";
    system('git', 'push', 'origin gh-pages') == 0 or
      stop("Unable to push updates to 'parrot-docsx' master");

    chdir $parrot_dir;
}

# Update parrot.github.com with present release docs
sub update_parrot_github {
    my $parrot_github = $repos . 'parrot.github.com' . '/';
    chdir $parrot_github;

    my $tmp = $PConfig{tempdir};

    print "\n== SAVING KEY 'PARROT.GITHUB.COM' FILES ==\n";
    system('cp', "--target-directory=$tmp", 'README.pod') == 0 or
      stop("Unable to save 'README.pod'");
    system('cp', "--target-directory=$tmp", 'index.html') == 0 or
      stop("Unable to save 'index.html'");
    system('cp', "--target-directory=$tmp", 'releases.html') == 0 or
      stop("Unable to save 'releases.html'");

    print "\n== GIT RM ('PARROT.GITHUB.COM') ==\n";
    system('git', 'rm', '-rf', '*') == 0 or
      stop("Unable to remove files from 'parrot.github.com'");

    print "\n== GIT ADD ('PARROT.GITHUB.COM') ==\n";
    system('git', 'add', '-A') == 0 or
      stop("Unable to add to 'parrot.github.com'");

    print "\n== GIT COMMIT ('PARROT.GITHUB.COM') ==\n";
    system('git', 'commit', '-m', "'Removed files from 'parrot.github.com'") == 0 or
      stop("Unable to commit to 'parrot.github.com'");

    print "\n== RESTORING KEY 'PARROT.GITHUB.COM' FILES ==\n";
    system('cp', "$tmp/README.pod", '.') == 0 or
      stop("Unable to restore 'README.pod'");
    system('cp', "$tmp/index.html", '.') == 0 or
      stop("Unable to restore 'index.html'");
     system('cp', "$tmp/releases.html", '.') == 0 or
      stop("Unable to restore 'releases.html'");

    update_index_html();
    update_releases_html();

    my $parrot_docs = $parrot_dir . '/' . 'docs/*';
    print "\n== COPYING 'DOCS/' TO 'PARROT.GITHUB.COM' ==\n";
    # Here I am, relying on the shell, again. <sigh>
    system("cp -r $parrot_docs .") == 0 or
      stop("Unable to copy 'docs/' to 'parrot.github.com'");

    print "\n== GIT ADD ('PARROT.GITHUB.COM') ==\n";
    system('git', 'add', '.') == 0 or
      stop("Unable to add to 'parrot.github.com'");

    print "\n== GIT COMMIT ('PARROT.GITHUB.COM') ==\n";
    system('git', 'commit', '-m', "'Updated 'parrot.github.com'") == 0 or
      stop("Unable to commit to 'parrot.github.com'");

    print "\n== PUSHING ('PARROT.GITHUB.COM') ==\n";
    system('git', 'push', 'origin master') == 0 or
      stop("Unable to push updates to 'parrot.github.com' master");

    chdir $parrot_dir;
}

# Update the link to 'Parrot Documentation Releases' in 'index.html'
sub update_index_html {
    my $buffer = '';
    open my $FH, '+<', 'index.html' or stop("Unable to open 'index.html'");
    while (<$FH>) {
        s/$1/$version/ if /Parrot ($major\.$minor\.$patch)-devel - Home/;
        s/$1/$version/ if /Parrot version ($major\.$minor\.$patch)-devel/;
        s/$1/$major\.$minor\.$patch/
          if /Parrot Documentation Releases \((\d.\d.\d) - 0.1.1\)/;
        $buffer .= $_;
    }
    seek($FH, 0, 0)          or stop("Unable to seek start of 'index.html'");
    print $FH $buffer        or stop("Unable to print out 'index.html'");
    truncate($FH, tell($FH)) or stop("Unable to truncate 'index.html'");
    close $FH                or stop("Unable to close 'index.html'");
}

# Update 'releases.html' to point to the newly archived documents in
# 'parrot-docsx'
sub update_releases_html {
    my $buffer = '';
    my $ul = '<ul>';
    my $li = '<li><a href="./parrot-docs' . $major . '/' . $major . '.' .
      $minor . '.' . $patch . '/html/index.html">Release ' . $major . '.' .
      $minor . '.' . $patch . '</a></li>';

    open my $FH, '+<', 'releases.html' or stop("Unable to open 'releases.html'");
    while (<$FH>) {
        s/$1/$version/ if /Parrot ($major\.$minor\.$patch)-devel - Home/;
        s/$1/$version/ if /Parrot version ($major\.$minor\.$patch)-devel/;
        if (/<ul>/) {
            $buffer .= $_;
            $buffer .= $li;
            next; # So we don't duplicate the '<ul>' tag.
        }
        $buffer .= $_;
    }
    seek($FH, 0, 0)          or stop("Unable to seek to start of 'releases.html'");
    print $FH $buffer        or stop("Unable to print out 'releases.html'");
    truncate($FH, tell($FH)) or stop("Unable to truncate 'releases.html'");
    close $FH                or stop("Unable to close 'releases.html'");
}

# Delete the downloaded repositories
sub delete_repos {
    my $parrot_docsx = $repos . 'parrot-docs' . $major . '/';
    my $parrot_github = $repos . 'parrot.github.com' . '/';

    print "\n== DELETING PARROT-DOCSX ==\n";
    system('rm', '-rf', $parrot_docsx) == 0 or
      stop("Unable to delete the 'parrot-docsx' repo");

    print "\n== DELETING PARROT.GITHUB.COM ==\n";
    system('rm', '-rf', $parrot_github) == 0 or
      stop("Unable to delete the 'parrot.github.com' repo");
}

# Customized version of die() for more consistent diagnostics
sub stop {
    if (@_ == 0) {
        print '[FATAL ERROR] ';

        if ($!) {
            print $!;
        }
        else {
            print 'An unrecoverable error has occurred';
        }
    }
    else {
        my $msg = shift;
        print "[ERROR] $msg";

        if ($!) {
            print ": $!";
        }
    }

    print "!\n";

    exit 1;
}

sub version {
    (my $version = <<VERSION_END) =~ s/^\S+//gm;
  This is parrot_github_release.pl, v1.0

  Copyright (C) 2001-2012, Parrot Foundation.

VERSION_END
    print "\n$version";
}

###################
# Signal handlers #
###################

$SIG{'INT'} = sub { stop('SIGINT received. Stopping') };

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
