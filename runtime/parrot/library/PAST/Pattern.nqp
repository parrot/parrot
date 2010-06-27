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

    my @attributes := pir::clone__PP(PCT::Pattern.attributes());
    for (<returns arity named flat lvalue>) {
        pir::push(@attributes, $_);
    }
    method attributes () {
        @attributes;
    }

    method target_class () {
        PAST::Node;
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
    
    my @attributes := pir::clone__PP(PAST::Pattern.attributes());
    for (<blocktype closure control loadinit namespace multi hll
         subid nsentry symtable lexical compiler compiler_args pirflags>) {
        pir::push(@attributes, $_);
    }
    method attributes () {
        @attributes;
    }

    method target_class () {
        PAST::Block;
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

    my @attributes := pir::clone__PP(PAST::Pattern.attributes());
    for (<pasttype pirop inline>) {
        pir::push(@attributes, $_);
    }
    method attributes () { @attributes; }

    method target_class () { PAST::Op; }
}

class PAST::Pattern::Stmts is PAST::Pattern {
    method target_class () { PAST::Stmts; }
}

class PAST::Pattern::Val is PAST::Pattern {
    method value ($val?) {
        self.attr("value", $val, !pir::isnull__iP($val));
    }

    my @attributes := pir::clone__PP(PAST::Pattern.attributes());
    @attributes.pop();
    @attributes.push('value');
    method attributes () { @attributes; }
    method target_class () { PAST::Val; }
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

    my @attributes := pir::clone__PP(PAST::Pattern.attributes());
    for (<scope isdecl namespace slurpy call_sig viviself
         vivibase multitype>) {
        pir::push(@attributes, $_);
    }
    method attributes () { @attributes; }

    method target_class () { PAST::Var; }
}

class PAST::Pattern::VarList is PAST::Pattern {
    method target_class () { PAST::VarList; }
}

class PAST::Pattern::Control is PAST::Pattern {
    my @attributes := pir::clone__PP(PAST::Pattern.attributes());
    pir::push(@attributes, 'handle_types');
    pir::push(@attributes, 'handle_types_except');
    method attributes () { @attributes; }

    method target_class () { PAST::Control; }
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
