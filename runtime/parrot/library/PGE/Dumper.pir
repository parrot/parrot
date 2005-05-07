=head1 TITLE

PGE::Dumper - various methods for displaying PGE structures

=cut

.namespace [ "PGE::Exp" ]

.sub "dumpindent" method
    .param int indent
    $S0 = repeat ' ', indent
    print $S0
.end

.sub "dump" method
    .param int indent
    self."dumpindent"(indent)
    print "EXP (abstract) "
    $S0 = self."quant"()
    print $S0
    print "\n"
.end

.namespace [ "PGE::Exp::Start" ]

.sub dump method
    .param int indent
    .local pmc exp1
    $S0 = self["firstchars"]
    print "firstchars: "
    print $S0
    print "\n"
    exp1 = self["exp1"]
    exp1."dump"(0)
.end

.namespace [ "PGE::Exp::End" ]

.sub dump method
    .param int indent
    self."dumpindent"(indent)
    print "End\n"
.end

.namespace [ "PGE::Exp::Literal" ]

.sub "dump" method
    .param int indent
    .local pmc literal
    literal = self["literal"]
    self."dumpindent"(indent)
    print "LITERAL «"
    print literal
    print "» "
    $S0 = self."quant"()
    print $S0
    print "\n"
.end

.namespace [ "PGE::Exp::Scalar" ]

.sub "dump" method
    .param int indent
    .local pmc cname
    cname = self["cname"]
    self."dumpindent"(indent)
    print "BACKREF «"
    print cname
    print "» "
    $S0 = self."quant"()
    print $S0
    print "\n"
.end

.namespace [ "PGE::Exp::Dot" ]

.sub "dump" method
    .param int indent
    self."dumpindent"(indent)
    print "DOT "
    $S0 = self."quant"()
    print $S0
    print "\n"
.end


.namespace [ "PGE::Exp::Anchor" ]

.sub "dump" method
    .param int indent
    .local string token
    self."dumpindent"(indent)
    print "ANCHOR "
    token = self["token"]
    print token
    print "\n"
.end


.namespace [ "PGE::Exp::Concat" ]

.sub "dump" method
    .param int indent
    $P0 = self["exp1"]
    $P0."dump"(indent)
    $P0 = self["exp2"]
    $P0."dump"(indent)
.end

.namespace [ "PGE::Exp::Alt" ]

.sub "dump" method
    .param int indent
    .local int offset
    .local pmc exp

    exp = self["exp1"]
    $I1 = indent
    $I0 = isa exp, "PGE::Exp::Alt"
    if $I0 goto print_exp1
    $I1 += 4
  print_exp1:
    exp."dump"($I1)
    self."dumpindent"(indent)
    print "ALT\n"
    exp = self["exp2"]
    $I1 = indent
    $I0 = isa exp, "PGE::Exp::Alt"
    if $I0 goto print_exp2
    $I1 += 4
  print_exp2:
    exp."dump"($I1)
.end


.namespace [ "PGE::Exp::Group" ]

.sub "dump" method
    .param int indent
    .local int offset
    .local pmc exp
    .local int subp

    self."dumpindent"(indent)
    print "GROUP "
    $S0 = self."quant"()
    print $S0
    $I0 = exists self["rname"]
    unless $I0 goto dump_0
    print "subrule '"
    $S0 = self["rname"]
    print $S0
    print "'"
  dump_0:
    $I0 = exists self["cname"]
    unless $I0 goto dump_1
    print " capture as '"
    $S0 = self["cname"]
    print $S0
    print "'"
  dump_1:
    $I0 = self["isarray"]
    unless $I0 goto dump_2
    print " isarray"
  dump_2:
    $I0 = self["cscope"]
    unless $I0 goto dump_3
    print " cscope"
  dump_3:
    print "\n"
    exp = self["exp1"] 
    indent += 4
    exp."dump"(indent)
.end

