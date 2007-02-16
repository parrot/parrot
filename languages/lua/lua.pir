
.namespace [ 'Lua' ]

.include "errors.pasm"

.sub '__onload' :load :init
    load_bytecode 'PGE.pbc'
    load_bytecode 'Parrot/HLLCompiler.pbc'
    load_bytecode 'PAST-pm.pbc'
    load_bytecode 'PGE/Util.pbc'
    load_bytecode 'PGE/Text.pbc'

    load_bytecode 'languages/lua/src/ASTGrammar.pbc'

    $P0 = new [ 'HLLCompiler' ]
    $P0.'language'('Lua')
    $P0.'parsegrammar'('Lua::Grammar')
    $P0.'astgrammar'('ASTGrammar')

.end

.sub 'main' :main
    .param pmc args

     # get program name for error reporting
    .local string prog
    prog = shift args

    # Sanity check parameters
    $I0 = args
    unless $I0 >= 1 goto ERR_TOO_FEW_ARGS

    # Register the Lua compiler
    $P0 = compreg 'Lua'

    # set up a global variable to keep track of syntax errors
    .local pmc errs
    errs = new .Integer
    set_root_global 'errors', errs


    # Process command line options
    load_bytecode "Getopt/Obj.pir"

    .local pmc getopts
    getopts = new "Getopt::Obj"
    getopts."notOptStop"(1)
    push getopts, "output|o=s"
    push getopts, "help|h"
    .local pmc opts
    opts = getopts."get_options"( args )

    # put back the program name
    unshift args, prog

    # handle help option
    .local string help
    help = opts['help']
    if help goto USAGE

    # handle target option
    .local string output
    output = opts['output']
    unless output goto OPTIONS_DONE
    if output == "PARSE" goto TARGET_PARSE
    if output == "PAST" goto TARGET_PAST
    if output == "PIRTIDY" goto TARGET_PIR
    if output == "PARSETREE" goto TARGET_PARSETREE
    goto ERR_UNKNOWN_TARGET

  OPTIONS_DONE:

  TARGET_PARSE:
    $P1 = $P0.'command_line'(args, 'target' => 'parse')
    goto DONE

  TARGET_PARSETREE:
    load_bytecode 'PGE/Dumper.pbc'
    load_bytecode 'dumper.pbc'
    $P1 = $P0.'command_line'(args, 'target' => 'parse')
    goto DONE

  TARGET_PAST:
    $P1 = $P0.'command_line'(args, 'target' => 'past')
    goto DONE

  TARGET_PIR:
    $P1 = $P0.'command_line'(args, 'target' => 'PIR')
    goto DONE

  ##COMPILE_AND_RUN:
  ##  $P1 = $P0.'command_line'(args)

  DONE:
    if errs > 0 goto ERR_MSG
    print "Parse successful!\n"
    .return($P1)

  ERR_MSG:
    if errs == 1 goto ONE_ERROR
    printerr "There were"
    printerr errs
    printerr " errors.\n"
    end

  ONE_ERROR:
    printerr "There was 1 error.\n"
    end

  USAGE:
     printerr "Usage: "
    printerr prog
    printerr " [OPTIONS] FILE\n"
    printerr <<"OPTIONS"
   Options:
    --help            -- print this message
    --output=TARGET   -- specify target
      possible targets are:
         PARSE     -- parse only (default)
         PAST      -- print Parrot AST
         PIRTIDY   -- print generated PIR code
         PARSETREE -- parse and print parse tree
OPTIONS
    exit 1

  ERR_TOO_FEW_ARGS:
    printerr "Error: too few arguments\n"
    goto USAGE
  ERR_UNKNOWN_TARGET:
    printerr "Error: "
    printerr output
    printerr " is an unknown target\n"
    exit 1
.end


.namespace [ 'Lua::Grammar' ]

.sub _load :load :init
    load_bytecode 'PGE.pbc'
    load_bytecode 'PGE/Text.pbc'

    $P0 = getclass 'PGE::Grammar'
    $P1 = subclass $P0, 'Lua::Grammar'

    load_bytecode 'languages/lua/src/lua_grammar_gen.pbc'
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







.sub 'long_string'
    .param pmc mob
    .param pmc adv :slurpy :named

    .local string target
    .local pmc mfrom, mpos
    .local int pos, lastpos
    (mob, target, mfrom, mpos) = mob.'newfrom'(mob)
    pos = mfrom
    lastpos = length target

    .local int sep
    sep = 0
    $S0 = substr target, pos, 1
    if $S0 != '[' goto END
    inc pos
    (pos, sep) = _skip_sep(target, pos, '[')
    if sep >= 0 goto L1
    if sep == -1 goto END
    error(mob, "invalid long string delimiter")
L1:
    inc pos
    $S0 = substr target, pos, 1
    $I0 = index "\n\r", $S0
    if $I0 < 0 goto L2
    inc pos
L2:

    .local string literal
    literal = ''
LOOP:
    if pos < lastpos goto L3
    error(mob, "unfinished long string")
L3:
    $S0 = substr target, pos, 1
    if $S0 != '[' goto L4
    inc pos
    $S0 = substr target, pos, 1
    if $S0 != '[' goto L5
    error(mob, "nesting of [[...]] is deprecated")
L5:
    dec pos
    goto CONCAT
L4:
    if $S0 != ']' goto L6
    inc pos
    ($I0, $I1) = _skip_sep(target, pos, ']')
    if $I1 != sep goto L7
    pos = $I0 + 1
    mob.'value'(literal)
    mpos = pos
    goto END
L7:
    dec pos
    goto CONCAT
L6:
    $I0 = index "\n\r", $S0
    if $I0 < 0 goto L8
    $S0 = "\n"
    goto CONCAT
L8:

CONCAT:
    concat literal, $S0
    inc pos
    goto LOOP

END:
    .return (mob)
.end



.sub 'long_comment'
    .param pmc mob
    .param pmc adv :slurpy :named

    .local string target
    .local pmc mfrom, mpos
    .local int pos, lastpos
    (mob, target, mfrom, mpos) = mob.'newfrom'(mob)
    pos = mfrom
    lastpos = length target

    .local int sep
    sep = 0
    $S0 = substr target, pos, 1
    if $S0 != '[' goto END
    inc pos
    (pos, sep) = _skip_sep(target, pos, '[')
    if sep < 0 goto END
    inc pos
#    $S0 = substr target, pos, 1
#    $I0 = index "\n\r", $S0
#    if $I0 < 0 goto L2
#    inc pos
#L2:

#    .local string literal
#    literal = ''
LOOP:
    if pos < lastpos goto L3
    error(mob, "unfinished long comment")
L3:
    $S0 = substr target, pos, 1
    if $S0 != '[' goto L4
    inc pos
    $S0 = substr target, pos, 1
    if $S0 != '[' goto L5
    error(mob, "nesting of [[...]] is deprecated")
L5:
    dec pos
    goto CONCAT
L4:
    if $S0 != ']' goto L6
    inc pos
    ($I0, $I1) = _skip_sep(target, pos, ']')
    if $I1 != sep goto L7
    pos = $I0 + 1
#    mob.'value'(literal)
    mpos = pos
    goto END
L7:
    dec pos
    goto CONCAT
L6:
    $I0 = index "\n\r", $S0
    if $I0 < 0 goto L8
#    $S0 = "\n"
    goto CONCAT
L8:

CONCAT:
#    concat literal, $S0
    inc pos
    goto LOOP

END:
    .return (mob)
.end

.sub _skip_sep
    .param string target
    .param int pos
    .param string delim
    .local int count
    count = 0
L1:
    $S0 = substr target, pos, 1
    if $S0 != '=' goto L2
    inc count
    inc pos
    goto L1
L2:
    if $S0 == delim goto L3
    neg count
    dec count
L3:
    .return (pos, count)
.end






=head1 LICENSE

Copyright (C) 2007, The Perl Foundation.

This is free software; you may redistribute it and/or modify
it under the same terms as Parrot.

=head1 AUTHOR

Klaas-Jan Stol <parrotcode@gmail.com>

=cut
