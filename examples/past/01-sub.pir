## code for (assuming package scoped variables)
## sub foo { $a = 4; $b = $a + 1; say($b); }

.sub main :main
    load_bytecode 'PAST-pm.pbc'
    load_bytecode 'Parrot/HLLCompiler.pbc'

    .local pmc block
    block = new 'PAST::Block'
    block.'init'('name'=>'foo')

    # $a = 4
    $P0 = block.'new'('PAST::Val', 'name'=>'4', 'vtype'=>'.Integer')
    $P1 = block.'new'('PAST::Var', 'name'=>'$a', 'islvalue'=>1)
    $P2 = block.'new'('PAST::Op', $P1, $P0, 'pasttype'=>'assign')
    block.'push'($P2)

    # $b = $a + 1
    $P0 = block.'new'('PAST::Var', 'name'=>'$a')
    $P1 = block.'new'('PAST::Val', 'name'=>'1', 'vtype'=>'.Integer')
    $P2 = block.'new'('PAST::Op', $P0, $P1, 'pirop'=>'add')
    $P3 = block.'new'('PAST::Var', 'name'=>'$b', 'islvalue'=>1)
    $P4 = block.'push_new'('PAST::Op', $P3, $P2, 'pasttype'=>'assign')

    # say($b)
    $P0 = block.'new'('PAST::Var', 'name'=>'$b')
    $P1 = block.'push_new'('PAST::Op', $P0, 'name'=>'say')

    # compile to PIR and display
    .local pmc astcompiler
    astcompiler = new 'HLLCompiler'
    astcompiler.'removestage'('parse')
    astcompiler.'removestage'('past')
    $S99 = astcompiler.'compile'(block, 'target'=>'pir')
    print $S99

    #compile to bytecode and execute
    $P99 = astcompiler.'compile'(block)
    $P99()
.end


.sub 'say'
    .param pmc args :slurpy
    if null args goto end
    .local pmc iter
    iter = new .Iterator, args
  loop:
    unless iter goto end
    $P0 = shift iter
    print $P0
    goto loop
  end:
    print "\n"
    .return ()
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
