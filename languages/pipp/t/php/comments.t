# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/php/comments.t - tests for Pipp


=head1 SYNOPSIS

    perl t/harness t/php/comments.t

=head1 DESCRIPTION

Testing comments in code.

=cut

# pragmata
use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

# core Perl modules
use Test::More     tests => 10;

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

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'two // comments' );
<?php
//
//
echo "asdf\n";
?>
CODE
asdf
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'three // comments' );
<?php
//
//
//
echo "asdf\n";
?>
CODE
asdf
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'two # comments' );
<?php
#
#
echo "asdf\n";
?>
CODE
asdf
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'three # comments' );
<?php
#
#
#
echo "asdf\n";
?>
CODE
asdf
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'one # and one // comment' );
<?php
#
//
echo "asdf\n";
?>
CODE
asdf
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'one # and two // comments' );
<?php
#
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

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
