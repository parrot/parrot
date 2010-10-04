#! perl
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

t/tools/mk_language_shell.t - test mk_language_shell.pl

=head1 SYNOPSIS

    % prove t/tools/mk_language_shell.t - test mk_language_shell.pl

=head1 DESCRIPTION

Tests the C<tools/dev/mk_language_shell.pl> tool.

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

my ($path, $exefile);

BEGIN {
    $path = catfile( ".", qw/tools dev mk_language_shell.pl/ );
    $exefile = $path . $PConfig{exe};
    unless ( -f $exefile ) {
        plan skip_all => "$exefile hasn't been built yet.";
        exit(0);
    }
    plan tests => 5;
}

output_like(
    "test_parrot_language_$$",
     qr{creating test_parrot_language_},
     'mk_language_shell basic sanity'
);

my $lang_dir = "test_parrot_language_$$";
my $test_dir = catfile($lang_dir, "t");
my $src_dir = catfile($lang_dir, "src");
my $setup = catfile($lang_dir, "setup.pir");
ok(-e $lang_dir, "$lang_dir dir exists");
ok(-e $test_dir, "$test_dir dir exists");
ok(-e $src_dir, "$src_dir dir exists");
ok(-s $setup, "$setup exists and has nonzero size");


=head1 HELPER SUBROUTINES

=head2 output_like

    output_like($keys, /regexp/, $description);

Runs mk_language_shell with $keys as the argument and verifies the output.

=cut

sub output_like {
    my ($options, $snippet, $desc)  = @_;

    my $out = `$^X $exefile $options`;

    like( $out, $snippet, $desc );

    return;
}

END {
    rmtree("test_parrot_language_$$");
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
