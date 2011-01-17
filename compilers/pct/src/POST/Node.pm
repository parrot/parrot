=begin NAME

POST - Parrot opcode syntax tree

=end NAME

=begin DESCRIPTION

Base class for all POST::* classes.

=end DESCRIPTION

class POST::Node is PCT::Node;

=item result
Get or set the result value of this node.  If the result value
is set to another POST node, then that node's result is used
as the result of the current node.

method result($result?) {
    if pir::defined($result) {
        self<result> := $result;
    }
    else {
        $result := self<result>;
        if !pir::defined($result) {
            $result := '';
        }
        elsif pir::isa($result, POST::Node) {
            $result := $result.result();
        }
    }
    $result;
}

=item get_string()
Returns the result of the current node as a string.

method get_string() is pirflags<:vtable('get_string')> {
    self.result();
}

=item push_pirop(pirop [,arglist :slurpy] [,adverbs :slurpy :named])
Shortcut for creating and adding a new POST::Op node with opcode
C<pirop> and any supplied arguments or options.  Returns the
newly created node.

method push_pirop($pirop, *@arglist, *%adverbs) {
    %adverbs<pirop> := $pirop;
    my $op := POST::Op.new(|@arglist, |%adverbs);
    self.push($op);
    $op;
}


=item escape(str)
Return C<str> as a PIR constant string.  (Deprecated in favor of
C<PAST::Compiler.escape>.)

method escape($str) {
    PAST::Compiler.escape($str);
}


=begin AUTHOR

Patrick Michaud <pmichaud@pobox.com> is the author and maintainer.
Please send patches and suggestions to the Parrot porters or
Perl 6 compilers mailing lists.

=end AUTHOR

=begin HISTORY

2011-01-10  Migrate to NQP from PIR.
2007-11-21  Significant refactor as part of Parrot Compiler Toolkit

=end HISTORY

=begin COPYRIGHT

Copyright (C) 2006-2011, Parrot Foundation.

=end COPYRIGHT


# Local Variables:
#   mode: perl6
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=perl6
