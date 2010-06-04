#!./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

INIT {
    pir::load_bytecode("PCT.pbc");
}

class PAST::Pattern is Capture {
    method attr ($name, $value, $has_value) {
        my $result;
        if ($has_value) {
            self{$name} := $value;
        } else {
            $result := self{$name};
        }
        $result;
    }

    method name ($val?) {
        self.attr("name", $val, !pir::isnull__iP($val));
    }

    method source ($val?) {
        self.attr("source", $val, !pir::isnull__iP($val));
    }

    method pos ($val?) {
        self.attr("pos", $val, !pir::isnull__iP($val));
    }

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
            pir::push($result, $_);
        }
        $result;
    }
    
    sub check ($patt, $val) {
        my $result := 0;
        if (pir::can__IPs($patt, "ACCEPTS")) {
            $result := $val ~~ $patt;
        } elsif (pir::does($patt, "invokable")) {
            $result := ?$patt($val);
        }
        else {
            $result := pir::iseq__IPP($patt, $val);
            CATCH {
                $result := 0;
            }
        }
        $result;
    }


    sub check_attribute ($pattern, $node, $attribute) {
        my $pVal := $pattern.attr($attribute, null, 0);
        my $nVal := $node.attr($attribute, null, 0);
        my $result;
        if $pVal {
            if check($pVal, $nVal) {
                $result := 1;
            } else {
                $result := 0;
            }
        } else {
            $result := 1;
        }
        $result;
    }

    sub check_children ($pattern, $node) {
        my $pLen := pir::elements($pattern);
        my $nLen := pir::elements($node);
        my $result;
        my $index;
        if ($pLen == $nLen) {
            $index := 0;
            while ($index < $pLen) {
                unless (check($pattern[$index], $node[$index])) {
                    return 0;
                }
                $index++;
            }
            $result := 1;
        } else {
            $result := 0;
        }
        $result;
    }

    sub check_node_attributes ($pattern, $node) {
        (check_attribute($pattern, $node, "name")
         && check_attribute($pattern, $node, "source")
         && check_attribute($pattern, $node, "pos")
         && check_attribute($pattern, $node, "returns")
         && check_attribute($pattern, $node, "arity")
         && check_attribute($pattern, $node, "named")
         && check_attribute($pattern, $node, "flat")
         && check_attribute($pattern, $node, "lvalue"));
    }

    method ACCEPTS ($node) {
        ?0;
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

    sub check_block_attributes($pattern, $node) {
        (PAST::Pattern::check_attribute($pattern, $node, "blocktype")
         && PAST::Pattern::check_attribute($pattern, $node, "closure")
         && PAST::Pattern::check_attribute($pattern, $node, "control")
         && PAST::Pattern::check_attribute($pattern, $node, "loadinit")
         && PAST::Pattern::check_attribute($pattern, $node, "namespace")
         && PAST::Pattern::check_attribute($pattern, $node, "multi")
         && PAST::Pattern::check_attribute($pattern, $node, "hll")
         && PAST::Pattern::check_attribute($pattern, $node, "nsentry")
         && PAST::Pattern::check_attribute($pattern, $node, "lexical")
         && PAST::Pattern::check_attribute($pattern, $node, "compiler")
         && PAST::Pattern::check_attribute($pattern, $node, 
                                           "compiler_args")
         && PAST::Pattern::check_attribute($pattern, $node, "subid")
         && PAST::Pattern::check_attribute($pattern, $node, "pirflags"));
    }

    method ACCEPTS ($node) {
        (($node ~~ PAST::Block)
         && PAST::Pattern::check_children(self, $node)
         && PAST::Pattern::check_node_attributes(self, $node)
         && check_block_attributes(self, $node));
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

    sub check_op_attributes ($pattern, $node) {
        (PAST::Pattern::check_attribute($pattern, $node, "pasttype")
         && PAST::Pattern::check_attribute($pattern, $node, "pirop")
         && PAST::Pattern::check_attribute($pattern, $node, "inline"));          
    }

    method ACCEPTS ($node) {
        (($node ~~ PAST::Op)
         && PAST::Pattern::check_children(self, $node)
         && PAST::Pattern::check_node_attributes(self, $node)
         && check_op_attributes(self, $node));
    }
}

class PAST::Pattern::Stmts is PAST::Pattern {
    method ACCEPTS ($node) {
        ($node ~~ PAST::Stmts
         && PAST::Pattern::check_children(self, $node)
         && PAST::Pattern::check_node_attributes(self, $node));
    }
}

class PAST::Pattern::Val is PAST::Pattern {
    method value ($val?) {
        self.attr("value", $val, !pir::isnull__iP($val));
    }

    method ACCEPTS ($node) {
        ($node ~~ PAST::Val
         && PAST::Pattern::check_children(self, $node)
         && PAST::Pattern::check_node_attributes(self, $node)
         && PAST::Pattern::check_attribute(self, $node, "value"));
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

    method ACCEPTS ($node) {
        ($node ~~ PAST::Var
         && PAST::Pattern::check_children(self, $node)
         && PAST::Pattern::check_node_attributes(self, $node)
         && PAST::Pattern::check_attribute(self, $node, "scope")
         && PAST::Pattern::check_attribute(self, $node, "isdecl")
         && PAST::Pattern::check_attribute(self, $node, "namespace")
         && PAST::Pattern::check_attribute(self, $node, "slurpy")
         && PAST::Pattern::check_attribute(self, $node, "call_sig")
         && PAST::Pattern::check_attribute(self, $node, "viviself")
         && PAST::Pattern::check_attribute(self, $node, "vivibase")
         && PAST::Pattern::check_attribute(self, $node, "multitype"));
    }
}

class PAST::Pattern::VarList is PAST::Pattern {
    method ACCEPTS ($node) {
        ($node ~~ PAST::VarList
         && PAST::Pattern::check_children(self, $node)
         && PAST::Pattern::check_node_attributes(self, $node));
    }
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
