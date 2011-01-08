class POST::File is POST::Node;

=begin Description
Single compiled file. Use to store global constants, e.g. Subs and .global_const
=end Description

=item C<sub($name, $value?)
Get or set Sub declared in file.

our method sub($name, $value?) {
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



# vim: ft=perl6
