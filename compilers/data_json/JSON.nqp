#! parrot-nqp

# This is the start to rewrite JSON. It starts with rewriting data_json only.
# data_json depends on the PGE. The rewrite use NQP.

INIT {
    pir::load_bytecode('P6Regex.pbc');
    pir::load_bytecode('dumper.pbc');
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
