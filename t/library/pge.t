#! perl -w
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/library/pge.t - Grammar Engine tests

=head1 SYNOPSIS

	% perl -Ilib t/library/pge.t

=cut

use strict;

use Parrot::Test tests => 23;
use Parrot::Test::PGE;

# 1-6
pgeglob_is  ('bznza', 'b?n*a', "glob wildcards");
pgeglob_is  ('bana', 'b?n*a', "glob wildcards");
pgeglob_isnt('bnana', 'b?n*a', "glob wildcards");
pgeglob_is  ('bnan', '?n?*', "glob wildcards");
pgeglob_is  ('ana', '?n?*', "glob wildcards");
pgeglob_isnt('an', '?n?*', "glob wildcards");

# 7
pgeglob_is  ('orange','[go]range','glob enumerated characters');
pgeglob_is  ('grange','[go]range','glob enumerated characters');
pgeglob_isnt('ggrange','[go]range','glob enumerated characters');
pgeglob_isnt('borange','[go]range','glob enumerated characters');
pgeglob_isnt('arange','[go]range','glob enumerated characters');
pgeglob_is  ('a','[^0-9]','glob enumerated characters');
pgeglob_isnt('4','[^0-9]','glob enumerated characters');
pgeglob_isnt('0','[^0-9]','glob enumerated characters');
pgeglob_isnt('9','[^0-9]','glob enumerated characters');
pgeglob_isnt('4a','[^0-9]','glob enumerated characters');
pgeglob_isnt('aa','[^0-9]','glob enumerated characters');

pgeglob_is  ('', '*', 'glob empty string');
pgeglob_isnt('', '?', 'glob empty string');
pgeglob_isnt('', '[0]', 'glob empty string');
pgeglob_isnt('', '[^0]', 'glob empty string');

# 22 
pir_output_is(<<'CODE', <<'OUT', "Glob, alternate");

.sub _main
  load_bytecode "library/PGE.pbc"
  load_bytecode "library/PGE/Glob.pir"

  .local pmc rule
  $P0 = find_global "PGE", "glob"
  (rule, $P1, $P2) = $P0("{app,bet,cod}a")

  $P1 = rule("appa")
  if $P1 goto ok1
  print "not "
ok1:
  print "ok1\n"

  $P1 = rule("coda")
  if $P1 goto ok2
  print "not "
ok2:
  print "ok2\n"

  $P1 = rule("beta")
  if $P1 goto ok3
  print "not "
ok3:
  print "ok3\n"

  $P1 = rule("bet")
  unless $P1 goto ok4
  print "not "
ok4:
  print "ok4\n"

  $P1 = rule("alfa")
  unless $P1 goto ok5
  print "not "
ok5:
  print "ok5\n"

  (rule, $P1, $P2) = $P0("*{1,two,three}")

  $P1 = rule("1")
  if $P1 goto ok6
  print "not "
ok6:
  print "ok6\n"

  $P1 = rule("ptwo")
  if $P1 goto ok7
  print "not "
ok7:
  print "ok7\n"

  $P1 = rule("al")
  unless $P1 goto ok8
  print "not "
ok8:
  print "ok8\n"

  $P1 = rule("three")
  if $P1 goto ok9
  print "not "
ok9:
  print "ok9\n"

  $P1 = rule("twop")
  unless $P1 goto ok10
  print "not "
ok10:
  print "ok10\n"

  $P1 = rule("1atwo")
  if $P1 goto ok11
  print "not "
ok11:
  print "ok11\n"

.end
CODE
ok1
ok2
ok3
ok4
ok5
ok6
ok7
ok8
ok9
ok10
ok11
OUT

# 23 
pir_output_is(<<'CODE', <<'OUT', "This made Parrot m4 fail");

.sub 'test' :main
  load_bytecode "PGE.pbc"

  .local pmc p6rule
  find_global p6rule, "PGE", "p6rule"

  .local pmc rulesub_a, rulesub_b
  rulesub_a  = p6rule( "a" )
  rulesub_b  = p6rule( "^(<[b]>)" )

  .local string input_string    
  input_string    = "_____________________________________________________________________"

  rulesub_b( input_string ) 

  print "ok1\n"
  # end

  rulesub_a( input_string ) 
  print "ok2\n"

.end

CODE
ok1
ok2
OUT

# vim: ft=imc :
