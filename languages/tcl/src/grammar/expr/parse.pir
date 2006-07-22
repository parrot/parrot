
=head1 TITLE

tcl_expr_parse.pir - Parsing support subroutines for [expr] 

=over 4

=item C<expression(PMC mob)>

The C<expression> subroutine implements the Tcl
<expression> subrule.  It accepts a match object representing
the current state of the parse, passes the match object
to the operator precedence parser to obtain an expression,
and returns the result to the caller.


.namespace [ 'TclExpr::Grammar' ]

.include 'cclass.pasm'

.sub 'expression'
    .param pmc mob
    .param string stoptoken    :optional # ignored
    .param int has_stoptoken   :opt_flag # ignored

    .local pmc optable

    load_bytecode 'PGE/Util.pbc'

    optable = find_global 'TclExpr::Grammar', '$optable'
    .return optable.'parse'(mob)
.end

=cut
