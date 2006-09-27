#! perl
# Copyright (C) 2001-2006, The Perl Foundation.
# $Id: /parrot/offline/t/codingstd/linelength.t 1005 2006-09-08T13:11:47.473258Z wcoleda  $

=head1 NAME

t/codingstd/perlcritic.t - use perlcritic for perl coding stds.

=head1 SYNOPSIS

 % prove t/codingstd/perlcritic.t

=head1 DESCRIPTION

Tests all source files for some very specific perl coding violations

=cut

use strict;
use warnings;

use lib qw(. lib ../lib ../../lib);

use ExtUtils::Manifest qw(maniread);
use File::Find;
use Test::More;

BEGIN {
    eval 'use Perl::Critic';
    if ($@) {
        print "1..1\nok 1 # skip Perl::Critic not installed\n";
        exit;
    }
}

my @files;

my $file_match = qr/\.(?:pm|pl|t)$/;

if (!@ARGV) {
    my $manifest = maniread('MANIFEST');

    foreach my $file (keys(%$manifest)) {
        next unless $file =~ $file_match;
        push @files, $file;
    }
} else {
    # if we're passed a directory, find all the matching files
    # under that directory. Otherwise just try to parse the given file.
    foreach my $file (@ARGV) {
        (-d $file)
             ? find(sub {
                            if ($File::Find::name =~ $file_match) {
                                push @files, $File::Find::name; 
                            }
                        }, $file)
             : push @files, $file;
    }
}

plan tests => scalar @files;

# By default, don't complain about anything.
my $critic = Perl::Critic->new(-exclude => [qr/.*/]);

# Add in the few cases we should care about.
# For a list of available policies, perldoc Perl::Critic
my @policies = qw{
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
};

foreach my $policy (@policies) {
    $critic->add_policy(-policy => $policy);
}

# Do this one manually - requires an option.
$critic->add_policy(
    -policy => 'CodeLayout::ProhibitHardTabs',
    -config => { allow_leading_tabs => 0 }
);

foreach my $file (@files) {
    my @violations = $critic->critique($file);
    my $output = join("\n", @violations);
    # Remove the PBP references to avoid morbid verbosity.
    $output =~ s/See page.*//g;
    is ($output, '', $file);
}
