=head1 NAME

POST::Var - A variable

=head1 DESCRIPTION

POST::Var is a node containing a variable in the OST. It is a subclass
of Node.

=cut

.namespace [ "POST::Var" ]

.sub "__onload" :load
    .local pmc base
    $P0 = getclass 'Node'
    base = subclass $P0, 'POST::Var'
    addattribute base, "varname"     # the PIR name of this variable
    .return ()
.end

.sub 'varname' :method
    .param string varname       :optional
    .param int passed_varname   :opt_flag
    .return self.'accessor'('varname', varname, passed_varname)
.end

.sub generate_temp :method
    .local string temp
       temp = "$P"
     $I1 = _new_temp_id()
     $S1 = $I1
     temp .= $S1
     .return (temp)
.end

# Autoincrementing id generator
.sub _new_temp_id
    .local int id
    id = 0
loop:
    inc id 
    .yield(id)
    goto loop
.end

.sub new_temp :method
    $S1 = self.generate_temp()
    self.varname($S1)
.end

.sub new_dummy :method
    # First we create a temporary variable
    self.new_temp()
    # Then we create a fabricated op to create a new pmc of type
    # 'Undef'. It has 2 arguments: the temp variable and the type.
    .local pmc newop
    newop = new 'POST::Op'
    newop.'clone'(self)
    newop.'op'('new')

    newop.'add_child'(self)
    $I1 = find_type 'Undef'
    $S10 = $I1
    $P6 = new 'POST::Val'
    $P6.'value'($S10)
    $P6.'valtype'('int')
    newop.'add_child'($P6)
    .return (newop)
.end

.sub 'DUMPABLE' :method
    $P1 = new .ResizablePMCArray
    push $P1, 'source'
    push $P1, 'pos'
    push $P1, 'varname'
    .return ($P1)
.end
