class POST::Call is POST::Node;

=begin Description

POST node to represent single PCC call (including .tailcall and .return)

=end Description

our multi method name($param)       { self.attr('name', $param, 1); }
our multi method name()             { self.attr('name', undef,  0); }

our multi method params($param)     { self.attr('params', $param, 1); }
our multi method params()           { self.attr('params', undef,  0); }

our multi method results($param)    { self.attr('results', $param, 1); }
our multi method results()          { self.attr('results', undef,  0); }

our multi method invocant($param)   { self.attr('invocant', $param, 1); }
our multi method invocant()         { self.attr('invocant', undef,  0); }

=item C<calltype>
Type of call. One of C<call>, C<tailcall>, C<return>, C<yield>, C<results>.

our multi method calltype($param)   { self.attr('calltype', $param, 1); }
our multi method calltype()         { self.attr('calltype', undef,  0); }


# vim: ft=perl6
