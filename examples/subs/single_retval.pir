# Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/subs/single_retval.pir - Subroutine example

=head1 SYNOPSIS

    % ./parrot examples/subs/single_retval.imc

=head1 DESCRIPTION

Simple sub calls with 1 return value.

=cut

.sub _main :main
  .local int i
  .local int j
  .local string s
  i = 7
  $I1 = 8
  s = "nine"
  $I0 = _foo(i, $I1, s)
  print "return: "
  print $I0
  print "\n"
.end

.sub _foo
  .param int i
  .param int j
  .param string s

  print i
  print " "
  print j
  print " "
  print s
  print "\n"

  .return( 10 )
.end
