
=head1 NAME

luac -- A compiler for Lua 5.1

=head1 SYNOPSIS

 TODO

=head1 DESCRIPTION

C<luac> is a compiler for Lua version 5.1, running on Parrot.

=cut


.sub 'main' :main
    .param pmc args

    load_bytecode 'languages/lua/src/lua.pbc'

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

=head1 LICENSE

Copyright (C) 2007, The Perl Foundation.

This is free software; you may redistribute it and/or modify
it under the same terms as Parrot.

=head1 AUTHOR

Klaas-Jan Stol <parrotcode@gmail.com>

=cut
