#! perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

use strict;
use warnings;

use lib qw{lib};

use File::Spec;
use Getopt::Long;
use Parrot::Config qw(%PConfig);
use Parrot::Distribution;
use Test::More;

eval { require Test::Perl::Critic };
if ($@) {
  plan( skip_all => 'Test::Perl::Critic required to criticize code');
  exit;
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
my $languages_dir = File::Spec->catdir( $PConfig{build_dir}, 'languages' );

my @files;
if ( !@ARGV ) {

    # Skip any files in languages/
    @files = grep { ! m{^\Q$languages_dir\E} }
             map { $_->path }
             $dist->get_perl_language_files();

} else {
    @files = @ARGV;
}

plan(tests => scalar(@files));
critic_ok($_) foreach @files;

__END__

=head1 NAME

t/codingstd/perlcritic.t - use perlcritic for perl coding stds.

=head1 SYNOPSIS

 % prove t/codingstd/perlcritic.t

 % perl --theme=extra t/codingstd/perlcritic.t

 % perl t/codingstd/perlcritic.t <file>

=head1 DESCRIPTION

Tests all perl source files for some very specific perl coding violations.

Optionally specify directories or files on the command line to test B<only>
those files, otherwise all perl 5 files in the C<MANIFEST> will be checked.

This test uses a standard perlcriticrc file, located in
F<tools/utils/perlcritic.conf>

If you wish to run a specific policy, the easiest way to do so is to
temporarily add a custom theme to the configuration file and then specify
that on the command line to this script.

If you wish to test a specific file, you can pass that as an argument on the
command line.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
