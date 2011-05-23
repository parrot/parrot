#! parrot
# Copyright (C) 2001-2011, Parrot Foundation.

=head1 NAME

t/dynpmc/foo.t - Test for a very simple dynamic PMC

=head1 SYNOPSIS

        % prove t/dynpmc/foo.t

=head1 DESCRIPTION

Tests the Foo PMC.

=cut

# load our Foo test (pseudo) language
# it defines one PMC type "Foo"
.HLL "Fool"
.loadlib "foo_group"

.sub main :main
    .include 'test_more.pir'
    plan(12)

    test_get_integer()
    test_survive_gc()
    test_loadlib_relative_pathname_no_ext()
    test_loadlib_absolute_pathname_no_ext()
    test_loadlib_relative_pathname_and_ext()
    test_loadlib_absolute_pathname_and_ext()
    test_inherited_add()
    test_foo_subclass_isa_integer()
    test_hll_1()
    test_hll_2()
.end

.sub test_get_integer
    loadlib $P1, "foo_group"
    $P1 = new "Foo"

    $I1 = $P1
    is($I1, 42, 'get integer')
.end

.sub test_survive_gc
    loadlib $P1, 'foo_group'
    sweep 1
    $P2 = getprop '_type', $P1
    $S0 = $P2
    is($S0, 'PMC', 'ParrotLibrary props survive GC')
.end

.sub test_loadlib_relative_pathname_no_ext 
    ## load a relative pathname without the extension.  loadlib will convert the
    ## '/' characters to '\\' on windows.
    $S0 = "runtime/parrot/dynext/foo_group"
    loadlib $P1, $S0

    ## ensure that we can still make Foo instances.
    $P1 = new "Foo"
    $I1 = $P1
    is($I1, 42, 'test loadlib with relative pathname, no ext')
.end

.sub test_loadlib_absolute_pathname_no_ext 
    ## get cwd in $S0.
    .include "iglobals.pasm"
    $P11 = getinterp
    $P12 = $P11[.IGLOBALS_CONFIG_HASH]
    $S0 = $P12["prefix"]

    ## convert cwd to an absolute pathname without the extension, and load it.
    ## this should always find the version in the build directory, since that's
    ## the only place "make test" will work.
    $S0 .= "/runtime/parrot/dynext/foo_group"
    loadlib $P1, $S0

    ## ensure that we can still make Foo instances.
    $P1 = new "Foo"
    $I1 = $P1
    is($I1, 42, 'loadlib with absolute pathname, no ext')
.end

.sub test_loadlib_relative_pathname_and_ext
    ## get load_ext in $S0.
    .include "iglobals.pasm"
    $P11 = getinterp
    $P12 = $P11[.IGLOBALS_CONFIG_HASH]
    $S0 = $P12["load_ext"]

    ## load a relative pathname with an extension.
    $S0 = concat "runtime/parrot/dynext/foo_group", $S0
    loadlib $P1, $S0

    ## ensure that we can still make Foo instances.
    $P1 = new "Foo"
    $I1 = $P1
    is($I1, 42, 'loadlib with relative pathname & ext')
.end

.sub test_loadlib_absolute_pathname_and_ext
    ## get cwd in $S0, load_ext in $S1.
    .include "iglobals.pasm"
    $P11 = getinterp
    $P12 = $P11[.IGLOBALS_CONFIG_HASH]
    $S0 = $P12["prefix"]
    $S1 = $P12["load_ext"]

    ## convert $S0 to an absolute pathname with extension, and load it.
    ## this should always find the version in the build directory, since that's
    ## the only place "make test" will work.
    $S0 = concat $S0, "/runtime/parrot/dynext/foo_group"
    $S0 = concat $S0, $S1
    loadlib $P1, $S0

    ## ensure that we can still make Foo instances.
    $P1 = new "Foo"
    $I1 = $P1
    is($I1, 42, 'loadlib with absolute pathname & ext')
.end

.sub test_inherited_add
    .include "iglobals.pasm" 
    .local pmc config_hash, interp 
    .local pmc d, l, r
    interp = getinterp 
    config_hash = interp[.IGLOBALS_CONFIG_HASH] 
    $S0 = config_hash['gmp'] 
    unless $S0 goto no_bigint

    $P0 = loadlib "foo_group"
    ok(1, 'inherited add - loadlib')
    l = new "Foo"
    l = 42
    r = new 'BigInt'
    r = 0x7ffffff
    d = new 'Undef'
    add d, l, r
    is(d, 134217769, 'inherited add')
    $S0 = typeof d
    is($S0, 'BigInt', 'inherited add - typeof')
    .return()
  no_bigint:
    skip( 3, 'No BigInt Lib configured' )
.end

.sub test_foo_subclass_isa_integer 
    .local pmc F, f, d, r
    loadlib F, "foo_group"
    f = new "Foo"
    f = 1
    d = new 'Integer'
    r = new 'Integer'
    r = 2
    d = f - r
    is(d, 144, 'Foo subclass isa Integer')
.end

.sub test_hll_1
    new $P1, "Foo"      # load by name
    $I1 = $P1
    is($I1, 42, '.HLL 1')
.end

.sub test_hll_2
    new $P1, 'Foo'       # load by index
    $I1 = $P1
    is($I1, 42, '.HLL 2')
.end

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 filetype=pir:
