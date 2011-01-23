#Copyright (C) 2009, Parrot Foundation.
# Sample creating of "Hello World" program using Packfile PMCs.
.sub 'main'
    .local pmc pf, pfdir, pfbc, pfconst, oplib

    # Hello World is something like
    # .sub 'hello'
    #    say "Hello World"
    # .end
    # To generate PBC we need few bits

    # First thing
    # Packfile will be created with fresh directory
    pf = new 'Packfile'
    pfdir = pf.'get_directory'()

    # We need some constants
    pfconst = new 'PackfileConstantTable'

    # We will need Sub PMC as well but will deal with it later.
    # Add PackfileConstantTable into directory.
    pfdir["CONSTANTS_hello.pir"] = pfconst

    # Generate bytecode
    pfbc = new 'PackfileBytecodeSegment'
    .local pmc op

    # Here is our function
    op    = new ['ResizablePMCArray']
    op[0] = 'say_sc'
    $I0   = pfconst.'get_or_create_constant'("Hello, World")
    op[1] = $I0
    push pfbc, op

    # Empty FIA for handling returns from "hello"
    $P0   = new 'FixedIntegerArray'
    op    = new ['ResizablePMCArray']
    op[0] = 'set_returns_pc'
    $I0   = pfconst.'get_or_create_constant'($P0)
    op[1] = $I0
    push pfbc, op

    op = new ['ResizablePMCArray']
    op[0] = 'returncc'
    push pfbc, op

    # Store bytecode
    pfdir['BYTECODE_hello.pir'] = pfbc

    # Now create Sub PMC using hash of values.
    $P0 = new 'Hash'
    $P0['start_offs']   = 0
    $P0['end_offs']     = 5
    $P0['name']         = 'hello'
    $P0['subid']        = 'hello'
    $P0['ns_entry_name']= 'hello'
    $P0['method']       = ''
    $P0['HLL_id']       = 0
    $P0['vtable_index'] = -1 # It required to store sub in namespace

    $P1 = new 'Sub', $P0

    # and store it in PackfileConstantTable
    push pfconst, $P1

    # Now pack Packfile and save it
    $S0 = pf
    $P1 = new ['FileHandle']
    $P1.'open'("generated_hello.pbc", "w")
    $P1.'puts'($S0)
    $P1.'close'()

    # And check it!
    load_bytecode 'generated_hello.pbc'
    $P1 = find_sub_not_null 'hello'
    $P1()

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
