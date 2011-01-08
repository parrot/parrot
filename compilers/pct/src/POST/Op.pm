class POST::Op is POST::Node;

=begin Description
C<POST::Op> nodes represents any PIR opcodes.
=end Description

=item pirop([opcode])
Get/set the opcode type for this node.

our multi method pirop($param)      { self.attr('pirop', $param, 1); }
our multi method pirop()            { self.attr('pirop', undef,  0); }

our multi method inline($param)     { self.attr('inline', $param, 1); }
our multi method inline()           { self.attr('inline', undef,  0); }

