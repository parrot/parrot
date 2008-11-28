# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/php/filestat.t - Standard Library filestat

=head1 SYNOPSIS

    perl t/harness t/php/filestat.t

=head1 DESCRIPTION

Tests PHP Standard Library file
(implemented in F<languages/pipp/src/common/php_filestat.pir>).

See L<http://www.php.net/manual/en/ref.filesystem.php>.

=cut

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

use Test::More     tests => 3;
use Parrot::Test;


unlink 'file.txt' if (-f 'file.txt');

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'file_exists()' );
<?php
  echo file_exists('file.txt'), "\n";
?>
CODE

OUT

open my $X, '>', 'file.txt';
binmode $X, ':raw';
print {$X} "line 1\n";
print {$X} "line 2\n";
print {$X} "line 3\n";
close $X;

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'file_exists()' );
<?php
  echo file_exists('file.txt'), "\n";
?>
CODE
1
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'filesize()' );
<?php
  echo filesize('file.txt'), "\n";
?>
CODE
21
OUT

unlink 'file.txt' if (-f 'file.txt');


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
