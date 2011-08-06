#! ./parrot
# Copyright (C) 2010, Parrot Foundation.

.include 't/compilers/opsc/common.pir'

.sub 'main' :main
    .include 'test_more.pir'
    load_bytecode 'opsc.pbc'

    $P0 = getstdout
    $P0.'encoding'('ascii')

    .local int total
    .local pmc os, all_files, ops_files, dynops_files

    all_files    = new ['ResizablePMCArray']
    ops_files    = get_ops_from_dir('./src/ops/')
    dynops_files = get_ops_from_dir('./src/dynoplibs/')

    #prepend the arrays to all_files
    splice all_files, ops_files, 0, 0
    splice all_files, dynops_files, 0, 0

    total = elements all_files
    all_files.'sort'()

    plan(total)
    test_parse(all_files)
.end

.sub get_ops_from_dir
    .param string dir
    .local pmc files, filtered_files, os, it

    $P0            = loadlib 'os'
    os             = new ['OS']
    files          = os.'readdir'(dir)
    filtered_files = new ['ResizablePMCArray']

    .local int len, is_pmc, total
    .local string filename, filename_end

    #filter out anything that doesn't end in .ops
    it = iter files
  iter_start:
    unless it goto iter_done
    filename = shift it

    len = length filename
    unless len > 4 goto iter_start

    filename_end = substr filename, -4
    is_pmc = iseq filename_end, ".ops"
    unless is_pmc goto iter_start

    filename = dir . filename
    push filtered_files, filename
    goto iter_start

  iter_done:
    .return (filtered_files)
.end

.sub 'test_parse'
    .param pmc list
    .local int i
    .local pmc it

    it = iter list
  iter_start:
    unless it goto iter_done
    $S0 = shift it
    push_eh fail
    _parse_one_file($S0)
    pop_eh
    ok(1, $S0)
    goto iter_start
  fail:
    ok(0, $S0)
    goto iter_start

  iter_done:

.end

# Don't forget to update plan!

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
