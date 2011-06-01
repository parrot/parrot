class POST::Register is POST::Value;

=begin

Representation of single PIR register

=end

=begin
=item C<declared>
Boolean flag which set when register declared.

Always set to 1 for "numbered" registers.
=end
multi method declared($param) { self.attr('declared', $param, 1); }
multi method declared()       { self.attr('declared', undef,  0); }

multi method regno($param) { self.attr('regno', $param, 1); }
multi method regno()       { self.attr('regno', undef,  0); }

# Copyright (C) 2011, Parrot Foundation.

# vim: expandtab shiftwidth=4 ft=perl6
