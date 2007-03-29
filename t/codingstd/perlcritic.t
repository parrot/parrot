#! perl
# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$

use strict;
use warnings;

use lib qw(. lib ../lib ../../lib);

use Fatal qw(open);
use File::Find;
use File::Spec;
use Test::More;
use Parrot::Config qw{%PConfig};
use Parrot::Distribution;

BEGIN {
    eval { require Perl::Critic };
    if ($@) {
        plan skip_all => 'Perl::Critic not installed';
    }
    my $required_version = 1.03;
    if ( $Perl::Critic::VERSION < $required_version ) {
        plan skip_all => "Perl::Critic v$required_version required, v$Perl::Critic::VERSION found";
    }
}

my $perl_tidy_conf = 'tools/util/perltidy.conf';

my ( @files, %policies, $list_policies, $list_files );

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
    elsif ( $arg eq '--listfiles' ) {
        $list_files = 1;
        shift @ARGV;    #discard
    }
    elsif ( $arg =~ /^--(.*)/ ) {
        $policies{$1} = 1;
        shift @ARGV;    # discard
    }
    else {
        last;
    }
}

# get the files to check
my $DIST = Parrot::Distribution->new();
if ( !@ARGV ) {

    # XXX We should skip any files that are copied wholesale
    #     into our repository. Add a method to $DIST for this. -Coke

    @files = map { $_->path } $DIST->get_perl_language_files();

    # Skip any language files...
    my $languages_dir = File::Spec->catdir($PConfig{build_dir}, 'languages');
    @files = grep { !m{\Q$languages_dir\E} } @files;
}
else {

    # if we're passed a directory, find all the matching files
    # under that directory.

    # use $_ for the check below, as File::Find chdirs on us.
    # XXX Change this to simply return all files in the distribution
    #     from this point down? -Coke
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

if ($list_files) {
    print "Files to be tested by perlcritic:\n";
    for my $file (@files) {
        print $file, "\n";
    }
    exit;
}

# Add in the few cases we should care about.
# For a list of available policies, perldoc Perl::Critic
if ( !keys %policies ) {
    %policies = (
        'TestingAndDebugging::RequireUseStrict'           => 1,
        'TestingAndDebugging::RequireUseWarnings'         => 1,
        'TestingAndDebugging::RequirePortableShebang'     => 1,
        'TestingAndDebugging::ProhibitShebangWarningsArg' => 1,
        'TestingAndDebugging::MisplacedShebang'           => 1,
        'Variables::ProhibitConditionalDeclarations'      => 1,
        'InputOutput::ProhibitTwoArgOpen'                 => 1,
        'InputOutput::ProhibitBarewordFileHandles'        => 1,
        'NamingConventions::ProhibitAmbiguousNames'       => 1,
        'Subroutines::ProhibitBuiltinHomonyms'            => 1,
        'Subroutines::ProhibitExplicitReturnUndef'        => 1,
        'Subroutines::ProhibitSubroutinePrototypes'       => 1,
        'CodeLayout::UseParrotCoda'                       => 1,
        'CodeLayout::ProhibitDuplicateCoda'               => 1,
        'CodeLayout::ProhibitTrailingWhitespace'          => 1,
        'CodeLayout::ProhibitHardTabs'                    => { allow_leading_tabs => 0 },
        'CodeLayout::RequireTidyCode'                     => { perltidyrc => $perl_tidy_conf },
        'Subroutines::RequireFinalReturn'                 => 1,
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

# the number of tests is the number of policies
if ( keys %policies ) {
    plan tests => scalar keys %policies;
}
else {
    exit;
}

# Create a critic object with all of the policies we care about.

# By default, don't complain about anything.
my $config = Perl::Critic::Config->new( -exclude => [qr/.*/] );

foreach my $policy ( keys %policies ) {
    $config->add_policy(
        -policy => $policy,
        ref $policies{$policy} ? ( -config => $policies{$policy} ) : (),
    ) or die;
}

my $critic = Perl::Critic->new(
    -config => $config,
    -top    => 50,
);

$Perl::Critic::Violation::FORMAT = '%f:%l.%c';

my %violations = map { $_, [] } ( keys %policies );

# check each file for the given policies
foreach my $file ( sort @files ) {
    if ( !-r $file ) {
        diag "skipping invalid file: $file\n";
        next;
    }

    foreach my $violation ( $critic->critique($file) ) {
        my $policy = $violation->policy();
        $policy =~ s/^Perl::Critic::Policy:://;
        push @{ $violations{$policy} }, $violation->to_string();
    }
}

foreach my $policy ( sort keys %violations ) {
    my @violations = @{ $violations{$policy} };
    ok( !@violations, $policy )
        or diag( "Policy: $policy failed in "
            . scalar @violations
            . " files:\n"
            . join( "\n", @violations ) );
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

If you just wish to get a listing of the files that will be checked
without actually running the tests, use:

 perl t/codingstd/perlcritic.t --listfils

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
