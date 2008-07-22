# $Id$

=head1 NAME

pipp/t/comments.t - tests for Pipp

=head1 DESCRIPTION

Testing comments in code.

=cut

# pragmata
use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../../lib";

# core Perl modules
use Test::More     tests => 5;

# Parrot modules
use Parrot::Test;

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'end of line comment //' );
<script language="php">
echo "Hello, World!\n";   // comment till end of line
</script>
CODE
Hello, World!
OUT


language_output_is( 'Pipp', <<'CODE', <<'OUT', 'single line /* */ comment' );
<script language="php">
echo "Hello, World!\n";   /* comment till end of line */
</script>
CODE
Hello, World!
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'multi line /* */ comment' );
<script language="php">
echo "Hello, World!\n";   /* multi
    line
    comment
*/
</script>
CODE
Hello, World!
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'three end of line comments', todo => 'broken' );
<?php
//
//
//
echo "asdf\n";
?>
CODE
asdf
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'end of line comment #' );
<script language="php">
echo "Hello, World!\n";   # comment till end of line
</script>
CODE
Hello, World!
OUT
