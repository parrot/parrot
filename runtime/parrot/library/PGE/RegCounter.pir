=head1 NAME

    PGE::RegCounter - A register naming manager

=head1 SYNOPSIS

    # creation (only once; you usually call "next")
    .local pmc new_rc
    .local pmc rc
    find_global new_rc, "PGE::RegCounter", "new"
    rc = new_rc()
    
    # declare the registers you're going to use
    rc.declare("answer", "$I")

    # and use them
    print rc["answer"]
    print " = 41\n"
    print "inc "
    print rc["answer"]
    print "\n"

    # and pass on a child counter to a subroutine
    $P0 = rc.next()
    generate_foo($P0)
    # generate_foo() now has a clean lexical space to work with

=cut

.sub __onload @ANON, @LOAD
    newclass $P0, "PGE::RegCounter"
    addattribute $P0, ".counter"
    addattribute $P0, ".map"
.end

.namespace [ "PGE::RegCounter" ]

.sub "new"
    .local pmc me
    
    $I0 = find_type "PGE::RegCounter"
    me = new $I0

    .local int offset
    offset = classoffset me, "PGE::RegCounter"

    $P0 = new Integer
    setattribute me, offset, $P0

    inc offset
    $P0 = new PerlHash    # XXX: There should be a non-perl hash
    setattribute me, offset, $P0

    .return(me)
.end

.sub "next" method
    .local int self_offset
    self_offset = classoffset self, "PGE::RegCounter"

    .local pmc me
    $I0 = find_type "PGE::RegCounter"
    me = new $I0

    .local int me_offset
    me_offset = classoffset me, "PGE::RegCounter"

    $P0 = getattribute self, self_offset
    setattribute me, me_offset, $P0

    inc me_offset

    $P0 = new PerlHash
    setattribute me, me_offset, $P0

    .return(me)
.end

.sub "set" method
    .param string key 
    .param string name

    .local int offset
    offset = classoffset self, "PGE::RegCounter"

    inc offset

    $P0 = getattribute self, offset
    $P0[key] = name

    .return()
.end

.sub "declare" method
    .param string key
    .param string prefix

    .local int offset
    offset = classoffset self, "PGE::RegCounter"

    $P0 = getattribute self, offset
    $S0 = $P0
    prefix .= $S0
    inc $P0

    inc offset

    $P0 = getattribute self, offset
    $P0[key] = prefix

    .return(prefix)
.end

.sub "__get_string_keyed" method
    .param pmc key

    .local int offset
    offset = classoffset self, "PGE::RegCounter"

    .local pmc counter
    .local pmc map

    counter = getattribute self, offset
    inc offset
    map = getattribute self, offset
    
AGAIN:
    $I0 = exists map[key]
    if $I0 goto FETCH

    $P0 = new Exception
    $S0 = "Use of undeclared register name: "
    $S1 = key
    $S0 .= $S1
    $P0["_message"] = $S0
    
    throw $P0

FETCH:
    $S0 = map[key]
    .return($S0)
.end
