#!perl
# Copyright (C) 2008, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 4;

=head1 NAME

t/op/io.t - Testing io opcodes

=head1 SYNOPSIS

    % prove t/op/io.t

=head1 DESCRIPTION

Tests various io opcodes.

=cut

pir_output_is( <<'CODE', <<'OUTPUT', 'open with null filename' );
.sub main
    push_eh failed
    $P0 = open $S0, '<'
    say 'never'
    goto finish
failed:
    say 'Catched'
finish:
.end
CODE
Catched
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'open with null mode' );
.sub main
    push_eh failed
    $P0 = open 'some_name', $S0
    say 'never'
    goto finish
failed:
    say 'Catched'
finish:
.end
CODE
Catched
OUTPUT

TODO: {
local $TODO = 'Unimplemented in this platform, TT #661' unless $^O =~ /linux|darwin|MSWin32/;

pir_output_like( <<'CODE', <<'OUTPUT', 'open pipe for reading' );
.include 'iglobals.pasm'

.sub testreadpipe :main
  .local pmc interp
  interp = getinterp
  .local pmc conf
  conf = interp[.IGLOBALS_CONFIG_HASH]
  .local string command
  command = conf['build_dir']
  .local string aux
  aux = conf['slash']
  command .= aux
  aux = conf['test_prog']
  command .= aux
  aux = conf['exe']
  command .= aux
  command .= ' -V'

  .local pmc pipe
  pipe = open command, 'rp'
  unless pipe goto failed
  .local string line
nextline:
  line = readline pipe
  print line
  if pipe goto nextline
  .return()
failed:
  say 'FAILED'
.end
CODE
/This is Parrot.*/
OUTPUT

}

TODO: {
local $TODO = 'Unimplemented in this platform, TT #661' unless $^O =~ /linux|darwin/;

pir_output_is( <<'CODE', <<'OUTPUT', 'open pipe for writing' );
.include 'iglobals.pasm'

.sub testreadpipe :main
  .local pmc interp
  interp = getinterp
  .local pmc conf
  conf = interp[.IGLOBALS_CONFIG_HASH]
  .local string command
  command = conf['build_dir']
  .local string aux
  aux = conf['slash']
  command .= aux
  .local string filename
  filename .= command
  filename .= 'examples/pasm/cat.pasm'
  aux = conf['test_prog']
  command .= aux
  aux = conf['exe']
  command .= aux
  command .= ' '
  command .= filename

  .local pmc pipe
  pipe = open command, 'wp'
  unless pipe goto failed
  pipe.'puts'("Hello, pipe!\n")
  close pipe
  .return()
failed:
  say 'FAILED'
.end
CODE
Hello, pipe!
OUTPUT

}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
