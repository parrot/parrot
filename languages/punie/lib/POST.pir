=head1 NAME

POST - A low-level opcode syntax tree for Punie.

=head1 DESCRIPTION

The Punie compiler progresses through two levels of syntax tree. POST
(Parrot/Punie Opcode Syntax Tree) is a low-level tree, which closely
corresponds to the semantics of PIR/PASM. POST::Node is the base class
for the opcode syntax tree nodes created by the Punie compiler.

=cut

.namespace [ "POST" ]

.sub "__onload" @LOAD
    load_bytecode "languages/punie/lib/POST/Node.pir"
    load_bytecode "languages/punie/lib/POST/Op.pir"
#    load_bytecode "languages/punie/lib/POST/Decl.pir"
#    load_bytecode "languages/punie/lib/POST/Stmt.pir"
#    load_bytecode "languages/punie/lib/POST/Stmts.pir"
    load_bytecode "languages/punie/lib/POST/Sub.pir"
    load_bytecode "languages/punie/lib/POST/Val.pir"
    load_bytecode "languages/punie/lib/POST/Var.pir"
#    load_bytecode "languages/punie/lib/POST/Code.pir"
    .local pmc base
    newclass base, "POST"
    addattribute base, "topnode" # the top node of the syntax tree
    .return ()
.end


