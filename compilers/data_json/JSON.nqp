#! parrot-nqp

# Copyright (C) 2011, Parrot Foundation.

# This is the start to rewrite JSON. It starts with rewriting data_json only.
# data_json depends on the PGE. The rewrite use NQP.


=begin Pod

=for NAME
JSON, a lightweight data-interchange format.

=head1 SYNOPSIS

The C<from_json> method return a PMC that containing the data structure
for a given valid JSON (JavaScript Object Notation) string.
For example:

=begin code

.sub 'main' :main
    .local pmc result

    load_language 'JSON'
    result = from_json( '[1,2,3]' )

    load_bytecode 'dumper.pbc'
    _dumper( result, 'JSON' )
.end

=end code

For more information about the structure of the JSON representation, see
the documentation at L<http://www.json.org/>.

=end Pod


INIT {
    my $pbc := pir::load_bytecode__ps('P6Regex.pbc');
    if (!$pbc.is_initialized('load')) {
        for $pbc.subs_by_tag('load') -> $sub { $sub(); };
        $pbc.mark_initialized(;load');
    }
}

grammar JSON::Grammar is HLL::Grammar {
    rule TOP { <value> }

    proto token value { <...> }

    token value:sym<string> { <string> }

    token value:sym<number> {
        '-'?
        [ <[1..9]> <[0..9]>+ | <[0..9]> ]
        [ '.' <[0..9]>+ ]?
        [ <[Ee]> <[+\-]>? <[0..9]>+ ]?
#        <.worry('oh, a number!')>
    }

    rule value:sym<array> {
        '[' [ <value> ** ',' ]? ']'
    }

    rule value:sym<object> {
        '{'
        [ [ <string> ':' <value> ] ** ',' ]?
        '}'
    }

    rule value:sym<true> {
        'true'
    }

    rule value:sym<false> {
        'false'
    }

    rule value:sym<null> {
        'null'
    }

    token string {
        <?["]> <quote_EXPR: ':qq'>
    }
}


class JSON::Actions is HLL::Actions {
    method TOP($/) {
        make PAST::Block.new($<value>.ast, :node($/));
    };

    method value:sym<string>($/) { make $<string>.ast; }

    method value:sym<number>($/) { make +$/; }

    method value:sym<array>($/) {
        my $past := PAST::Op.new(:pasttype<list>, :node($/));
        if $<value> {
            for $<value> { $past.push($_.ast); }
        }
        make $past;
    }

    method value:sym<object>($/) {
        my $past := PAST::Stmts.new( :node($/) );
        my $hashname := PAST::Compiler.unique('hash');
        my $hash := PAST::Var.new( :scope<register>, :name($hashname),
                                   :viviself('Hash'), :isdecl );
        my $hashreg := PAST::Var.new( :scope<register>, :name($hashname) );
        $past.'push'($hash);
        # loop through all string/value pairs, add set opcodes for each pair.
        my $n := 0;
        while $n < +$<string> {
            $past.'push'(PAST::Op.new( :pirop<set__vQ~*>, $hashreg,
                                       $<string>[$n].ast, $<value>[$n].ast ) );
            $n++;
        }
        # return the Hash as the result of this node
        $past.'push'($hashreg);
        make $past;
    }

    method value:sym<true>($/) { make 1; }

    method value:sym<false>($/) { make 0; }

    method string($/) { make $<quote_EXPR>.ast; }
}


class JSON::Compiler is HLL::Compiler {
    INIT {
        JSON::Compiler.language('JSON');
        JSON::Compiler.parsegrammar(JSON::Grammar);
        JSON::Compiler.parseactions(JSON::Actions);
    }
}


sub from_json($value) {
     my $result := JSON::Compiler.eval($value, :actions(JSON::Actions.new));
     return $result;
}


# vim: expandtab shiftwidth=4 ft=perl6:
