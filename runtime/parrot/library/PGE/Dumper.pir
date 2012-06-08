# Copyright (C) 2005-2012, Parrot Foundation.

=head1 DESCRIPTION

PGE::Dumper - various methods for displaying PGE structures

=cut


.namespace [ "PGE";"Match" ]

=head2 C<PGE::Match> Methods

=over 4

=item C<__dump(PMC dumper, STR label)>

This method enables Data::Dumper to work on Match objects.

=cut

.sub "__dump" :method
    .param pmc dumper
    .param string label
    .local string indent, subindent
    .local pmc it, val
    .local string key
    .local pmc hash, array
    .local int hascapts

    (subindent, indent) = dumper."newIndent"()
    print "=> "
    $S0 = self
    dumper."genericString"("", $S0)
    print " @ "
    $I0 = self.'from'()
    print $I0
    hascapts = 0
    hash = self.'hash'()
    if_null hash, dump_array
    it = iter hash
  dump_hash_1:
    unless it goto dump_array
    if hascapts goto dump_hash_2
    print " {"
    hascapts = 1
  dump_hash_2:
    print "\n"
    print subindent
    key = shift it
    val = hash[key]
    print "<"
    print key
    print "> => "
    dumper."dump"(label, val)
    goto dump_hash_1
  dump_array:
    array = self.'list'()
    if_null array, dump_end
    $I1 = elements array
    $I0 = 0
  dump_array_1:
    if $I0 >= $I1 goto dump_end
    if hascapts goto dump_array_2
    print " {"
    hascapts = 1
  dump_array_2:
    print "\n"
    print subindent
    val = array[$I0]
    print "["
    print $I0
    print "] => "
    dumper."dump"(label, val)
    inc $I0
    goto dump_array_1
  dump_end:
    unless hascapts goto end
    print "\n"
    print indent
    print "}"
  end:
    dumper."deleteIndent"()
.end

=item C<dump_str()>

An alternate dump output for a Match object and all of its subcaptures.

=cut

.sub "dump_str" :method
    .param string prefix       :optional           # name of match variable
    .param int has_prefix      :opt_flag
    .param string b1           :optional           # bracket open
    .param int has_b1          :opt_flag
    .param string b2           :optional           # bracket close
    .param int has_b2          :opt_flag

    .local pmc capt
    .local int spi, spc
    .local pmc it
    .local string prefix1, prefix2
    .local pmc jmpstack
    jmpstack = new 'ResizableIntegerArray'

    if has_b2 goto start
    b2 = "]"
    if has_b1 goto start
    b1 = "["
  start:
    .local pmc out
    out = new ['StringBuilder']
    out = prefix
    out .= ':'
    unless self goto subpats
    out .= ' <'
    $S0 = self
    out .= $S0
    out .= ' @ '
    $S0 = self.'from'()
    out .= $S0
    out .= '> '

  subpats:
    $I0 = self
    $S0 = $I0
    out .= $S0
    out .= "\n"
    capt = self.'list'()
    if_null capt, subrules
    spi = 0
    spc = elements capt
  subpats_1:
    unless spi < spc goto subrules
    prefix1 = concat prefix, b1
    $S0 = spi
    prefix1 = concat prefix1, $S0
    prefix1 = concat prefix1, b2
    $I0 = defined capt[spi]
    unless $I0 goto subpats_2
    $P0 = capt[spi]
    local_branch jmpstack, dumper
  subpats_2:
    inc spi
    goto subpats_1

  subrules:
    capt = self.'hash'()
    if_null capt, end
    it = iter capt
  subrules_1:
    unless it goto end
    $S0 = shift it
    prefix1 = concat prefix, '<'
    prefix1 = concat prefix1, $S0
    prefix1 = concat prefix1, ">"
    $I0 = defined capt[$S0]
    unless $I0 goto subrules_1
    $P0 = capt[$S0]
    local_branch jmpstack, dumper
    goto subrules_1

  dumper:
    $I0 = isa $P0, ['PGE';'Match']
    unless $I0 goto dumper_0
    $S0 = $P0.'dump_str'(prefix1, b1, b2)
    out .= $S0
    local_return jmpstack
  dumper_0:
    $I0 = does $P0, 'array'
    unless $I0 goto dumper_3
    $I0 = 0
    $I1 = elements $P0
  dumper_1:
    if $I0 >= $I1 goto dumper_2
    $P1 = $P0[$I0]
    prefix2 = concat prefix1, b1
    $S0 = $I0
    prefix2 = concat prefix2, $S0
    prefix2 = concat prefix2, b2
    $S0 = $P1.'dump_str'(prefix2, b1, b2)
    out .= $S0
    inc $I0
    goto dumper_1
  dumper_2:
    local_return jmpstack
  dumper_3:
    out .= prefix1
    out .= ': '
    $S0 = $P0
    out .= $S0
    out .= "\n"
    local_return jmpstack

  end:
    $S0 = out
    .return ($S0)
.end


=item C<dump()>

An alternate dump output for a Match object and all of its subcaptures.
Simply calls C<dump_str()> above and prints the results.

=cut

.sub "dump" :method
    .param string prefix       :optional           # name of match variable
    .param int has_prefix      :opt_flag
    .param string b1           :optional           # bracket open
    .param int has_b1          :opt_flag
    .param string b2           :optional           # bracket close
    .param int has_b2          :opt_flag

    .local pmc capt
    .local int spi, spc
    .local pmc iter
    .local string prefix1, prefix2

    if has_b2 goto start
    b2 = "]"
    if has_b1 goto start
    b1 = "["
  start:
    $S0 = self.'dump_str'(prefix, b1, b2)
    print $S0
    .return ()
.end


=back

=head2 C<PGE::Exp> methods

These methods print out a PGE expression tree.  They may be
obsoleted in favor of a Data::Dumper method.

=cut

.namespace [ "PGE";"Exp" ]

.sub "dumpindent" :method
    .param int indent
    $S0 = repeat ' ', indent
    print $S0
    .return ()
.end

.sub "dump" :method
    .param int indent
    self."dumpindent"(indent)
    print "EXP (abstract) "
    $S0 = self."quant"()
    print $S0
    print "\n"
    .return ()
.end

.namespace [ "PGE";"Exp";"Start" ]

.sub dump :method
    .param int indent
    .local pmc exp1
    $S0 = self["firstchars"]
    print "firstchars: "
    print $S0
    print "\n"
    exp1 = self["exp1"]
    exp1."dump"(0)
    .return ()
.end

.namespace [ "PGE";"Exp";"End" ]

.sub dump :method
    .param int indent
    self."dumpindent"(indent)
    print "End\n"
    .return ()
.end

.namespace [ "PGE";"Exp";"Literal" ]

.sub "dump" :method
    .param int indent
    .local pmc literal
    literal = self["literal"]
    self."dumpindent"(indent)
    print "LITERAL <<"
    print literal
    print ">> "
    $S0 = self."quant"()
    print $S0
    print "\n"
    .return ()
.end

.namespace [ "PGE";"Exp";"Scalar" ]

.sub "dump" :method
    .param int indent
    .local pmc cname
    cname = self["cname"]
    self."dumpindent"(indent)
    print "BACKREF <<"
    print cname
    print ">> "
    $S0 = self."quant"()
    print $S0
    print "\n"
    .return ()
.end

.namespace [ "PGE";"Exp";"Dot" ]

.sub "dump" :method
    .param int indent
    self."dumpindent"(indent)
    print "DOT "
    $S0 = self."quant"()
    print $S0
    print "\n"
    .return ()
.end

.namespace [ "PGE";"Exp";"CharClass" ]

.sub dump :method
    .param int indent
    self."dumpindent"(indent)
    print "CharClass "
    $S0 = self["charmatch"]
    print $S0
    print " <<"
    $S0 = self["charclass"]
    print $S0
    print ">> "
    $S0 = self."quant"()
    print $S0
    print "\n"
    .return ()
.end

.namespace [ "PGE";"Exp";"WS" ]

.sub "dump" :method
    .param int indent
    self."dumpindent"(indent)
    print "<?ws> "
    $S0 = self."quant"()
    print $S0
    print "\n"
    .return ()
.end

.namespace [ "PGE";"Exp";"Anchor" ]

.sub "dump" :method
    .param int indent
    .local string token
    self."dumpindent"(indent)
    print "ANCHOR "
    token = self["token"]
    print token
    print "\n"
    .return ()
.end


.namespace [ "PGE";"Exp";"Concat" ]

.sub "dump" :method
    .param int indent
    $P0 = self["exp1"]
    $P0."dump"(indent)
    $P0 = self["exp2"]
    $P0."dump"(indent)
    .return ()
.end

.namespace [ "PGE";"Exp";"Alt" ]

.sub "dump" :method
    .param int indent
    .local int offset
    .local pmc exp

    exp = self["exp1"]
    $I1 = indent
    $I0 = isa exp, ["PGE";"Exp";"Alt"]
    if $I0 goto print_exp1
    $I1 += 4
  print_exp1:
    exp."dump"($I1)
    self."dumpindent"(indent)
    print "ALT\n"
    exp = self["exp2"]
    $I1 = indent
    $I0 = isa exp, ["PGE";"Exp";"Alt"]
    if $I0 goto print_exp2
    $I1 += 4
  print_exp2:
    exp."dump"($I1)
    .return ()
.end


.namespace [ "PGE";"Exp";"Group" ]

.sub "dump" :method
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
    print " subrule '"
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
    .return ()
.end

.namespace [ "PGE";"OPTable" ]

=head2 C<PGE::OPTable> Methods

=over 4

=item C<__dump(PMC dumper, STR label)>

This method enables Data::Dumper to work on PGE::OPTable objects.

=cut

.sub "__dump" :method
    .param pmc dumper
    .param string label
    .local string indent, subindent
    .local pmc it, val
    .local string key
    .local pmc hash, array

    (subindent, indent) = dumper."newIndent"()
    print " {"
    hash = self
    if_null hash, dump_rest
    it = iter hash
  dump_hash:
    unless it goto dump_rest
    print "\n"
    print subindent
    key = shift it
    val = hash[key]
    print "<"
    print key
    print "> => "
    dumper."dump"(label, val)
    goto dump_hash
  dump_rest:
    print "\n"
    $P0 = getattribute self, '%!key'
    print subindent
    dumper."dump"(label, $P0)
    print "\n"
    $P0 = getattribute self, '%!klen'
    print subindent
    dumper."dump"(label, $P0)
    print indent
    print "}\n"
    dumper."deleteIndent"()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
