# $Id$

=head1 NAME

plumhead/t/hello.t - tests for Plumhead

=head1 DESCRIPTION

Hello World test.

=cut

# pragmata
use strict;
use warnings;
use 5.006_001;

use FindBin;
use lib "$FindBin::Bin/../lib", "$FindBin::Bin/../../../lib";

use Parrot::Config (); 
use Parrot::Test;
use Test::More     tests => 1;

language_output_is( 'Plumhead', <<'END_CODE', <<'END_EXPECTED', 'hello' );
<?php
echo "Hello, World!\n";
?>
END_CODE
Hello, World!
END_EXPECTED

