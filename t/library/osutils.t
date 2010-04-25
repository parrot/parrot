#!./parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

t/library/osutils.t

=head1 DESCRIPTION

Test the osutils library

=head1 SYNOPSIS

    % prove t/library/osutils.t

=cut

.sub 'main' :main
    .include 'test_more.pir'

    load_bytecode 'osutils.pir'

    plan(4)
    test_basename()
    test_dirname()
.end

.sub 'test_basename'
    $S0 = 'foo/bar/baz.txt'
    $S0 = basename($S0)
    is( $S0, 'baz.txt', "basename" )
.end

.sub 'test_dirname'
    $S0 = 'foo/bar/baz.txt'
    $S0 = dirname($S0)
    is( $S0, 'foo/bar', "dirname" )
    $S0 = dirname($S0)
    is( $S0, 'foo', "dirname" )
    $S0 = dirname($S0)
    is( $S0, '.', "dirname" )
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
