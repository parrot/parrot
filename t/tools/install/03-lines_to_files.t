#! perl
# Copyright (C) 2007, Parrot Foundation.
# 03-lines_to_files.t

use strict;
use warnings;

use Test::More tests =>  8;
use Carp;
use Cwd;
use File::Copy;
use File::Temp qw( tempdir );
use lib qw( lib );
use Parrot::Install qw(
    install_files
    create_directories
    lines_to_files
);
use IO::CaptureOutput qw( capture );

my $cwd = cwd();
my $testsourcedir = qq{$cwd/t/tools/install/testlib};

my $parrotdir = q{};

my %metatransforms = (
    doc => {
        optiondir => 'doc',
        transform => sub {
            my($dest) = @_;
            # resources go in the top level of docs
            $dest =~ s/^docs\/resources/resources/;
            # other docs are actually raw Pod
            $dest =~ s/^docs/pod/;
            $parrotdir, $dest;
        },
    },
    '.*' => {
        optiondir => 'foo',
        transform => sub {
            return($_[0]);
        }
    }
);
my(@transformorder) = ('doc', '.*');

my %badmetatransforms = (
    doc => {
        optiondir => 'doc',
        transform => sub {
            my($dest) = @_;
            $dest =~ s/^docs\/resources/resources/; # resources go in the top level of docs
            $dest =~ s/^docs/pod/; # other docs are actually raw Pod
            $parrotdir, $dest;
        },
    },
    '.*' => {
        optiondir => 'foo',
        transform => sub {
            return(@_);
        }
    }
);

my @manifests = qw(MANIFEST MANIFEST.generated);
my %options = (
    packages => 'main',
);

my ($files_ref, $directories_ref, %badtransformorder);

eval {
    ($files_ref, $directories_ref) =
        lines_to_files(
            \%metatransforms,
            \@transformorder,
            {},
            \%options,
            $parrotdir,
        );
};
like($@, qr/Manifests must be listed in an array reference/,
    "Correctly detected lack of array ref as 3rd argument"
);

eval {
    ($files_ref, $directories_ref) =
        lines_to_files(
            \%metatransforms,
            \@transformorder,
            [],
            \%options,
            $parrotdir,
        );
};
like($@, qr/No manifests specified/,
    "Correctly detected lack of manifest files"
);

eval {
    ($files_ref, $directories_ref) =
        lines_to_files(
            \%metatransforms,
            \%badtransformorder,
            [ qw( MANIFEST MANIFEST.generated ) ],
            \%options,
            $parrotdir,
        );
};
like($@, qr/Transform order should be an array of keys/,
    "Correctly detected incorrect type for transform order"
);

{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or die "Unable to change to testing directory: $!";
    copy qq{$testsourcedir/manifest_pseudo} => qq{$tdir/MANIFEST}
        or die "Unable to copy file to tempdir for testing:  $!";
    copy qq{$testsourcedir/generated_pseudo} => qq{$tdir/MANIFEST.generated}
        or die "Unable to copy file to tempdir for testing:  $!";

    my ($stdout, $stderr);
    eval {
        ($files_ref, $directories_ref) =
            lines_to_files(
                \%badmetatransforms,
                \@transformorder,
                [ qw( MANIFEST MANIFEST.generated ) ],
                \%options,
                $parrotdir,
            );
    };
    like($@, qr/transform didn't return a hash for key/,
        "Correctly detected transform with a bad return value"
    );

    chdir $cwd or die "Unable to return to starting directory: $!";
}

{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or die "Unable to change to testing directory: $!";
    copy qq{$testsourcedir/manifest_pseudo} => qq{$tdir/MANIFEST}
        or die "Unable to copy file to tempdir for testing:  $!";
    copy qq{$testsourcedir/generated_pseudo_with_dupe} => qq{$tdir/MANIFEST.generated}
        or die "Unable to copy file to tempdir for testing:  $!";

    my ($stdout, $stderr);
    eval {
        capture(
            sub {
                ($files_ref, $directories_ref) =
                    lines_to_files(
                        \%metatransforms,
                        \@transformorder,
                        [ qw( MANIFEST MANIFEST.generated ) ],
                        \%options,
                        $parrotdir,
                    );
            },
            \$stdout,
            \$stderr,
        );
    };
    like($stderr, qr/MANIFEST\.generated:\d+:\s+Duplicate entry/,
        "Detected duplicate entries in one or more manifest files" );
    is( scalar(grep { $_->{Installable} } @$files_ref), 0,
        "No installable executables in this test" );

    chdir $cwd or die "Unable to return to starting directory: $!";
}

{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or die "Unable to change to testing directory: $!";
    my $defective_man = q{MANIFEST.1defective};
    copy qq{$testsourcedir/$defective_man} => qq{$tdir/MANIFEST}
        or die "Unable to copy file to tempdir for testing:  $!";

    eval {
        ($files_ref, $directories_ref) =
            lines_to_files(
                \%metatransforms,
                \@transformorder,
                [ q{MANIFEST} ],
                \%options,
                $parrotdir,
            );
    };
    like($@, qr/Malformed line in MANIFEST: ChangeLog/,
        "Got expected error message with defective manifest" );

    chdir $cwd or die "Unable to return to starting directory: $!";
}


pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

03-lines_to_files.t - test subroutines exported by C<Parrot::Install>

=head1 SYNOPSIS

    % prove t/tools/install/03-lines_to_files.t

=head1 DESCRIPTION

The files in this directory test functionality used by the scripts
F<tools/dev/install_files.pl>, F<tools/dev/install_doc_files.pl> and F<tools/dev/install_dev_files.pl>
and are exported by F<lib/Parrot/Install.pm>.

=head1 AUTHOR

James E Keenan and Timothy S Nelson

=head1 SEE ALSO

Parrot::Install, F<tools/dev/install_files.pl>, F<tools/dev/install_dev_files.pl>

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

__END__

# Can't safely run lines_to_files() more than once in a program until it's been fixed,
# and we can't fix it until its tested, so I've commented most of these out until we've
# fixed lines_to_files() not to use @ARGV



## In the code below:
## - othertransforms needs to be merged into metatransforms
## - transformorder needs to be added
## - $installable_exe needs to be removed

#{
#    my($metatransforms, $transformorder, $manifests, $options, $parrotdir,
#        $files, $installable_exe, $directories);
#
#    # First lines_to_files test
##    eval { lines_to_files(); };
##    $@ or die "lines_to_files didn't die with no parameters\n";
##    ok($@ =~ /^.manifests must be an array reference$/, 'lines_to_files dies with bad parameters');
#
#    # Second lines_to_files test
##    eval { lines_to_files(
##        $metatransforms, $transformorder,
##        [qw(MANIFEST MANIFEST.generated)],
##        $options, $parrotdir
##    ); };
##    ok($@ =~ /^Unknown install location in MANIFEST for file/, 'fails for install locations not specified in transforms');
#
#    # Third lines_to_files test
#    $metatransforms = {
#        doc => {
#            optiondir => 'doc',
#            transform => sub {
#                my($dest) = @_;
#                $dest =~ s/^docs\/resources/resources/; # resources go in the top level of docs
#                $dest =~ s/^docs/pod/; # other docs are actually raw Pod
#                $parrotdir, $dest;
#            },
#        },
#    };
#    $othertransforms = {
#        '.*' => {
#            optiondir => 'foo',
#            transform => sub {
#                return(@_);
#            }
#        }
#    };
#
#    ($files, $installable_exe, $directories) = lines_to_files(
#        $metatransforms, $othertransforms,
#        [qw(MANIFEST MANIFEST.generated)],
#        { packages => 'main' }, $parrotdir
#    );
#    ok((ref($files) and ref($installable_exe) and ref($directories)), 'lines_to_files returns something vaguely sensible');
#    ok(1, 'lines_to_files passed all tests');
#}
