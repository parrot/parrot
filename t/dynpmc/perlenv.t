#!perl
# Copyright (C) 2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 1;

=head1 NAME

t/dynpmc/perlenv.t - test the PerlEnv PMC


=head1 SYNOPSIS

    % prove t/dynpmc/perlenv.t

=head1 DESCRIPTION

Tests the PerlEnv PMC.

=cut

my $load_perl = <<'END_PASM';
    loadlib P20, 'perl_group'
    find_type I22, 'PerlEnv'
END_PASM


pir_output_is(<<"CODE", <<'OUT', 'new');
.sub 'test' :main
$load_perl
    new P0, I22
    print "ok 1\\n"
.end
CODE
ok 1
OUT


