#!./parrot
# Copyright (C) 2011 Parrot Foundation.

=head1 NAME

t/library/lib_search_path.t - testing for proper search path precedence

=head1 SYNOPSIS

This test program verifies that Parrot searches for libraries in the
proper order.

=head1 AUTHOR

Kevin Polulak (a.k.a. soh_cah_toa) kpolulak@gmail.com

=cut

.const int TESTS = 3

.sub 'main' :main
    .include 'test_more.pir'

    .local pmc lib

    plan(TESTS)

    # Verify current working directory isn't searched
    lib = loadlib 'lib_search_path.t'
    is(lib, '', 'Verify current working directory not searched')

    lib = loadlib 'dont_load_me.pir'
    is(lib, '', 'Verify current working directory not searched')

    # Verify runtime/parrot/dynext is searched
	lib = loadlib 'osutils.pir'
    isnt(lib, '', 'Verify runtime/parrot/dynext is searched')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

