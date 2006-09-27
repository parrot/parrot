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

my @files;

if (!@ARGV) {
    my $manifest = maniread('MANIFEST');

    foreach my $file (keys(%$manifest)) {
        next unless is_perl($file);
        push @files, $file;
    }
} else {
    # if we're passed a directory, find all the matching files
    # under that directory.

    # use $_ for the check below, as File::Find chdirs on us.
    foreach my $file (@ARGV) {
        (-d $file)
             ? find(sub {
                            if (is_perl($_)) {
                                push @files, $File::Find::name; 
                            }
                        }, $file)
             : push @files, $file;
    }
}

if (scalar @files) {
    plan tests => scalar @files;
} else {
    exit;
}

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

foreach my $file (sort @files) {
    my @violations = $critic->critique($file);
    my $output = join("\n", @violations);
    # Remove the PBP references to avoid morbid verbosity.
    $output =~ s/See page.*//g;
    is ($output, '', $file);
}

# Since .t files might be written in any language, we can't *just* check the
# filename to see if something should be treated as perl.
sub is_perl {
    my $filename = shift;

    if (! -f $filename) {
        return 0;
    }
 
    # modules and perl scripts should be tested.. 
    if ($filename =~ /\.(?:pm|pl)$/) {
        return 1;
    }

    # Now let's check to see if there's a perl shebang.

    open my $file_handle, '<', $filename or die "eek";
    my $line = <$file_handle>;
    close $file_handle;

    if ($line =~ /^#!.*perl/) {
        return 1;
    }

    return 0;
}
