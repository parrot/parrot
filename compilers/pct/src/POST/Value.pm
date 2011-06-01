class POST::Value is POST::Node;

=begin Description
Typed PIR value. Either Constant of Register.
=end Description

=begin Attributes

=item C<name>
Name of value. Reference to POST::Sub's symtable.

=item C<type>
Type of value. One of <i n s p ic nc sc pc> for Registers and Constants.

=item C<flags>
PCC call params or returns flags

=end Attributes

multi method name($param) { self.attr('name', $param, 1); }
multi method name()       { self.attr('name', undef,  0); }

multi method type($param) { self.attr('type', $param, 1); }
multi method type()       { self.attr('type', undef,  0); }

multi method flags(%flags) { self.attr('flags', %flags, 1); }
multi method flags()       { self.attr('flags', undef,  0); }

# PCC call modifier. E.g. :slurpy, :flat, etc
multi method modifier($param) { self.attr('modifier', $param, 1); }
multi method modifier()       { self.attr('modifier', undef,  0); }

multi method declared()    { 0 };

# Copyright (C) 2011, Parrot Foundation.

# vim: expandtab shiftwidth=4 ft=perl6
