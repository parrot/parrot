# Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/subs/no_retval.pir - Subroutine example

=head1 SYNOPSIS

    % ./parrot examples/subs/no_retval.pir

=head1 DESCRIPTION

Call a sub with no return values.

=cut

.sub _main :main
  _foo(7, 8, "nine")
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
.end
