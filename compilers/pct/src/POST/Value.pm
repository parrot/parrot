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

our multi method name($param) { self.attr('name', $param, 1); }
our multi method name()       { self.attr('name', undef,  0); }

our multi method type($param) { self.attr('type', $param, 1); }
our multi method type()       { self.attr('type', undef,  0); }

our multi method flags(%flags) { self.attr('flags', %flags, 1); }
our multi method flags()       { self.attr('flags', undef,  0); }

# PCC call modifier. E.g. :slurpy, :flat, etc
our multi method modifier($param) { self.attr('modifier', $param, 1); }
our multi method modifier()       { self.attr('modifier', undef,  0); }

our multi method declared()    { 0 };

# vim: ft=perl6
