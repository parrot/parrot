#! perl
# Copyright (C) 2008-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/codingstd/perlcritic.t - use perlcritic for perl coding stds.

=head1 SYNOPSIS

 # test all files
 % prove t/codingstd/perlcritic.t

 % perl t/codingstd/perlcritic.t [--theme=sometheme]

 # test specific files
 % perl t/codingstd/perlcritic.t src/foo.pl lib/parrot/bar.pm

=head1 DESCRIPTION

By default, tests all perl source files for some very specific perl coding
violations.

This test uses a standard perlcriticrc file, located in
F<tools/utils/perlcritic.conf>

If you wish to run a specific policy, the easiest way to do so is to
temporarily add a custom theme to the configuration file and then specify
that on the command line to this script.

=cut

use strict;
use warnings;
use lib qw( lib ../lib ../../lib );

use File::Spec;
use Getopt::Long;
use Parrot::Config qw(%PConfig);
use Parrot::Distribution;
use Test::More;

# There's no point in continuing if we're missing some certain modules, or
# if the developer doesn't want to.

if (exists $ENV{'PARROT_TEST_NO_PERLCRITIC'}) {
  give_up('absence of PARROT_TEST_NO_PERLCRITIC environment variable');
}

eval { require Test::Perl::Critic };
if ($@) {
  give_up('Test::Perl::Critic');
}

my $minimum_version = 1.090;
if ($Perl::Critic::VERSION < $minimum_version) {
  give_up("Perl::Critic version $minimum_version");
}

my $theme = 'parrot';
GetOptions(
    'theme=s'   => \$theme
);

my $config = File::Spec->catfile( $PConfig{build_dir}, qw{tools util perlcritic.conf} );

Test::Perl::Critic->import(
    -profile => $config,
    -theme   => $theme
);

my $dist = Parrot::Distribution->new();

my @files;
if ( !@ARGV ) {

    # We want to skip any language's perl files except those which have declared
    # they wish to be tested.
    # As languages are leaving the Parrot repository, there are currently no
    # languages that want to be tested in the root 'make codetest'.

    my $languages_dir = File::Spec->catdir( $PConfig{build_dir}, 'languages');
    my $filter_languages = qr/^\Q$languages_dir$PConfig{slash}\E(?!dummy)/x;

    @files = grep {! m/$filter_languages/}
             map  { $_->path }
             grep { $_->read !~ m/use v6;/ }
             grep { $_->read !~ m/#! nqp/ }
             $dist->get_perl_language_files();
}
else {
    @files = <@ARGV>;
}

plan(tests => scalar(@files));
critic_ok($_) foreach @files;

sub give_up {
  my $excuse = shift;
  plan(skip_all => "$excuse required to criticize code.");
  exit;
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
