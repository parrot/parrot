=head1 TITLE

P6Regex - compiler and parser for Perl 6 regex

=over 4

=item C<compile_p6regex(PMC source, PMC adverbs :slurpy :named)>

Return the result of compiling C<source> according to Perl 6
regex syntax and the associated C<adverbs>.  Normally this
function is obtained using C<compreg 'PGE::P6Regex'> instead
of calling it directly.

Returns the compiled regular expression.  If a C<target>
named parameter is supplied, then it will return the parse tree
(target='parse'), the expression tree (target='exp'),
or the resulting PIR code (target='PIR').

=cut

.namespace [ 'PGE::P6Regex' ]
 
.sub 'compile_p6regex'
    .param pmc source
    .param pmc args            :slurpy
    .param pmc adverbs         :slurpy :named

    unless null adverbs goto set_adverbs
    adverbs = new .Hash

  set_adverbs:
    $I0 = exists adverbs['grammar']
    if $I0 goto with_grammar
    unless args goto adverb_grammar_1
    $S0 = shift args
    adverbs['grammar'] = $S0
    goto with_grammar
  adverb_grammar_1:
    adverbs['grammar'] = 'PGE::Grammar'
  with_grammar:
    $I0 = exists adverbs['name']
    if $I0 goto with_name
    unless args goto adverb_name_1
    $S0 = shift args
    adverbs['name'] = $S0
    goto with_name
  adverb_name_1:
    adverbs['name'] = '_regex'
  with_name:
    $I0 = exists adverbs['lang']
    if $I0 goto with_lang
    adverbs['lang'] = 'PIR'
  with_lang:
    $I0 = exists adverbs['ignorecase']
    if $I0 goto with_ignorecase
    $I0 = adverbs['i']
    adverbs['ignorecase'] = $I0
  with_ignorecase:
    $I0 = exists adverbs['sigspace']
    if $I0 goto with_sigspace
    $I0 = exists adverbs['s']
    if $I0 goto with_s
    $I0 = exists adverbs['words']
    if $I0 goto with_words
    $I0 = adverbs['w']
    adverbs['sigspace'] = $I0
    goto with_sigspace
  with_s:
    $I0 = adverbs['s']
    adverbs['sigspace'] = $I0
    goto with_sigspace
  with_words:
    $I0 = adverbs['words']
    adverbs['sigspace'] = $I0
  with_sigspace:

    .local string target
    target = adverbs['target']

    ##   If we're passed the results of a previous parse,  use it.
    .local pmc match, exp
    $I0 = isa source, 'PGE::Match'
    if $I0 == 0 goto parse
    $P0 = source['expr']
    if null $P0 goto parse
    $I0 = isa $P0, 'PGE::Exp'
    if $I0 == 0 goto parse
    match = source
    goto analyze

  parse:
    ##   Let's parse the source as a regex
    $P0 = get_hll_global ['PGE::Grammar'], 'regex'
    match = $P0(source, adverbs :flat :named)
    if target != 'parse' goto check
    .return (match)

  check:
    unless match goto check_1
    $S0 = source
    $S1 = match
    if $S0 == $S1 goto analyze
  check_1:
    null $P0
    .return ($P0)

  analyze:
    .local pmc exp, pad
    exp = match['expr']
    pad = clone adverbs
    $P0 = new .Hash
    pad['lexscope'] = $P0
    exp = exp.p6exp(pad)
    if target != 'exp' goto pir
    .return (exp)

  pir:
    .local pmc code
    .local string grammar
    .local string nsformat
    grammar = adverbs['grammar']
    nsformat = ".namespace"
    if grammar == '' goto pir_emit
    nsformat = ".namespace [ '%0' ]"
  pir_emit:
    code = new 'PGE::CodeString'
    code.emit(nsformat, grammar)
    $P0 = exp.root_pir(adverbs :flat :named)
    code .= $P0
    if target != 'PIR' goto bytecode
    .return (code)

  bytecode:
    $P0 = compreg 'PIR'
    $P1 = $P0(code)
  make_grammar:
    $I0 = find_type grammar
    if $I0 > 0 goto end
    $P0 = subclass 'PGE::Grammar', grammar
  end:
    .return ($P1)
.end


=item C<regex(PMC mob, PMC adverbs :slurpy :named)>

Parses a regex according to Perl 6 regex syntax, and returns 
the corresponding parse tree.  This is installed as a C<< <regex> >> 
rule in C<PGE::Grammar>, so one can call it from another regex to 
parse valid Perl 6 regular expressions.

=cut

.namespace [ 'PGE::Grammar' ]

.sub 'regex'
    .param pmc mob
    .param pmc adverbs         :slurpy :named

    .local string stop
    .local pmc stopstack, optable, match

    stopstack = get_hll_global ['PGE::P6Regex'], '@!stopstack'
    optable = get_hll_global ['PGE::P6Regex'], '$optable'

    stop = adverbs['stop']
    push stopstack, stop
    match = optable.'parse'(mob, 'stop'=>stop)
    $S0 = pop stopstack

    .return (match)
.end

=item C<onload()>

Initializes the P6Regex parser and other data structures
needed for compiling regexes.

=cut

.include 'cclass.pasm'

.namespace [ 'PGE::P6Regex' ]

.sub '__onload' :load
    .local pmc optable

    $P0 = subclass 'PGE::Exp::Subrule', 'PGE::Exp::WS'
    $P0 = subclass 'PGE::Exp', 'PGE::Exp::Alias'

    optable = new 'PGE::OPTable'
    set_global '$optable', optable

    $P0 = get_global 'parse_term'
    optable.newtok('term:', 'precedence'=>'=', 'nows'=>1, 'parsed'=>$P0)

    optable.newtok('term:^', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::Anchor')
    optable.newtok('term:^^', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::Anchor')
    optable.newtok('term:$$', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::Anchor')
    optable.newtok('term:\b', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::Anchor')
    optable.newtok('term:\B', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::Anchor')
    optable.newtok('term:<<', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::Anchor')
    optable.newtok('term:>>', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::Anchor')
    optable.newtok(unicode:"term:\xab", 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::Anchor')
    optable.newtok(unicode:"term:\xbb", 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::Anchor')

    optable.newtok('term:.', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::CCShortcut')
    optable.newtok('term:\d', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::CCShortcut')
    optable.newtok('term:\D', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::CCShortcut')
    optable.newtok('term:\s', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::CCShortcut')
    optable.newtok('term:\S', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::CCShortcut')
    optable.newtok('term:\w', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::CCShortcut')
    optable.newtok('term:\W', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::CCShortcut')
    optable.newtok('term:\N', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::CCShortcut')
    optable.newtok('term:\n', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::Newline')

    $P0 = get_global 'parse_dollar'
    optable.newtok('term:$', 'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)

    $P0 = get_global 'parse_subrule'
    optable.newtok('term:<', 'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)
    optable.newtok('term:<?', 'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)
    optable.newtok('term:<!', 'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)

    $P0 = get_global 'parse_enumcharclass'
    optable.newtok('term:<[', 'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)
    optable.newtok('term:<+', 'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)
    optable.newtok('term:<-', 'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)
    optable.newtok('term:<![', 'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)

    $P0 = get_global 'parse_quoted_literal'
    optable.newtok("term:<'", 'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)

    optable.newtok('term:::', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::Cut')
    optable.newtok('term::::', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::Cut')
    optable.newtok('term:<commit>', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::Cut')

    $P0 = get_global 'parse_closure'
    optable.newtok("term:{{", 'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)

    optable.newtok('circumfix:[ ]', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::Group')
    optable.newtok('circumfix:( )', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::CGroup')

    $P0 = get_global 'parse_quant'
    optable.newtok('postfix:*', 'looser'=>'term:', 'parsed'=>$P0)
    optable.newtok('postfix:+', 'equiv'=>'postfix:*', 'parsed'=>$P0)
    optable.newtok('postfix:?', 'equiv'=>'postfix:*', 'parsed'=>$P0)
    optable.newtok('postfix::', 'equiv'=>'postfix:*', 'parsed'=>$P0)
    optable.newtok('postfix:**', 'equiv'=>'postfix:*', 'parsed'=>$P0)


    optable.newtok('infix:', 'looser'=>'postfix:*', 'assoc'=>'list', 'nows'=>1, 'match'=>'PGE::Exp::Concat')
    optable.newtok('infix:&', 'looser'=>'infix:', 'nows'=>1, 'match'=>'PGE::Exp::Conj')
    optable.newtok('infix:|', 'looser'=>'infix:&', 'nows'=>1, 'match'=>'PGE::Exp::Alt')
    optable.newtok('prefix:|', 'equiv'=>'infix:|', 'nows'=>1, 'match'=>'PGE::Exp::Alt')

    optable.newtok('infix::=', 'tighter'=>'infix:', 'assoc'=>'right', 'match'=>'PGE::Exp::Alias')

    $P0 = get_global 'parse_modifier'
    optable.newtok('prefix::', 'looser'=>'infix:|', 'nows'=>1, 'parsed'=>$P0)

    optable.newtok('close:}', 'precedence'=>'<', 'nows'=>1)

    .local pmc esclist
    esclist = new .Hash
    set_global '%esclist', esclist
    esclist['e'] = "\e"
    esclist['f'] = "\f"
    esclist['r'] = "\r"
    esclist['t'] = "\t"
    esclist['v'] = unicode:"\x0a\x0b\x0c\x0d\x85\u2028\u2029"
    esclist['h'] = unicode:"\x09\x20\xa0\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000"
    esclist['n'] = unicode:"\x0a\x0d\x0c\x85\u2028\u2029"
    # See http://www.unicode.org/Public/UNIDATA/PropList.txt for above

    # Create and store closure preprocessors in %closure_pp
    $P0 = new .Hash
    set_hll_global ['PGE::P6Regex'], '%closure_pp', $P0
    $P1 = get_hll_global ['PGE::P6Regex'], 'PIR_closure'
    $P0["PIR"] = $P1

    # Create an array for holding stop tokens
    $P0 = new .ResizablePMCArray
    set_hll_global ['PGE::P6Regex'], '@!stopstack', $P0

    $P0 = get_global 'compile_p6regex'
    compreg 'PGE::P6Regex', $P0
    .return ()
.end


=item C<parse_term(PMC mob [, PMC adverbs :slurpy :named])>

Parses literal strings and whitespace.  
Return a failed match if the stoptoken is found.

=cut

.sub 'parse_term'
    .param pmc mob
    .param pmc adverbs         :slurpy :named

    .local string target
    .local int pos, lastpos
    $P0 = getattribute mob, '$.target'
    target = $P0
    $P0 = getattribute mob, '$.pos'
    pos = $P0
    lastpos = length target

    .local string stop
    $P0 = get_hll_global ['PGE::P6Regex'], '@!stopstack'
    stop = $P0[-1]

    .local string initchar
    $I0 = is_cclass .CCLASS_WHITESPACE, target, pos
    if $I0 goto term_ws
    $I0 = length stop
    if $I0 == 0 goto not_stop
    $S0 = substr target, pos, $I0
    if $S0 == stop goto end_noterm
  not_stop:
    initchar = substr target, pos, 1
    $I0 = index '<>[](){}:*?+|&^$.', initchar
    if $I0 >= 0 goto end_noterm
    inc pos
    if initchar == '#' goto term_ws
    if initchar != "\\" goto term_literal

  term_backslash:
    $I0 = is_cclass .CCLASS_NUMERIC, target, pos
    if $I0 goto err_backslash_digit
    initchar = substr target, pos, 1
    .local int isnegated
    isnegated = is_cclass .CCLASS_UPPERCASE, target, pos
    inc pos
    $S0 = initchar
    $I0 = index "ABCDEFGHIJKLMNOPQRSTUVWXYZ", $S0
    if $I0 < 0 goto term_backslash_1
    $S0 = substr "abcdefghijklmnopqrstuvwxyz", $I0, 1
  term_backslash_1:  
    if $S0 == 'x' goto term_backslash_x            # \x.. \X..
    if $S0 == 'o' goto term_backslash_o            # \o.. \O..
    $P0 = get_global '%esclist'
    $I0 = exists $P0[$S0]
    if $I0 == 0 goto term_literal
    initchar = $P0[$S0]
    if isnegated goto term_charlist
    $I0 = length initchar
    if $I0 < 2 goto term_literal
  term_charlist:
    (mob, $P99, $P99, $P0) = mob.newfrom(0, 'PGE::Exp::EnumCharList')
    mob.'result_object'(initchar)
    mob['isnegated'] = isnegated
    $P0 = pos
    .return (mob)

  term_backslash_o:
    .local int base
    base = 8
    goto term_bx0
  term_backslash_x:
    base = 16
  term_bx0:
    $I0 = 0
    $S0 = substr target, pos, 1
    $I2 = index "[{(<", $S0
    if $I2 < 0 goto term_bx1
    $S2 = substr "]})>", $I0
    inc pos
  term_bx1:
    $S0 = substr target, pos, 1
    $I1 = index "0123456789abcdef0123456789ABCDEF", $S0
    if $I1 < 0 goto term_bx2
    $I1 = $I1 % 16
    if $I1 >= base goto term_bx2
    $I0 *= base
    $I0 += $I1
    inc pos
    goto term_bx1
  term_bx2:
    initchar = chr $I0
    if $I2 < 0 goto term_bx3
    $S0 = substr target, pos, 1
    if $S0 != $S2 goto err_backslash_close
    inc pos
  term_bx3:
    if isnegated goto term_charlist                # \X[...], \000
    # goto term_literal                            # \x[...], \000

  term_literal:
    .local int litstart, litlen
    .local string delim
    litstart = pos
    litlen = 0
    delim = "<>[](){}:*?+\\|&#^$"
    $S0 = substr stop, 0, 1
    delim .= $S0
  term_literal_loop:
    if pos >= lastpos goto term_literal_end
    $I0 = is_cclass .CCLASS_WHITESPACE, target, pos
    if $I0 goto term_literal_end
    $S0 = substr target, pos, 1
    $I0 = index delim, $S0
    if $I0 >= 0 goto term_literal_end
    inc pos
    inc litlen
    goto term_literal_loop
  term_literal_end:
    ##   for a multi-char literal, we don't eat the last chararacter
    ##   in case it's quantified (it gets processed as a subsequent term)
    if litlen < 1 goto term_literal_one
    dec pos
  term_literal_one:
    $I0 = pos - litstart
    $S0 = substr target, litstart, $I0
    $S0 = concat initchar, $S0
    (mob, $S99, $P99, $P0) = mob.newfrom(0, 'PGE::Exp::Literal')
    mob.'result_object'($S0)
    $P0 = pos
    .return (mob)

  term_ws:
    .return 'parse_term_ws'(mob)

  end_noterm:
    (mob) = mob.newfrom(0, 'PGE::Exp::Literal')
    .return (mob)

  err_backslash_digit:
    parse_error(mob, pos, "\\1 and \\012 illegal, use $1, \\o012, or \\x0a")
    .return (mob)

  err_backslash_close:
    parse_error(mob, pos, "Missing close bracket for \\x..")
.end


=item C<parse_term_ws(PMC mob)>

Parses a whitespace term.

=cut

.sub 'parse_term_ws'
    .param pmc mob
    .local string target
    .local pmc mfrom, mpos
    .local int pos, lastpos
    (mob, target, mfrom, mpos) = mob.newfrom(0, 'PGE::Exp::WS')
    pos = mfrom
    lastpos = length target
  
  term_ws_loop:
    ##   scan for the next non-whitespace character
    pos = find_not_cclass .CCLASS_WHITESPACE, target, pos, lastpos
    $S0 = substr target, pos, 1
    if $S0 != '#' goto end
    ##   we have a #-comment, determine its closing delimiter
    inc pos
    .local string closedelim
    closedelim = "\n"
    $S0 = substr target, pos, 1
    $I0 = index '<[{(', $S0
    if $I0 < 0 goto term_ws_loop_1
    closedelim = substr '>]})', $I0, 1
  term_ws_loop_1:
    $I0 = index target, closedelim, pos
    pos = $I0 + 1
    if pos > 0 goto term_ws_loop
    pos = lastpos
  end:
    mpos = pos
    .return (mob)
.end


=item C<parse_quant(PMC mob)>

Parses a quantifier, such as *, +, ?, :, and all of their wonderous
combinations.

=cut

.sub 'parse_quant'
    .param pmc mob
    .local string target
    .local pmc mfrom, mpos
    .local pmc key
    .local int pos, lastpos
    key = mob['KEY']
    (mob, target, mfrom, mpos) = mob.newfrom(0, 'PGE::Exp::Quant')
    pos = mfrom
    lastpos = length target


    .local int min, max, suffixpos
    .local string suffix
    min = 1
    max = 1
    suffixpos = find_not_cclass .CCLASS_WHITESPACE, target, pos, lastpos

    #   The postfix:<::> operator may bring us here when it's really a
    #   term:<::> term.  So, we check for that here and fail this match
    #   if we really have a cut term.  
    if key != ':' goto quant
    $S0 = substr target, pos, 1
    if $S0 == ':' goto end
    mob['backtrack'] = PGE_BACKTRACK_NONE
    goto quant_suffix_1

  quant:
    if key == '**' goto quant_closure
    if key == '+' goto quant_max
    min = 0
  quant_max:
    if key == '?' goto quant_suffix
    max = PGE_INF
    goto quant_suffix
  quant_closure:
    pos = find_not_cclass .CCLASS_WHITESPACE, target, pos, lastpos
    $S0 = substr target, pos, 1
    if $S0 != "{" goto err_closure
    inc pos
    $I1 = find_not_cclass .CCLASS_NUMERIC, target, pos, lastpos
    if $I1 <= pos goto err_closure
    $S0 = substr target, pos
    min = $S0
    max = $S0
    pos = $I1
    $S0 = substr target, pos, 2
    if $S0 != '..' goto quant_closure_end
    pos += 2
    max = PGE_INF
    $S0 = substr target, pos, 1
    if $S0 == '.' goto quant_closure_end
    $I1 = find_not_cclass .CCLASS_NUMERIC, target, pos, lastpos
    if $I1 <= pos goto err_closure
    $S0 = substr target, pos
    max = $S0
    pos = $I1
  quant_closure_end:
    $S0 = substr target, pos, 1
    if $S0 != "}" goto err_closure
    inc pos
    suffixpos = find_not_cclass .CCLASS_WHITESPACE, target, pos, lastpos
  quant_suffix:
    suffix = substr target, suffixpos, 2
    if suffix == ':?' goto quant_eager
    if suffix == ':!' goto quant_greedy
  quant_suffix_1:
    suffix = substr target, suffixpos, 1
    if suffix == '?' goto quant_eager
    if suffix == '!' goto quant_greedy
    if suffix != ':' goto quant_set
  quant_none:
    mob['backtrack'] = PGE_BACKTRACK_NONE
    goto quant_skip_suffix
  quant_eager:
    mob['backtrack'] = PGE_BACKTRACK_EAGER
    goto quant_skip_suffix
  quant_greedy:
    mob['backtrack'] = PGE_BACKTRACK_GREEDY
  quant_skip_suffix:
    $I0 = length suffix
    pos = suffixpos + $I0
  quant_set:
    mob['min'] = min
    mob['max'] = max
    mpos = pos
  end:
    .return (mob) 

  err_closure:
    parse_error(mob, pos, "Error in closure quantifier")
.end


=item C<parse_dollar(PMC mob)>

Parse things that begin with a dollar sign, such as scalars,
anchors, and match subscripts.

=cut

.sub "parse_dollar"
    .param pmc mob
    .local string target
    .local int pos, lastpos
    .local pmc newfrom, mfrom, mpos
    .local string cname
    newfrom = get_hll_global ['PGE::Match'], 'newfrom'
    $P0 = getattribute mob, '$.target'
    target = $P0
    $P0 = getattribute mob, '$.pos'
    pos = $P0
    lastpos = length target
    $S0 = substr target, pos, 1
    if $S0 == '<' goto name
    $I0 = find_not_cclass .CCLASS_NUMERIC, target, pos, lastpos
    if $I0 > pos goto numeric
    $I0 = find_not_cclass .CCLASS_WORD, target, pos, lastpos
    if $I0 > pos goto scalar

  eos_anchor:
    (mob, $P0, mfrom, mpos) = newfrom(mob, 0, 'PGE::Exp::Anchor')
    mpos = pos
    .return (mob)

  scalar:
    (mob, $P0, mfrom, mpos) = newfrom(mob, 0, 'PGE::Exp::Scalar')
    dec pos
    $I1 = $I0 - pos
    cname = substr target, pos, $I1
    cname = concat '"', cname
    cname = concat cname, '"'
    mob["cname"] = cname
    mpos = $I0
    .return (mob)

  numeric:
    (mob, $P0, mfrom, mpos) = newfrom(mob, 0, 'PGE::Exp::Scalar')
    $I1 = $I0 - pos
    cname = substr target, pos, $I1
    mob["cname"] = cname
    mpos = $I0
    .return (mob)

  name:
    inc pos
    (mob, $P0, mfrom, mpos) = newfrom(mob, 0, "PGE::Exp::Scalar")
    $I0 = index target, ">", pos
    if $I0 < pos goto err_close
  name_1:
    $I1 = $I0 - pos
    cname = substr target, pos, $I1
    cname = escape cname
    cname = concat '"', cname
    cname = concat cname, '"'
    mob["cname"] = cname
    pos = $I0 + 1
    mpos = pos
    .return (mob)

  err_close:
    parse_error(mob, pos, "Missing close '>' in scalar")
    .return (mob)
.end


=item C<parse_subname(STR target, INT pos)>

Scan C<target> starting at C<pos> looking for a subrule name
(following Perl 6's identifier syntax).  Returns any subrule
name found, and the ending position of the name.

=cut


.sub 'parse_subname'
    .param string target
    .param int pos
    .local int startpos, targetlen

    targetlen = length target
    startpos = pos
    $I0 = pos
  loop:
    $I1 = find_not_cclass .CCLASS_WORD, target, $I0, targetlen
    if $I1 == $I0 goto end
    pos = $I1
    $S0 = substr target, pos, 2
    if $S0 != '::' goto end
    $I0 = pos + 2
    goto loop
  end:
    $I0 = pos - startpos
    $S0 = substr target, startpos, $I0
    .return ($S0, pos)
.end


=item C<parse_subrule(PMC mob)>

Parses a subrule token.

=cut

.sub 'parse_subrule'
    .param pmc mob
    .local string target
    .local pmc mobsave, mfrom, mpos
    .local int pos, lastpos
    .local string key
    key = mob['KEY']
    mobsave = mob
    (mob, target, mfrom, mpos) = mob.newfrom(0, 'PGE::Exp::Subrule')
    pos = mfrom
    lastpos = length target

    .local string subname
    (subname, pos) = 'parse_subname'(target, pos)
    mob['subname'] = subname
    $S0 = substr target, pos, 1

    ##   see what type of subrule this is
    mob['iscapture'] = 1
    if key == '<?' goto nocapture
    if key == '<!' goto negated

    ##   if the next character is +/-, this is really an enumcharclass
    $I0 = index '+-', $S0
    if $I0 == -1 goto subrule_arg
    .return 'parse_enumcharclass'(mobsave)

  negated:
    mob['isnegated'] = 1
  nocapture:
    mob['iscapture'] = 0
  subrule_arg:
    if $S0 == ':' goto subrule_text_arg
    if $S0 != ' ' goto subrule_end
  subrule_pattern_arg:
    inc pos
    mpos = pos
    .local pmc regex
    regex = get_hll_global ['PGE::Grammar'], 'regex'
    $P1 = regex(mob, 'stop'=>'>')
    unless $P1 goto end
    $S0 = $P1
    mob['arg'] = $S0
    pos = $P1.to()
    mpos = -1
    goto subrule_end
  subrule_text_arg:
    pos += 2
    $I0 = index target, '>', pos
    if $I0 < 0 goto end
    $I0 -= pos
    $S0 = substr target, pos, $I0
    mob['arg'] = $S0
    pos += $I0
  subrule_end:
    $S0 = substr target, pos, 1
    if $S0 != '>' goto end
    inc pos
    mpos = pos
    $I0 = mob['iscapture']
    if $I0 == 0 goto end
    $S0 = escape subname
    $S0 = concat '"', $S0
    $S0 = concat $S0, '"'
    mob['cname'] = $S0
  end:
    .return (mob)
.end


=item C<parse_enumcharclass(PMC mob)>

Extract an enumerated character list.

=cut

.sub 'parse_enumcharclass'
    .param pmc mob
    .param pmc adverbs         :slurpy :named
    .local string target
    .local pmc term
    .local string op
    .local int pos, lastpos

    $P0 = getattribute mob, '$.target'
    target = $P0
    pos = mob.to()
    lastpos = length target
    op = mob['KEY']

    ##   handle the case of <[, <+[, <-[, and <![ as the token
    ##   by converting to <, <+, <-, or <! 
    $S0 = substr op, -1, 1
    if $S0 != '[' goto parse_loop
    chopn op, 1
    goto enum

  parse_loop: 
    pos = find_not_cclass .CCLASS_WHITESPACE, target, pos, lastpos
    if pos >= lastpos goto err_close
    $S0 = substr target, pos, 1
    if $S0 != '[' goto subrule
    inc pos
  
  enum:
    .local string charlist
    .local int isrange
    charlist = ''
    isrange = 0

  enum_loop:
    ##   skip leading whitespace and get next character
    pos = find_not_cclass .CCLASS_WHITESPACE, target, pos, lastpos
    if pos >= lastpos goto err_close
    $S0 = substr target, pos, 1
    if $S0 == ']' goto enum_close
    if $S0 == '-' goto err_hyphen
    if $S0 == '.' goto enum_dotrange
    if $S0 != "\\" goto enum_addchar
  enum_backslash:
    inc pos
    ##   get escaped character
    $S0 = substr target, pos, 1
    ##   handle metas such as \n, \t, \r, etc.
    $I0 = index 'nrtfae0', $S0
    if $I0 == -1 goto enum_addchar
    $S0 = substr "\n\r\t\f\a\e\0", $I0, 1
  enum_addchar:
    inc pos
    if isrange goto enum_addrange
    charlist .= $S0
    goto enum_loop
  enum_dotrange:
    ##   check if we have a .. range marker
    if isrange goto enum_addrange
    $S1 = substr target, pos, 2
    if $S1 != '..' goto enum_addchar
    pos += 2
    isrange = 1
    goto enum_loop
  enum_addrange:
    ##   add character range to charlist
    $I2 = ord charlist, -1
    $I0 = ord $S0
  enum_addrange_1:
    inc $I2
    if $I2 > $I0 goto enum_loop
    $S1 = chr $I2
    charlist .= $S1
    goto enum_addrange_1
  enum_close:
    inc pos
    ##   create a node for the charlist
    (term) = mob.'newfrom'(0, 'PGE::Exp::EnumCharList')
    term.'to'(pos)
    term.'result_object'(charlist)
    goto combine

  subrule:
    $I0 = pos
    .local string subname
    (subname, pos) = 'parse_subname'(target, $I0)
    if pos == $I0 goto err
    (term) = mob.'newfrom'(0, 'PGE::Exp::Subrule')
    term.'from'($I0)
    term.'to'(pos)
    term['subname'] = subname
    term['iscapture'] = 0

  combine:
    ##   find out what operator preceded this term
    if op == '+' goto combine_plus
    if op == '-' goto combine_minus
    if op == '<' goto combine_init
    if op == '<+' goto combine_init
    ##   token was '<-' or '<!'
    term['isnegated'] = 1
    if op != '<!' goto combine_init
    term['iszerowidth'] = 1

  combine_init:
    mob = term
    goto next_op

  combine_plus:
    ##   <a+b>  ==>   <a> | <b>
    ($P0) = mob.'newfrom'(0, 'PGE::Exp::Alt')
    $P0.'to'(pos)
    $P0[0] = mob
    $P0[1] = term
    mob = $P0
    goto next_op

  combine_minus:
    ##   <a-b> ==>   <!b> <a>
    term['isnegated'] = 1
    term['iszerowidth'] = 1
    ($P0) = mob.'newfrom'(0, 'PGE::Exp::Concat')
    $P0.'to'(pos)
    $P0[0] = term
    $P0[1] = mob
    mob = $P0
    goto next_op

  next_op:
    pos = find_not_cclass .CCLASS_WHITESPACE, target, pos, lastpos
    if pos >= lastpos goto err_close

    op = substr target, pos, 1
    inc pos
    if op == '+' goto parse_loop
    if op == '-' goto parse_loop
    if op != '>' goto err
    mob.'to'(pos)
    goto end

  err:
    parse_error(mob, pos, "Error parsing enumerated character class")
    goto end
  err_hyphen:
    parse_error(mob, pos, "Unescaped '-' in charlist (use '..' or '\-')")
    goto end
  err_close:
    parse_error(mob, pos, "Missing close '>' or ']>' in enumerated character class")
  end:
    .return (mob)
.end


=item C<parse_quoted_literal>

Parses <'...'> literals.

=cut

.sub 'parse_quoted_literal'
    .param pmc mob
    .local int pos, lastpos
    .local string target
    (mob, target, pos) = mob.newfrom(0, 'PGE::Exp::Literal')
    lastpos = length target
    lastpos -= 2
    .local string lit
    lit = ''
  literal_iter:
    if pos > lastpos goto literal_error
    $S0 = substr target, pos, 2
    if $S0 == "'>" goto literal_end
    $S0 = substr target, pos, 1
    if $S0 != "\\" goto literal_add
    inc pos
    $S0 = substr target, pos, 1
  literal_add:
    inc pos
    lit .= $S0
    goto literal_iter
  literal_end:
    pos += 2
    mob.'result_object'(lit)
    mob.'to'(pos)
    .return (mob)
  literal_error:
    parse_error(mob, pos, "No closing '> in quoted literal")
    .return (mob)
.end


=item C<parse_modifier>

Parse a modifier.

=cut

.sub 'parse_modifier'
    .param pmc mob
    .local int pos, lastpos
    .local string target, value
    .local pmc mfrom, mpos
    .local string key
    key = mob['KEY']
    (mob, target, mfrom, mpos) = mob.newfrom(0, 'PGE::Exp::Modifier')
    pos = mfrom
    lastpos = length target
    value = "1"
    $I0 = pos
    pos = find_not_cclass .CCLASS_NUMERIC, target, pos, lastpos
    if pos == $I0 goto name
    $I1 = pos - $I0
    value = substr target, $I0, $I1
    $I0 = pos
  name:
    pos = find_not_cclass .CCLASS_WORD, target, pos, lastpos
    $I1 = pos - $I0
    $S0 = substr target, $I0, $I1
    mob['key'] = $S0
    mob.'result_object'(value)
    $S0 = substr target, pos, 1
    if $S0 != '(' goto end
    $I0 = pos + 1
    pos = index target, ')', pos
    $I1 = pos - $I0
    $S0 = substr target, $I0, $I1
    mob.'result_object'($S0)
    inc pos
  end:
    ### XXX pos = find_not_cclass .CCLASS_WHITESPACE, target, pos, lastpos
    mpos = pos
    .return (mob)
.end


.sub 'parse_closure'
    .param pmc mob
    .local pmc newfrom
    .local string target
    .local pmc mfrom, mpos
    .local int pos, len
    $P0 = get_hll_global ["PGE::Match"], "newfrom"
    (mob, target, mfrom, mpos) = $P0(mob, 0, "PGE::Exp::Closure")
    pos = mfrom
    len = 2
  init:
    $S0 = substr target, pos, 1
    if $S0 != "{" goto body
    inc len
    inc pos
    goto init
  body:
    $S0 = repeat "}", len
    $I0 = index target, $S0, pos
    if $I0 < pos goto err_noclose
    $I1 = $I0 - pos
    $S1 = substr target, pos, $I1
    mob.'result_object'($S1)
    pos = $I0 + len
    mpos = pos
    .return (mob)
 err_noclose:
    parse_error(mob, pos, "Missing closing braces for closure")
    .return (mob)
.end


.sub 'parse_error'
    .param pmc mob
    .param int pos
    .param string message
    $P0 = getattribute mob, '$.pos'
    $P0 = pos
    $P0 = new .Exception
    $S0 = 'p6rule parse error: '
    $S0 .= message
    $S0 .= ' at offset '
    $S1 = pos
    $S0 .= $S1
    $S0 .= ", found '"
    $P1 = getattribute mob, '$.target'
    $S1 = $P1
    $S1 = substr $S1, pos, 1
    $S0 .= $S1
    $S0 .= "'"
    $P0['_message'] = $S0
    throw $P0
    .return ()
.end




.namespace [ 'PGE::Exp' ]

.sub 'p6exp' :method
    .param pmc pad
    .return (self)
.end


.namespace [ 'PGE::Exp::Literal' ]

.sub 'p6exp' :method
    .param pmc pad
    $I0 = pad['ignorecase']
    self['ignorecase'] = $I0
    .return (self)
.end


.namespace [ 'PGE::Exp::Concat' ]

.sub 'p6exp' :method
    .param pmc pad

    .local pmc array, exp
    .local int i, j, n
    array = self.get_array()
    n = elements array
    i = 0
    j = 0
  iter_loop:
    if i >= n goto iter_end
    exp = self[i]
    inc i
    exp = exp.p6exp(pad)
    if null exp goto iter_loop
    self[j] = exp
    inc j
    goto iter_loop
  iter_end:
    array = j
    if j > 1 goto end
    $P0 = array[0]
    .return ($P0)
  end:
    .return (self)
.end


.namespace [ 'PGE::Exp::Quant' ]

.sub 'p6exp' :method
    .param pmc pad

    $I0 = exists self['backtrack']
    if $I0 goto backtrack_done
    self['backtrack'] = PGE_BACKTRACK_GREEDY
    $I0 = pad['ratchet']
    if $I0 == 0 goto backtrack_done
    self['backtrack'] = PGE_BACKTRACK_NONE
  backtrack_done:

    .local pmc exp0
    .local int isarray
    isarray = pad['isarray']
    pad['isarray'] = 1
    exp0 = self[0]
    exp0['isquant'] = 1
    exp0 = exp0.p6exp(pad)
    self[0] = exp0
    pad['isarray'] = isarray
    .return (self)
.end


.namespace [ 'PGE::Exp::Group' ]

.sub 'p6exp' :method
    .param pmc pad
    .local pmc exp0

    $I0 = self['isquant']
    if $I0 goto backtrack_done
    $I0 = exists self['backtrack']
    if $I0 goto backtrack_done
    $I0 = pad['ratchet']
    if $I0 == 0 goto backtrack_done
    self['backtrack'] = PGE_BACKTRACK_NONE
  backtrack_done:

    exp0 = self[0]
    exp0 = exp0.p6exp(pad)
    self[0] = exp0
    .return (self)
.end


.namespace [ 'PGE::Exp::CGroup' ]

.sub 'p6exp' :method
    .param pmc pad
    .local pmc exp

    $I0 = self['isquant']
    if $I0 goto backtrack_done
    $I0 = exists self['backtrack']
    if $I0 goto backtrack_done
    $I0 = pad['ratchet']
    if $I0 == 0 goto backtrack_done
    self['backtrack'] = PGE_BACKTRACK_NONE
  backtrack_done:

    self['iscapture'] = 1
    $I0 = exists self['isscope']
    if $I0 goto set_cname
    self['isscope'] = 1

  set_cname:
    $I0 = exists self['cname']
    if $I0 goto set_subpats
    $I0 = pad['subpats']
    self['cname'] = $I0

  set_subpats:
    .local string cname
    cname = self['cname']
    $S0 = substr cname, 0, 1
    if $S0 == '"' goto set_lexicals
    $I0 = cname
    inc $I0
    pad['subpats'] = $I0

  set_lexicals:
    .local int isarray
    isarray = 0
    .local pmc lexscope
    lexscope = pad['lexscope']
    $I0 = exists lexscope[cname]
    if $I0 == 0 goto set_lexicals_1
    $P0 = lexscope[cname]
    $P0['isarray'] = 1
    isarray = 1
  set_lexicals_1:
    lexscope[cname] = self

    .local int padarray
    padarray = pad['isarray']
    isarray |= padarray
    self['isarray'] = isarray
    $I0 = self['isscope']
    if $I0 == 0 goto unscoped

  scoped:
    .local int subpats
    subpats = pad['subpats']
    pad['subpats'] = 0
    pad['isarray'] = 0
    $P0 = new .Hash
    pad['lexscope'] = $P0
    exp = self[0]
    exp = exp.'p6exp'(pad)
    self[0] = exp
    pad['lexscope'] = lexscope
    pad['isarray'] = padarray
    pad['subpats'] = subpats
    goto end

  unscoped:
    exp = self[0]
    exp = exp.'p6exp'(pad)
    self[0] = exp
  end:
    .return (self)
.end


.namespace [ 'PGE::Exp::Subrule' ]

.sub 'p6exp' :method
    .param pmc pad

    $I0 = self['isquant']
    if $I0 goto backtrack_done
    $I0 = exists self['backtrack']
    if $I0 goto backtrack_done
    $I0 = pad['ratchet']
    if $I0 == 0 goto backtrack_done
    self['backtrack'] = PGE_BACKTRACK_NONE
  backtrack_done:

    .local int iscapture, isarray
    .local pmc lexscope
    iscapture = self['iscapture']
    if iscapture == 0 goto end
    .local string cname
    cname = self['cname']
    isarray = pad['isarray']
    lexscope = pad['lexscope']
    $I0 = exists lexscope[cname]
    if $I0 == 0 goto lexscope_1
    $P0 = lexscope[cname]
    $P0['isarray'] = 1
    isarray = 1
  lexscope_1:
    lexscope[cname] = self
    self['isarray'] = isarray
  next_cname:
    $S0 = substr cname, 0, 1
    if $S0 == '"' goto end
    $I0 = cname
    inc $I0
    pad['subpats'] = $I0
  end:
    .return (self)
.end


.namespace [ 'PGE::Exp::WS' ]

.sub 'p6exp' :method 
    .param pmc pad

    $I0 = pad['sigspace']
    if $I0 goto end
    null $P0
    .return ($P0)
  end:
    self['subname'] = 'ws'
    self['iscapture'] = 0
    .return (self)
.end


.namespace [ 'PGE::Exp::Alt' ]

.sub 'p6exp' :method
    .param pmc pad

    .local pmc exp0, exp1
    exp0 = self[0]
    exp1 = self[1]

    ##   if we only have one operand (prefix:|),
    ##   reduce and return it.
    $I0 = defined self[1]
    if $I0 goto with_rhs
    .return exp0.'p6exp'(pad)
  with_rhs:

    ##   if lhs is whitespace, then this is a prefix-alt and
    ##   we ignore it (by simply returning its rhs)
    $I0 = isa exp0, 'PGE::Exp::WS'
    if $I0 == 0 goto with_lhs
    .return exp1.'p6exp'(pad)
  with_lhs:

    .local pmc lexscope, savescope, iter
    lexscope = pad['lexscope']
    savescope = new .Hash
    iter = new .Iterator, lexscope
  iter_loop:
    unless iter goto iter_end
    $P1 = shift iter
    $P2 = iter[$P1]
    savescope[$P1] = $P2
    goto iter_loop
  iter_end:
    $I0 = pad['subpats']
    exp0 = exp0.p6exp(pad)
    self[0] = exp0

    $I1 = pad['subpats']
    pad['subpats'] = $I0
    pad['lexscope'] = savescope
    exp1 = exp1.'p6exp'(pad)
    self[1] = exp1
    $I0 = pad['subpats']
    if $I0 >= $I1 goto end
    pad['subpats'] = $I1
  end:
    .return (self)
.end


.namespace [ 'PGE::Exp::Alias' ]

.sub 'p6exp' :method
    .param pmc pad
    .local string cname
    .local pmc exp0, exp1

    exp0 = self[0]
    cname = exp0['cname']
    exp1 = self[1]

    ##   If we're aliasing a capture group or a quantified capture
    ##   group, then we just move the alias name to that group.  
    ##   Otherwise, we need to create a capture group for this
    ##   alias and return that.

    $I0 = isa exp1, 'PGE::Exp::CGroup'
    if $I0 == 1 goto make_alias
    $I0 = isa exp1, 'PGE::Exp::Subrule'
    if $I0 == 1 goto make_alias
    $I0 = isa exp1, 'PGE::Exp::Quant'
    if $I0 == 0 goto add_cgroup
    $P0 = exp1[0]
    $I0 = isa $P0, 'PGE::Exp::CGroup'
    if $I0 == 0 goto add_cgroup
    $P0['cname'] = cname
    goto end

  add_cgroup:
    .local pmc cexp, mfrom, mpos
    (cexp, $P99, mfrom, mpos) = self.newfrom(0, 'PGE::Exp::CGroup')
    $I0 = self.from()
    mfrom = $I0
    $I0 = self.to()
    mpos = $I0
    cexp[0] = exp1
    cexp['isscope'] = 0
    cexp['iscapture'] = 1
    cexp['cname'] = cname
    cexp = cexp.p6exp(pad)
    .return (cexp)

  make_alias:
    exp1['cname'] = cname
    exp1['iscapture'] = 1
  end:
    exp1 = exp1.p6exp(pad)
    .return (exp1)
.end


.namespace [ 'PGE::Exp::Modifier' ]

.sub 'p6exp' :method
    .param pmc pad
    .local string key
    .local string value
    key = self['key']
    value = self
    if key == 'words' goto sigspace
    if key == 's' goto sigspace
    if key == 'w' goto sigspace
    if key == 'i' goto ignorecase
    goto setpad
  sigspace:
    key = 'sigspace'
    goto setpad
  ignorecase:
    key = 'ignorecase'
  setpad:
    $P0 = pad[key]
    pad[key] = value
    .local pmc exp
    exp = self[0]
    exp = exp.p6exp(pad)
    self[0] = exp
    pad[key] = $P0
    .return (exp)
.end

.namespace [ 'PGE::Exp::Conj' ]

.sub 'p6exp' :method
    .param pmc pad
    $P0 = self[0]
    $P0 = $P0.p6exp(pad)
    self[0] = $P0
    $P1 = self[1]
    $P1 = $P1.p6exp(pad)
    self[1] = $P1
    .return (self)
.end


.namespace [ 'PGE::Exp::Closure' ]

.sub 'p6exp' :method
    .param pmc pad
    .local string lang
    .local pmc closure_pp
    .local pmc closure_fn
    lang = pad['lang']
    self['lang'] = lang
    # see if we need to do any pre-processing of the closure
    closure_pp = get_hll_global ['PGE::P6Regex'], '%closure_pp'
    $I0 = defined closure_pp[lang]
    if $I0 == 0 goto end
    closure_fn = closure_pp[lang]
    $S1 = self
    $S1 = closure_fn($S1)
    self.'result_object'($S1)
  end:
    .return (self)
.end

=back

=head1 Functions

=over 4

=item C<PIR_closure(string code)>

This helper function helps with :lang(PIR) closures in rules
by adding a ".sub" wrapper around the code if one isn't
already present.

=back
=cut

.namespace [ 'PGE::P6Regex' ]

.sub 'PIR_closure'
    .param string code
    $I0 = index code, '.sub'
    if $I0 >= 0 goto end
    code = concat ".sub anon :anon\n.param pmc match\n", code
    code .= "\n.end\n"
  end:
    .return (code)
.end


.namespace [ 'PGE::Exp::Cut' ]

.sub 'p6exp' :method
    .param pmc pad
    $S0 = self
    if $S0 == ':::' goto cut_rule
    if $S0 == '<commit>' goto cut_match
    self['cutmark'] = PGE_CUT_GROUP
    .return (self)
  cut_rule:
    self['cutmark'] = PGE_CUT_RULE
    .return (self)
  cut_match:
    self['cutmark'] = PGE_CUT_MATCH
    .return (self)
.end
