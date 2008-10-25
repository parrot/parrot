# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

concat.t - testing concatenation

=head1 DESCRIPTION

Concatenate various thingies.

=cut

# pragmata
use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

# core Perl modules
use Test::More     tests => 3;

# Parrot modules
use Parrot::Test;

language_output_is( 'Pipp', <<'END_CODE', <<'END_EXPECTED', 'concatenate 2 strings' );
<?php
echo '1' . "a\n"
?>
END_CODE
1a
END_EXPECTED

language_output_is( 'Pipp', <<'END_CODE', <<'END_EXPECTED', 'concatenate four strings' );
<?php
echo 'Hell' . 'o, ' . 'World!' . "\n"
?>
END_CODE
Hello, World!
END_EXPECTED

language_output_is( 'Pipp', <<'END_CODE', <<'END_EXPECTED', 'concatenate an int and a string' );
<?php
echo 1 . "a\n"
?>
END_CODE
1a
END_EXPECTED

