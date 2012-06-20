# Copyright (C) 2007-2012, Parrot Foundation.

=pod

=head1 DESCRIPTION

A tutorial lesson about Parrot's external C function call.

=head1 EXTERNAL C FUNCTION CALL

There is a vast wealth of libraries written for a variety of tasks, and
Parrot can tap into most of them using an interface called NCI. NCI
allows Parrot to make calls to low-level compiled functions from
pre-compiled libraries.

The C<loadlib> opcode loads in a compiled library as a Library PMC. The
C<dlfunc> opcode takes a reference to that library PMC and the name of
a function and returns an NCI subroutine PMC that can be invoked
like a normal Parrot subroutine.

=cut

.sub main :main
  .local pmc library
  library = loadlib "libnci_test"
  unless library goto NOT_LOADED

  # calling a function in the library
  .local pmc function
  dlfunc function, library, "nci_c", "c"

  ( $I0 ) = function()
  print $I0
  print "\n"
  end

NOT_LOADED:
    say "not loaded"
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

