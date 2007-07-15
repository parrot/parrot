#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id: 01-basic.t 19869 2007-07-14 17:05:26Z jkeenan $
# 01-basic.t

use strict;
use warnings;

use Test::More tests => 11;
use Carp;
use Cwd;
use File::Temp qw( tempdir );
use lib ( qw| lib | );
use_ok('Parrot::Manifest');

my $script = $0;
my $mani = Parrot::Manifest->new($script);
isa_ok($mani, 'Parrot::Manifest');

ok(scalar(@{ $mani->{dirs} } ),
    "Parrot::Manifest constructor used 'status' command to find at least 1 directory.");
ok(scalar(@{ $mani->{versioned_files} } ),
    "Parrot::Manifest constructor used 'status' command to find at least 1 versioned file.");

my $manifest_lines_ref = $mani->prepare_manifest();
is(ref($manifest_lines_ref), q{ARRAY},
    "prepare_manifest() returned array ref");
my $cwd = cwd();
{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or
        croak "Unable to change to temporary directory for testing";
    ok(! -f 'MANIFEST',
        "No MANIFEST yet in this directory");
    $mani->print_manifest($manifest_lines_ref);
    ok(  -f 'MANIFEST',
        "MANIFEST has been created in this directory");
    chdir $cwd or
        croak "Unable to change back from temporary directory after testing";
}

my $ignore_ref = $mani->prepare_manifest_skip();
is(ref($ignore_ref), q{HASH},
    "prepare_manifest() returned hash ref");
{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or
        croak "Unable to change to temporary directory for testing";
    ok(! -f 'MANIFEST.SKIP',
        "No MANIFEST.SKIP yet in this directory");
    $mani->print_manifest_skip($ignore_ref);
    ok(  -f 'MANIFEST.SKIP',
        "MANIFEST.SKIP has been created in this directory");
    chdir $cwd or
        croak "Unable to change back from temporary directory after testing";
}

pass("Completed all tests in $0");


################### DOCUMENTATION ###################

=head1 NAME

01-basic.t - test C<Parrot::Manifest> constructor

=head1 SYNOPSIS

    % prove t/manifest/01-basic.t

=head1 DESCRIPTION

The files in this directory test the publicly callable methods of
F<lib/Parrot/Manifest.pm> and packages which inherit from that package.

F<01-basic.t> tests whether the Parrot::Manifest methods work properly under
normal conditions.

=head1 AUTHOR

James E Keenan (jkeenan@cpan.org)

=head1 SEE ALSO

Parrot::Manifest, Parrot::Manifest::Files, Parrot::Manifest::Skip,
F<tools/dev/mk_manifest_and_skip.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

