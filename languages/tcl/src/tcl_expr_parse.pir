
=head1 TITLE

tcl_expr_parse.pir - Parsing support subroutines for [expr] 

=over4

=item C<expression(PMC mob)>

The C<expression> subroutine implements the Perl6::Grammar
<expression> subrule.  It accepts a match object representing
the current state of the parse, passes the match object
to the operator precedence parser to obtain an expression,
and returns the result to the caller.

=cut

.namespace [ '_Tcl::Grammar::Expr' ]

.include 'cclass.pasm'

.sub 'expression'
    .param pmc mob
    .param string stoptoken    :optional
    .param int has_stoptoken   :opt_flag
    .local pmc optable
    .local pmc ws

    load_bytecode 'PGE/Util.pbc'

    optable = find_global '_Tcl::Grammar::Expr', '$optable'
    # XXX - try just using the default ws?
    #ws = find_global 'Perl6::Grammar', 'ws'
    #setattribute optable, "PGE::OPTable\x0&!ws", ws
    if has_stoptoken > 0 goto expression_1
    stoptoken = ''
  expression_1:
    say 'GOT HERE'
    $P10 = optable.'parse'(mob, 'stop'=> stoptoken)
    $P1 = find_global 'PGE::Util', 'die' 
    $P1($P10, 'eek')
.end

