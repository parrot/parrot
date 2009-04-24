#!parrot


.sub 'main' :main
.include 'test_more.pir'
load_bytecode 'compilers/pmc/pmc.pbc'
    .local int total
    .local pmc os, all_files, pmc_files, dynpmc_files, it

    all_files    = new ['ResizablePMCArray']
    pmc_files    = get_pmcs_from_dir('src/pmc/')
    dynpmc_files = get_pmcs_from_dir('src/dynpmc/')

    #prepend the arrays to all_files
    splice all_files, pmc_files, 0, 0
    splice all_files, dynpmc_files, 0, 0

    total = elements all_files
    all_files.'sort'()

    plan(total)
    test_parse(all_files)

.end

.sub get_pmcs_from_dir
    .param string dir
    .local pmc files, filtered_files, os, it

    os             = new ['OS']
    files          = os.'readdir'(dir)
    filtered_files = new ['ResizablePMCArray']

    .local int len, is_pmc, total
    .local string filename, filename_end

    #filter out anything that doesn't end in .pmc
    it = iter files
  iter_start:
    unless it goto iter_done
    filename = shift it

    len = length filename
    unless len > 4 goto iter_start

    filename_end = substr filename, -4
    is_pmc = iseq filename_end, ".pmc"
    unless is_pmc goto iter_start

    filename = dir . filename
    push filtered_files, filename
    goto iter_start

  iter_done:
    .return (filtered_files)
.end

.sub 'test_parse'
    .param pmc pmc_list
    .local int i
    .local pmc it

    it = iter pmc_list
  iter_start:
    unless it goto iter_done
    $S0 = shift it
    test_parse_one($S0)
    goto iter_start
  iter_done:

.end

.sub 'test_parse_one'
    .param string file
    $S0 = _slurp(file)
    .local pmc compiler
    compiler = compreg 'PMC'
    push_eh fail
    compiler.'parse'($S0)
    pop_eh
    ok(1, file)
    .return ()
  fail:
    pop_eh
    ok(0, file)
.end

.sub '_slurp'
    .param string file
    .local pmc pio
    pio  = open file
    $S0  = pio.'readall'()
    close pio
    .return ($S0)
.end

# Don't forget to update plan!

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
