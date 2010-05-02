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

    plan(11)
    test_basename()
    test_dirname()
    test_catfile()
    test_splitpath()
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

.sub 'test_catfile'
    $S0 = catfile('abc', 'def', 'ghi')
    is($S0, 'abc/def/ghi', "catfile")
.end

.sub 'test_splitpath'
    .local string volume, directories, file
    (volume, directories, file) = splitpath('abc/def/ghi.txt')
    is(volume, '', "splitpath vol")
    is(directories, 'abc/def', "splitpath dirs")
    is(file, 'ghi.txt', "splitpath file")

    (volume, directories, file) = splitpath('c:/abc/def/ghi.txt')
    is(volume, 'c:', "splitpath vol")
    is(directories, '/abc/def', "splitpath dirs")
    is(file, 'ghi.txt', "splitpath file")
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
