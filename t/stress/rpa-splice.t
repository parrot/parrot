#! perl
# Copyright (C) 2014-2015, Parrot Foundation.

=head1 NAME

t/stress/rpa-slice.t - Smoke the ResizablePMCArray.splice variants

=head1 SYNOPSIS

    % prove -v t/stress/rpa-slice.t

=head1 DESCRIPTION

Test ResizablePMCArray.splice heap-buffer overflows with negative count arguments
under AddressSanitizer or valgrind.

Test the wrong splice shrink fast branch, as described in GH #1174, with the
params offset=3,size=2,tresh=8 and off=0, count=1, elems1=0, tail=1, sizediff=1.

=cut

use strict;
use warnings;
use lib qw(lib ../../lib);
use Parrot::Test tests => (3*3*5*5) +
                          33;

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

# test shrink fast, which deleted one too less
for my $i0 (2..7) {                # size of p0
    for my $o0 (0 .. $i0) {        # offsets in p0
        for my $offset (0) {       # offset to splice
            for my $count (1) {    # count to splice
                my $code = ".sub main :main
    .local pmc p0, p1
    p0 = new ['ResizablePMCArray']
    p1 = new ['ResizablePMCArray']
    p1 = 0
";
                # fill p0
                for my $i (0 .. $i0-1) {
                    $code .= "    push p0, '".chr(65+$i)."'\n";
                }
                # create offsets in p0
                $code .= "    # create offset=$o0\n";
                for my $i (1 .. $o0) {
                    $code .= "    \$I0 = shift p0\n";
                }
                $code .= "    # push_eh eh
    # rpa splice ($i0,$o0,8)
    splice p0, p1, $offset, $count
    \$S0 = join '', p0
    \$I1 = length \$S0
    print \$I1
.end
";
                pir_output_is( $code, $i0>$o0 ? $i0-$o0-1 : 0, "ResizablePMCArray.splice ($i0,$o0,8) $offset, $count");
            }
        }
    }
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
