class POST::Constant is POST::Value;

=begin

Representation of single PIR constant.

=end

multi method value($param) { self.attr('value', $param, 1); }
multi method value()       { self.attr('value', undef,  0); }

method declared() { 1 };

# Copyright (C) 2011, Parrot Foundation.

# vim: expandtab shiftwidth=4 ft=perl6
