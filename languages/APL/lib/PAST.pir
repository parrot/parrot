=head1 NAME

PAST - A high-level abstract syntax tree for APL

=head1 DESCRIPTION

The APL compiler progresses through two levels of syntax tree. PAST
(Parrot Abstract Syntax Tree) is a high-level tree, which closely
corresponds to the semantics of the language (though in a desugared
form). PAST::Node implements the abstract syntax tree nodes created by
the APL compiler.

=cut

.namespace [ "PAST" ]

.sub "__onload" :load
    load_bytecode "languages/APL/lib/PAST/Node.pbc"
    load_bytecode "languages/APL/lib/PAST/Code.pbc"
    load_bytecode "languages/APL/lib/PAST/Exp.pbc"
    load_bytecode "languages/APL/lib/PAST/Op.pbc"
    load_bytecode "languages/APL/lib/PAST/Stmt.pbc"
    load_bytecode "languages/APL/lib/PAST/Stmts.pbc"
    load_bytecode "languages/APL/lib/PAST/Sub.pbc"
    load_bytecode "languages/APL/lib/PAST/Val.pbc"
    load_bytecode "languages/APL/lib/PAST/Var.pbc"
    .local pmc base
    newclass base, "PAST"
    addattribute base, "topnode" # the top node of the syntax tree
    .return ()
.end


