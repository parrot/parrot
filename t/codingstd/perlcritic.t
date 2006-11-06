#! perl
# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$

use strict;
use warnings;

use lib qw(. lib ../lib ../../lib);

use ExtUtils::Manifest qw(maniread);
use Fatal qw(open);
use File::Find;
use Test::More;

BEGIN {
    eval { require Test::Perl::Critic; };
    if ($@) {
        plan skip_all => 'Test::Perl::Critic not installed';
    }
    Test::Perl::Critic->import(-verbose => 7);
}

my $perl_tidy_conf = 'tools/util/perltidy.conf';

my ( @files, %policies, $list_policies );

while (@ARGV) {
    my $arg = $ARGV[0];
    if ( $arg eq '--' ) {
        shift @ARGV;    # discard
        last;
    }
    if ( $arg eq '--list' ) {
        $list_policies = 1;
        shift @ARGV;    # discard
    }
    elsif ( $arg =~ /^--(.*)/ ) {
        $policies{$1} = 1;
        shift @ARGV;    # discard
    }
    else {
        last;
    }
}

# By default, don't complain about anything.
my $config = Perl::Critic::Config->new( -exclude => [qr/.*/] );

# Add in the few cases we should care about.
# For a list of available policies, perldoc Perl::Critic
if ( !keys %policies ) {
    %policies = (
        'TestingAndDebugging::RequireUseStrict'      => 1,
        'TestingAndDebugging::RequireUseWarnings'    => 1,
        'Variables::ProhibitConditionalDeclarations' => 1,
        'InputOutput::ProhibitTwoArgOpen'            => 1,
        'InputOutput::ProhibitBarewordFileHandles'   => 1,
        'NamingConventions::ProhibitAmbiguousNames'  => 1,
        'Subroutines::ProhibitBuiltinHomonyms'       => 1,
        'Subroutines::ProhibitExplicitReturnUndef'   => 1,
        'Subroutines::ProhibitSubroutinePrototypes'  => 1,
        'CodeLayout::UseParrotCoda'                  => 1,
        'CodeLayout::ProhibitHardTabs'               => { allow_leading_tabs => 0 },
        'CodeLayout::RequireTidyCode'                => { perltidyrc => $perl_tidy_conf },

        #40564 [TODO] fix perlcritic Subroutines::RequireFinalReturn policy
        # below commented out because it does not ignore subs which 'exit'
        # or 'die'
        # 'Subroutines::RequireFinalReturn'            => 1,
    );

    # Give a diag to let users know if this is doing anything, how to repeat.
    eval { require Perl::Tidy; };
    if ( !$@ ) {
        diag "Using $perl_tidy_conf for Perl::Tidy settings";
    }
}

if ($list_policies) {
    use Data::Dumper;
    $Data::Dumper::Indent = 1;
    warn Dumper( \%policies );
    exit;
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

foreach my $policy ( keys %policies ) {
    $config->add_policy(
        -policy => $policy,
        ref $policies{$policy} ? ( -config => $policies{$policy} ) : (),
        )
        or die;
}

Test::Perl::Critic->import(
    -format => '[%p] %m at %l,%c',
    -config => $config
);

foreach my $file ( sort @files ) {
    if ( !-r $file ) {
        diag "skipping invalid file: $file\n";
        next;
    }

    Test::Perl::Critic::critic_ok($file);
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

If you just wish to get a listing of the polices that will be checked
without actually running them, use:

 perl t/codingstd/perlcritic.t --list

=head1 BUGS AND LIMITATIONS

There's no way to specify options to policies when they are specified on the
command line.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
