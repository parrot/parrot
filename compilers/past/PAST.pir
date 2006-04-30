# $Id$

=head1 NAME

PAST - A high-level abstract syntax tree for Punie, Pheme and Parrot bc.

=head1 DESCRIPTION

The Punie compiler progresses through two levels of syntax tree. PAST
(Parrot/Punie Abstract Syntax Tree) is a high-level tree, which closely
corresponds to the semantics of the language (though in a desugared
form). The individual subclasses of Node implement the abstract syntax
tree nodes created by a language compiler.

=cut

.namespace [ "PAST" ]

.sub "__onload" :load
    load_bytecode "Node.pbc"
    load_bytecode "PAST/Code.pbc"
    load_bytecode "PAST/Exp.pbc"
    load_bytecode "PAST/Op.pbc"
    load_bytecode "PAST/Stmt.pbc"
    load_bytecode "PAST/Stmts.pbc"
    load_bytecode "PAST/Sub.pbc"
    load_bytecode "PAST/Val.pbc"
    load_bytecode "PAST/Var.pbc"
    .local pmc base
    newclass base, "PAST"
    addattribute base, "topnode" # the top node of the syntax tree
    .return ()
.end
