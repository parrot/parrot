# Copyright (C) 2001-2005 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/subs/single_retval.pir - Subroutine example

=head1 SYNOPSIS

    % ./parrot examples/subs/single_retval.pir

=head1 DESCRIPTION

Simple subroutine calls with 1 return value.

=head1 SEE ALSO

F<docs/imcc/syntax.pod>
F<docs/imcc/calling_conventions.pod>

=cut

.sub example :main
  .local int i
  i = 7
  $I1 = 8
  .local string s
  s = "nine"
  I2  = 10

  # subs accept locals and registers
  $I0 = foo(i, $I1, s, I2)
  print "return: "
  print $I0
  print "\n"

  # subs accept locals and registers
  ( $I3 ) = foo(i, $I1, s, I2)
  print "return: "
  print $I3
  print "\n"

.end

.sub foo
  .param int i
  .param int j
  .param string s
  .param string k

  print i
  print " "
  print j
  print " "
  print s
  print " "
  print k
  print "\n"

  .return( 10 )
.end
