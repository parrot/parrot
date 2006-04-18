=head1 NAME

PAST - A high-level abstract syntax tree for Pheme.

=head1 DESCRIPTION

The Pheme compiler progresses through two levels of syntax tree. PAST
(Parrot/Pheme Abstract Syntax Tree) is a high-level tree, which closely
corresponds to the semantics of the language (though in a desugared
form). PAST::Node implements the abstract syntax tree nodes created by
the Pheme compiler.

=cut

.namespace [ "PAST" ]

.sub "__onload" :load
    load_bytecode "languages/pheme/lib/PAST/Node.pir"
    load_bytecode "languages/pheme/lib/PAST/List.pir"
    load_bytecode "languages/pheme/lib/PAST/Code.pir"
    load_bytecode "languages/pheme/lib/PAST/Exp.pir"
    load_bytecode "languages/pheme/lib/PAST/Op.pir"
    load_bytecode "languages/pheme/lib/PAST/Stmt.pir"
    load_bytecode "languages/pheme/lib/PAST/Stmts.pir"
    load_bytecode "languages/pheme/lib/PAST/Sub.pir"
    load_bytecode "languages/pheme/lib/PAST/Atom.pir"
    load_bytecode "languages/pheme/lib/PAST/Var.pir"
    load_bytecode "languages/pheme/lib/PAST/Val.pir"
    .local pmc base
    newclass base, "PAST"
    addattribute base, "topnode" # the top node of the syntax tree
    .return ()
.end
