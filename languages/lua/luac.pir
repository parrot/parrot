
=head1 NAME

luac -- A compiler for Lua 5.1

=head1 SYNOPSIS

 TODO

=head1 DESCRIPTION

C<luac> is a compiler for Lua version 5.1, running on Parrot.

=cut


.sub 'main' :main
    .param pmc args

    load_bytecode 'languages/lua/src/lua51.pbc'
    load_bytecode 'PGE/Dumper.pbc'

    # Register the Lua compiler
    $P0 = compreg 'Lua'

    # set up a global variable to keep track of syntax errors
    .local pmc errs
    errs = new .Integer
    set_root_global 'errors', errs

    $P1 = $P0.'command_line'(args)

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

.end

.namespace

.sub 'listmaker'
    .param pmc args            :slurpy
    unless null args goto have_args
    args = new .ResizablePMCArray
  have_args:
    .return (args)
.end

=head1 LICENSE

Copyright (C) 2007, The Perl Foundation.

This is free software; you may redistribute it and/or modify
it under the same terms as Parrot.

=head1 AUTHOR

Klaas-Jan Stol <parrotcode@gmail.com>

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
