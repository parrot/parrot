# $Id: hello.t 15613 2006-11-16 21:20:43Z bernhard $

=head1 NAME

plumhead/t/superglobals.t - tests for Plumhead

=head1 DESCRIPTION

Test the funny PHP superglobal variables.

=cut

# pragmata
use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib", "$FindBin::Bin/../../../lib";

use Parrot::Config (); 
use Parrot::Test;
use Test::More     tests => 1;

$ENV{REQUEST_TYPE} = 'GET';
$ENV{QUERY_STRING} = 'as=df';
language_output_is( 'Plumhead', <<'END_CODE', <<'END_EXPECTED', 'hello' );
<?php
echo $_GET['as'];
echo "\n";
?>
END_CODE
df
END_EXPECTED

