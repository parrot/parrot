# Copyright (C) 2006-2007, The Perl Foundation.
# $Id$

=head1 NAME

luac -- A compiler for Lua 5.1

=head1 SYNOPSIS

  $ parrot luac.pbc script.lua
  $ parrot luac.pbc --target=parse script.lua
                             PAST
                             POST
                             PIR

=head1 DESCRIPTION

C<luac> is a compiler for Lua version 5.1, running on Parrot.

=cut

.sub 'main' :main
    .param pmc args
    load_bytecode 'languages/lua/src/lua51.pbc'
    load_bytecode 'PGE/Dumper.pbc'
    $P0 = compreg 'Lua'
    $P0.'command_line'(args)
.end

=head1 AUTHOR

Klaas-Jan Stol <parrotcode@gmail.com>

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
