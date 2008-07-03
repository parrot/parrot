#! perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/php/var.t - Test for constants

=head1 SYNOPSIS

    % perl -I../lib pipp/t/php/constants.t

=head1 DESCRIPTION

Tests support for constants.

See L<http://www.php.net/manual/en/language.constants.php>.

=cut

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../../lib";

use Test::More     tests => 1;
use Parrot::Test;


language_output_is( 'Pipp', <<'END_CODE', <<'END_OUT', 'define and print', todo => 'not supported yet' );
<?php

define( "THIS_IS", "it" );
echo THIS_IS;
echo "\n";
END_CODE
it
END_OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
