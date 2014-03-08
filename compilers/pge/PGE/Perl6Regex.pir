# Copyright (C) 2006-2009, Parrot Foundation.

=head1 DESCRIPTION

Perl6Regex - compiler and parser for Perl 6 regex

=over 4

=item C<compile_perl6regex(PMC source, PMC adverbs :slurpy :named)>

Return the result of compiling C<source> according to Perl 6
regex syntax and the associated C<adverbs>.  Normally this
function is obtained using C<compreg 'PGE::Perl6Regex'> instead
of calling it directly.

Returns the compiled regular expression.  If a C<target>
named parameter is supplied, then it will return the parse tree
(target='parse'), the expression tree (target='exp'),
or the resulting PIR code (target='PIR').

=cut

.namespace [ 'PGE';'Perl6Regex' ]

.sub 'compile_perl6regex'
    .param pmc source
    .param pmc args            :slurpy
    .param pmc adverbs         :slurpy :named

    unless null adverbs goto set_adverbs
    adverbs = new 'Hash'

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
    unless args goto with_name
    $S0 = shift args
    adverbs['name'] = $S0
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
    target = downcase target

    ##   If we're passed the results of a previous parse,  use it.
    .local pmc match, exp
    $I0 = isa source, ['PGE';'Match']
    if $I0 == 0 goto parse
    $P0 = source['expr']
    if null $P0 goto parse
    $I0 = isa $P0, ['PGE';'Exp']
    if $I0 == 0 goto parse
    match = source
    goto analyze

  parse:
    ##   Let's parse the source as a regex
    $P0 = get_global 'regex'
    match = $P0(source, adverbs :flat :named)
    if source == '' goto err_null
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
    .local pmc pad
    exp = match['expr']
    pad = clone adverbs
    $P0 = new 'Hash'
    pad['lexscope'] = $P0
    exp = exp.'perl6exp'(pad)
    if null exp goto err_null
    .tailcall exp.'compile'(adverbs :flat :named)

  err_null:
    $I0 = match.'from'()
    'parse_error'(match, $I0, 'Null pattern illegal')
.end


=item C<regex(PMC mob, PMC adverbs :slurpy :named)>

Parses a regex according to Perl 6 regex syntax, and returns
the corresponding parse tree.

=cut

.sub 'regex'
    .param pmc mob
    .param pmc adverbs         :slurpy :named

    .local string stop, tighter
    .local pmc stopstack, optable, match

    stopstack = get_global '@!stopstack'
    optable = get_global '$optable'

    stop = adverbs['stop']
    tighter = adverbs['tighter']
    push stopstack, stop
    match = optable.'parse'(mob, 'stop'=>stop, 'tighter'=>tighter)
    $S0 = pop stopstack

    .return (match)
.end

=item C<p6escapes>

Parse and calculate various Perl 6 string escapes, such as \n, \r,
\x, \o, and \c.  For the latter escapes, also handle the bracketed
forms and other special forms.

Note that this function is used directly by PCT::Grammar and Rakudo,
and someday may be refactored to a different location.

=cut

.sub 'trim'
    .param string s
    .local int rpos, lpos
    rpos = length s
    lpos = find_not_cclass .CCLASS_WHITESPACE, s, 0, rpos
  rtrim_loop:
    unless rpos > lpos goto rtrim_done
    dec rpos
    $I0 = is_cclass .CCLASS_WHITESPACE, s, rpos
    if $I0 goto rtrim_loop
  rtrim_done:
    inc rpos
    $I0 = rpos - lpos
    $S0 = substr s, lpos, $I0
    .return ($S0)
.end


.sub 'p6escapes'
    .param pmc mob
    .param pmc adverbs         :slurpy :named
    .local string target, backchar, literal
    .local int pos, lastpos
    $P0 = get_hll_global ['PGE'], '$!MATCH'
    (mob, pos, target) = $P0.'new'(mob, adverbs :flat :named)
    lastpos = length target
    if pos >= lastpos goto fail
    $S0 = substr target, pos, 1
    inc pos
    if $S0 != "\\" goto fail
    if pos >= lastpos goto fail
    backchar = substr target, pos, 1
    inc pos
    backchar = downcase backchar
    $I0 = index "\\0abefnrtxco", backchar
    if $I0 < 0 goto fail
    if $I0 >= 9 goto scan_xco
    literal = substr "\\\0\a\b\e\f\n\r\t", $I0, 1
    goto succeed
  scan_xco:
    ##  Handle \x, \c, and \o escapes.  Start by converting
    ##  backchar into the appropriate radix, then loop through
    ##  the characters that follow to compute the decimal value
    ##  of codepoints, and concatenate the codepoints into a
    ##  literal.
    .local int base, decnum, isbracketed
    base = index '        o c     x', backchar
    literal = ''
    $S0 = substr target, pos, 1
    isbracketed = iseq $S0, '['
    pos += isbracketed
    ##  Handle the case of \cC (control escape).
    if base != 10 goto scan_xco_char
    if isbracketed goto scan_xco_char
    $I0 = is_cclass .CCLASS_NUMERIC, $S0, 0
    if $I0 goto scan_xco_char
    ##  xor the 64 bit
    $I0 = ord $S0
    bxor $I0, 64
    literal = chr $I0
    inc pos
    goto succeed
  scan_xco_char:
    decnum = 0
    # inside brackets, skip leading ws
    unless isbracketed goto scan_xco_char_ws
    pos = find_not_cclass .CCLASS_WHITESPACE, target, pos, lastpos
  scan_xco_char_ws:
    if base != 10 goto scan_xco_char_digits
    unless isbracketed goto scan_xco_char_digits
    $I0 = is_cclass .CCLASS_NUMERIC, target, pos
    if $I0 goto scan_xco_char_digits
    ##  look up character by name
    .local int namepos
    namepos = index target, ']', pos
    if namepos < 0 goto err_missing_bracket
    $I0 = index target, ',', pos
    if $I0 < 0 goto have_namepos
    if namepos < $I0 goto have_namepos
    namepos = $I0
  have_namepos:
    $I0 = namepos - pos
    $S0 = substr target, pos, $I0
    $S0 = 'trim'($S0)
    decnum = find_codepoint $S0
    if decnum < 0 goto err_unicode_name
    pos = namepos
    goto scan_xco_char_end
  scan_xco_char_digits:
    $S0 = substr target, pos, 1
    $I0 = index "0123456789abcdef0123456789ABCDEF", $S0
    if $I0 < 0 goto scan_xco_char_end
    $I0 %= 16
    if $I0 >= base goto scan_xco_char_end
    decnum *= base
    decnum += $I0
    inc pos
    goto scan_xco_char_digits
  scan_xco_char_end:
    $S1 = chr decnum
    literal = concat literal, $S1
    unless isbracketed goto scan_xco_end
    pos = find_not_cclass .CCLASS_WHITESPACE, target, pos, lastpos
    $S0 = substr target, pos, 1
    if $S0 == ']' goto scan_xco_end
    if $S0 == '' goto err_missing_bracket
    if $S0 != ',' goto err_digit
    inc pos
    goto scan_xco_char
  scan_xco_end:
    pos += isbracketed
  succeed:
    mob.'!make'(literal)
    mob.'to'(pos)
  fail:
    .return (mob)

  err_unicode_name:
    $S0 = concat "Unrecognized character name ", $S0
    'parse_error'(mob, pos, $S0)
  err_missing_bracket:
    'parse_error'(mob, pos, "Missing close bracket for \\x[...], \\o[...], or \\c[...]")
  err_digit:
    'parse_error'(mob, pos, "Invalid digit in \\x[...], \\o[...], or \\c[...]")
.end


=item C<onload()>

Initializes the Perl6Regex parser and other data structures
needed for compiling regexes.

=cut

.include 'cclass.pasm'

.namespace [ 'PGE';'Perl6Regex' ]

.sub '__onload' :load
    .local pmc p6meta
    p6meta = new 'P6metaclass'
    p6meta.'new_class'('PGE::Exp::WS', 'parent'=>'PGE::Exp::Subrule')
    p6meta.'new_class'('PGE::Exp::Alias', 'parent'=>'PGE::Exp')

    .local pmc optable
    optable = new ['PGE';'OPTable']
    set_global '$optable', optable

    $P0 = get_global 'parse_term'
    optable.'newtok'('term:',    'precedence'=>'=', 'nows'=>1, 'parsed'=>$P0)

    $P0 = get_global 'parse_term_ws'
    optable.'newtok'('term:#',   'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)

    $P0 = get_global 'parse_term_backslash'
    optable.'newtok'("term:\\",  'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)

    optable.'newtok'('term:^',   'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::Anchor')
    optable.'newtok'('term:^^',  'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::Anchor')
    optable.'newtok'('term:$$',  'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::Anchor')
    optable.'newtok'('term:\b',  'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::Anchor')
    optable.'newtok'('term:\B',  'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::Anchor')
    optable.'newtok'('term:<<',  'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::Anchor')
    optable.'newtok'('term:>>',  'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::Anchor')
    optable.'newtok'('term:<?>', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::Anchor')
    optable.'newtok'('term:<!>', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::Anchor')
    optable.'newtok'(unicode:"term:\xab", 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::Anchor')
    optable.'newtok'(unicode:"term:\xbb", 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::Anchor')

    optable.'newtok'('term:.',   'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::CCShortcut')
    optable.'newtok'('term:\d',  'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::CCShortcut')
    optable.'newtok'('term:\D',  'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::CCShortcut')
    optable.'newtok'('term:\s',  'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::CCShortcut')
    optable.'newtok'('term:\S',  'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::CCShortcut')
    optable.'newtok'('term:\w',  'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::CCShortcut')
    optable.'newtok'('term:\W',  'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::CCShortcut')
    optable.'newtok'('term:\N',  'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::CCShortcut')
    optable.'newtok'('term:\n',  'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::Newline')

    $P0 = get_global 'parse_dollar'
    optable.'newtok'('term:$',   'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)

    $P0 = get_global 'parse_subrule'
    optable.'newtok'('term:<',   'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)
    optable.'newtok'('term:<?',  'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)
    optable.'newtok'('term:<!',  'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)
    optable.'newtok'('term:<.',  'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)

    $P0 = get_global 'parse_enumcharclass'
    optable.'newtok'('term:<[',  'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)
    optable.'newtok'('term:<+', 'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)
    optable.'newtok'('term:<-', 'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)
    optable.'newtok'('term:<![', 'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)

    $P0 = get_global 'parse_quoted_literal'
    optable.'newtok'("term:'",  'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)

    $P0 = get_global 'parse_goal'
    optable.'newtok'('term:~', 'equiv'=>'term:', 'parsed'=>$P0)

    optable.'newtok'('term:::',  'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::Cut')
    optable.'newtok'('term::::', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::Cut')
    optable.'newtok'('term:<cut>',    'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::Cut')
    optable.'newtok'('term:<commit>', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::Cut')

    $P0 = get_global 'parse_closure'
    optable.'newtok'("term:{{",   'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)
    optable.'newtok'("term:<?{{", 'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)
    optable.'newtok'("term:<!{{", 'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)

    $P0 = get_global 'parse_action'
    optable.'newtok'("term:{*}",      'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)


    optable.'newtok'('circumfix:[ ]', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::Group')
    optable.'newtok'('circumfix:( )', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::CGroup')

    $P0 = get_global 'parse_quant'
    optable.'newtok'('postfix:*',  'looser'=>'term:', 'parsed'=>$P0)
    optable.'newtok'('postfix:+',  'equiv'=>'postfix:*', 'parsed'=>$P0)
    optable.'newtok'('postfix:?',  'equiv'=>'postfix:*', 'parsed'=>$P0)
    optable.'newtok'('postfix::',  'equiv'=>'postfix:*', 'parsed'=>$P0)
    optable.'newtok'('postfix:**', 'equiv'=>'postfix:*', 'parsed'=>$P0)
    $P0 = get_global 'parse_quant_error'
    optable.'newtok'('term:*', 'equiv'=>'term:', 'parsed'=>$P0)
    optable.'newtok'('term:+', 'equiv'=>'term:', 'parsed'=>$P0)
    optable.'newtok'('term:?', 'equiv'=>'term:', 'parsed'=>$P0)

    optable.'newtok'('infix:',   'looser'=>'postfix:*', 'assoc'=>'list', 'nows'=>1, 'match'=>'PGE::Exp::Concat')
    optable.'newtok'('infix:&',  'looser'=>'infix:', 'nows'=>1, 'match'=>'PGE::Exp::Conj')
    optable.'newtok'('infix:|',  'looser'=>'infix:&', 'nows'=>1, 'match'=>'PGE::Exp::Alt')
    optable.'newtok'('prefix:|', 'equiv'=>'infix:|', 'nows'=>1, 'match'=>'PGE::Exp::Alt')
    optable.'newtok'('infix:||', 'equiv'=>'infix:|', 'nows'=>1, 'match'=>'PGE::Exp::Alt')
    optable.'newtok'('prefix:||', 'equiv'=>'infix:|', 'nows'=>1, 'match'=>'PGE::Exp::Alt')

    optable.'newtok'('infix::=', 'tighter'=>'infix:', 'assoc'=>'right', 'match'=>'PGE::Exp::Alias')
    optable.'newtok'('infix:=', 'tighter'=>'infix:', 'assoc'=>'right', 'match'=>'PGE::Exp::Alias')

    $P0 = get_global 'parse_modifier'
    optable.'newtok'('prefix::', 'looser'=>'infix:|', 'parsed'=>$P0)

    optable.'newtok'('close:}',  'precedence'=>'<', 'nows'=>1)

    .local pmc esclist
    esclist = new 'Hash'
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
    $P0 = new 'Hash'
    set_hll_global ['PGE';'Perl6Regex'], '%closure_pp', $P0
    $P1 = get_hll_global ['PGE';'Perl6Regex'], 'PIR_closure'
    $P0["PIR"] = $P1

    # Create an array for holding stop tokens
    $P0 = new 'ResizablePMCArray'
    set_hll_global ['PGE';'Perl6Regex'], '@!stopstack', $P0

    $P0 = get_global 'compile_perl6regex'
    compreg 'PGE::Perl6Regex', $P0
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
    $P0 = get_hll_global ['PGE';'Perl6Regex'], '@!stopstack'
    stop = $P0[-1]

    $I0 = is_cclass .CCLASS_WHITESPACE, target, pos
    if $I0 goto term_ws
    $I0 = length stop
    if $I0 == 0 goto not_stop
    $S0 = substr target, pos, $I0
    if $S0 == stop goto end_noterm
  not_stop:
    ##   find length of word character sequence
    .local int litlen
    $I0 = find_not_cclass .CCLASS_WORD, target, pos, lastpos
    litlen = $I0 - pos

    ##   if we didn't find any, return no term
    if litlen == 0 goto end_noterm

    ##   for multi-char unquoted literals, leave the last character
    ##   in case it's quantified (it gets processed as a subsequent term)
    if litlen < 2 goto term_literal
    dec litlen
  term_literal:
    $S0 = substr target, pos, litlen
    pos += litlen
    mob = mob.'new'(mob, 'grammar'=>'PGE::Exp::Literal')
    mob.'!make'($S0)
    mob.'to'(pos)
    .return (mob)

  term_ws:
    .tailcall 'parse_term_ws'(mob)

  end_noterm:
    $S0 = substr target, pos, 1
    if $S0 == ':' goto err_cut
    (mob) = mob.'new'(mob, 'grammar'=>'PGE::Exp::Literal')
    .return (mob)
  err_cut:
    'parse_error'(mob, pos, 'Quantifier follows nothing in regex')
    .return (mob)
.end


=item C<parse_term_backslash(mob [, adverbs :slurpy :named])>

Parses terms beginning with backslash.

=cut

.sub 'parse_term_backslash'
    .param pmc mob
    .param pmc adverbs         :slurpy :named

    .local string target
    .local int pos, lastpos, isnegated
    $P0 = getattribute mob, '$.target'
    target = $P0
    $P0 = getattribute mob, '$.pos'
    pos = $P0
    lastpos = length target
    isnegated = 0

    .local string backchar, charlist
    ##  get whatever follows the backslash
    backchar = substr target, pos, 1
    charlist = backchar
    inc pos

    ##  if it's not a word character, it's a quoted metachar
    $I0 = is_cclass .CCLASS_WORD, backchar, 0
    unless $I0 goto term_literal

    ##  if it's a word character, it may be negated
    isnegated = is_cclass .CCLASS_UPPERCASE, backchar, 0
    ##  $S0 = downcase charlist
            $I0 = ord backchar
            $S0 = chr $I0
            backchar = downcase $S0

    ##  if it's \x, \c, or \o, parse as string escape
    $I0 = index 'xco', backchar
    if $I0 < 0 goto meta_esclist
  meta_xco:
    $I0 = pos - 2
    $P0 = 'p6escapes'(mob, 'pos' => $I0)
    unless $P0 goto err_xcoparse
    pos = $P0.'to'()
    charlist = $P0.'ast'()
    unless isnegated goto term_literal
    $I0 = length charlist
    if $I0 > 1 goto err_negated_brackets
    goto term_charlist

  meta_esclist:
    $P0 = get_global '%esclist'
    $I0 = exists $P0[backchar]
    unless $I0 goto err_reserved_metachar
    charlist = $P0[backchar]
    if isnegated goto term_charlist
    $I0 = length charlist
    if $I0 > 1 goto term_charlist

  term_literal:
    mob = mob.'new'(mob, 'grammar'=>'PGE::Exp::Literal')
    mob.'!make'(charlist)
    mob.'to'(pos)
    .return (mob)

  term_charlist:
    mob = mob.'new'(mob, 'grammar'=>'PGE::Exp::EnumCharList')
    mob.'!make'(charlist)
    mob['isnegated'] = isnegated
    mob.'to'(pos)
    .return (mob)

  err_xcoparse:
    parse_error(mob, pos, 'Unable to parse \x, \c, or \o value')
  err_negated_brackets:
    pos = mob.'from'()
    parse_error(mob, pos, 'Cannot use comma in \\X[...] or \\O[...]')
  err_reserved_metachar:
    parse_error(mob, pos, 'Alphanumeric metacharacters are reserved')
.end


=item C<parse_term_ws(PMC mob)>

Parses a whitespace term.

=cut

.sub 'parse_term_ws'
    .param pmc mob
    .param pmc adverbs         :slurpy :named

    .local string target
    .local int pos, lastpos
    (mob, pos, target) = mob.'new'(mob, 'grammar'=>'PGE::Exp::WS')
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
    mob.'to'(pos)
    .return (mob)
.end


=item C<parse_quant(PMC mob)>

Parses a quantifier, such as *, +, ?, :, and all of their wondrous
combinations.

=cut

.sub 'parse_quant'
    .param pmc mob
    .param pmc adverbs         :slurpy :named

    .local string target
    .local pmc key
    .local int pos, lastpos
    key = mob['KEY']
    (mob, pos, target) = mob.'new'(mob, 'grammar'=>'PGE::Exp::Quant')
    lastpos = length target

    .local int min, max, suffixpos, sepws
    .local string suffix
    min = 1
    max = 1
    sepws = is_cclass .CCLASS_WHITESPACE, target, pos
    suffixpos = find_not_cclass .CCLASS_WHITESPACE, target, pos, lastpos

    if key == '**' goto quant_suffix
    if key == ':' goto quant_cut
    if key == '+' goto quant_max
    ##  quantifier is '?' or '*'
    min = 0
  quant_max:
    if key == '?' goto quant_suffix
    ##  quantifier is '+' or '*'
    max = PGE_INF
    goto quant_suffix

  quant_cut:
    #   The postfix:<:> operator may bring us here when it's really a
    #   term:<::> term.  So, we check for that here and fail this match
    #   if we really have a cut term.
    if key != ':' goto quant_suffix
    $S0 = substr target, pos, 1
    if $S0 == ':' goto end
    mob['backtrack'] = PGE_BACKTRACK_NONE

  quant_suffix:
    suffix = substr target, suffixpos, 2
    if suffix == ':?' goto quant_eager
    if suffix == ':!' goto quant_greedy
  quant_suffix_1:
    suffix = substr target, suffixpos, 1
    if suffix == '?' goto quant_eager
    if suffix == '!' goto quant_greedy
    if suffix != ':' goto quant
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

  quant:
    if key != '**' goto quant_set
  quant_closure:
    $I0 = is_cclass .CCLASS_WHITESPACE, target, pos
    sepws |= $I0
    pos = find_not_cclass .CCLASS_WHITESPACE, target, pos, lastpos
    .local int isconst
    isconst = is_cclass .CCLASS_NUMERIC, target, pos
    if isconst goto brace_skip
    $S0 = substr target, pos, 1
    if $S0 != "{" goto parse_repetition_controller
    inc pos
  brace_skip:
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
    if $S0 != '*' goto quant_range_end
    inc pos
    goto quant_closure_end
  quant_range_end:
    $I1 = find_not_cclass .CCLASS_NUMERIC, target, pos, lastpos
    if $I1 <= pos goto err_closure
    $S0 = substr target, pos
    max = $S0
    pos = $I1
  quant_closure_end:
    if isconst goto brace_skip2
    $S0 = substr target, pos, 1
    if $S0 != "}" goto err_closure
    inc pos
  brace_skip2:
    suffixpos = find_not_cclass .CCLASS_WHITESPACE, target, pos, lastpos

  quant_set:
    mob['min'] = min
    mob['max'] = max
    mob.'to'(pos)
  end:
    .return (mob)

  parse_repetition_controller:
    .local pmc regex, repetition_controller
    mob.'to'(pos)
    regex = get_global 'regex'
    #parse everything down to concatenation precedence
    repetition_controller = regex(mob, 'tighter'=>'infix:')
    unless repetition_controller goto err_repetition_controller

    #update pos to after the matched
    pos = repetition_controller.'to'()
    repetition_controller = repetition_controller['expr']

    # if there's surrounding ws, then add WS nodes
    unless sepws goto sepws_done
    $P0 = mob.'new'(mob, 'grammar'=>'PGE::Exp::Concat')
    $P0.'to'(pos)
    $P1 = mob.'new'(mob, 'grammar'=>'PGE::Exp::WS')
    $P1.'to'(pos)
    push $P0, $P1
    push $P0, repetition_controller
    $P1 = mob.'new'(mob, 'grammar'=>'PGE::Exp::WS')
    $P1.'to'(pos)
    push $P0, $P1
    repetition_controller = $P0
  sepws_done:

    #save the matched in the mob as sep
    mob['sep'] = repetition_controller

    #force the match to be 1..Inf
    mob['min'] = 1
    mob['max'] = PGE_INF

    #move position to after the matched
    mob.'to'(pos)
    .return (mob)

  err_repetition_controller:
    'parse_error'(mob, pos, "Error in repetition controller")
  err_closure:
    'parse_error'(mob, pos, "Error in closure quantifier")
.end


=item C<parse_quant_error(mob)>

Throw an exception for quantifiers in term position.

=cut

.sub 'parse_quant_error'
    .param pmc mob
    .param pmc adverbs         :slurpy :named

    .local int pos
    pos = mob.'to'()
    'parse_error'(mob, pos, "Quantifier follows nothing in regex")
.end


=item C<parse_dollar(PMC mob)>

Parse things that begin with a dollar sign, such as scalars,
anchors, and match subscripts.

=cut

.sub "parse_dollar"
    .param pmc mob
    .param pmc adverbs         :slurpy :named

    .local string target
    .local int pos, lastpos
    .local string cname
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
    mob = mob.'new'(mob, 'grammar'=>'PGE::Exp::Anchor')
    mob.'to'(pos)
    .return (mob)

  scalar:
    mob = mob.'new'(mob, 'grammar'=>'PGE::Exp::Scalar')
    dec pos
    $I1 = $I0 - pos
    cname = substr target, pos, $I1
    cname = concat '"', cname
    cname = concat cname, '"'
    mob["cname"] = cname
    mob.'to'($I0)
    .return (mob)

  numeric:
    mob = mob.'new'(mob, 'grammar'=>'PGE::Exp::Scalar')
    $I1 = $I0 - pos
    cname = substr target, pos, $I1
    mob["cname"] = cname
    mob.'to'($I0)
    .return (mob)

  name:
    inc pos
    mob = mob.'new'(mob, 'grammar'=>'PGE::Exp::Scalar')
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
    mob.'to'(pos)
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
    .param pmc adverbs         :slurpy :named

    .local string target
    .local pmc mobsave
    .local int pos, lastpos
    .local string key
    key = mob['KEY']
    mobsave = mob
    (mob, pos, target) = mob.'new'(mob, 'grammar'=>'PGE::Exp::Subrule')
    lastpos = length target

    ##  default to non-capturing rule
    .local int iscapture
    iscapture = 0

    ##  see what type of subrule this is
    if key == '<.' goto scan_subname
    if key == '<?' goto zerowidth
    if key == '<!' goto negated

    ##  capturing subrule, get its name/alias
    iscapture = 1
    .local string subname, cname
    (subname, pos) = 'parse_subname'(target, pos)
    cname = subname
    $S0 = substr target, pos, 1
    unless $S0 == '=' goto subrule_arg
    ##  aliased subrule, skip the '=' and get the real name
    inc pos
    goto scan_subname

  negated:
    mob['isnegated'] = 1
  zerowidth:
    mob['iszerowidth'] = 1

  scan_subname:
    (subname, pos) = 'parse_subname'(target, pos)

  subrule_arg:
    mob['subname'] = subname
    $S0 = substr target, pos, 1
    if $S0 == ':' goto subrule_text_arg
    if $S0 != ' ' goto subrule_end
  subrule_pattern_arg:
    inc pos
    mob.'to'(pos)
    .local pmc regex
    regex = get_global 'regex'
    $P1 = regex(mob, 'stop'=>'>')
    unless $P1 goto end
    $S0 = $P1
    mob['arg'] = $S0
    pos = $P1.'to'()
    mob.'to'(-1)
    goto subrule_end
  subrule_text_arg:
    $I0 = pos + 1
    pos = find_not_cclass .CCLASS_WHITESPACE, target, $I0, lastpos
    if pos == $I0 goto end
    if pos >= lastpos goto end
    .local string textarg, closedelim
    textarg = ''
    closedelim = '>'
    $S0 = substr target, pos, 1
    if $S0 == '"' goto subrule_text_quote
    if $S0 != "'" goto subrule_text_loop
  subrule_text_quote:
    closedelim = $S0
    inc pos
  subrule_text_loop:
    if pos >= lastpos goto end
    $S0 = substr target, pos, 1
    if $S0 == closedelim goto subrule_text_end
    if $S0 != "\\" goto subrule_text_add
    inc pos
    $S0 = substr target, pos, 1
    if $S0 == closedelim goto subrule_text_add
    if $S0 == "\\" goto subrule_text_add
    textarg .= "\\"
  subrule_text_add:
    textarg .= $S0
    inc pos
    goto subrule_text_loop
  subrule_text_end:
    mob['arg'] = textarg
    if closedelim == '>' goto subrule_end
    inc pos
    pos = find_not_cclass .CCLASS_WHITESPACE, target, pos, lastpos
  subrule_end:
    $S0 = substr target, pos, 1
    if $S0 != '>' goto end
    inc pos
    mob.'to'(pos)
    mob['iscapture'] = iscapture
    unless iscapture goto end
    $S0 = escape cname
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
    pos = mob.'to'()
    lastpos = length target
    op = mob['KEY']

    ##   handle the case of <[, <+[, <-[, and <![ as the token
    ##   by converting to <, <+, <-, or <!
    $S0 = substr op, -1, 1
    if $S0 != '[' goto parse_loop
    op = chopn op, 1
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
    $I0 = index 'nrtfae0xco', $S0
    if $I0 == -1 goto enum_addchar
    if $I0 >= 7 goto enum_xco
    $S0 = substr "\n\r\t\f\a\e\0", $I0, 1
    goto enum_addchar
  enum_xco:
    $I0 = pos - 1
    $P0 = 'p6escapes'(mob, 'pos'=>$I0)
    $S0 = $P0.'ast'()
    pos = $P0.'to'()
    goto enum_addchar_1
  enum_addchar:
    inc pos
  enum_addchar_1:
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
    isrange = 0
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
    term = mob.'new'(mob, 'grammar'=>'PGE::Exp::EnumCharList')
    term.'to'(pos)
    term.'!make'(charlist)
    goto combine

  subrule:
    $I0 = pos
    .local string subname
    (subname, pos) = 'parse_subname'(target, $I0)
    if pos == $I0 goto err
    term = mob.'new'(mob, 'grammar'=>'PGE::Exp::Subrule')
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
    term['iszerowidth'] = 1
    if op == '<!' goto combine_init
    ##   token is '<-', we need to match a char by concat dot
    $P0 = mob.'new'(mob, 'grammar'=>'PGE::Exp::CCShortcut')
    $P0.'to'(pos)
    $P0.'!make'('.')
    mob = mob.'new'(mob, 'grammar'=>'PGE::Exp::Concat')
    mob.'to'(pos)
    mob[0] = term
    mob[1] = $P0
    goto next_op

  combine_init:
    mob = term
    goto next_op

  combine_plus:
    ##   <a+b>  ==>   <a> | <b>
    $P0 = mob.'new'(mob, 'grammar'=>'PGE::Exp::Alt')
    $P0.'to'(pos)
    $P0[0] = mob
    $P0[1] = term
    mob = $P0
    goto next_op

  combine_minus:
    ##   <a-b> ==>   <!b> <a>
    term['isnegated'] = 1
    term['iszerowidth'] = 1
    $P0 = mob.'new'(mob, 'grammar'=>'PGE::Exp::Concat')
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
    parse_error(mob, pos, "Unescaped '-' in charlist (use '..' or '\\-')")
    goto end
  err_close:
    parse_error(mob, pos, "Missing close '>' or ']>' in enumerated character class")
  end:
    .return (mob)
.end


=item C<parse_quoted_literal>

Parses '...' literals.

=cut

.sub 'parse_quoted_literal'
    .param pmc mob
    .param pmc adverbs         :slurpy :named

    .local int pos, lastpos
    .local string target
    (mob, pos, target) = mob.'new'(mob, 'grammar'=>'PGE::Exp::Literal')
    lastpos = length target
    lastpos -= 1
    .local string lit
    lit = ''
  literal_iter:
    if pos > lastpos goto literal_error
    $S0 = substr target, pos, 1
    if $S0 == "'" goto literal_end
    if $S0 != "\\" goto literal_add
    inc pos
    $S0 = substr target, pos, 1
  literal_add:
    inc pos
    lit .= $S0
    goto literal_iter
  literal_end:
    inc pos
    mob.'!make'(lit)
    mob.'to'(pos)
    .return (mob)
  literal_error:
    parse_error(mob, pos, "No closing ' in quoted literal")
    .return (mob)
.end


=item C<parse_goal>

Parse a goal.

=cut

.sub 'parse_goal'
    .param pmc mob
    .param pmc adverbs         :slurpy :named

    .local int pos, lastpos
    .local string target
    (mob, pos, target) = mob.'new'(mob, 'grammar'=>'PGE::Exp::Concat')
    lastpos = length target
    ##  skip any leading whitespace before goal
    pos = find_not_cclass .CCLASS_WHITESPACE, target, pos, lastpos
    .local pmc regex, goal, expr, alt, failsub
    regex = get_global 'regex'
    ##  parse the goal, down to concatenation precedence
    mob.'to'(pos)
    goal = regex(mob, 'tighter'=>'infix:')
    unless goal goto fail_goal
    pos = goal.'to'()
    goal = goal['expr']
    ##  skip any leading whitespace before expression
    pos = find_not_cclass .CCLASS_WHITESPACE, target, pos, lastpos
    ##  parse the goal, down to concatenation precedence
    mob.'to'(pos)
    expr = regex(mob, 'tighter'=>'infix:')
    unless expr goto fail_expr
    pos = expr.'to'()
    expr = expr['expr']
    mob.'to'(pos)
    failsub = mob.'new'(mob, 'grammar'=>'PGE::Exp::Subrule')
    failsub.'to'(pos)
    failsub['subname'] = 'FAILGOAL'
    $S0 = goal.'Str'()
    failsub['arg'] = $S0
    alt = mob.'new'(mob, 'grammar'=>'PGE::Exp::Alt')
    alt.'to'(pos)
    push alt, goal
    push alt, failsub
    push mob, expr
    push mob, alt
    .return (mob)
  fail_goal:
    'parse_error'(mob, pos, 'Unable to parse goal after ~')
  fail_expr:
    'parse_error'(mob, pos, 'Unable to parse expression after ~')
.end


=item C<parse_modifier>

Parse a modifier.

=cut

.sub 'parse_modifier'
    .param pmc mob
    .param pmc adverbs         :slurpy :named

    .local int pos, lastpos
    .local string target, value
    .local string key
    key = mob['KEY']
    (mob, pos, target) = mob.'new'(mob, 'grammar'=>'PGE::Exp::Modifier')
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
    if $I1 == 0 goto fail
    $S0 = substr target, $I0, $I1
    mob['key'] = $S0
    mob.'!make'(value)
    $S0 = substr target, pos, 1
    if $S0 != '(' goto end
    $I0 = pos + 1
    pos = index target, ')', pos
    $I1 = pos - $I0
    $S0 = substr target, $I0, $I1
    mob.'!make'($S0)
    inc pos
  end:
    ### XXX pos = find_not_cclass .CCLASS_WHITESPACE, target, pos, lastpos
    mob.'to'(pos)
    .return (mob)
  fail:
    .return (mob)
.end


.sub 'parse_closure'
    .param pmc mob
    .param pmc adverbs         :slurpy :named

    .local pmc key
    key = mob['KEY']
    .local string target
    .local int pos, len
    (mob, pos, target) = mob.'new'(mob, 'grammar'=>'PGE::Exp::Closure')
    len = 2
  init:
    $S0 = substr target, pos, 1
    if $S0 != "{" goto body
    inc len
    inc pos
    goto init
  body:
    .local string close
    close = repeat "}", len
    if key == '<?{{' goto assert_pos
    if key == '<!{{' goto assert_neg
    goto have_close
  assert_neg:
    mob['isnegated'] = 1
  assert_pos:
    mob['iszerowidth'] = 1
    close = concat close, '>'
    inc len
  have_close:
    $I0 = index target, close, pos
    if $I0 < pos goto err_noclose
    $I1 = $I0 - pos
    $S1 = substr target, pos, $I1
    mob.'!make'($S1)
    pos = $I0 + len
    mob.'to'(pos)
    .return (mob)
 err_noclose:
    parse_error(mob, pos, "Missing closing braces for closure")
    .return (mob)
.end


.sub 'parse_action'
    .param pmc mob
    .param pmc adverbs         :slurpy :named

    .local string target
    .local int pos, keypos
    (mob, pos, target) = mob.'new'(mob, 'grammar' => 'PGE::Exp::Action')
    keypos = index target, '#= ', pos
    if keypos < 0 goto end
    $I0 = find_cclass .CCLASS_NEWLINE, target, pos, keypos
    if $I0 < keypos goto end
    .local string actionkey
    keypos += 3
    $I0 -= keypos
    actionkey = substr target, keypos, $I0
    actionkey = 'trim'(actionkey)
    mob['actionkey'] = actionkey
  end:
    mob.'to'(pos)
    .return (mob)
.end


.sub 'parse_error'
    .param pmc mob
    .param int pos
    .param string message
    $P0 = getattribute mob, '$.pos'
    $P0 = pos
    $P0 = new 'Exception'
    $S0 = 'perl6regex parse error: '
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
    $P0 = $S0
    throw $P0
    .return ()
.end




.namespace [ 'PGE';'Exp' ]

.sub 'perl6exp' :method
    .param pmc pad
    .return (self)
.end


.namespace [ 'PGE';'Exp';'Literal' ]

.sub 'perl6exp' :method
    .param pmc pad
    $I0 = pad['ignorecase']
    self['ignorecase'] = $I0
    .return (self)
.end


.namespace [ 'PGE';'Exp';'Concat' ]

.sub 'perl6exp' :method
    .param pmc pad

    .local pmc array, exp
    .local int i, j, n
    array = self.'list'()
    n = elements array
    i = 0
    j = 0
  iter_loop:
    if i >= n goto iter_end
    exp = self[i]
    inc i
    exp = exp.'perl6exp'(pad)
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


.namespace [ 'PGE';'Exp';'Quant' ]

.sub 'perl6exp' :method
    .param pmc pad

    $I0 = exists self['backtrack']
    if $I0 goto backtrack_done
    self['backtrack'] = PGE_BACKTRACK_GREEDY
    $I0 = pad['ratchet']
    if $I0 == 0 goto backtrack_done
    self['backtrack'] = PGE_BACKTRACK_NONE
  backtrack_done:

    .local pmc exp0, sep
    .local int isarray
    isarray = pad['isarray']
    pad['isarray'] = 1
    exp0 = self[0]
    $I0 = isa exp0, ['PGE';'Exp';'WS']
    if $I0 goto err_parse_quant
    exp0['isquant'] = 1
    exp0 = exp0.'perl6exp'(pad)
    self[0] = exp0
    sep = self['sep']
    if null sep goto sep_done
    sep = sep.'perl6exp'(pad)
    self['sep'] = sep
  sep_done:
    pad['isarray'] = isarray
    .return (self)
  err_parse_quant:
    $P0 = get_hll_global ['PGE';'Perl6Regex'], 'parse_quant_error'
    $P0(self)
    .return (self)
.end


.namespace [ 'PGE';'Exp';'Group' ]

.sub 'perl6exp' :method
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
    exp0 = exp0.'perl6exp'(pad)
    self[0] = exp0
    .return (self)
.end


.namespace [ 'PGE';'Exp';'CGroup' ]

.sub 'perl6exp' :method
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
    $P0 = new 'Hash'
    pad['lexscope'] = $P0
    exp = self[0]
    exp = exp.'perl6exp'(pad)
    self[0] = exp
    pad['lexscope'] = lexscope
    pad['isarray'] = padarray
    pad['subpats'] = subpats
    goto end

  unscoped:
    exp = self[0]
    exp = exp.'perl6exp'(pad)
    self[0] = exp
  end:
    .return (self)
.end


.namespace [ 'PGE';'Exp';'Subrule' ]

.sub 'perl6exp' :method
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
    $S0 = pad['dba']
    self['dba'] = $S0
    .return (self)
.end


.namespace [ 'PGE';'Exp';'WS' ]

.sub 'perl6exp' :method
    .param pmc pad

    $I0 = pad['sigspace']
    if $I0 goto end
    null $P0
    .return ($P0)
  end:
    self['subname'] = 'ws'
    self['iscapture'] = 0
    $I0 = pad['ratchet']
    unless $I0 goto end_1
    self['backtrack'] = PGE_BACKTRACK_NONE
  end_1:
    .return (self)
.end


.namespace [ 'PGE';'Exp';'Alt' ]

.sub 'perl6exp' :method
    .param pmc pad

    .local pmc exp0, exp1
    exp0 = self[0]
    exp1 = self[1]

    ##   if we only have one operand (prefix:|),
    ##   reduce and return it.
    $I0 = defined self[1]
    if $I0 goto with_rhs
    .tailcall exp0.'perl6exp'(pad)
  with_rhs:

    ##   if lhs is whitespace, then this is a prefix-alt and
    ##   we ignore it (by simply returning its rhs)
    $I0 = isa exp0, ['PGE';'Exp';'WS']
    if $I0 == 0 goto with_lhs
    .tailcall exp1.'perl6exp'(pad)
  with_lhs:

    .local pmc lexscope, savescope, it
    lexscope = pad['lexscope']
    savescope = new 'Hash'
    it = iter lexscope
  iter_loop:
    unless it goto iter_end
    $P1 = shift it
    $P2 = it[$P1]
    savescope[$P1] = $P2
    goto iter_loop
  iter_end:
    $I0 = pad['subpats']
    exp0 = exp0.'perl6exp'(pad)
    self[0] = exp0

    $I1 = pad['subpats']
    pad['subpats'] = $I0
    pad['lexscope'] = savescope
    exp1 = exp1.'perl6exp'(pad)
    self[1] = exp1
    $I0 = pad['subpats']
    if $I0 >= $I1 goto end
    pad['subpats'] = $I1
  end:
    .return (self)
.end


.namespace [ 'PGE';'Exp';'Alias' ]

.sub 'perl6exp' :method
    .param pmc pad
    .local string cname
    .local pmc exp0, exp1

    exp0 = self[0]
    $I0 = isa exp0, ['PGE';'Exp';'Scalar']
    unless $I0 goto err_no_lvalue

    cname = exp0['cname']
    exp1 = self[1]

    ##   If we're aliasing a capture group or a quantified capture
    ##   group, then we just move the alias name to that group.
    ##   Otherwise, we need to create a capture group for this
    ##   alias and return that.

    $I0 = isa exp1, ['PGE';'Exp';'CGroup']
    if $I0 == 1 goto make_alias
    $I0 = isa exp1, ['PGE';'Exp';'Subrule']
    if $I0 == 1 goto make_alias
    $I0 = isa exp1, ['PGE';'Exp';'Quant']
    if $I0 == 0 goto add_cgroup
    $P0 = exp1[0]
    $I0 = isa $P0, ['PGE';'Exp';'CGroup']
    if $I0 == 0 goto add_cgroup
    $P0['cname'] = cname
    goto end

  add_cgroup:
    .local pmc cexp
    cexp = self.'new'(self, 'grammar'=>'PGE::Exp::CGroup')
    $I0 = self.'from'()
    cexp.'from'($I0)
    $I0 = self.'to'()
    cexp.'to'($I0)
    cexp[0] = exp1
    cexp['isscope'] = 0
    cexp['iscapture'] = 1
    cexp['cname'] = cname
    cexp = cexp.'perl6exp'(pad)
    .return (cexp)

  make_alias:
    exp1['cname'] = cname
    exp1['iscapture'] = 1
  end:
    exp1 = exp1.'perl6exp'(pad)
    .return (exp1)

  err_no_lvalue:
    $P0 = get_hll_global ['PGE';'Perl6Regex'], 'parse_error'
    $I0 = self.'from'()
    $P0(self, $I0, 'LHS of alias must be lvalue')
.end


.namespace [ 'PGE';'Exp';'Modifier' ]

.sub 'perl6exp' :method
    .param pmc pad
    .local string key
    .local string value
    key = self['key']
    value = self.'ast'()
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
    exp = exp.'perl6exp'(pad)
    self[0] = exp
    pad[key] = $P0
    .return (exp)
.end

.namespace [ 'PGE';'Exp';'Conj' ]

.sub 'perl6exp' :method
    .param pmc pad
    $P0 = self[0]
    $P0 = $P0.'perl6exp'(pad)
    self[0] = $P0
    $P1 = self[1]
    $P1 = $P1.'perl6exp'(pad)
    self[1] = $P1
    .return (self)
.end


.namespace [ 'PGE';'Exp';'Closure' ]

.sub 'perl6exp' :method
    .param pmc pad
    .local string lang
    .local pmc closure_pp
    .local pmc closure_fn
    lang = pad['lang']
    self['lang'] = lang
    # see if we need to do any pre-processing of the closure
    closure_pp = get_hll_global ['PGE';'Perl6Regex'], '%closure_pp'
    $I0 = defined closure_pp[lang]
    if $I0 == 0 goto end
    closure_fn = closure_pp[lang]
    $S1 = self.'ast'()
    $S1 = closure_fn($S1)
    self.'!make'($S1)
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

.namespace [ 'PGE';'Perl6Regex' ]

.sub 'PIR_closure'
    .param string code
    $I0 = index code, '.sub'
    if $I0 >= 0 goto end
    code = concat ".sub anon :anon\n.param pmc match\n", code
    code .= "\n.end\n"
  end:
    .return (code)
.end


.namespace [ 'PGE';'Exp';'Action' ]

.sub 'perl6exp' :method
    .param pmc pad
    $S0 = pad['name']
    self['actionname'] = $S0
    .return (self)
.end


.namespace [ 'PGE';'Exp';'Cut' ]

.sub 'perl6exp' :method
    .param pmc pad
    $S0 = self.'ast'()
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

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
