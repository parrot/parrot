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

=item B<--docs>=[/path_to/previous/docs/]

The path to the directory which contains the previous documentation release.
Specifically, the 'docs/' directory of the previous release of parrot.

=item B<-h>, B<--help>

Displays this help message and exits.

=item B<-v>, B<--version>

Displays the version and copyright information and exits.

=back

=head1 LIMITATIONS

1. As written, this script will execute only on *nix (and related) systems.

2. You must execute this script from the parrot root directory, I<i.e.>,
'./parrot'; otherwise, it will fail.

=head1 NOTES

1. This script assumes you are the Release Manager, working on Section X of
the Release Manger Guide, and have, therefore, already cut the new Parrot
release.

2. You must use a fully qualified path for the '-d' option.

For example, if the path to the previous version of the documentation is
contained in F</home/user/git-work/parrot/docs/'>, you I<must> specify the
complete path to the 'docs/' directory and may not use "shell expansion" as
the name of your home directory, I<i.e.,> you may not use
C<~/git-work/parrot/docs/>. To do otherwise means the script will fail.

=head1 HISTORY

* [2012-03-21] Initial version written by Alvis Yardley <ac.yardley@gmail.com>

* [2012-07-13] Made the script more robust Alvis Yardley <ac.yardley@gmail.com>

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
my $help;             # Displays help message
my $version;          # Displays version and copyright information

my $result = GetOptions('docs=s'    => \$docs,
                        'h|help'    => \$help,
                        'v|version' => \$version);

my $repos;            # Path to where to store, temporarily, the repositories

# Catch unrecognized switches
pod2usage() unless $result;

# Display help message if '-h' was given
pod2usage(0) if $help;

# Display version and copyright information if '-v' was given
version() && exit(0) if $version;

# Get temporary directory defined in 'Parrot::Config::Generated.pm'
get_repo_directory();

# Get 'docs/' directory if not supplied
get_docs_directory() unless $docs;

# Test 'docs/' directory to ensure it's a valid 'docs/' directory.
tst_docs_directory();

# Get VERSION
open my $FH, '<', 'VERSION' or stop("Unable to open 'VERSION' file");
chomp($version = <$FH>);
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
delete_repos();
exit(0);

##########################
# Subroutine definitions #
##########################

# Get the temporary directory, contained in '%PConfig', in which to clone
# the repos
sub get_repo_directory {
    $repos = $PConfig{tempdir};
    if (!defined $repos) {
        print "\'\$PConfig{\'tempdir\'}\' is undefined. This variable must ",
          "be defined and defined with a readable and a writeable directory ",
            "to execute, successfuly, this script.\n";
        print "Did you, perhaps, fail to configure parrot?\n";
        exit(1);
    }

    $repos .= '/';

    # Test '$repo' directory to ensure we can read and write to it.
    my $tstfile   = $repos . 'parrot_github_release.out';
    my $outstring = "A simple test string: parrot_github_release.out";
    open my $OUT, '+>', $tstfile or
      stop("Unable to open file for output in $repos directory.");
    print $OUT $outstring;
    close $OUT or stop("Unable to close file in $repos directory");

    open my $IN, '<', $tstfile or
      stop("Unable to open file for input in $repos directory.");
    my $instring = <$IN>;
    close $IN or stop("Unable to close $tstfile");
    stop("Unable to read and to write to $repos directory")
      unless $instring eq $outstring;

    unlink $tstfile or warn "Unable to delete $tstfile: $!";
}

# Get 'docs/' directory
sub get_docs_directory {
    while (1) {
        print "Please specify the path to the previous documentation release? ";
        $docs = <>;
        chomp $docs;

        last if -d $docs;
    }

    $docs .= '/' if $docs =~ /[a-zA-Z0-9]$/;
}

# Test whether or not we actually have a valid 'docs/' directory.
sub tst_docs_directory {
    my $parrot_dir = getcwd();
    my $filename   = 'parrothist.pod'; # This one's likely to stick around.

    $docs .= '/' if $docs =~ /[a-zA-Z0-9]$/;
    chdir $docs;

    stop("Unable to access the $docs directory")
      unless (-f $filename && -s $filename);

    chdir $parrot_dir;
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

    print "\n== CHECKING OUT MASTER ==\n";
    system('git', 'checkout', 'master') == 0 or
      stop("Unable to switch to 'master'");

    print "\n== PUSHING 'PARROT-DOCSX' ==\n";
    system('git', 'push', 'origin', 'gh-pages') == 0 or
      stop("Unable to push updates to 'parrot-docsx'");

    chdir $parrot_dir;
}

# Update parrot.github.com with present release docs
sub update_parrot_github {
    my $parrot_github = $repos . 'parrot.github.com' . '/';
    chdir $parrot_github;

    my $tmp = $PConfig{tempdir};

    print "\n== SAVING KEY 'PARROT.GITHUB.COM' FILES ==\n";
    system('cp', "--target-directory=$tmp", 'README.md') == 0 or
      stop("Unable to save 'README.md'");
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
    system('cp', "$tmp/README.md", '.') == 0 or
      stop("Unable to restore 'README.md'");
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
    system('git', 'push', 'origin', 'master') == 0 or
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
      $minor . '.' . $patch . '</a></li>' . "\n";

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
