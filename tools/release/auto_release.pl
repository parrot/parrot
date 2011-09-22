#! perl

# Copyright (C) 2011, Parrot Foundation.

=head1 NAME

    tools/release/auto_release.pl - automates the release process

=head1 SYNOPSIS

    % perl tools/release/auto_release.pl [OPTION]... VERSION

=head1 DESCRIPTION

This script fully automates much of the process of packaging a release.

=head1 OPTIONS

=over 4

=item B<-v>, B<--version>=I<a.b.c>

Specifies the new release version. Must be a string of the form a.b.c (e.g.
3.8.0).

The release version passed to C<-v> always takes precedence over the one given
as C<VERSION> (if any).

=item B<-d>, B<--developer>

Builds a developer release. Cannot be used in conjunction with C<-s>.

Specifying the C<-d> switch is a bit redundant as C<auto_release.pl> builds a
developer release by default. It's merely provided for the sake of consistency.

=item B<-s>, B<--supported>

Builds a supported release. Cannot be used in conjunction with C<-d>.

=item B<-t>, B<--test-jobs>=I<n>

Represents the number of test harnesses to run simultaneously when the test
suite is being run. If given, it's value will override the one in the
C<$TEST_JOBS> environment variable.

If not given, it will default to 1 unless C<$TEST_JOBS> is defined; in which
case, C<$TEST_JOBS> will be used as a default.

Using the C<-t> switch (or C<$TEST_JOBS>) is strongly recommended as it can
significantly reduce the amount of time spent on running the test suite which
can take up to several minutes.

=back

=head1 HISTORY

* [2011-09-20] Initial version written by Kevin Polulak <kpolulak@gmail.com>

=head1 SEE ALSO

F<docs/project/release_manager_guide.pod>

=cut

use 5.008;
use strict;
use warnings;

use Getopt::Long;
use System::Command;

# TODO Add help switch (-h), consider using Pod::Usage
# TODO Be more verbose in perldoc
# TODO Migrate code from update_version.pl
# TODO Edit '== ==' strings so that newlines are on top and bottom

# Switches
my $version;          # Version number
my $developer;        # Developer release
my $supported;        # Supported release
my $test_jobs = 1;    # Number of parallel test harnesses

my $type;             # Developer or supported release

my $result = GetOptions('v|version=s'   => \$version,
                        'd|developer'   => \$developer,
                        's|supported'   => \$supported,
                        't|test_jobs=i' => \$test_jobs);

# Catch unrecognized switches
stop('Unrecognized option') unless $result;

# Determine whether to build a developer or supported release
set_release_type(\$developer, \$supported, \$type);

# Don't run without a release version
$version = shift unless defined $version;
stop('You must specify the release version') unless $version;

# Parse version number
stop('Release version must be of the form a.b.c (e.g. 3.8.0)')
    if $version !~ /(\d+)\.(\d+)\.(\d+)/;

# Prompt user to begin packaging release
while (1) {
    print "Begin building $version $type release? [y/n] ";

    my $answer = <>;

    chomp $answer;

    if ($answer eq 'y') {
        last;
    }
    elsif ($answer eq 'n') {
        exit 1;
    }
}

# Begin release process
get_recent_version();
check_local_commits();
build_old_version();
update_version($version);
distro_tests();

update_pbc_compat() unless $developer;

build_and_run_tests();
commit_changes();
prepare_tarball();
verify_new_version($version, $type);
tag_release($version);
push_to_ftp_server($version, $type);

##########################
# Subroutine definitions #
##########################

# Rebuilds Parrot and runs the full test suite
sub build_and_run_tests {
    print "== BUILDING NEW VERSION ==\n";

    system('make', 'realclean')              == 0 or stop();
    system('perl', 'Configure.pl', '--test') == 0 or stop();

    # XXX Use separate filehandles to redirect stderr/stdout to log file
    system('make', 'world', 'html') == 0 or stop();

    #_edit('make_world_html.log');

    print "== RUNNING FULL TEST SUITE ==\n";

    # XXX Use separate filehandles to redirect stderr/stdout to log file
    if (defined $ENV{'TEST_JOBS'}) {
        system('make', 'fulltest', $ENV{'TEST_JOBS'}) == 0 or stop();
    }
    else {
        system('make', 'fulltest', $test_jobs)        == 0 or stop();
    }

    #_edit('make_fulltest.log');
}

# Builds an old version of Parrot so that ops can be bootstrapped
sub build_old_version {
    print "== REBUILDING PARROT ==\n";

    system('perl', 'Configure.pl') == 0 or stop();
    system('make')                 == 0 or stop();
}

# Verifies that there aren't any uncommitted local changes
sub check_local_commits {
    my $ret = `git log origin/master..`;

    stop('Uncommitted local changes were found. '
       . 'Please push all changes before continuing') if $ret;
}

# Pushes changes to master branch
sub commit_changes {
    print "== PREPARING COMMIT ==\n";

    while (1) {
        print "Do you want to review the diff patch before pushing to master? "
            . "[y/n] ";

        my $answer = <>;

        chomp $answer;

        if ($answer eq 'y') {
            system('git', 'diff') == 0 or stop();
            last;
        }
        elsif ($answer eq 'n') {
            last;
        }
    }

    my $msg;

    # Set commit message
    print "Please enter the commit message (default: 'Released $version'): ";

    $msg = <>;

    chomp $msg;

    # XXX Should I use global $version or pass it as an argument?
    $msg = "Released $version" if length $msg == 0;

    print "== COMMITTING LOCAL CHANGES ==\n";

    system('git', 'commit', '-a', "-m $msg") == 0 or stop();

    # Get SHA-1 digest for commit
    open my $REV_PARSE, '-|', 'git rev-parse master' or stop();

    my $commit = <$REV_PARSE>;
    close $REV_PARSE;

    chomp $commit;
    $commit = substr $commit, 0, 7;

    while (1) {
        print "Do you want to review commit $commit? [y/n] ";

        my $answer = <>;

        chomp $answer;

        if ($answer eq 'y') {
            system('git', 'show') == 0 or stop();
            last;
        }
        elsif ($answer eq 'n') {
            last;
        }
    }

    print "== PUSHING COMMIT TO MASTER BRANCH ==\n";

    system('git', 'push', 'origin', 'master') == 0 or stop();
}

# Runs distribution tests
sub distro_tests {
    print "== RUNNING DISTRIBUTION TESTS ==\n";

    if (defined $ENV{'TEST_JOBS'}) {
        system('make', 'distro_tests', $ENV{'TEST_JOBS'}) == 0 or stop();
    }
    else {
        system('make', 'distro_tests', $test_jobs)        == 0 or stop();
    }
}

# Clones a local copy of 'master' branch
sub get_recent_version {
    print "== CLONING MOST RECENT VERSION OF MASTER ==\n";

    system('git', 'checkout', 'master')   == 0 or stop();
    system('git', 'pull',     '--rebase') == 0 or stop();
}

# Creates release tarball and verifies that it builds properly after extracting
sub prepare_tarball {
    # XXX Should this be `make reconfig` instead? If so, update guide
    system('perl', 'Configure.pl')  == 0 or stop();
    system('make', 'release_check') == 0 or stop();
}

# Opens an SSH connection parrot@ftp-osl.osuosl.org and copies tarball
sub push_to_ftp_server {
    my ($ver, $type) = @_;

    my $server       = 'parrot@ftp-osl.osuosl.org';
    my $remote_dir   = '~/ftp/releases';

    # Wait for user input so commands don't start running without permission
    while (1) {
        print "Do you want to push the tarballs to $server? [y/n] ";

        my $answer = <>;

        chomp $answer;

        if ($answer eq 'y') {
            last;
        }
        elsif ($answer eq 'n') {
            return;
        }
    }

    # Create tarball filenames (gzip and bzip2)
    my $sha256       = '.sha256';
    my $gz           = '.gz';
    my $bz2          = '.bz2';

    my $gz_tarball   = "parrot-$ver" . $gz;
    my $bz2_tarball  = "parrot-$ver" . $bz2;

    my $gz_sha256    = $gz_tarball   . $sha256;
    my $bz2_sha256   = $bz2_tarball  . $sha256;

    my $ssh;
    my $ssh_stdin;

    print "== CONNECTING TO OSUOSL FTP SERVER ==\n";

    # SSH into FTP server to create new directory for tarball
    $ssh       = System::Command->new('ssh', $server) or stop();
    $ssh_stdin = $ssh->stdin;

    # Wait for user to enter password
    sleep 6;

    # Determine pathname based on release type
    if ($type eq 'developer') {
        $remote_dir .= "/devel/$ver";
    }
    else {
        $remote_dir .= "/supported/$ver";
    }

    print $ssh_stdin "mkdir $remote_dir";

    $ssh->close;

    stop("Failed to login to $server") unless $ssh->exit == 0;

    my $scp;
    my $scp_files = "$gz_tarball $bz2_tarball $gz_sha256 $bz2_sha256";
    my $scp_dir   = "$server:$remote_dir";

    print "== COPYING TARBALLS TO OSUOSL FTP SERVER ==\n";

    # Copy tarballs into newly created directories on FTP server
    $scp = System::Command->new('scp', $scp_files, $scp_dir) or stop();
    $scp->close;

    stop("Failed to copy tarballs to $server") unless $scp->exit == 0;

    my $trigger;
    my $trigger_stdin;

    print "== PUSHING CHANGES TO OSUOSL FTP MIRRORS ==\n";

    # Run `trigger-parrot` to push changes to all FTP mirrors
    $trigger       = System::Command->('ssh', $server) or stop();
    $trigger_stdin = $trigger->stdin;

    sleep 6;

    print $trigger_stdin "~/trigger-parrot";

    $trigger->close;

    stop("Failed to push changes to FTP mirrors") unless $trigger->exit == 0;
}

# Determines the type of release: developer or supported
sub set_release_type {
    my ($dev, $supp, $type) = @_;

    # Fail if both -d and -s were given
    stop('You may not use both the -d and -s switches. '
       . 'Use one or the other') if $$dev and $$supp;

    # Set type to supported if -s was given
    if ($$supp) {
        $$type = "supported";

        return;
    }

    # Default to developer release if -d or -s weren't given
    if (!($$dev and $$supp)) {
        $$dev  = 1;
        $$type = "developer";
    }
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

# Adds a lightweight tag to the Git repository for the new release
sub tag_release {
    my $ver = shift;

    print "== TAGGING NEW RELEASE ==\n";

    # Transform version number so that it's of the form 'RELEASE_a_b_c'
    $ver = 'RELEASE_' . $ver;
    $ver =~ s/\./_/g;

    system('git', 'tag',  "$ver")   == 0 or stop();
    system('git', 'push', '--tags') == 0 or stop();
}

# Prompts user to edit PBC_COMPAT and regenerates bytecode
sub update_pbc_compat {
    _edit('PBC_COMPAT');

    print "== UPDATING PBC FILES ==\n";

    system('sh', 'tools/dev/mk_packfile_pbc') == 0 or stop();
    system('sh', 'tools/dev/mk_native_pbc')   == 0 or stop();
}

# Updates version-specific information in particular files
sub update_version {
    my $ver = shift;

    print "== UPDATING VERSION INFORMATION ==\n";

    system('perl', 'tools/release/update_version.pl', "$ver") == 0 or stop();

    _edit('docs/parrothist.pod');
    _edit('docs/project/release_manager_guide.pod');
    _edit('ChangeLog');
    _edit('tools/release/release.json');
    _edit('RESPONSIBLE_PARTIES');
    _edit('CREDITS');
}

sub verify_new_version {
    my ($ver, $type) = @_;

    print "== VERIFYING NEW VERSION ==\n";

    open my $PARROT, '-|', './parrot -V' or stop();

    my @output = <$PARROT>;

    close $PARROT;

    # XXX There has got to be a better way to do this
    if ($type eq 'developer') {
        # Avoid using regex in void context
        if ($output[0] ~~ /(?=This is Parrot version )\d+\.\d+\.\d+(?=-devel)/) { }

        stop("Version $ver could not be verified. Found $& instead") if $& ne $ver;
    }
    else {
        # Avoid using regex in void context
        if ($output[0] ~~ /(?=This is Parrot version )\d+\.\d+\.\d+/) { }

        stop("Version $ver could not be verified. Found $& instead") if $& ne $ver;
    }
}

#######################
# Private subroutines #
#######################

# Prompts the user to edit a file
sub _edit {
    my $doc = shift;

    while (1) {
        print "Do you want to edit $doc? [y/n] ";

        my $answer = <>;

        chomp $answer;

        # XXX Use an OS-dependent solution (with $^O) for the default editor
        if ($answer eq 'y') {
            if (defined $ENV{'EDITOR'}) {
                system("$ENV{'EDITOR'} $doc") == 0 or stop();
            }
            else {
                system("vim $doc")            == 0 or stop();
            }

            last;
        }
        elsif ($answer eq 'n') {
            last;
        }
    }
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
