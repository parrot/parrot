=head1 NAME

POST - A low-level opcode syntax tree for APL

=head1 DESCRIPTION

The APL compiler progresses through two levels of syntax tree. POST
(Parrot Opcode Syntax Tree) is a low-level tree, which closely
corresponds to the semantics of PIR/PASM. POST::Node is the base class
for the opcode syntax tree nodes created by the APL compiler.

=cut

.namespace [ "POST" ]

.sub "__onload" :load
    load_bytecode "languages/APL/lib/POST/Node.pbc"
    load_bytecode "languages/APL/lib/POST/Op.pbc"
    load_bytecode "languages/APL/lib/POST/Ops.pbc"
#    load_bytecode "languages/APL/lib/POST/Decl.pbc"
#    load_bytecode "languages/APL/lib/POST/Stmt.pbc"
#    load_bytecode "languages/APL/lib/POST/Stmts.pbc"
    load_bytecode "languages/APL/lib/POST/Sub.pbc"
    load_bytecode "languages/APL/lib/POST/Val.pbc"
    load_bytecode "languages/APL/lib/POST/Var.pbc"
#    load_bytecode "languages/APL/lib/POST/Code.pbc"
    .local pmc base
    newclass base, "POST"
    addattribute base, "topnode" # the top node of the syntax tree
    .return ()
.end


