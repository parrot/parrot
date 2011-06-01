class POST::Label is POST::Node;

=item C<declared>
Set to 1 of we did see label: inside.

multi method declared($param) { self.attr('declared', $param, 1); }
multi method declared()       { self.attr('declared', undef,  0); }

# Position in bytecode segment.
multi method position($param) { self.attr('position', $param, 1); }
multi method position()       { self.attr('position', undef,  0); }

# Labels are always int constants.
multi method type()           { 'ic' }

method result($value?) {
    unless pir::defined__ip($value) {
        $value := self<value>;
        unless pir::defined__ip($value) {
            $value := self.unique(self.name);
        }
    }
    self<value> := $value;
    $value;
}

# Copyright (C) 2011, Parrot Foundation.

# vim: expandtab shiftwidth=4 ft=perl6
