# Copyright (C) 2001-2005, The Perl Foundation.
# $Id$

=head1 NAME

examples/subs/multi_retvals.pir - Subroutine example

=head1 SYNOPSIS

    % ./parrot examples/subs/multi_retvals.pir

=head1 DESCRIPTION

Call a sub with multiple return values.

=head1 SEE ALSO

F<docs/imcc/syntax.pod>
F<docs/imcc/calling_conventions.pod>

=cut

.sub example :main
  ($I0, $I1, $I99) = foo(7, 8, "nine")
  print "return: "
  print $I0
  print " "
  print $I1
  print " "
  print $I99
  print "\n"
.end

.sub foo
  .return( 10, 11, 12 )
.end
