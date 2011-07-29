#!./parrot
# Copyright (C) 2010, Parrot Foundation.

=head1 NAME

t/library/osutils.t

=head1 DESCRIPTION

Tests the C<osutils> runtime library.

=head1 SYNOPSIS

    % prove t/library/osutils.t

=cut

.loadlib 'io_ops'

.sub 'main' :main
    .include 'test_more.pir'
    .include 'stat.pasm'

    load_bytecode 'osutils.pir'

    ######################################################################
    # NOTE: Do not change the order in which these functions are called! #
    ####### Some of them rely of the presence of resources created by    #
    ####### functions called before them!                                #
    ######################################################################

    plan(25)
    test_basename()
    test_dirname()
    test_catfile()
    test_splitpath()
    test_newer()
    test_rindex()
    test_file_exists()
    test_mkpath()
    test_cp()
    test_rmtree()
    test_slurp()
.end

.sub 'test_basename'
    $S0 = 'foo/bar/baz.txt'
    $S0 = basename($S0)
    is($S0, 'baz.txt', "basename('foo/bar/baz.txt')")
.end

.sub 'test_dirname'
    $S0 = 'foo/bar/baz.txt'
    $S0 = dirname($S0)
    is($S0, 'foo/bar', "dirname('foo/bar')")

    $S0 = dirname($S0)
    is($S0, 'foo', "dirname('foo')")

    $S0 = dirname($S0)
    is($S0, '.', "dirname('.')")
.end

.sub 'test_catfile'
    $S0 = catfile('abc', 'def', 'ghi')
    is($S0, 'abc/def/ghi', "catfile('abc', 'def', 'ghi')")
.end

.sub 'test_splitpath'
    .local string volume, directories, file

    (volume, directories, file) = splitpath('abc/def/ghi.txt')
    is(volume,      '',        "splitpath('')")
    is(directories, 'abc/def', "splitpath('abc/def')")
    is(file,        'ghi.txt', "splitpath('ghi.txt')")

    (volume, directories, file) = splitpath('c:/abc/def/ghi.txt')
    is(volume,      'c:',       "splitpath('c:')")
    is(directories, '/abc/def', "splitpath('/abc/def')")
    is(file,        'ghi.txt',  "splitpath('ghi.txt')")
.end

.sub 'test_newer'
    $I0 = newer('runtime/parrot/library/osutils.pbc', 'runtime/parrot/library/osutils.pir')
    ok($I0, "newer('osutils.pbc', 'osutils.pir')")

    $I0 = newer('runtime/parrot/library/osutils.no_file', 'runtime/parrot/library/osutils.pir')
    nok($I0, "newer('osutils.no_file', 'osutils.pir')")

    $I0 = newer('runtime/parrot/library/osutils.pir', 'runtime/parrot/library/osutils.pir')
    nok($I0, "newer('osutils.pir', 'osutils.pir')")

    $P0 = split ' ', 'runtime/parrot/library/osutils.pir runtime/parrot/include/stat.pasm'
    $I0 = newer('runtime/parrot/library/osutils.pbc', $P0)
    ok($I0, "newer('osutils.pbc', ['osutils.pir', 'stat.pasm'])")

    $I0 = newer('runtime/parrot/library/osutils.no_file', $P0)
    nok($I0, "newer('osutils.no_file', ['osutils.pir', 'stat.pasm'])")

    $I0 = newer('runtime/parrot/library/osutils.pir', $P0)
    nok($I0, "newer('osutils.pir', ['osutils.pir', 'stat.pasm'])")
.end

.sub 'test_rindex'
    $I0 = rindex('abc', '.')
    is($I0, -1, "rindex('abc', '.')")

    $I0 = rindex('abc.def.ghi', '.')
    is($I0, 7, "rindex('abc.def.ghi', '.')")
.end

.sub 'test_file_exists'
    $I0 = file_exists('t/library/testlib/foo.txt')
    ok($I0, "file_exists('testlib/foo.txt')")

    $I0 = file_exists('foobar')
    nok($I0, "file_exists('foobar')")
.end

.sub 'test_mkpath'
    $S0 = 't/library/testlib/foo/bar/baz'

    mkpath($S0)
    $I0 = stat $S0, .STAT_EXISTS
    ok($I0, "mkpath('testlib/foo/bar/baz')")
.end

.sub 'test_cp'
    $S0 = 't/library/testlib/foo.txt'
    $S1 = 't/library/testlib/foo/bar/baz/foo.txt'

    cp($S0, $S1)
    $I0 = stat $S1, .STAT_EXISTS
    ok($I0, "cp('testlib/foo.txt', 'testlib/foo/bar/baz/foo.txt')")
.end

.sub 'test_rmtree'
    $S0 = 't/library/testlib/foo'

    rmtree($S0)
    $I0 = stat $S0, .STAT_EXISTS
    nok($I0, "rmtree('testlib/foo')")
.end

.sub 'test_slurp'
    $S0 = slurp('t/library/testlib/foo.txt')
    ok($S0, "slurp('testlib/foo.txt')")
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
