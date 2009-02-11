# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/php/tags.t - PHP code tags

=head1 SYNOPSIS

    % perl t/harness t/php/tags.t

=head1 DESCRIPTION

Tests Pipp's parsing of PHP code tags

See L<http://www.php.net/manual/en/language.basic-syntax.php>

=cut

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

use Test::More     tests => 8;
use Parrot::Test;


language_output_is( 'Pipp', <<'CODE', <<'OUT', 'short tags w/ close' );
<?echo "hello world\n";?>
CODE
hello world
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'short tags w/o close' );
<?echo "hello world\n";
CODE
hello world
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'short php tags w/ close' );
<?php echo "hello world\n";
CODE
hello world
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'short echoing tags' );
<?= "hello world\n";
CODE
hello world
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'clean script tags, single quotes' );
<script language='php'> echo "hello world\n"; </script>
CODE
hello world
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'clean script tags, double quotes' );
<script language="php"> echo "hello world\n"; </script>
CODE
hello world
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'broken script tag' );
<scriptlanguage="php"> echo "hello world\n"; </script>
CODE
<scriptlanguage="php"> echo "hello world\n"; </script>
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'messy script tags' );
<script
       language      =
    'php'
            >
    echo "hello world\n";
    </script            >
CODE
hello world
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
