#! perl
# Copyright (C) 2001-2009, Parrot Foundation.
# $Id$

=head1 NAME

t/doc/pod.t - Pod document syntax tests

=head1 SYNOPSIS

    # test all files
    % prove t/doc/pod.t

    # test specific files
    % perl t/doc/pod.t perl_module.pm perl_file.pl

=head1 DESCRIPTION

Tests the Pod syntax for all files listed in F<MANIFEST> and
F<MANIFEST.generated> that appear to contain Pod markup. If any files
contain invalid POD markup, they are reported in the test output.
Use C<podchecker> to ferret out individual issues.

=cut

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Config;
use ExtUtils::Manifest qw(maniread);

use vars qw(@failed_syntax @empty_description);

BEGIN {
    eval 'use Pod::Find';
    if ($@) {
        plan skip_all => 'Pod::Find not installed';
        exit;
    }
    eval 'use Pod::Simple';
    if ($@) {
        plan skip_all => 'Pod::Simple not installed';
        exit;
    }
}

plan tests => 2;

# RT #44437 this should really be using src_dir instead of build_dir but it
# does not exist (yet)
my $build_dir    = $PConfig{build_dir};
my $manifest     = maniread("$build_dir/MANIFEST");
my $manifest_gen = maniread("$build_dir/MANIFEST.generated");

# if we have files passed in at the command line, use them
my @files;
if (@ARGV) {
    @files = <@ARGV>;
}
else {
    diag "finding files with POD, this may take a minute.";
    @files = ( keys(%$manifest), keys(%$manifest_gen) );
}

foreach my $file (@files) {
    $file = "$build_dir/$file";

    # skip missing MANIFEST.generated files ( -e )
    # skip binary files (including .pbc files) ( -B )
    # skip files that pass the -e test because they resolve the .exe variant
    next unless -T $file;

    # Skip the book, because it uses extended O'Reilly-specific POD
    next if $file =~ m{docs/book/};

    # skip files without POD
    next unless Pod::Find::contains_pod( $file, 0 );

    # skip POD generating scripts
    next if $file =~ m/ops_summary\.pl/;

    # skip file which includes malformed POD for other testing purposes
    next if $file =~ m{t/tools/dev/searchops/samples\.pm};

    # skip files with valid POD
    if (file_pod_ok($file)) {

        #check DESCRIPTION section on valid POD files
        push @empty_description, $file if empty_description($file);

    }
    else {

        # report whatever is not skipped
        push @failed_syntax, $file;
    }
}

my $bad_syntax_files = join( "\n", @failed_syntax );
my $empty_description_files = join( "\n", @empty_description);
my $nempty_description = scalar( @empty_description );

is( $bad_syntax_files, q{}, 'Pod syntax correct' );    # only ok if everything passed

TODO: {
    local $TODO = "not quite done yet";
    is( $empty_description_files, q{}, 'All Pod files have non-empty DESCRIPTION sections' );
}

diag("You should use podchecker to check the failed files.\n")
    if $bad_syntax_files;

diag("Found $nempty_description files without DESCRIPTION sections.\n")
    if $nempty_description;

# Pulled from Test::Pod
sub file_pod_ok {
    my $file    = shift;
    my $checker = Pod::Simple->new;

    $checker->output_string( \my $trash );      # Ignore any output
    $checker->parse_file($file);

    return !$checker->any_errata_seen;
}

sub empty_description {
    my $file = shift;

    use Pod::Simple::PullParser;
    my $parser = Pod::Simple::PullParser->new;
    $parser->set_source( $file );
    my $description = $parser->get_description;

    if ( $description =~ m{^\s*$}m ) {
        return 1;
    }

    return 0;
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
