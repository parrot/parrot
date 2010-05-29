#Copyright (C) 2009, Parrot Foundation.
#$Id$
# Sample creating of "Hello World" program using Packfile PMCs.
.sub 'main'
    .local pmc pf, pfdir, pffixup, pfbc, pfconst, oplib

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
    # Interpreter.
    pfconst = new 'PackfileConstantTable'
    $P0 = getinterp
    pfconst[0] = $P0

    # Empty FIA for handling returns from "hello"
    $P0 = new 'FixedIntegerArray'
    pfconst[1] = $P0

    # "Hello World" string
    pfconst[2] = "Hello World"

    # "hello" is function name
    pfconst[3] = "hello"

    # "hello.pir" is our pir file which we are "compiling"
    pfconst[4] = "hello.pir"

    # We will need Sub PMC as well but will deal with it later.
    # Add PackfileConstantTable into directory.
    pfdir["CONSTANTS_hello.pir"] = pfconst

    # Generate bytecode
    pfbc = new 'PackfileRawSegment'
    oplib = new 'OpLib'

    # Here is our function
    $I0 = oplib['say_sc']
    pfbc[0] = $I0
    pfbc[1] = 0x002 # constant id.

    $I0 = oplib['set_returns_pc']
    pfbc[2] = $I0
    pfbc[3] = 0x001 # id of FIA

    $I0 = oplib['returncc']
    pfbc[4] = $I0

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

    $P1 = new 'Sub', $P0
    # and store it in PackfileConstantTable
    pfconst[5] = $P1

    # Dark magik. Create Fixup for Sub.
    pffixup = new 'PackfileFixupTable'
    # Add it to Directory now because adding FixupEntries require Directory
    pfdir["FIXUP_hello.pir"] = pffixup

    $P1 = new 'PackfileFixupEntry'
    $P1 = 'hello'
    $P1.'set_type'(2)
    $P1 = 5 # offset
    pffixup[0] = $P1

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
