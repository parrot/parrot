#!./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

INIT {
    pir::load_bytecode("PCT.pbc");
}

class PAST::Pattern is Capture {
    has $name;
    has $source;
    has $pos;
    has $returns;
    has $arity;
    has $named;
    has $flat;
    has $lvalue;

    method new (*@children, *%attrs) {
        my $result := Q:PIR {
            $P0 = self.'HOW'()
            $P0 = getattribute $P0, 'parrotclass'
            %r = new $P0
        };

        for %attrs {
            $result{$_} := %attrs{$_};
        }
        for @children {
            pir::push($result, $_);
        }
        $result;
    }

    sub check_attribute ($pattern, $node, $attribute) {
        my $pVal := $pattern{$attribute};
        my $nVal := $node{$attribute};
        my $result;
        if $pVal {
            if pir::iseq__i_p_p($pVal, $nVal) {
                $result := ?1;
            } else {
                $result := ?0;
            }
        } else {
            $result := ?1;
        }
        $result;
    }

    sub check_node_attributes ($pattern, $node) {
        check_attribute($pattern, $node, "name");
    }

    method ACCEPTS ($node) {
        ?0;
    }
}

class PAST::Pattern::Block is PAST::Pattern {
    has $blocktype;
    has $closure;
    has $control;
    has $loadinit;
    has $namespace;
    has $multi;
    has $hll;
    has $nsentry;
    has $symtable;
    has $lexical;
    has $compiler;
    has $compiler_args;
    has $subid;
    has $pirflags;

    method ACCEPTS ($node) {
        (($node ~~ PAST::Block)
         && PAST::Pattern::check_node_attributes(self, $node));
    }
}


class PAST::Pattern::Op is PAST::Pattern {
    has $pasttype;
    has $pirop;
    has $inline;

    method ACCEPTS ($node) {
        ($node ~~ PAST::Op
         && PAST::Pattern::check_node_attributes(self, $node));
    }
}

class PAST::Pattern::Stmts is PAST::Pattern {
    method ACCEPTS ($node) {
        ($node ~~ PAST::Stmts
         && PAST::Pattern::check_node_attributes(self, $node));
    }
}

class PAST::Pattern::Val is PAST::Pattern {
    has $value;

    method ACCEPTS ($node) {
        ($node ~~ PAST::Val
         && PAST::Pattern::check_node_attributes(self, $node));
    }
}

class PAST::Pattern::Var is PAST::Pattern {
    has $scope;
    has $isdecl;
    has $namespace;
    has $slurpy;
    has $call_sig;
    has $viviself;
    has $vivibase;
    has $multitype;

    method ACCEPTS ($node) {
        ($node ~~ PAST::Var
         && PAST::Pattern::check_node_attributes(self, $node));
    }
}

class PAST::Pattern::VarList is PAST::Pattern {
    method ACCEPTS ($node) {
        ($node ~~ PAST::VarList
         && PAST::Pattern::check_node_attributes(self, $node));
    }
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
