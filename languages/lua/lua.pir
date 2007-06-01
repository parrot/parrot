# Copyright (C) 2006-2007, The Perl Foundation.
# $Id$

=head1 NAME

lua -- An interpreter for Lua 5.1

=head1 SYNOPSIS

  $ parrot lua.pbc script.lua
  $ parrot lua.pbc --target=parse script.lua
                            PAST
                            POST
                            PIR

=head1 DESCRIPTION

C<lua> is a interpreter for Lua version 5.1, running on Parrot.

=cut

.sub 'main' :main
    .param pmc args
    load_bytecode 'PGE/Dumper.pbc'
    $P0 = compreg 'Lua'
    $P0.'command_line'(args)
.end

.include 'languages/lua/src/lua51.pir'

.HLL "Lua", "lua_group"

=head1 SEE ALSO

F<languages/lua/doc/status.pod>

=head1 AUTHORS

Francois Perrad

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
