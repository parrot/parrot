#!./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

INIT {
    pir::load_bytecode('PCT/Pattern.pbc');
}

class PAST::Pattern is PCT::Pattern {
    method returns ($val?) {
        self.attr("returns", $val, !pir::isnull__iP($val));
    }

    method arity ($val?) {
        self.attr("arity", $val, !pir::isnull__iP($val));
    }

    method named ($val?) {
        self.attr("named", $val, !pir::isnull__iP($val));
    }

    method flat ($val?) {
        self.attr("flat", $val, !pir::isnull__iP($val));
    }

    method lvalue ($val?) {
        self.attr("lvalue", $val, !pir::isnull__iP($val));
    }    

    method new (*@children, *%attrs) {
        my $result := Q:PIR {
            $P0 = self.'HOW'()
            $P0 = getattribute $P0, 'parrotclass'
            %r = new $P0
        };

        for %attrs {
            $result.attr($_, %attrs{$_}, 1);
        }
        for @children {
            pir::push($result, Tree::Pattern::patternize($_));
        }
        $result;
    }

    method check_past_node_attributes ($node, $/) {
        (self.check_pct_node_attributes($node, $/)
         && self.check_attribute($node, "returns", $/)
         && self.check_attribute($node, "arity", $/)
         && self.check_attribute($node, "named", $/)
         && self.check_attribute($node, "flat", $/)
         && self.check_attribute($node, "lvalue", $/));
    }
}

class PAST::Pattern::Block is PAST::Pattern {
    method blocktype ($val?) {
        self.attr("blocktype", $val, !pir::isnull__iP($val));
    }

    method closure ($val?) {
        self.attr("closure", $val, !pir::isnull__iP($val));
    }

    method control ($val?) {
        self.attr("control", $val, !pir::isnull__iP($val));
    }

    method loadinit ($val?) {
        self.attr("loadinit", $val, !pir::isnull__iP($val));
    }

    method namespace ($val?) {
        self.attr("namespace", $val, !pir::isnull__iP($val));
    }

    method multi ($val?) {
        self.attr("multi", $val, !pir::isnull__iP($val));
    }

    method hll ($val?) {
        self.attr("hll", $val, !pir::isnull__iP($val));
    }

    method nsentry ($val?) {
        self.attr("nsentry", $val, !pir::isnull__iP($val));
    }

    method symtable ($val?) {
        self.attr("symtable", $val, !pir::isnull__iP($val));
    }

    method lexical ($val?) {
        self.attr("lexical", $val, !pir::isnull__iP($val));
    }

    method compiler ($val?) {
        self.attr("compiler", $val, !pir::isnull__iP($val));
    }

    method compiler_args ($val?) {
        self.attr("compiler_args", $val, !pir::isnull__iP($val));
    }

    method subid ($val?) {
        self.attr("subid", $val, !pir::isnull__iP($val));
    }

    method pirflags ($val?) {
        self.attr("pirflags", $val, !pir::isnull__iP($val));
    }
    
    method ACCEPTSEXACTLY ($node) {
        return Tree::Pattern::Match.new(0) unless $node ~~ PAST::Block;
        my $/ := Tree::Pattern::Match.new(1);
        (self.check_attribute($node, "blocktype", $/)
         && self.check_attribute($node, "closure", $/)
         && self.check_attribute($node, "control", $/)
         && self.check_attribute($node, "loadinit", $/)
         && self.check_attribute($node, "namespace", $/)
         && self.check_attribute($node, "multi", $/)
         && self.check_attribute($node, "hll", $/)
         && self.check_attribute($node, "nsentry", $/)
         && self.check_attribute($node, "symtable", $/)
         && self.check_attribute($node, "lexical", $/)
         && self.check_attribute($node, "compiler", $/)
         && self.check_attribute($node, "compiler_args", $/)
         && self.check_attribute($node, "subid", $/)
         && self.check_attribute($node, "pirflags", $/)
         && self.check_children($node, $/)
         && self.check_past_node_attributes($node, $/));
        $/.from($node) if $/;
        $/;
    }
}


class PAST::Pattern::Op is PAST::Pattern {
    method pasttype ($val?) {
        self.attr("pasttype", $val, !pir::isnull__iP($val));
    }

    method pirop ($val?) {
        self.attr("pirop", $val, !pir::isnull__iP($val));
    }

    method inline ($val?) {
        self.attr("inline", $val, !pir::isnull__iP($val));
    }


    method ACCEPTSEXACTLY ($node) {
        return Tree::Pattern::Match.new(0) unless $node ~~ PAST::Op;
        my $/ := Tree::Pattern::Match.new(1);
        (self.check_attribute($node, "pasttype", $/)
         && self.check_attribute($node, "pirop", $/)
         && self.check_attribute($node, "inline", $/)
         && self.check_children($node, $/)
         && self.check_past_node_attributes($node, $/));
        $/.from($node) if $/;
        $/;
    }
}

class PAST::Pattern::Stmts is PAST::Pattern {
    method ACCEPTSEXACTLY ($node) {
        return Tree::Pattern::Match.new(0) unless $node ~~ PAST::Stmts;
        my $/ := Tree::Pattern::Match.new(1);
        (self.check_children($node, $/)
         && self.check_past_node_attributes($node, $/));
        $/.from($node) if $/;
        $/;
    }
}

class PAST::Pattern::Val is PAST::Pattern {
    method value ($val?) {
        self.attr("value", $val, !pir::isnull__iP($val));
    }

    method ACCEPTSEXACTLY ($node) {
        return Tree::Pattern::Match.new(0) unless $node ~~ PAST::Val;
        my $/ := Tree::Pattern::Match.new(1);
        (self.check_children($node, $/)
         && self.check_past_node_attributes($node, $/)
         && self.check_attribute($node, "value", $/));
        $/.from($node) if $/;
        $/;
    }
}

class PAST::Pattern::Var is PAST::Pattern {
    method scope ($val?) {
        self.attr("scope", $val, !pir::isnull__iP($val));
    }

    method isdecl ($val?) {
        self.attr("isdecl", $val, !pir::isnull__iP($val));
    }

    method namespace ($val?) {
        self.attr("namespace", $val, !pir::isnull__iP($val));
    }

    method slurpy ($val?) {
        self.attr("slurpy", $val, !pir::isnull__iP($val));
    }

    method call_sig ($val?) {
        self.attr("call_sig", $val, !pir::isnull__iP($val));
    }

    method viviself ($val?) {
        self.attr("viviself", $val, !pir::isnull__iP($val));
    }

    method vivibase ($val?) {
        self.attr("vivibase", $val, !pir::isnull__iP($val));
    }

    method multitype ($val?) {
        self.attr("multitype", $val, !pir::isnull__iP($val));
    }

    method ACCEPTSEXACTLY ($node) {
        return Tree::Pattern::Match.new(0) unless $node ~~ PAST::Var;
        my $/ := Tree::Pattern::Match.new(1);
        (self.check_attribute($node, "scope", $/)
         && self.check_attribute($node, "isdecl", $/)
         && self.check_attribute($node, "namespace", $/)
         && self.check_attribute($node, "slurpy", $/)
         && self.check_attribute($node, "call_sig", $/)
         && self.check_attribute($node, "viviself", $/)
         && self.check_attribute($node, "vivibase", $/)
         && self.check_attribute($node, "multitype", $/)
         && self.check_children($node, $/)
         && self.check_past_node_attributes($node, $/));
        $/.from($node) if $/;
        $/;
    }
}

class PAST::Pattern::VarList is PAST::Pattern {
    method ACCEPTSEXACTLY ($node) {
        return Tree::Pattern::Match.new(0) unless $node ~~ PAST::VarList;
        my $/ := Tree::Pattern::Match.new(1);
        (self.check_children($node, $/)
         && self.check_past_node_attributes($node, $/));
        $/.from($node) if $/;
        $/;
    }
}


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
