#! parrot
# Copyright (C) 2001-2009, The Perl Foundation.
# $Id$

=head1 NAME

t/library/File_Spec.t - test File::Spec module

=head1 SYNOPSIS

    % prove t/library/File_Spec.t

=head1 DESCRIPTION

Tests file specifications.

=cut

##############################
# File::Spec

.sub main :main
    .include 'test_more.pir'
    plan(22)

    FS_load_bytecode()
    FS_new()
    FS_can()
    FS_isa()
    FS_version()
    FS_private_subs()
.end

.sub FS_load_bytecode
    load_bytecode 'File/Spec.pir'
    ok(1, 'load_bytecode')
.end

.sub FS_new
    .local pmc spec

    spec = new 'File::Spec'
    ok(1, 'new')
.end

.sub FS_can
    .local pmc spec
    .local pmc method_list

    $S0 = '__isa VERSION devnull tmpdir case_tolerant file_name_is_absolute '
    $S0 = concat $S0, 'catfile catdir path canonpath splitpath splitdir '
    $S0 = concat $S0, 'catpath abs2rel rel2abs'
    method_list = split ' ', $S0

    spec = new 'File::Spec'

  LOOP:
    $I0 = elements method_list
    if $I0 == 0 goto END_TEST
    $S0 = method_list.'shift'()
    $I0 = can spec, $S0
    $S1 = concat 'File::Spec can ', $S0
    ok($I0, $S1)
    goto LOOP

  END_TEST:
.end

.sub FS_isa
    .local pmc spec

    spec = new 'File::Spec'
    isa_ok(spec, 'File::Spec')
    $S0 = spec.'__isa'()
    like($S0, "File '::' Spec '::' .+", 'The object isa File::Spec::.+')
.end

.sub FS_version
    .local pmc spec

    spec = new 'File::Spec'
    $S0 = spec.'VERSION'()
    is($S0, '0.1', 'VERSION 0.1')
.end

.sub FS_private_subs
    .local pmc spec

    spec = new 'File::Spec'
    .local string module
    .local pmc get_module
    get_module = get_hll_global [ 'File::Spec' ], '_get_module'

    module = get_module( 'MSWin32' )
    is(module, 'Win32', 'File::Spec module for MSWin32 is Win32')

    module = get_module( 'foobar' )
    is(module, 'Unix',  'File::Spec module for foobar is Unix')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
