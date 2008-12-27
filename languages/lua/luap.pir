# Copyright (C) 2007-2008, The Perl Foundation.
# $Id$

=head1 NAME

luap -- A compiler for Lua 5.1

=head1 SYNOPSIS

  $ parrot luap.pir script.lua
  $ parrot luap.pir --target=parse script.lua
                             PAST
                             POST
                             PIR

=head1 DESCRIPTION

C<luap> is a compiler for Lua 5.1 on Parrot.

=cut

.sub 'main' :anon :main
    .param pmc args
    load_bytecode 'languages/lua/lua.pbc'
    $P0 = compreg 'Lua'
    $S0 = "Compiler Lua 5.1 on Parrot  Copyright (C) 2005-2008, The Perl Foundation.\n"
    $P0.'commandline_banner'($S0)
    $P0.'command_line'(args)
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
