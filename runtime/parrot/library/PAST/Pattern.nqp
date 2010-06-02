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

    method ACCEPTS ($node) {
        0;
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
        $node ~~ PAST::Block;
    }
}

class PAST::Pattern::Op {
    has $pasttype;
    has $pirop;
    has $inline;

    method ACCEPTS ($node) {
        $node ~~ PAST::Op;
    }
}

class PAST::Pattern::Stmts {
    method ACCEPTS ($node) {
        $node ~~ PAST::Stmts;
    }
}

class PAST::Pattern::Val {
    has $value;

    method ACCEPTS ($node) {
        $node ~~ PAST::Val;
    }
}

class PAST::Pattern::Var {
    has $scope;
    has $isdecl;
    has $namespace;
    has $slurpy;
    has $call_sig;
    has $viviself;
    has $vivibase;
    has $multitype;

    method ACCEPTS ($node) {
        $node ~~ PAST::Var;
    }
}

class PAST::Pattern::VarList {
    method ACCEPTS ($node) {
        $node ~~ PAST::VarList;
    }
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
