class POST::String is POST::Constant;

=begin

Representation of single PIR constant string.

=end

our multi method charset($param) { self.attr('charset', $param, 1); }
our multi method charset()       { self.attr('charset', undef,  0); }

our multi method encoding($param) { self.attr('encoding', $param, 1); }
our multi method encoding()       { self.attr('encoding', undef,  0); }

# vim: ft=perl6

