=head1 External C Function Call

This example demonstrates using NCI to load a C library and call a C function.

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

