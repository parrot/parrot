# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/php/sha1.t - Standard Library sha1

=head1 SYNOPSIS

    % perl -I../lib pipp/t/php/sha1.t

=head1 DESCRIPTION

Tests PHP Standard Library sha1
(implemented in F<languages/pipp/src/common/php_sha1.pir>).

See L<http://www.php.net/manual/en/ref.strings.php>.

=cut

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

use Test::More     tests => 5;
use Parrot::Test;


language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'sha1(msg)' );
<?php
  echo sha1('message digest'), "\n";
?>
CODE
c12252ceda8be8994d5fa0290a47231c1d16aae3
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'sha1(msg, FALSE)' );
<?php
  echo sha1('message digest', FALSE), "\n";
?>
CODE
c12252ceda8be8994d5fa0290a47231c1d16aae3
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'sha1(msg, TRUE)' );
<?php
  $md = sha1('message digest', TRUE);
  echo gettype($md), "\n";
  echo strlen($md), "\n";
?>
CODE
string
20
OUTPUT

unlink 'pipp/file.txt' if -f 'pipp/file.txt';
open my $X, '>', 'pipp/file.txt';
print {$X} 'message digest';
close $X;

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'sha1_file(file)' );
<?php
  echo sha1_file('file.txt'), "\n";
?>
CODE
c12252ceda8be8994d5fa0290a47231c1d16aae3
OUTPUT

unlink 'pipp/file.txt' if -f 'pipp/file.txt';

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'sha1_file(nofile)' );
<?php
  echo sha1_file('nofile.txt'), "\n";
?>
CODE

OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
