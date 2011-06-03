#! perl
# Copyright (C) 2010-2011, Parrot Foundation.

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
use Carp;
use IO::File ();
use Parrot::Config;
use Parrot::Test;
use File::Spec::Functions;
use File::Path qw/rmtree/;

my $build_parrot;

BEGIN {
    $build_parrot = catfile($PConfig{build_dir}, $PConfig{test_prog} . $PConfig{exe});
    unless (-e $build_parrot) {
        plan skip_all => "Parrot binary has not been built yet";
        exit(0);
    }

}

plan tests => 7;

output_like(
    "test_parrot_language_$$",
     qr{creating test_parrot_language_},
     'mk_language_shell basic sanity'
);

my $lang_dir = "test_parrot_language_$$";
my $test_dir = catfile($lang_dir, "t");
my $src_dir = catfile($lang_dir, "src");
my $setup = catfile($lang_dir, "setup.pir");
my $parrot_exe   = $build_parrot;
my $to_dev_null = $^O =~ /Win/ ? "1> NUL 2>&1" : ">/dev/null 2>&1";
ok(-e $lang_dir, "$lang_dir dir exists");
ok(-e $test_dir, "$test_dir dir exists");
ok(-e $src_dir, "$src_dir dir exists");
ok(-s $setup, "$setup exists and has nonzero size");

SKIP: {
    my $reason = "tools/dev/mk_language_shell.pl requires installed parrot on Darwin";
    skip $reason, 2 if (
        ($PConfig{osname} eq 'darwin') and
        ($parrot_exe eq $build_parrot)
    );
    my $build_status =
        system("cd $lang_dir && \"$parrot_exe\" setup.pir $to_dev_null")
        and croak "Unable to execute setup.pir";
    is($build_status, 0,
        "system call to execute setup.pir completed successfully");

    my $test_status =
        system("cd $lang_dir && \"$parrot_exe\" setup.pir test $to_dev_null")
        and croak "Unable to execute setup.pir test";
    is($test_status, 0,
        "system call to execute setup.pir test completed successfully");
}

=head1 HELPER SUBROUTINES

=head2 output_like

    output_like($keys, /regexp/, $description);

Runs mk_language_shell with $keys as the argument and verifies the output.

=cut

sub output_like {
    my ($options, $snippet, $desc)  = @_;
    my $exefile = catfile( ".", qw/tools dev mk_language_shell.pl/ );

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
