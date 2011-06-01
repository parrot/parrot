class POST::Op is POST::Node;

=begin Description
C<POST::Op> nodes represents any PIR opcodes.
=end Description

=item pirop([opcode])
Get/set the opcode type for this node.

multi method pirop($param)      { self.attr('pirop', $param, 1); }
multi method pirop()            { self.attr('pirop', undef,  0); }

multi method inline($param)     { self.attr('inline', $param, 1); }
multi method inline()           { self.attr('inline', undef,  0); }

# Copyright (C) 2011, Parrot Foundation.

# vim: expandtab shiftwidth=4 ft=perl6
