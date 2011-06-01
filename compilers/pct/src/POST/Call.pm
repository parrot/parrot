class POST::Call is POST::Node;

=begin Description

POST node to represent single PCC call (including .tailcall and .return)

=end Description

multi method name($param)       { self.attr('name', $param, 1); }
multi method name()             { self.attr('name', undef,  0); }

multi method params($param)     { self.attr('params', $param, 1); }
multi method params()           { self.attr('params', undef,  0); }

multi method results($param)    { self.attr('results', $param, 1); }
multi method results()          { self.attr('results', undef,  0); }

multi method invocant($param)   { self.attr('invocant', $param, 1); }
multi method invocant()         { self.attr('invocant', undef,  0); }

=item C<calltype>
Type of call. One of C<call>, C<tailcall>, C<return>, C<yield>, C<results>.

multi method calltype($param)   { self.attr('calltype', $param, 1); }
multi method calltype()         { self.attr('calltype', undef,  0); }

# Copyright (C) 2011, Parrot Foundation.

# vim: expandtab shiftwidth=4 ft=perl6
