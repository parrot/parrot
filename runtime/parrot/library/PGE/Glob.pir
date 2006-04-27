=head1 TITLE

Glob - Parse and compile glob notation expressions.

=head1 DESCRIPTION

A parser for shell-stype glob notation.

=head2 Functions

=over 4

=item C<compile_glob(PMC source, PMC adverbs :slurpy :named)>

Return the result of compiling the glob expression given by
C<source>.   Normally this function is obtained using 
C<compreg 'PGE::Glob'> instead of calling it directly.

Returns the compiled regular expression.  If a C<target>
named parameter is supplied, then it will return the parse tree
(target='parse'), the expression tree (target='exp'),
or the resulting PIR code (target='PIR').

=cut

.namespace [ 'PGE::Glob' ]

.sub 'compile_glob'
    .param pmc source
    .param pmc adverbs         :slurpy :named

    .local string target
    target = adverbs['target']

    .local pmc match
    $P0 = find_global 'PGE::Regex', 'glob'
    match = $P0(source)
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
    exp = new 'PGE::Exp::Concat'
    $P0 = new 'PGE::Exp::Anchor'
    $P0.set_value('^')
    exp[0] = $P0
    $P0 = match['expr']
    exp[1] = $P0
    $P0 = new 'PGE::Exp::Anchor'
    $P0.set_value('$')
    exp[2] = $P0
    if target != 'exp' goto pir
    .return (exp)

  pir:
    .local pmc code
    code = exp.'root_pir'()
    if target != 'PIR' goto bytecode
    .return (code)

  bytecode:
    $P0 = compreg 'PIR'
    $P1 = $P0(code)
    .return ($P1)
.end


.sub '__onload' :load
    .local pmc optable
    optable = new 'PGE::OPTable'
    store_global '$optable', optable

    $P0 = find_global 'glob_literal'
    optable.newtok('term:', 'precedence'=>'=', 'nows'=>1, 'parsed'=>$P0)

    $P0 = find_global 'glob_quest'
    optable.newtok('term:?', 'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)

    $P0 = find_global 'glob_star'
    optable.newtok('term:*', 'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)

    $P0 = find_global 'glob_enum'
    optable.newtok('term:[', 'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)

    $P0 = find_global 'glob_alt'
    optable.newtok('term:{', 'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)

    optable.newtok('infix:', 'looser'=>'term:', 'assoc'=>'list', 'nows'=>1, 'match'=>'PGE::Exp::Concat')

    $P0 = find_global 'compile_glob'
    compreg 'PGE::Glob', $P0
    .return ()
.end


=item C<glob(PMC mob, PMC adverbs :slurpy :named)>

Parses a glob expression, returning the corresponding
parse C<PGE::Match> object.   This is installed as a
C<< <glob> >> subrule in C<PGE::Regex>, so one can call
it from another regex in order to parse a valid glob
expression.

=cut

.namespace [ 'PGE::Regex' ]

.const int GLOB_INF = 2147483647 

.sub 'glob'
    .param pmc mob
    .param pmc adverbs         :slurpy :named

    .local pmc optable, match
    optable = find_global 'PGE::Glob', '$optable'
    match = optable.'parse'(mob)
    .return (match)
.end


.namespace [ 'PGE::Glob' ]

.sub 'scan_literal'
    .param string target
    .param int pos
    .param string delim

    .local int lastpos
    lastpos = length target
    .local string literal
    literal = ''
  literal_loop:
    if pos >= lastpos goto literal_end
    $S0 = substr target, pos, 1
    $I0 = index delim, $S0
    if $I0 >= 0 goto literal_end
    if $S0 != '\' goto literal_add
    inc pos
    $S0 = substr target, pos, 1
  literal_add:
    literal .= $S0
    inc pos
    goto literal_loop
  literal_end:
    .return (literal, pos)
.end


=item C<glob_literal(PMC mob, PMC adverbs)>

Scan a literal from a string, stopping at any metacharacters such
as C<*> or C<[>.  Return the matched portion, with the C<value>
set to the decoded literal.

=cut

.sub 'glob_literal'
    .param pmc mob
    .param pmc adverbs         :slurpy :named

    .local string target
    .local pmc mfrom, mpos
    .local int pos
    (mob, target, mfrom, mpos) = mob.newfrom(0, 'PGE::Exp::Literal')
    pos = mfrom
    ($S0, $I0) = 'scan_literal'(target, mfrom, '*?[{')
    if $I0 <= pos goto end
    mpos = $I0
    mob.set_value($S0)
  end:
    .return (mob)
.end


=item C<glob_quest(PMC mob, PMC adverbs)>

Process a C<?> wildcard character in a glob.  For this we just
return a CCShortcut that is set to '.'

=cut

.sub 'glob_quest'
    .param pmc mob
    .param pmc adverbs         :slurpy :named
    .local pmc mtarget, mfrom, mpos
    ##   The '?' is already in mob['KEY'], so we don't need to find it here.
    (mob, mtarget, mfrom, mpos) = mob.newfrom(0, 'PGE::Exp::CCShortcut')
    assign mpos, mfrom
    mob.set_value('.')
    .return (mob)
.end


=item C<glob_star(PMC mob, PMC adverbs)>

Process a C<*> wildcard character in a glob.  This is a little
bit more complex, as we have to return a quantified '.'.

=cut

.sub 'glob_star'
    .param pmc mob
    .param pmc adverbs         :slurpy :named
    .local pmc mtarget, mfrom, mpos
    ##   The '*' is already in mob['KEY'], so we don't need to find it here.
    ##   We create a Quant object, then a CCShortcut inside of it.
    (mob, mtarget, mfrom, mpos) = mob.newfrom(0, 'PGE::Exp::Quant')
    assign mpos, mfrom
    mob['min'] = 0
    mob['max'] = GLOB_INF
    ($P0, $P1, $P2, $P3) = mob.newfrom(0, 'PGE::Exp::CCShortcut')
    assign $P3, $P2
    $P0.set_value('.')
    mob[0] = $P0
    .return (mob)
.end

=item C<glob_enum(PMC mob, PMC adverbs)>

Parse an enumerated character list, such as [abcd],
[!abcd], and [^0-9].

=cut

.sub glob_enum
    .param pmc mob
    .param pmc adverbs         :slurpy :named

    .local string target
    .local pmc mfrom, mpos
    (mob, target, mfrom, mpos) = mob.newfrom(0, 'PGE::Exp::EnumCharList')

    .local int pos, lastpos
    pos = mfrom
    lastpos = length target
    $S0 = substr target, pos, 1
    if $S0 == '!' goto negate
    if $S0 == '^' goto negate
    mob['isnegated'] = 0
    goto firstchar
  negate:
    mob['isnegated'] = 1
    inc pos
  firstchar:
    .local string charlist
    charlist = ''
    $S0 = substr target, pos, 1
    if $S0 == '-' goto addfirst
    if $S0 == ']' goto addfirst
    goto scan_loop
  addfirst:
    charlist .= $S0
    inc pos
  scan_loop:
    ($S0, pos) = 'scan_literal'(target, pos, '-]')
    if pos >= lastpos goto err_noclose
    charlist .= $S0
    $S0 = substr target, pos, 1
    if $S0 == ']' goto scan_end
    inc pos
    $S0 = substr target, pos, 1
    if $S0 == ']' goto scan_endhyphen
    inc pos
    $I1 = ord $S0
    $I0 = ord charlist, -1
  add_range:
    if $I0 > $I1 goto scan_loop
    $S1 = chr $I0
    charlist .= $S1
    inc $I0
    goto add_range
  scan_endhyphen:
    charlist .= '-'
  scan_end:
    inc pos
    mpos = pos
    mob.set_value(charlist)
    .return (mob)

  err_noclose:
    mpos = -1
    .return (mob)
.end

=item C<glob_alt(PMC mob, PMC adverbs)>

Parse an enumerated character list, such as [abcd],
[!abcd], and [^0-9].

=cut

.sub glob_alt
    .param pmc mob
    .param pmc adverbs         :slurpy :named

    .local string target
    .local int pos, lastpos
    (mob, target, $P2, $P3) = mob.newfrom(0, 'PGE::Exp::Literal')
    pos = $P2
    lastpos = length target

    ($S0, pos) = 'scan_literal'(target, pos, ',}')
    mob.set_value($S0)
    $P3 = pos
  alt_loop:
    if pos >= lastpos goto err_noclose
    $S0 = substr target, pos, 1
    if $S0 == '}' goto end
    ($P0, $P1, $P2, $P3) = mob.newfrom(0, 'PGE::Exp::Alt')
    inc pos
    $P3 = pos
    $P0[0] = mob
    mob = $P0
    ($P0, $P1, $P2, $P3) = mob.newfrom(0, 'PGE::Exp::Literal')
    ($S0, pos) = 'scan_literal'(target, pos, ',}')
    $P3 = pos
    $P0.set_value($S0)
    mob[1] = $P0
    goto alt_loop
  end:
    inc pos
    $P3 = mob.to()
    $P3 = pos
    .return (mob)

  err_noclose:
    $P3 = mob.to()
    $P3 = -1
    .return (mob)
.end


=back

=head1 AUTHOR

PGE::Glob was originally authored by Jonathan Scott Duff (duff@pobox.com),
It has been updated for later versions of PGE by Patrick R. Michaud
(pmichaud@pobox.com).

=cut
