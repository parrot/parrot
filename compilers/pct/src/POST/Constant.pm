class POST::Constant is POST::Value;

=begin

Representation of single PIR constant.

=end

our multi method value($param) { self.attr('value', $param, 1); }
our multi method value()       { self.attr('value', undef,  0); }

our method declared() { 1 };
# vim: ft=perl6

