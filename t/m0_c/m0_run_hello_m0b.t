#! perl
# Copyright (C) 2011, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 1;
use Parrot::Config;

=head1 NAME

t/m0_c/m0_run_hello_m0b.t - make sure t/m0/hello.m0b doesn't break

=head1 SYNOPSIS

    % prove t/m0_c/m0_run_hello_m0b.t

=head1 DESCRIPTION

Run the canonically "correct", hand-assembled hello_canon.m0b.

=cut

my $m0_interp = "./src/m0/c/m0$PConfig{exe}";

my $output = `$m0_interp t/m0/basic/hello_canon.m0b`;

is($output, "hello world\n", "hello world m0b works");

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
