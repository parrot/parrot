=head1 TITLE

PGE::Glob - Parse and compile glob notation

=head1 DESCRIPTION

A parser for shell-stype glob notation.

=head2 Functions

=cut

.namespace [ "PGE::Glob" ]

.const string STOPCHARS = ",*?{}[]"	# XXX: should be part of context
.const int GLOB_INF = 2147483647	# XXX: arbitrary limit

.sub "__onload" :load
    $P0 = find_global "PGE", "glob"
    compreg "PGE::Glob", $P0
.end

=item C<new(STR class [, PMC exp1 [, PMC exp2]])>

Creates and returns  a new C<Exp> object of C<class>, initializing
min/max/greedy/etc.  values and C<exp1> and C<exp2> objects if provided.

=cut

.sub "new"
    .param pmc pattern
    .param string expclass     :optional           # class from find_type
    .param int has_class       :opt_flag
    .param pmc exp1            :optional           # left expression
    .param int has_exp1        :opt_flag
    .param pmc exp2            :optional           # right expression
    .param int has_exp2        :opt_flag
    .local pmc me                                  # new expression object

    if has_class goto buildme
    expclass = "PGE::Exp"
  buildme:
    $P0 = find_global "PGE::Match", "newfrom"
    (me, $P0, $P1, $P2) = $P0(pattern, 0, expclass)
    assign $P2, $P1

    unless has_exp1 goto end
    me[0] = exp1
    unless has_exp2 goto end
    me[1] = exp2
  end:
    .return (me)
.end


=item C<glob_error(STR pattern, PMC lex, STR message)>

output an error message

=cut

.sub "glob_error"
    .param string pattern
    .param pmc lex
    .param string message

    $P0 = new Exception
    $S0 = "PGE Parse error: "
    $S0 .= message
    $S0 .= " at offset "
    $I0 = lex["pos"]
    $S1 = $I0
    $S0 .= $S1
    $S0 .= " (found <<"
    $S1 = substr pattern, $I0, 1
    $S0 .= $S1
    $S0 .= ">>)\n"
    $P0["_message"] = $S0
    throw $P0
.end

=item C<glob_parse_alt(STR pattern, PMC lex)>

Parse alternations of the form {a,b,c} where a,b, and c are the alternatives.

=cut

.sub "glob_parse_alt"
    .param string pattern
    .param pmc lex
    .local pmc exp

    $I0 = lex['pos']
    $S0 = substr pattern, $I0, 1
    if $S0 != '{' goto alt_err1
    inc $I0
    lex['pos'] = $I0
    exp = "glob_parse_literallist"(pattern,lex)
    $I0 = lex['pos']
    $S0 = substr pattern, $I0, 1
    if $S0 != '}' goto alt_err2
    inc $I0
    lex['pos'] = $I0
    goto alt_end

  alt_err1:
    "glob_error"(pattern,lex,"Expected '{'")
    goto alt_end

  alt_err2:
    "glob_error"(pattern,lex,"Expected '}'")

  alt_end:
    .return (exp)
.end

.sub "glob_parse_literallist"
    .param string pattern
    .param pmc lex
    .local pmc exp
    .local pmc exp1
    .local pmc exp2
    .local string c

    exp1 = "glob_parse_literal"(pattern,lex)
    $I0 = lex['pos']
    $S0 = substr pattern, $I0, 1
    if $S0 != ',' goto lit_end
    inc $I0
    lex['pos'] = $I0
    exp2 = "glob_parse_literallist"(pattern,lex)
    exp =  "new"(pattern, "PGE::Exp::Alt", exp1, exp2)
    .return (exp)

  lit_end:
    .return (exp1)
.end

.sub "glob_parse_literal"		# literal strings
    .param string pattern
    .param pmc lex
    .local pmc exp
    .local string c
    .local string lit

    lit = ''
    $I0 = lex['pos']
    $I1 = lex['plen']
  next_char:
    unless $I0 < $I1 goto lit_end
    c = substr pattern, $I0, 1
    if c == "\\" goto backslash
    $I2 = index STOPCHARS, c
    if $I2 >= 0 goto lit_end
    inc $I0
    concat lit,c
    goto next_char
  backslash:
    inc $I0
    c = substr pattern, $I0, 1
    inc $I0
    concat lit, c
    goto next_char
  lit_end:
    lex['pos'] = $I0
    exp = "new"(pattern, "PGE::Exp::Literal")
    exp["value"] = lit
    .return (exp)
.end

.sub "glob_parse_cc"			# character classes
    .param string pattern
    .param pmc lex
    .local int pos, plen
    .local string charclass, range
    .local pmc exp
    pos = lex["pos"]
    plen = lex["plen"]
    charclass = ""
    exp = "new"(pattern, "PGE::Exp::EnumCharList")
    $S0 = substr pattern, pos, 1
    if $S0 == "!" goto negate
    if $S0 == "^" goto negate
    exp["isnegated"] = 0
    goto first_bracket
  negate:
    exp["isnegated"] = 1
    inc pos
  first_bracket:
    $S0 = substr pattern, pos, 1
    if $S0 == "]" goto add_char
    if $S0 == "-" goto add_char
  scan:
    if pos > plen goto no_close_err
    $S0 = substr pattern, pos, 1
    if $S0 == "]" goto end_class
    if $S0 == "-" goto add_hyphen
  add_char:
    concat charclass, $S0
    inc pos
    goto scan
  add_hyphen:
    $I0 = pos + 1
    $S1 = substr pattern, $I0, 1
    if $S1 == "]" goto add_char
    pos += 2
    $I1 = ord $S1
    $I2 = ord charclass, -1
  add_range:
    inc $I2
    if $I2 > $I1 goto scan
    $S1 = chr $I2
    concat charclass, $S1
    goto add_range
  no_close_err:
    "glob_error"(pattern, lex, "Missing close ']' of character class")
  end_class:
    inc pos
    lex["pos"] = pos
    exp["value"] = charclass
  end:
    .return (exp)
.end  

.sub "glob_parse_expr"
    .param string pattern
    .param pmc lex
    .local pmc exp
    .local pmc exp2

    $I0 = lex['pos']
    $I1 = lex['plen']
    $S0 = substr pattern, $I0, 1
    if $S0 == '?' goto dot
    if $S0 == '*' goto star
    if $S0 == '[' goto cc
    if $S0 == '{' goto alt
    exp = "glob_parse_literal"(pattern,lex)
    goto next

  dot:
    inc $I0
    lex['pos'] = $I0
    exp = "new"(pattern, "PGE::Exp::CCShortcut")
    exp["value"] = "."
    goto next

  star:
    inc $I0
    lex['pos'] = $I0
    exp = "new"(pattern, "PGE::Exp::CCShortcut")
    exp["value"] = "."
    exp["min"] = 0
    exp["max"] = GLOB_INF
    exp["islazy"] = 0
    exp["isquant"] = 1
    goto next

  cc:
    inc $I0
    lex['pos'] = $I0
    exp = "glob_parse_cc"(pattern,lex)
    goto next

  alt:
    exp = "glob_parse_alt"(pattern,lex)
    goto next

  next:
    $I0 = lex['pos']
    unless $I0 < $I1 goto expr_end
    $P2 = "glob_parse_expr"(pattern,lex)
    exp = "new"(pattern, "PGE::Exp::Concat", exp, $P2)

  expr_end:
    .return (exp)
.end

.namespace [ "PGE" ]

.sub "glob"
    .param string pattern
    .local pmc lex
    .local pmc exp
    .local pmc code
    .local pmc glob
    .local pmc aexp

    lex = new Hash
    lex["pos"] = 0
    $I0 = length pattern
    lex["plen"] = $I0
    $P0 = find_global "PGE::Glob", "glob_parse_expr"
    exp = $P0(pattern,lex)

    $P1 = find_global "PGE::Glob", "new"

    aexp = $P1(pattern, "PGE::Exp::Anchor")
    aexp["value"] = "^"
    exp = $P1(pattern, "PGE::Exp::Concat", aexp, exp)

    aexp = $P1(pattern, "PGE::Exp::Anchor")
    aexp["value"] = "$"
    exp = $P1(pattern, "PGE::Exp::Concat", exp, aexp)

    $P2 = $P1(pattern, "PGE::Exp")
    $P2["expr"] = exp

    code = $P2."as_pir"("_pge_rule")

    compreg $P0, "PIR"
    $S0 = code

    glob = $P0($S0)
    .return (glob, code, $P2)
.end

=head1 AUTHOR

 Jonathan Scott Duff
 duff@pobox.com

 Character class support added by Patrick R. Michaud (pmichaud@pobox.com)

=cut
