#! perl
# Copyright (C) 2001-2006, The Perl Foundation.
# $Id: /parrot/offline/t/codingstd/linelength.t 1005 2006-09-08T13:11:47.473258Z wcoleda  $

use strict;
use warnings;

use lib qw(. lib ../lib ../../lib);

use ExtUtils::Manifest qw(maniread);
use Fatal qw(open);
use File::Find;
use Test::More;

BEGIN {
    eval 'use Perl::Critic';
    if ($@) {
        print "1..1\nok 1 # skip Perl::Critic not installed\n";
        exit;
    }
}

my ( @files, @policies );

while (@ARGV) {
    my $arg = $ARGV[0];
    if ( $arg eq '--' ) {
        shift @ARGV;    # discard
        last;
    }
    if ( $arg =~ /^--(.*)/ ) {
        push @policies, $1;
        shift @ARGV;    # discard
    }
    else {
        last;
    }
}

if ( !@ARGV ) {
    my $manifest = maniread('MANIFEST');

    foreach my $file ( keys(%$manifest) ) {
        next unless is_perl($file);
        push @files, $file;
    }
}
else {

    # does the first

    # if we're passed a directory, find all the matching files
    # under that directory.

    # use $_ for the check below, as File::Find chdirs on us.
    foreach my $file (@ARGV) {
        ( -d $file )
            ? find(
            sub {
                if ( -d $_ and $_ eq '.svn' ) {
                    $File::Find::prune = 1;
                    return;
                }
                if ( is_perl($_) ) {
                    push @files, $File::Find::name;
                }
            },
            $file
            )
            : push @files, $file;
    }
}

if ( scalar @files ) {
    plan tests => scalar @files;
}
else {
    exit;
}

# By default, don't complain about anything.
my $critic = Perl::Critic->new( -exclude => [qr/.*/] );

# Add in the few cases we should care about.
# For a list of available policies, perldoc Perl::Critic
if ( !@policies ) {
    @policies = qw{
        TestingAndDebugging::RequireUseStrict
        TestingAndDebugging::RequireUseWarnings
        Variables::ProhibitConditionalDeclarations
        InputOutput::ProhibitTwoArgOpen
        InputOutput::ProhibitBarewordFileHandles
        NamingConventions::ProhibitAmbiguousNames
        Subroutines::ProhibitBuiltinHomonyms
        Subroutines::ProhibitExplicitReturnUndef
        Subroutines::ProhibitSubroutinePrototypes
        Subroutines::RequireFinalReturn
        CodeLayout::UseParrotCoda
    };

    # Add these policies manually - requires an option.
    $critic->add_policy(
        -policy => 'CodeLayout::ProhibitHardTabs',
        -config => { allow_leading_tabs => 0 }
    );

    # Give a diag to let users know if this is doing anything, how to repeat.
    my $tidy_conf = 'tools/util/perltidy.conf';
    eval "require Perl::Tidy";
    if ($@) {
        diag "Perl::Tidy not installed, silently ignoring tidy failures.";
    }
    else {
        diag "Using $tidy_conf for Perl::Tidy settings";
    }

    $critic->add_policy(
        -policy => 'CodeLayout::RequireTidyCode',
        -config => { perltidyrc => $tidy_conf },
    );
}

foreach my $policy (@policies) {
    $critic->add_policy( -policy => $policy ) or die;
}

foreach my $file ( sort @files ) {
    my @violations = $critic->critique($file);
    my $output     = join( "\n", @violations );

    # Remove the PBP references to avoid morbid verbosity.
    $output =~ s/See page.*//g;
    is( $output, '', $file );
}

# Since .t files might be written in any language, we can't *just* check the
# filename to see if something should be treated as perl.
sub is_perl {
    my $filename = shift;

    if ( !-f $filename ) {
        return 0;
    }

    # modules and perl scripts should always be tested..
    if ( $filename =~ /\.(?:pm|pl)$/ ) {
        return 1;
    }

    # test files (.t) and configure (.in) files might need testing.
    # ignore everything else.
    if ( $filename !~ /\.(?:t|in)$/ ) {
        return 0;
    }

    # Now let's check to see if there's a perl shebang.

    open my $file_handle, '<', $filename or die "eek";
    my $line = <$file_handle>;
    close $file_handle;

    if ( $line && $line =~ /^#!.*perl/ ) {
        return 1;
    }

    return 0;
}

__END__

=head1 NAME

t/codingstd/perlcritic.t - use perlcritic for perl coding stds.

=head1 SYNOPSIS

 % prove t/codingstd/perlcritic.t

=head1 DESCRIPTION

Tests all perl source files for some very specific perl coding violations.

Optionally specify directories or files on the command line to test B<only>
those files, otherwise all files in the C<MANIFEST> will be checked.

By default, this script will validate the specified files against a default
set of policies. To run the test for a B<specific> Rule, specify it on the
command line before any other files, as:

 perl t/codingstd/perlcritic.t --TestingAndDebugging::RequireUseWarnings

This will, for example, use B<only> that policy (see L<Perl::Critic> for
more information on policies) when examining files from the manifest.

=head1 BUGS AND LIMITATIONS

There's no way to specify options to policies when they are specified on the
command line.

=cut
