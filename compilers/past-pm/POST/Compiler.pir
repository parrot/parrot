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

    $I0 = isa post, 'POST::Sub'
    if $I0 goto with_sub
    $S0 = typeof post
    say $S0
    post = post.'new'('POST::Sub', post, 'name'=>'anon')
  with_sub:
    .local pmc code
    code = new 'PGE::CodeString'
    set_hll_global ['POST'], '$!subpir', code
    post.'pir'()

    code = get_hll_global ['POST'], '$!subpir'
    .return (code)
.end



# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
