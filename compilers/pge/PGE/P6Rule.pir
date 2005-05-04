=head1 TITLE

PGE::P6Rule - Parse and compile Perl 6 rules

=head1 DESCRIPTION

This file implements the Perl 6 rules compiler -- it parses strings
using Perl 6 rules syntax into a rule expression tree (see L<PGE::Exp>),
generates the PIR code from the expression tree, and compiles the
PIR code into a subroutine object.  

The parser here is implemented as a hybrid top-down parser, with a
token lookup table for individual pattern terms.  This parser is
likely temporary; one of our goals once more of Perl 6 is implemented
will be to use Perl 6 to write and compile a better (faster) rules parser.

=head2 Functions

=cut

.namespace [ "PGE::P6Rule" ]

.const int PGE_INF    = 2147483647                # XXX: arbitrary limit

.sub "__onload"
    .local pmc p6meta
    .local pmc u

    u = new Undef
    $I0 = find_type "PGE::TokenHash"
    p6meta = new $I0
    store_global "PGE::P6Rule", "%_p6meta", p6meta
    p6meta['*'] = u
    p6meta['+'] = u
    p6meta['?'] = u
    p6meta[':'] = u
    p6meta['|'] = u
    $P0 = find_global "PGE::P6Rule", "p6rule_parse_literal"
    p6meta['']  = $P0
    $P0 = find_global "PGE::P6Rule", "p6rule_parse_dot"
    p6meta['.'] = $P0
    $P0 = find_global "PGE::P6Rule", "p6rule_parse_anchor"
    p6meta['^'] = $P0
    p6meta['^^'] = $P0
    p6meta['$'] = $P0
    p6meta['$$'] = $P0
    p6meta["\\B"] = $P0
    p6meta["\\b"] = $P0
    $P0 = find_global "PGE::P6Rule", "p6rule_parse_cut"
    p6meta['::'] = $P0
    p6meta[':::'] = $P0
    $P0 = find_global "PGE::P6Rule", "p6rule_parse_group"
    p6meta['['] = $P0
    p6meta[']'] = u
    p6meta['('] = $P0
    p6meta[')'] = u
    # $P0 = find_global "PGE::P6Rule", "p6rule_parse_assert"      # XXX: TODO
    # p6meta['<'] = $P0
    # p6meta['>'] = u
    $P0 = find_global "PGE::P6Rule", "p6rule_parse_charclass"
    p6meta['\d'] = $P0
    p6meta['\D'] = $P0
    p6meta['\w'] = $P0
    p6meta['\W'] = $P0
    p6meta['\s'] = $P0
    p6meta['\S'] = $P0
    p6meta['\n'] = $P0
    p6meta['\N'] = $P0
.end

=item C<p6rule_parse_skip(STR pattern, PMC lex, INT skip)>

Advance the lexical context over the next C<skip> characters and 
scan until the next token is found in C<pattern>.  

=cut

.sub "p6rule_parse_skip"
    .param string pattern                  # pattern being analyzed
    .param pmc lex                         # current lexical state
    .param int skip                        # characters to skip
    .local int pos                         # current position
    .local int plen                        # pattern length

    plen = lex["plen"]
    pos = lex["pos"]
    pos += skip                      
  skipws:
    unless pos < plen goto end
    $I0 = is_whitespace pattern, pos 
    unless $I0 goto skipcomments
    inc pos
    goto skipws
  skipcomments:
    substr $S0, pattern, pos, 1
    if $S0 != '#' goto end
  skipnl:
    inc pos
    unless pos < plen goto end
    $I0 = is_newline $S0, pos
    if $I0 goto skipws
    goto skipnl
  end:
    lex["pos"] = pos
    .return (pos)
.end

=item C<p6rule_parse_error(STR pattern, PMC lex, STR message)>

Generates error messages during parsing.  Gracefully recovering
from errors in rule expressions still needs a fair amount of work
(but that's probably true for nearly any compiler).

=cut

.sub "p6rule_parse_error"
    .param string pattern
    .param pmc lex
    .param string message

    print message
    print " at offset "
    $I0 = lex["pos"]
    print $I0
    print " (found «"
    $S0 = substr pattern, $I0, 1
    print $S0
    print "»)\n"
.end

=item C<p6rule_parse_literal(STR pattern, PMC lex)>

Parse a literal string out of C<pattern> and return a PGE::Exp::Literal
object.  If a quantifier appears after a literal string, it applies
only to the last character (and we handle that below in C<p6rule_parse_quant>.

=cut

.sub "p6rule_parse_literal"
    .param string pattern                  # pattern being analyzed
    .param pmc lex                         # current position (Integer)
    .local pmc p6meta                      # meta characters (Hash)
    .local string c                        # current character
    .local string lit                      # captured literal
    .local int pos                         # current position
    .local pmc exp

    p6meta = find_global "PGE::P6Rule", "%_p6meta"
    lit = ''

  literal:
    pos = lex["pos"]
    c = substr pattern, pos, 1             # get current character
    if c == "\\" goto isslashmeta          # possibly a \ escape
    $I0 = exists p6meta[c]                 # see if we have a meta char
    if $I0 goto literal_end                # stop literal if we do
    concat lit, c                          # add char to literal
    "p6rule_parse_skip"(pattern, lex, 1)   # move to next position
    goto literal                           # get next lit char
  isslashmeta:
    c = substr pattern, pos, 2             # get full \ escape
    $I0 = exists p6meta[c]                 # see if this is a meta
    if $I0 goto literal_end                # yes, so stop literal
    c = substr c, 1                        # use actual char here
    concat lit, c                          # add escaped char to literal
    "p6rule_parse_skip"(pattern, lex, 2)   # skip them
    goto literal                           # go for next
  literal_end:
    $P0 = find_global "PGE::Exp", "new"
    exp = $P0("PGE::Exp::Literal")
    exp["literal"] = lit
    .return (exp)
.end

=item C<p6rule_parse_dot(STR pattern, PMC lex)>

Parse a dot (.) token and return a C<PGE::Exp::Dot> object for it.

=cut

.sub "p6rule_parse_dot"
    .param string pattern
    .param pmc lex
    .param string token
    .local pmc exp
    p6rule_parse_skip(pattern, lex, 1)
    $P0 = find_global "PGE::Exp", "new"
    exp = $P0("PGE::Exp::Dot")
    .return (exp)
.end

=item C<p6rule_parse_anchor(STR pattern, PMC lex)>

Parse one of the ^, ^^, $, or $$ anchors and return a 
C<PGE::Exp::Anchor> object for it.  Note that $ will be
a little tricky here, because it can also be used to represent
backreferences or variables.

=cut

.sub "p6rule_parse_anchor"
    .param string pattern
    .param pmc lex
    .param string token
    .local pmc exp

    $I0 = length token
    p6rule_parse_skip(pattern, lex, $I0)
    $P0 = find_global "PGE::Exp", "new"
    exp = $P0("PGE::Exp::Anchor")
    exp["token"] = token
    if token != '^' goto end
  end:
    .return (exp)
.end

=item C<p6rule_parse_group(STR pattern, PMC lex)>

Parse a capturing or non-capturing group.  '[' is used to indicate
non-capturing groups, and '(' indicates capturing subpatterns.
Furthermore, '('-captures introduce a new lexical scope for
subcaptures.

=cut

.sub "p6rule_parse_group"
    .param string pattern
    .param pmc lex
    .param string token
    .local pmc exp
    .local int pos
    .local string ket
    .local int subp
    p6rule_parse_skip(pattern, lex, $I0)
    $P0 = find_global "PGE::Exp", "new"
    exp = $P0("PGE::Exp::Group")
    if token == '(' goto group_1
    ket = ']'
    goto group_2
  group_1:
    ket = ')'
    subp = lex["subp"]
    exp["cname"] = subp
    exp["cscope"] = 1
    lex["subp"] = 0
  group_2:
    $P1 = "p6rule_parse_exp"(pattern, lex)
    exp["exp1"] = $P1
    pos = lex['pos']
    $S0 = substr pattern, pos, 1
    if $S0 != ket goto error
    p6rule_parse_skip(pattern, lex, 1)
    unless token == '(' goto end
    inc subp
    lex["subp"] = subp
    goto end
  error:
    $S0 = "missing '"
    concat $S0, ket
    concat $S0, "'"
    p6rule_parse_error(pattern, lex, $S0)
  end:
    .return (exp)
.end

=item C<p6rule_parse_assert(STR pattern, PMC lex)>

Parses an assertion (such as a subrule).

=cut

.sub p6rule_parse_assert
    .param string pattern
    .param pmc lex
    .param string token
    .local int pos
    .local pmc exp
    p6rule_parse_skip(pattern, lex, 1)
    pos = lex["pos"]
    $I0 = pos
  assert_1:
    $I1 = is_wordchar pattern, pos 
    unless $I1 goto assert_2
    inc pos
    goto assert_1
  assert_2:
    $I1 = pos - $I0
    if $I1 > 0 goto assert_3
    p6rule_parse_error(pattern, lex, "invalid subrule name")
  assert_3:
    $P0 = find_global "PGE::Exp", "new"
    $P1 = $P0("PGE::Exp")
    exp = $P0("PGE::Exp::Group", $P1)
    $S0 = substr pattern, $I0, $I1
    exp["rname"] = $S0
    exp["cname"] = $S0
    $S0 = substr pattern, pos, 1
    if $S0 == '>' goto assert_4
    p6rule_parse_error(pattern, lex, "missing closing '>'")
  assert_4:
    inc pos
    $I1 = pos - $I0
    p6rule_parse_skip(pattern, lex, $I1)
    .return (exp)
.end

=item C<p6rule_parse_charclass(STR pattern, PMC lex)>

Parses a character class of some sort, including the \n, \N, \s, \S,
and related matches.

=cut

.sub p6rule_parse_charclass
    .param string pattern
    .param pmc lex
    .param string token
    .local pmc exp
    $P0 = find_global "PGE::Exp", "new"
    exp = $P0("PGE::Exp::CharClass")
    exp["token"] = token
    $I0 = length token
    p6rule_parse_skip(pattern, lex, $I0)
    .return (exp)
.end

=item C<p6rule_parse_cut(STR pattern, PMC lex)>

Parse one of the cut terms (::, :::) in a rule expression.
The single-colon cut (cut previous expression) is actually
handled as a special quantifier.

=cut

.sub p6rule_parse_cut
    .param string pattern
    .param pmc lex
    .param string token
    .local pmc exp
    $P0 = find_global "PGE::Exp", "new"
    exp = $P0("PGE::Exp::Cut")
    exp["token"] = token
    $I0 = length token
    p6rule_parse_skip(pattern, lex, $I0)
    .return (exp)
.end

=item C<p6rule_parse_term(STR pattern, PMC lex)>

Parse a single term in a rule expression, such as a literal,
anchor, assertion, backslash sequence, etc.  We use a TokenHash
here as a lookup table to find the longest sequence of matching
characters.  

=cut

.sub "p6rule_parse_term"
    .param string pattern                          # pattern
    .param pmc lex                                 # current lexical state
    .local pmc p6meta                              # hash of meta chars
    .local int pos                                 # current position
    .local string c                                # current character
    .local pmc exp                                 # returned expression

    p6rule_parse_skip(pattern, lex, 0)             # skip to next token
    pos = lex["pos"]

    p6meta = find_global "PGE::P6Rule", "%_p6meta"
    c = p6meta."lkey"(pattern, pos)
    $P0 = p6meta[c]
    (exp) = $P0(pattern, lex, c)
    .return (exp)
.end

=item C<p6rule_parse_quant(STR pattern, PMC lex)>

Parse a quantified term expressions, as well as the C<:> backtracking
control.  Currently does not handle **{m..n} quantifiers, but that 
will be coming soon.

=cut

.sub "p6rule_parse_quant"
    .param string pattern
    .param pmc lex
    .local pmc exp
    .local pmc qexp
    .local string c
    .local int offset
    .local int pos

    (exp) = "p6rule_parse_term"(pattern, lex)
    set qexp, exp
    pos = lex["pos"]
    c = substr pattern, pos, 1
    $I0 = index "*+?:", c
    if $I0 < 0 goto end
    $I0 = isa exp, "PGE::Exp::Literal"             # break multichar literals
    unless $I0 goto quant                          # not a literal
    $S0 = exp["literal"]                           
    $I0 = length $S0                          
    unless $I0 > 1 goto quant                      # not multichar
    $S1 = substr $S0, -1, 1                        # split off last char
    chopn $S0, 1                                   # else split off last char
    exp["literal"] = $S0                           # save shorter literal
    $P1 = find_global "PGE::Exp", "new"            
    qexp = $P1("PGE::Exp::Literal")                # create quantified literal
    qexp["literal"] = $S1
    exp = $P1("PGE::Exp::Concat", exp, qexp)       # and concat
  quant:                                           # qexp is the atom to quant
  quant_quest:
    if c != '?' goto quant_plus
    pos = "p6rule_parse_skip"(pattern, lex, 1)
    qexp["min"] = 0
    goto quant_greedy
  quant_plus:
    if c != '+' goto quant_star
    pos = "p6rule_parse_skip"(pattern, lex, 1)
    qexp["max"] = PGE_INF
    qexp["isarray"] = 1
    goto quant_greedy
  quant_star:
    if c != '*' goto quant_greedy
    pos = "p6rule_parse_skip"(pattern, lex, 1)
    c = substr pattern, pos, 1
    if c == '*' goto quant_range
    qexp["min"] = 0
    qexp["max"] = PGE_INF
    qexp["isarray"] = 1
    goto quant_greedy
  quant_range:
    pos = "p6rule_parse_skip"(pattern, lex, 1)
    c = substr pattern, pos, 1
    unless c == '{' goto quant_range_error
    pos = "p6rule_parse_skip"(pattern, lex, 1)
    $I0 = pos
  quant_range_1:
    $I1 = is_digit pattern, $I0
    unless $I1 goto quant_range_2
    inc $I0
    goto quant_range_1
  quant_range_2:
    $I0 -= pos
    $S0 = substr pattern, pos, $I0
    qexp["min"] = $S0
    qexp["max"] = $S0
    pos = "p6rule_parse_skip"(pattern, lex, $I0)
    $S0 = substr pattern, pos, 1
    if $S0 == '}' goto quant_range_close
    $S0 = substr pattern, pos, 3
    unless $S0 == "..." goto quant_range_3
    qexp["max"] = PGE_INF
    pos = "p6rule_parse_skip"(pattern, lex, 3)
    goto quant_range_close
  quant_range_3:
    $S0 = substr pattern, pos, 2
    print "SO="
    print $S0
    print "\n"
    unless $S0 == ".." goto quant_range_error
    pos = "p6rule_parse_skip"(pattern, lex, 2)
    $I0 = pos
  quant_range_4:
    $I1 = is_digit pattern, $I0
    unless $I1 goto quant_range_5
    inc $I0
    goto quant_range_4
  quant_range_5:
    $I0 -= pos
    unless $I0 > 0 goto quant_range_error
    $S0 = substr pattern, pos, $I0
    qexp["max"] = $S0
    pos = "p6rule_parse_skip"(pattern, lex, $I0)
  quant_range_close:
    $S0 = substr pattern, pos, 1
    unless $S0 == '}' goto quant_range_error
    pos = "p6rule_parse_skip"(pattern, lex, 1)
    goto quant_greedy
  quant_range_error:
    p6rule_parse_error(pattern, lex, "error in range quantifier")
  quant_greedy:
    c = substr pattern, pos, 1
    if c != '?' goto quant_cut
    pos = "p6rule_parse_skip"(pattern, lex, 1)
    qexp["isgreedy"] = 0
  quant_cut:
    c = substr pattern, pos, 1
    if c != ':' goto end
    inc pos
    c = substr pattern, pos, 1
    if c == ':' goto end
    pos = "p6rule_parse_skip"(pattern, lex, 1)
    qexp["iscut"] = 1
  end:
    .return (exp)
.end

=item C<p6rule_parse_concat(STR pattern, PMC lex)>

Parse a concatenated sequence of rule expressions, terminated
by a closing group character, an alternation, or a conjunction.
XXX: We need to add an option here to allow other characters to
terminate the expression.

=cut

.sub "p6rule_parse_concat"
    .param string pattern
    .param pmc lex
    .local pmc exp
    .local pmc p6meta

    (exp) = "p6rule_parse_quant"(pattern, lex)
    $I0 = lex["pos"]
    $S0 = substr pattern, $I0, 1
    if $S0 == '' goto end
    $I0 = index "])|&", $S0
    if $I0 >= 0 goto end
  concat:
    ($P0) = "p6rule_parse_concat"(pattern, lex)
    $P1 = find_global "PGE::Exp", "new"
    (exp) = $P1("PGE::Exp::Concat", exp, $P0)
  end:
    .return (exp)
.end

=item C<p6rule_parse_alt(STR pattern, PMC lex)>

Parse an alternating sequence of rule expressions, and
generate a PGE::Exp::Alt object for it.  We also have
to adjust the subpattern counts here.

=cut

.sub "p6rule_parse_alt"
    .param string pattern
    .param pmc lex
    .local pmc exp
    .local int subp
    .local int subp1

    subp = lex["subp"]
    (exp) = "p6rule_parse_concat"(pattern, lex)
    $I0 = lex["pos"]
    $S0 = substr pattern, $I0, 1
    if $S0 != '|' goto end
  alt:
    subp1 = lex["subp"]
    lex["subp"] = subp
    "p6rule_parse_skip"(pattern, lex, 1)
    ($P0) = "p6rule_parse_alt"(pattern, lex)
    $P1 = find_global "PGE::Exp", "new"
    (exp) = $P1("PGE::Exp::Alt", exp, $P0)
    $I0 = lex["subp"]
    unless subp1 > $I0 goto end
    lex["subp"] = subp1
  end:
    .return (exp)
.end
   
=item C<p6rule_parse_exp(STR pattern, PMC lex)>

Parse a complete rule expression and return its expression object.
Note that this function may be called recursively from
C<p6rule_parse_group> above.

=cut

.sub "p6rule_parse_exp"
    .param string pattern
    .param pmc lex
    .local pmc exp

    (exp) = "p6rule_parse_alt"(pattern, lex)
    .return (exp)
.end

=item C<(PMC rule, PMC code, PMC expr) = p6rule(STR pattern)>

Compile C<pattern> containing a Perl 6 rule expression into
a subroutine that can match that expression, returned as C<rule>.
The C<p6rule> subroutine also returns the PIR code and expression
tree used to generate the rule (generally for debugging purposes).

=cut

.namespace [ "PGE" ]

.sub "p6rule"
    .param string pattern
    .local pmc lex
    .local pmc exp
    .local pmc code
    .local pmc rule

    lex = new Hash
    lex["pos"] = 0
    lex["subp"] = 0
    $I0 = length pattern
    lex["plen"] = $I0
    $P0 = find_global "PGE::P6Rule", "p6rule_parse_exp"
    (exp) = $P0(pattern, lex)

    $P1 = find_global "PGE::Exp", "new"
    $P2 = $P1("PGE::Exp::End")
    exp = $P1("PGE::Exp::Concat", exp, $P2)
    exp = $P1("PGE::Exp::Start", exp)

    exp.analyze(0)
    exp.serno(0)

    code = new String
    exp.gen(code, "R", "fail")
    # print code
    compreg $P0, "PIR"
    $S0 = code
    rule = compile $P0, $S0
    .return (rule, code, exp)
.end

=head1 AUTHOR

Patrick Michaud (pmichaud@pobox.com) is the author and maintainer.
Patches and suggestions should be sent to the Perl 6 compiler list
(perl6-compiler@perl.org).

=cut

