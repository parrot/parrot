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

In short, this script automates the process in Section X of the Release
Manager Guide (F<docs/project/release_manager_guide.pod>) and outlined in the
Release Parrot Github Guide (F<docs/project/release_parrot_github_guide.pod>).

=head1 OPTIONS

=over 4

=item B<-d>, B<--docs-path>=I<[/path/to_previous/docs_release/]>

The path on your local file system in which to clone the 'parrot.github.com'
and the 'parrot-docsx' repositories.

=item B<-r>, B<--repo-path>=I<[/path/in_which/to_clone/the_repos/]>

The path on your local file system in which to clone the 'parrot.github.com'
and the 'parrot-docsx' repositories.

=item B<-h>, B<--help>

Displays this help message and exits.

=item B<-v>, B<--version>

Displays the version and copyright information and exits.

=back

=head1 NOTE

This script makes an important assumption: That you are the Release Manager,
working on Section X of the Release Manger Guide, and have, therefore, already
cut the new Parrot release.

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
use File::Spec;
use System::Command;

# Switches
my $help;             # Displays help message
my $version;          # Displays version and copyright information
my $docs_path;        # Path to the previous docs release
my $repo_path;        # Path in which to clone the repos

my $result = GetOptions('h|help'        => \$help,
			'v|version'     => \$version,
			'd|docs-path=s' => \$docs_path,
			'r|repo-path=s' => \$repo_path);

# Catch unrecognized switches
pod2usage() unless $result;

# Display help message if '-h' was given
pod2usage(0) if $help;

# Display version and copyright information if '-v' was given
version() && exit(0) if $version;

# Get 'docs/' directory if not supplied
get_docs_directory() unless $docs_path;

# Get the directory in which to clone the repos if not supplied
get_repo_directory() unless $repo_path;

# Get VERSION
open my $VERSION, "<VERSION" or stop("I'm unable to open the 'VERSION' file");
$version = <$VERSION>;
close $VERSION;

# Parse version number
my ($major, $minor, $patch) = ($1, $2, $3) if $version =~ /^(\d+)\.(\d+)\.(\d+)$/;
stop("There is some (unkonw) problem with the major or the minor release numbers")
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
my $parrot_dir = File::Spec->curdir();

# Begin release process
# get_parrot_github();
# get_parrot_docsx();
archive_parrot_docsx();

##########################
# Subroutine definitions #
##########################

# Get 'docs/' directory
sub get_docs_directory {
    while (1) {
	print "What is the path to the previous documentation release? ",
	  "(e.g.,[/home/[user]/path_to_docs/]) ";
	$docs_path = <>;
	chomp $docs_path;

	last if -d $docs_path;
    }
}

# Get the directory in which to clone the repos
sub get_repo_directory {
    while (1) {
	print "What is the path in which to clone the 'parrot.github.com' ",
	  "and the 'parrot-docsx' repositories? ",
	  "(e.g.,[/home/[user]/path_to_clone/]) ";
	$repo_path = <>;
	chomp $repo_path;

	last if -d $repo_path;
    }
}

# Clone a local copy of 'master' branch of 'parrot.github.com'
sub get_parrot_github {
    chdir $repo_path;

    print "\n== CLONING 'PARROT.GITHUB.COM' ==\n";
    system('git', 'clone', 'git@github.com:parrot/parrot.github.com.git') == 0
      or stop();

    chdir $parrot_dir;
}

# Clone a local copy of 'master' branch of 'parrot.github.com'
sub get_parrot_docsx {
    my $parrot_docsx = 'git@github.com:parrot/parrot-docs' . $major . '.git';
    chdir $repo_path;

    print "\n== CLONING 'PARROT-DOCSX' ==\n";
    system('git', 'clone', $parrot_docsx) == 0 or
      stop("Please ensure the correct 'parrot-docsx' repo exists");

    chdir $parrot_dir;
}

# Archive the 'parrot-docsx' repository
sub archive_parrot_docsx {
    my $parrot_docsx = $repo_path . 'parrot-docs' . $major . '/';
    chdir $parrot_docsx;

    print "\n== CHECKING OUT GH-PAGES BRANCH ==\n";
    system('git', 'checkout', 'gh-pages') == 0 or
      stop("Unable to switch to the 'gh-pages' branch");

    my $previous = $major . '.' . $minor . '.' . $patch;
    my $copy_to = $parrot_docsx . $previous . '/';

    print "\n== MAKING NEW DIRECTORY  ==\n";
    system('mkdir', "$previous") or stop("Unable to make new directory");

    my $copy_from = $docs_path . '*';

    print "\n== COPYING DOCS TO PARROT-DOCSX ==\n";
    system('cp', '-r', "$copy_from", "$copy_to") or
      stop("Unable to copy 'docs/'");

    print "\n== PUSHING PARROT-DOCSX ==\n";
#   system('git', 'push', 'origin master') or
#     stop("Unable to push parrot-docx master");

    chdir $parrot_dir;
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

#######################
# Private subroutines #
#######################

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
