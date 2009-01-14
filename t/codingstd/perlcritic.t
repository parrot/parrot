#! perl
# Copyright (C) 2008-2009, The Perl Foundation.
# $Id$

use strict;
use warnings;

use lib qw{lib};

use File::Spec;
use Getopt::Long;
use Parrot::Config qw(%PConfig);
use Parrot::Distribution;
use Test::More;

# There's no point in continuing if we're missing some certain modules.
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

my $config = File::Spec->catfile( qw{tools util perlcritic.conf} );

Test::Perl::Critic->import(
    -profile => $config,
    -theme   => $theme
);

my $dist = Parrot::Distribution->new();

my @files;
if ( !@ARGV ) {

    # We want to skip any language's perl files except those which have declared
    # they wish to be tested. Language developers: don't break the build!

    my $languages_dir = File::Spec->catdir( $PConfig{build_dir}, 'languages');
    my $filter_languages = qr/^\Q$languages_dir$PConfig{slash}\E(?!m4|pipp)/x;

    @files = grep {! m/$filter_languages/}
             map  { $_->path }
             grep { $_->read !~ m/use v6;/ }
             $dist->get_perl_language_files();
} else {
    my $node = shift;
    if (-f $node) {
        @files = ($node);
    } elsif (-d $node) {

        $node = File::Spec->rel2abs( $node );
        @files = grep { m/^$node/ }
                 map { $_->path }
                 $dist->get_perl_language_files();
    } else {
        die "invalid file '$node' specified.\n";
    }
}

plan(tests => scalar(@files));
critic_ok($_) foreach @files;

sub give_up {
  my $excuse = shift;
  plan(skip_all => "$excuse required to criticize code.");
  exit;
}


__END__

=head1 NAME

t/codingstd/perlcritic.t - use perlcritic for perl coding stds.

=head1 SYNOPSIS

 % prove t/codingstd/perlcritic.t

 % perl t/codingstd/perlcritic.t [--theme=sometheme] [file|directory]

=head1 DESCRIPTION

By default, tests all perl source files for some very specific perl coding
violations.

Optionally specify a file on the command line to test B<only>
that file. If you specify a directory, any perl files under that directory
are tested.

This test uses a standard perlcriticrc file, located in
F<tools/utils/perlcritic.conf>

If you wish to run a specific policy, the easiest way to do so is to
temporarily add a custom theme to the configuration file and then specify
that on the command line to this script.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
