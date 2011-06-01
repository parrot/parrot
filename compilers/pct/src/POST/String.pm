class POST::String is POST::Constant;

=begin

Representation of single PIR constant string.

=end

multi method charset($param) { self.attr('charset', $param, 1); }
multi method charset()       { self.attr('charset', undef,  0); }

multi method encoding($param) { self.attr('encoding', $param, 1); }
multi method encoding()       { self.attr('encoding', undef,  0); }

# Copyright (C) 2011, Parrot Foundation.

# vim: expandtab shiftwidth=4 ft=perl6
