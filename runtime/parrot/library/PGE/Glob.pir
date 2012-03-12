# Copyright (C) 2005-2009, Parrot Foundation.

=head1 TITLE

Glob - Parse and compile glob notation expressions.

=head1 DESCRIPTION

A parser for shell-stype glob notation. See C<Tcl::Glob> for a
slightly different glob syntax.

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

.namespace [ 'PGE';'Glob' ]

.sub 'compile_glob'
    .param pmc source
    .param pmc adverbs         :slurpy :named

    .local string target
    target = adverbs['target']
    target = downcase target

    .local pmc match
    null match
    if source == '' goto analyze
    $P0 = get_global 'glob'
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
    exp = new ['PGE';'Exp';'Concat']
    $I0 = 1
    $P0 = new ['PGE';'Exp';'Anchor']
    $P0.'!make'('^')
    exp[0] = $P0
    if null match goto analyze_1
    $P0 = match['expr']
    exp[$I0] = $P0
    inc $I0
  analyze_1:
    $P0 = new ['PGE';'Exp';'Anchor']
    $P0.'!make'('$')
    exp[$I0] = $P0

    .tailcall exp.'compile'(adverbs :flat :named)
.end


.sub 'main' :main
    .param pmc args

    '__load_bytecode'('PGE.pbc')
    '__load_bytecode'('PGE/Dumper.pbc')

    $P0 = compreg 'PGE::Glob'
    .tailcall $P0.'command_line'(args)
.end


.sub '__onload' :tag('load') :tag('init')
    .local pmc optable
    '__load_bytecode'('PGE.pbc')

    optable = new ['PGE';'OPTable']
    set_global '$optable', optable

    $P0 = get_global 'glob_literal'
    optable.'newtok'('term:', 'precedence'=>'=', 'nows'=>1, 'parsed'=>$P0)

    $P0 = get_global 'glob_quest'
    optable.'newtok'('term:?', 'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)

    $P0 = get_global 'glob_star'
    optable.'newtok'('term:*', 'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)

    $P0 = get_global 'glob_enum'
    optable.'newtok'('term:[', 'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)

    $P0 = get_global 'glob_alt'
    optable.'newtok'('term:{', 'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)

    optable.'newtok'('infix:', 'looser'=>'term:', 'assoc'=>'list', 'nows'=>1, 'match'=>'PGE::Exp::Concat')

    .local pmc p6meta
    p6meta = get_hll_global 'P6metaclass'
    p6meta.'new_class'('PGE::Glob::Compiler', 'attr'=>'$!compsub')

    $P0 = get_global 'compile_glob'
    $P1 = new [ 'PGE';'Glob';'Compiler' ]
    $P1.'register'('PGE::Glob', $P0)
    .return ()
.end

.sub '__load_bytecode' :anon
    .param string pbcname

    $P0 = load_bytecode pbcname
    $I0 = $P0.'is_initialized'('load')
    if $I0 goto done_initialization

    $P1 = $P0.'subs_by_tag'('load')
    $P2 = iter $P1
  loop_top:
    unless $P2 goto loop_bottom
    $P3 = shift $P2
    $P3()
    goto loop_top
  loop_bottom:

    $P0.'mark_initialized'('load')
  done_initialization:
.end


=item C<glob(PMC mob, PMC adverbs :slurpy :named)>

Parses a glob expression, returning the corresponding
parse C<PGE::Match> object.

=cut

.const int GLOB_INF = 2147483647

.sub 'glob'
    .param pmc mob
    .param pmc adverbs         :slurpy :named

    .local pmc optable, match
    optable = get_hll_global ['PGE';'Glob'], '$optable'
    match = optable.'parse'(mob)
    .return (match)
.end


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
as C<*> or C<[>.  Return the matched portion, with the I<ast object>
set to the decoded literal.

=cut

.sub 'glob_literal'
    .param pmc mob
    .param pmc adverbs         :slurpy :named

    .local string target
    .local int pos
    (mob, pos, target) = mob.'new'(mob, 'grammar'=>'PGE::Exp::Literal')
    ($S0, $I0) = 'scan_literal'(target, pos, '*?[{')
    if $I0 <= pos goto end
    mob.'to'($I0)
    mob.'!make'($S0)
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
    ##   The '?' is already in mob['KEY'], so we don't need to find it here.
    (mob, $I0) = mob.'new'(mob, 'grammar'=>'PGE::Exp::CCShortcut')
    mob.'to'($I0)
    mob.'!make'('.')
    .return (mob)
.end


=item C<glob_star(PMC mob, PMC adverbs)>

Process a C<*> wildcard character in a glob.  This is a little
bit more complex, as we have to return a quantified '.'.

=cut

.sub 'glob_star'
    .param pmc mob
    .param pmc adverbs         :slurpy :named
    .local int pos
    ##   The '*' is already in mob['KEY'], so we don't need to find it here.
    ##   We create a Quant object, then a CCShortcut inside of it.
    (mob, pos) = mob.'new'(mob, 'grammar'=>'PGE::Exp::Quant')
    mob.'to'(pos)
    mob['min'] = 0
    mob['max'] = GLOB_INF
    $P0 = mob.'new'(mob, 'grammar'=>'PGE::Exp::CCShortcut')
    $P0.'to'(pos)
    $P0.'!make'('.')
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
    .local int pos, lastpos
    (mob, pos, target) = mob.'new'(mob, 'grammar'=>'PGE::Exp::EnumCharList')
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
    mob.'to'(pos)
    mob.'!make'(charlist)
    .return (mob)

  err_noclose:
    mob.'to'(-1)
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
    (mob, pos, target) = mob.'new'(mob, 'grammar'=>'PGE::Exp::Literal')
    lastpos = length target

    ($S0, pos) = 'scan_literal'(target, pos, ',}')
    mob.'to'(pos)
    mob.'!make'($S0)
  alt_loop:
    if pos >= lastpos goto err_noclose
    $S0 = substr target, pos, 1
    if $S0 == '}' goto end
    $P0 = mob.'new'(mob, 'grammar'=>'PGE::Exp::Alt')
    inc pos
    mob.'to'(pos)
    $P0[0] = mob
    mob = $P0
    $P0 = mob.'new'(mob, 'grammar'=>'PGE::Exp::Literal')
    ($S0, pos) = 'scan_literal'(target, pos, ',}')
    mob.'to'(pos)
    $P0.'!make'($S0)
    mob[1] = $P0
    goto alt_loop
  end:
    inc pos
    mob.'to'(pos)
    .return (mob)

  err_noclose:
    mob.'to'(-1)
    .return (mob)
.end

.namespace [ 'PGE';'Glob';'Compiler' ]

=item register(string name, pmc compsub)

Registers this compiler object as C<name> and
using C<compsub> as the subroutine to call for performing compilation.

=cut

.sub 'register' :method
    .param string name
    .param pmc compsub

    setattribute self, '$!compsub', compsub
    compreg name, self

    .return ()
.end

=item compile(pmc code [, "option" => value, ... ])

Compile C<source> (possibly modified by any provided options).

=cut

.sub 'compile' :method
    .param pmc source
    .param pmc adverbs         :slurpy :named

    .local pmc compsub

    #   $!compsub is deprecated
    compsub = getattribute self, '$!compsub'

    .tailcall compsub(source, adverbs :flat :named)
.end

=back

=head1 AUTHOR

PGE::Glob was originally authored by Jonathan Scott Duff (duff@pobox.com),
It has been updated for later versions of PGE by Patrick R. Michaud
(pmichaud@pobox.com).

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
