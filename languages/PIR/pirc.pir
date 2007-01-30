.namespace [ 'PIR' ]

.include "errors.pasm"

.sub '__onload' :load, :init
    load_bytecode 'PGE.pbc'
    load_bytecode 'Parrot/HLLCompiler.pir'
    load_bytecode 'PAST-pm.pbc'
    load_bytecode 'PGE/Util.pbc'

    load_bytecode 'languages/PIR/lib/ASTGrammar.pbc'

    $P0 = new [ 'HLLCompiler' ]
    $P0.'language'('PIR')
    $P0.'parsegrammar'('PIRGrammar')
    $P0.'astgrammar'('ASTGrammar')

.end

.sub 'main' :main
    .param pmc args

    ## prevent printing of ASTs to the screen
    #load_bytecode 'PGE/Dumper.pbc'
    #load_bytecode 'dumper.pbc'

    $P0 = compreg 'PIR'

    # set up a global variable to keep track of syntax errors
    .local pmc errs
    errs = new .Integer
    set_root_global 'errors', errs

    push_eh unexpected_exc
    $P1 = $P0.'command_line'(args, 'target' => 'parse')
    #$P1 = $P0.'command_line'(args, 'target' => 'past')
    #$P1 = $P0.'command_line'(args)
    if errs > 0 goto err_msg
    print "Parse successful!\n"

    clear_eh
    .return($P1)

 err_msg:
    printerr "There "
    if errs == 1 goto one_error
    printerr "were "
    printerr errs
    printerr " errors.\n"
    end

 one_error:
    printerr "was 1 error.\n"
    end

 unexpected_exc:
    .local pmc exception, message
    .get_results (exception, message)
    printerr "Unexpected exception: "
    if null message goto no_msg
    if null exception goto no_exc

    printerr message
    printerr "\n"
    end

 no_msg:
    printerr "No message"
    end
 no_exc:
    printerr "No exception\n"
    end
.end


.namespace [ 'PIRGrammar' ]

.sub _load :load :init
    load_bytecode 'PGE.pbc'
    load_bytecode 'PGE/Text.pbc'

    $P0 = getclass 'PGE::Grammar'
    $P1 = subclass $P0, 'PIRGrammar'

    # The parser is split up into several files
    # for faster edit-compile-test cycles.
    # Compiling the file pasm_grammar takes ages
    # due to the large number of instructions.
    load_bytecode 'languages/PIR/lib/pir_grammar_gen.pbc'
    load_bytecode 'languages/PIR/lib/pasm_grammar_gen.pbc'
    load_bytecode 'languages/PIR/lib/pasm_args_gen.pbc'
    load_bytecode 'languages/PIR/lib/pasm_instr_gen.pbc'
    load_bytecode 'languages/PIR/lib/pasm_io_gen.pbc'
    load_bytecode 'languages/PIR/lib/pasm_pmc_gen.pbc'
    load_bytecode 'languages/PIR/lib/pasm_core_gen.pbc'
.end


.sub warning
  .param pmc self
  .param string message


  if null self goto no_self
  if null message goto no_msg

  printerr "Warning: "
  $P0 = get_hll_global ['PGE::Util'], 'warn'
  if null $P0 goto no_warn
  self.$P0(message)
  .return()
no_warn:
  print "Cannot find method 'warn'\n"
  .return()
no_msg:
  print "Warning: 'no message specified for warning()\n"
  .return()
no_self:
  print "No 'self' in warning()\n"
  .return()
.end

.sub syntax_error
  .param pmc self
  .param string message

  $P0 = get_hll_global ['PGE::Util'], 'line_number'
  if null $P0 goto no_line_nr_method
  $I0 = self.$P0()

  # line_number() starts counting at line 0, so increment:
  inc $I0

  printerr "Syntax error (line "
  printerr $I0
  printerr "): "
  printerr message
  printerr "\n\n"

  .local pmc errs
  errs = get_root_global 'errors'
  inc errs

  .return()
no_line_nr_method:
  printerr "can't find PGE::Util::line_number"
  end
.end


=head1 LICENSE

Copyright (C) 2007, The Perl Foundation.

This is free software; you may redistribute it and/or modify
it under the same terms as Parrot.

=head1 AUTHOR

Klaas-Jan Stol <parrotcode@gmail.com>

=cut
