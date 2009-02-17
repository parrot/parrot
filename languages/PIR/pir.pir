# Copyright (C) 2007-2008, Parrot Foundation.
# $Id$

.namespace [ 'PIR::Compiler' ]

.sub '__onload' :load :init
    load_bytecode 'PCT.pbc'

    $P0 = get_hll_global ['PCT'], 'HLLCompiler'
    $P1 = $P0.'new'()
    $P1.'language'('languages-PIR')
    $P1.'parsegrammar'('PIR::Grammar')
    $P1.'parseactions'('PIR::Grammar::Actions')

.end

.sub 'main' :main
    .param pmc args

    $P0 = compreg 'languages-PIR'
    $P1 = $P0.'command_line'(args)
.end

.include 'src/gen_actions.pir'
.include 'src/gen_grammar.pir'

.namespace [ 'PIR::Grammar' ]

.sub _load :load :init

    # The parser is split up into several files
    # for faster edit-compile-test cycles.
    # Compiling the file pasm_grammar takes ages
    # due to the large number of instructions.

    load_bytecode 'languages/PIR/src/pasm/gen_pasm.pbc'
    load_bytecode 'languages/PIR/src/pasm/gen_pasm_args.pbc'
    load_bytecode 'languages/PIR/src/pasm/gen_pasm_instr.pbc'
    load_bytecode 'languages/PIR/src/pasm/gen_pasm_io.pbc'
    load_bytecode 'languages/PIR/src/pasm/gen_pasm_pmc.pbc'
    load_bytecode 'languages/PIR/src/pasm/gen_pasm_core.pbc'
.end




.sub process_heredocs
        .param pmc mob


        .local pmc labels
        labels = get_root_global "heredoc"
        .local pmc id
        .local int count, i

        count = labels
        i = 0

    loop:
        if i >= count goto endloop
        id = shift labels
        i += 1

        printerr id
        #mob = heredoc_label(mob)
        #heredoc_label()

        goto loop
    endloop:

.end



.sub store_heredoc_label
    .param pmc mob
    .param pmc heredocid

    printerr heredocid
    printerr "\n"

    .local pmc labels
    labels = get_root_global "heredoc"
    push labels, heredocid

#   .local pmc iter, obj
#   iter = new .Iterator, labels
#   printerr "\n===============\n"
#loop:
#   unless iter goto endloop
#   obj = shift iter
#   printerr "Obj: "
#   printerr obj
#   printerr "\n"
#   goto loop
#endloop:
#   printerr "\n===============\n"
#   .return (mob, adverbs :flat :named)
.end

#
# Clear all heredoc labels
#
.sub clear_heredocs
        .local pmc labels
        .local int count, i
        labels = get_root_global 'heredoc'
        count = labels
        i = 0
    loop:
        if i >= count goto endloop
        delete labels[i]
        i += 1
        goto loop
    endloop:
        #printerr "=============\n"
.end






.sub warning
      .param pmc self
      .param string message

      if null self goto NO_SELF
      if null message goto NO_MSG

      printerr "Warning: "
      $P0 = get_hll_global ['PGE::Util'], 'warn'
      if null $P0 goto NO_WARN
      self.$P0(message)
      .return()
    NO_WARN:
      printerr "Cannot find method 'warn'\n"
      .return()
    NO_MSG:
      printerr "Warning: 'no message specified for warning()\n"
      .return()
    NO_SELF:
      printerr "No 'self' in warning()\n"

      .return()
.end

.sub syntax_error
    .param pmc self
    .param string message

    $P0 = get_hll_global ['PGE::Util'], 'line_number'
    if null $P0 goto NO_LINE_NR_METHOD
    $I0 = self.$P0()

    # line_number() starts counting at line 0, so increment:
    inc $I0

    printerr "Syntax error (line "
    printerr $I0
    printerr "): "
    printerr message
    printerr "\n\n"

    # increment parse errors
    .local pmc errs
    errs = get_root_global 'errors'
    inc errs

    .return()

    NO_LINE_NR_METHOD:
      printerr "can't find PGE::Util::line_number"
      exit 1
.end



=head2 Custom parse methods

The rules C<target> and C<label> need to be redefined when parsing
macros. These wrapper rules invoke the appropiate rules in pir.pg
depending on the context.

=cut

#.sub target
#        .param pmc mob
#        .param pmc adverbs :slurpy :named
#        $P0 = get_global 'macro_context'
#        if null $P0 goto do_normal
#        if $P0 > 0 goto do_macro
#    do_normal:
#        .return normal_target(mob, adverbs :flat :named)
#    do_macro:
#        .return macro_target(mob, adverbs :flat :named)
#.end


.sub label
        .param pmc mob
        .param pmc adverbs :slurpy :named
        $P0 = get_global 'macro_context'
        if null $P0 goto do_normal
        if $P0 > 0 goto do_macro
    do_normal:
        .tailcall normal_label(mob, adverbs :flat :named)
    do_macro:
        .tailcall macro_label_decl(mob, adverbs :flat :named)
.end

.sub init_macro_rules
        .local pmc macro_context
        macro_context = new 'Integer'
        macro_context = 1
        set_global 'macro_context', macro_context
.end

.sub close_macro_rules
        $P0 = get_global 'macro_context'
        $P0 = 0
.end







=head1 LICENSE

Copyright (C) 2007, Parrot Foundation.

This is free software; you may redistribute it and/or modify
it under the same terms as Parrot.

=head1 AUTHOR

Klaas-Jan Stol <parrotcode@gmail.com>

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
