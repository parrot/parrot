class POST::File is POST::Node;

=begin Description
Single compiled file. Use to store global constants, e.g. Subs and .global_const
=end Description

=item C<sub($name, $value?)
Get or set Sub declared in file.

method sub($name, $value?) {
    my %subs := self<subs>;
    unless %subs {
        self<subs> := hash();
        %subs := self<subs>;
    }

    if $value {
        %subs{$name} := $value;
    }

    %subs{$name};
}

# Copyright (C) 2011, Parrot Foundation.

# vim: expandtab shiftwidth=4 ft=perl6
