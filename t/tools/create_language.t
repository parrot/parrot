#! perl
# Copyright (C) 2010, Parrot Foundation.

=head1 NAME

t/tools/create_language.t - test create_language.pl

=head1 SYNOPSIS

    % prove t/tools/create_language.t - test create_language.pl

=head1 DESCRIPTION

Tests the C<tools/dev/create_language.pl> tool.

=cut

use strict;
use warnings;
use lib qw(lib);

use Test::More;
use IO::File ();
use Parrot::Config;
use Parrot::Test;
use File::Spec::Functions;
use File::Path qw/rmtree/;

my $exefile;

BEGIN {
    $exefile = catfile( ".", qw/tools dev create_language.pl/ );
    unless ( -f $exefile ) {
        plan skip_all => "$exefile hasn't been built yet.";
        exit(0);
    }
    plan tests => 8;
}


create_output_like(
    "--help",
    qr{documentation},
    'create_language DTRT with --help'
);
ok(!-e '--help', 'create_language does not create a language called --help');


create_output_like(
    "test_parrot_language_$$",
     qr{creating test_parrot_language_},
     'create_language basic sanity'
);

my $lang_dir = "test_parrot_language_$$";
my $build_dir = catfile($lang_dir, "build");
my $test_dir = catfile($lang_dir, "t");
my $src_dir = catfile($lang_dir, "src");
my $config = catfile($lang_dir, "Configure.pl");
ok(-e $lang_dir, "$lang_dir dir exists");
ok(-e $build_dir, "$build_dir dir exists");
ok(-e $test_dir, "$test_dir dir exists");
ok(-e $src_dir, "$src_dir dir exists");
ok(-s $config, "$config exists and has nonzero size");

rmtree("test_parrot_language_$$");

=head1 HELPER SUBROUTINES

=head2 create_output_like

    create_output_like($keys, /regexp/, $description);

Runs create_language with $keys as the argument and verifies the output.

=cut

sub create_output_like {
    my ($options, $snippet, $desc)  = @_;

    my $out = `$^X $exefile $options`;

    like( $out, $snippet, $desc );

    return;
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
