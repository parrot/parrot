#! perl
# Copyright (C) 2014, Parrot Foundation.

=head1 NAME

t/stress/rpa-slice.t - ResizablePMCArray.splice variants

=head1 SYNOPSIS

    % prove -v t/stress/rpa-slice.t

=head1 DESCRIPTION

Test ResizablePMCArray.splice heap-buffer overflows with negative count arguments
under AddressSanitizer or valgrind.

=cut

use strict;
use warnings;
use lib qw(lib ../../lib);
use Parrot::Test tests => 3*3*5*5;

#TODO: check if running under asan or valgrind and diag if not

# rpa GH #766 heap-buffer-overflow with asan, when negative counts were allowed
for my $i0 (0..2) {
  for my $i1 (0..2) {
    for my $offset (-2..2) {
      for my $count (-2..2) {
        pir_exit_code_is( << "CODE", 0, "ResizablePMCArray.splice $i0, $i1, $offset, $count");
.sub main :main
    .local pmc p0, p1
    p0 = new ['ResizablePMCArray']
    p1 = new ['ResizablePMCArray']
    p0 = $i0
    p1 = $i1
    push_eh eh
    splice p0, p1, $offset, $count
    eh:
.end
CODE
      }
    }
  }
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
