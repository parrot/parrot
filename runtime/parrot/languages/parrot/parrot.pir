# Copyright (C) 2009, Parrot Foundation.

.HLL 'parrot'
.namespace ['Parrot';'Compiler']

.sub '__load_bytecode' :anon
    .param string pbc_name
    .param string tag
    $P0 = load_bytecode pbc_name
    $I0 = $P0.'is_initialized'(tag)
    if $I0 goto done_initialization

    $P1 = $P0.'subs_by_tag'(tag)
    $P2 = iter $P1
  loop_top:
    unless $P2 goto loop_bottom
    $P3 = shift $P2
    $P3()
    goto loop_top
  loop_bottom:

    $P0.'mark_initialized'(tag)
  done_initialization:
.end

.sub 'load' :anon :tag('load') :tag('init')
    # I'm not sure if this is completely right...
    .local pmc p6meta, c

    '__load_bytecode'('PCT.pbc', 'load')

    p6meta = get_hll_global 'P6metaclass'
    c = p6meta.'new_class'('Parrot::Compiler', 'parent'=>'PCT::HLLCompiler')
    c.'language'('parrot')
.end

.sub 'load_library' :method
    .param pmc name
    .param pmc extra :named :slurpy
    .local pmc name, library, ns, inc_hash
    .local string file
    $I0 = does name, 'array'
    if $I0 goto have_namelist
    $S0 = name
    name = split '::', $S0
  have_namelist:
    file = join '/', name
    file = concat file, '.pir'
    '__load_bytecode'(file)
    library = new 'Hash'
    library['name'] = name
    library['filename'] = file
    ns = get_hll_namespace name
    library['namespace'] = ns
    $P0 = ns['EXPORT']
    if null $P0 goto no_exports
    library['symbols'] = $P0
    goto symbols_done
  no_exports:
    $P0 = new 'Hash'
    $P0['ALL'] = ns
    $P0['DEFAULT'] = ns
    library['symbols'] = $P0
  symbols_done:
    .return (library)
  fail:
    # TODO: better fail?
    .return (0)
.end

.sub 'export' :method
    .param pmc symbols
    .param pmc tags    :optional
    .param pmc from_ns :optional

    # 1. Canonify / default params

    # If space-delimited symbol string, canonify to array;
    # may also pass a hash to allow symbol rename during export
    $I0 = does symbols, 'array'
    $I1 = does symbols, 'hash'
    $I2 = $I0 | $I1
    if $I2 goto symbols_ready
    $S0 = symbols
    symbols = split ' ', $S0
  symbols_ready:

    # If space-delimited tag string, canonify to array;
    # if no tags, use ALL and DEFAULT
    unless null tags goto have_tags
    tags = new 'ResizableStringArray'
    tags.'push'('ALL')
    tags.'push'('DEFAULT')
    goto tags_is_array
  have_tags:
    $I0 = does tags, 'array'
    if $I0 goto tags_is_array
    $S0 = tags
    tags = split ' ', $S0
  tags_is_array:

    # If no from_ns, export from caller's namespace
    unless null from_ns goto has_from_ns
    $P0 = getinterp
    from_ns = $P0['namespace'; 1]
  has_from_ns:

    # 2. Export symbols to each tag namespace
    # (e.g. ['parrot';'Module';'Name';'EXPORT';'tagname'])

    # rel_ns_key will hold ['EXPORT';'tagname'] for each tagname
    .local pmc rel_ns_key
    rel_ns_key = new 'ResizableStringArray'
    rel_ns_key.'push'('EXPORT')

    # For each tagname, use rel_ns_key to make a new EXPORT namespace
    # and export all symbols to it, using native NameSpace .export_to()
    .local pmc tag_iter, export_ns
    tag_iter = iter tags
  tag_loop:
    unless tag_iter goto tag_loop_end
    $S0 = shift tag_iter
    rel_ns_key.'push'($S0)
    export_ns = from_ns.'make_namespace'(rel_ns_key)
    from_ns.'export_to'(export_ns, symbols)
    rel_ns_key.'pop'()
    goto tag_loop
  tag_loop_end:

.end

.sub 'import' :method :multi(_,_)
    .param pmc library
    .local pmc i, targetns
    i = getinterp
    targetns = i['namespace';1]
    .tailcall self.'import'('parrot',library,'targetns'=>targetns)
.end

.sub 'import' :method :multi(_,_,_)
    .param string lang
    .param pmc library
    .param pmc targetns :named('targetns') :optional
    .local pmc name, compiler, library, imports
    $S0 = library
    name = split '::', $S0
    compiler = compreg lang
    unless null targetns goto has_targetns
    $P0 = getinterp
    targetns = $P0['namespace';1]
  has_targetns:
    library = compiler.'load_library'(name)
    imports = library['symbols']
    imports = imports['DEFAULT']
    .local pmc ns_iter, item
    ns_iter = iter imports
  import_loop:
    unless ns_iter goto import_loop_end
    $S0 = shift ns_iter
    $P0 = imports[$S0]
    targetns[$S0] = $P0
    goto import_loop
  import_loop_end:
    #foreignlibns = library['namespace']
    #if null foreignlibns goto no_foreign_ns
    #$S0 = pop name
    #set_hll_global name, $S0, foreignlibns
    #no_foreign_ns:
    .return (library)
.end

# TODO Should this provide support for loading HLL libraries?

=head1 NAME

languages/parrot/parrot.pir - Compiler object for interop between HLLs and
Parrot-hosted languages

=head1 SYNOPSIS

    # NameSpace MUST match path!
    .namespace ['Foo']
    .sub 'load' :anon :tag('load') :tag('init')
        .local pmc c
        load_language 'parrot'
        c = compreg 'parrot'
        c.'export'('dance leap')
    .end

    .sub 'dance'
        say 'lol dancing'
    .end

    .sub 'leap'
        say 'like dancing, but fancier'
    .end

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

