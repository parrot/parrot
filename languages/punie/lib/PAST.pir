=head1 NAME

PAST - A high-level abstract syntax tree for Punie.

=head1 DESCRIPTION

The Punie compiler progresses through two levels of syntax tree. PAST
(Parrot/Punie Abstract Syntax Tree) is a high-level tree, which closely
corresponds to the semantics of the language (though in a desugared
form). PAST::Node implements the abstract syntax tree nodes created by
the Punie compiler.

=cut

.namespace [ "PAST" ]

.sub "__onload" @LOAD
    load_bytecode "languages/punie/lib/PAST/Node.pir"
    load_bytecode "languages/punie/lib/PAST/Code.pir"
    load_bytecode "languages/punie/lib/PAST/Exp.pir"
    load_bytecode "languages/punie/lib/PAST/Op.pir"
    load_bytecode "languages/punie/lib/PAST/Stmt.pir"
    load_bytecode "languages/punie/lib/PAST/Stmts.pir"
    load_bytecode "languages/punie/lib/PAST/Sub.pir"
    load_bytecode "languages/punie/lib/PAST/Val.pir"
    load_bytecode "languages/punie/lib/PAST/Var.pir"
    .local pmc base
    newclass base, "PAST"
    addattribute base, "topnode" # the top node of the syntax tree
    .return ()
.end


