=head1 NAME

POST::Compiler - Compiler for POST trees

=head1 DESCRIPTION

POST::Compiler defines a compiler that converts a POST tree into
either PIR or executable bytecode.

=head1 METHODS

=cut

.namespace [ 'POST::Compiler' ]

.sub '__onload' :load :init
    load_bytecode 'Parrot/HLLCompiler.pbc'

    $P99 = subclass 'HLLCompiler', 'POST::Compiler'
    $P0 = new 'POST::Compiler'
    $P0.'language'('POST')
    .return ()
.end


.sub 'compile' :method
    .param pmc post
    .param pmc adverbs         :slurpy :named

    .local string target
    target = adverbs['target']
    target = downcase target
    if target != 'post' goto compile_post
    .return (post)

  compile_post:
    $I0 = isa post, 'POST::Sub'
    if $I0 goto with_sub
    post = post.'new'('POST::Sub', post, 'name'=>'anon')
  with_sub:
    .local pmc code
    code = new 'PGE::CodeString'
    set_hll_global ['POST'], '$!subpir', code
    post.'pir'()

    code = get_hll_global ['POST'], '$!subpir'
    if target != 'pir' goto compile_pir
    .return (code)

  compile_pir:
    $P0 = compreg 'PIR'
    $P0 = $P0(code)
    .return ($P0)
.end


