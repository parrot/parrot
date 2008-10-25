# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

references.t - testing references

=head1 DESCRIPTION

Test references.

=cut

# pragmata
use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

use Parrot::Config (); 
use Parrot::Test;
use Test::More     tests => 1;

language_output_is( 'Pipp', <<'END_CODE', <<'END_OUT', 'references', todo => 'not implemented yet' );
<?php

$var = 1;
$ref1 =& $var;
$ref2 =& $var;
$ref3 = $ref2;
echo $var; echo $ref1; echo $ref2; echo $ref3; echo "\n";

$var++;
echo $var; echo $ref1; echo $ref2; echo $ref3; echo "\n";

$ref1++;
echo $var; echo $ref1; echo $ref2; echo $ref3; echo "\n";

$ref2++;
echo $var; echo $ref1; echo $ref2; echo $ref3; echo "\n";

$ref3++;
echo $var; echo $ref1; echo $ref2; echo $ref3; echo "\n";

?>
END_CODE
1111
2221
3331
4441
4442
END_OUT
