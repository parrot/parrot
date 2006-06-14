=head1 NAME

PAST::Var - A variable

=head1 DESCRIPTION

PAST::Var is a node containing a variable in the AST. It is a subclass
of Node.

=cut

.namespace [ "PAST::Var" ]

.sub "__onload" :load
    .local pmc base
    $P0 = getclass 'Node'
    base = subclass $P0, 'PAST::Var'
    addattribute base, 'varname'     # the HLL name of this variable
    addattribute base, 'vartype'     # the container type of this variable
    addattribute base, 'scope'       # global, lexical, etc
    .return ()
.end

.sub 'DUMPABLE' :method
    $P1 = new .ResizableStringArray
    push $P1, 'source'
    push $P1, 'pos'
    push $P1, 'varname'
    push $P1, 'vartype'
    push $P1, 'scope'
    .return($P1)
.end
.sub 'varname' :method
    .param string varname       :optional
    .param int passed_varname   :opt_flag
    .return self.'accessor'('varname', varname, passed_varname)
.end

.sub 'vartype' :method
    .param string vartype       :optional
    .param int passed_vartype   :opt_flag
    .return self.'accessor'('vartype', vartype, passed_vartype)
.end

.sub 'scope' :method
    .param string scope       :optional
    .param int passed_scope   :opt_flag
    .return self.'accessor'('scope', scope, passed_scope)
.end
