# Copyright (C) 2005-2009, Parrot Foundation.

=head1 TITLE

PGE::Exp - base class for expressions

=cut

.namespace [ 'PGE';'Exp' ]

.include "interpinfo.pasm"
.include "cclass.pasm"
.const int PGE_INF = 2147483647
.const int PGE_CUT_GROUP = -1
.const int PGE_CUT_RULE = -2
.const int PGE_CUT_MATCH = -3
.const int PGE_CUT_CUT = -4
.const int PGE_BACKTRACK_GREEDY = 1
.const int PGE_BACKTRACK_EAGER = 2
.const int PGE_BACKTRACK_NONE = 3

.sub "__onload" :tag('load')
    .local pmc optable
    .local pmc term

    .local pmc p6meta, expproto
    p6meta = get_hll_global 'P6metaclass'
    expproto = p6meta.'new_class'('PGE::Exp', 'parent'=>'PGE::Match')
    p6meta.'new_class'('PGE::Exp::Literal',      'parent'=>expproto)
    p6meta.'new_class'('PGE::Exp::Scalar',       'parent'=>expproto)
    p6meta.'new_class'('PGE::Exp::CCShortcut',   'parent'=>expproto)
    p6meta.'new_class'('PGE::Exp::Newline',      'parent'=>expproto)
    p6meta.'new_class'('PGE::Exp::EnumCharList', 'parent'=>expproto)
    p6meta.'new_class'('PGE::Exp::Anchor',       'parent'=>expproto)
    p6meta.'new_class'('PGE::Exp::Concat',       'parent'=>expproto)
    p6meta.'new_class'('PGE::Exp::Alt',          'parent'=>expproto)
    p6meta.'new_class'('PGE::Exp::Conj',         'parent'=>expproto)
    p6meta.'new_class'('PGE::Exp::Group',        'parent'=>expproto)
    p6meta.'new_class'('PGE::Exp::CGroup',       'parent'=>'PGE::Exp::Group')
    p6meta.'new_class'('PGE::Exp::Subrule',      'parent'=>expproto)
    p6meta.'new_class'('PGE::Exp::Cut',          'parent'=>expproto)
    p6meta.'new_class'('PGE::Exp::Quant',        'parent'=>expproto)
    p6meta.'new_class'('PGE::Exp::Modifier',     'parent'=>expproto)
    p6meta.'new_class'('PGE::Exp::Closure',      'parent'=>expproto)
    p6meta.'new_class'('PGE::Exp::Action',       'parent'=>expproto)

    load_bytecode 'PGE/Util.pbc'
.end


=over 4

=item C<compile(PMC adverbs :slurpy :named)>

Compile C<self> into PIR or a subroutine, according to the
C<target> adverbs.

=cut

.sub 'compile' :method
    .param pmc adverbs         :slurpy :named

    .local string target
    target = adverbs['target']
    target = downcase target
    if target == 'parse' goto return_exp
    if target == 'pge::exp' goto return_exp

    .local pmc code
    code = new 'StringBuilder'

    .local pmc ns
    ns = adverbs['namespace']
    unless null ns goto ns_emit
  ns_grammar:
    .local string grammar
    grammar = adverbs['grammar']
    ns = split '::', grammar
  ns_emit:
    $P1 = get_root_global ['parrot';'PGE';'Util'], 'pir_key_escape'
    $P0 = $P1(ns :flat)
    code.'append_format'(".namespace %0\n", $P0)
  ns_done:

    $P0 = self.'root_pir'(adverbs :flat :named)
    code .= $P0
    if target != 'pir' goto bytecode
    .return (code)

  bytecode:
    $P0 = compreg 'PIR'
    $P1 = $P0(code)
  make_grammar:
    if grammar == '' goto end
    .local pmc p6meta
    p6meta = get_hll_global 'P6metaclass'
    $P0 = p6meta.'get_proto'(grammar)
    unless null $P0 goto end
    $P0 = p6meta.'new_class'(grammar, 'parent'=>'PGE::Grammar')
  end:
    .return ($P1)

  return_exp:
    .return (self)
.end


=item C<root_pir(PMC adverbs)>

Return a StringBuilder object containing the entire expression
tree as a PIR code object that can be compiled.

=cut

.sub 'root_pir' :method
    .param pmc adverbs         :slurpy :named

    .local pmc code
    code = new 'StringBuilder'

    .local string name, namecorou
    name = adverbs['name']
    namecorou = concat name, '_corou'
    if name > '' goto have_name
    $P0 = get_root_global ['parrot';'PGE';'Util'], 'unique'
    name = $P0('_regex')
    namecorou = concat name, '_corou'
  have_name:
    .local pmc escape
    escape = get_root_global ['parrot';'PGE';'Util'], 'pir_str_escape'
    name      = escape(name)
    namecorou = escape(namecorou)

    .local string pirflags
    pirflags = adverbs['pirflags']

    $I0 = index pirflags, ':subid'
    if $I0 >= 0 goto have_subid
    $P0 = adverbs['subid']
    if null $P0 goto have_subid
    $S0 = escape($P0)
    pirflags = concat pirflags, ' :subid('
    pirflags = concat pirflags, $S0
    pirflags = concat pirflags, ')'
  have_subid:

    ##   Perform reduction/optimization on the
    ##   expression tree before generating PIR.
    .local pmc exp
    .local string explabel
    exp = self
    set_hll_global ['PGE';'Exp'], '$!group', exp
    exp = exp.'reduce'(self)

    ##   we don't need a coroutine if :ratchet is set
    .local int cutrule
    $I0 = adverbs['ratchet']
    cutrule = isne $I0, 0

    ##   generate the PIR for the expression tree.
    .local pmc expcode
    expcode = new 'StringBuilder'
    explabel = 'R'
    exp.'pir'(expcode, explabel, 'succeed')

    if cutrule goto code_cutrule
    ##   Generate the initial PIR code for a backtracking (uncut) rule.
    .local string returnop
    returnop = '.yield'
    code.'append_format'(<<"        CODE", name, pirflags, namecorou, .INTERPINFO_CURRENT_SUB)
      .sub %0 :method :nsentry %1
          .param pmc adverbs   :slurpy :named
          .local pmc mob
          .const 'Sub' corou = %2
          $P0 = corou
          $P0 = clone $P0
          mob = $P0(self, adverbs)
          .return (mob)
      .end
      .sub '' :subid(%2)
          .param pmc mob
          .param pmc adverbs
          .local string target
          .local pmc mfrom, mpos
          .local int cpos, iscont
          $P0 = get_hll_global ['PGE'], '$!MATCH'
          (mob, cpos, target, mfrom, mpos, iscont) = $P0.'new'(mob, adverbs :flat :named)
          $P0 = interpinfo %3
          setattribute mob, '&!corou', $P0
          .local int lastpos
          lastpos = length target
          if cpos > lastpos goto fail_rule
        CODE
    goto code_body

  code_cutrule:
    ##   Initial code for a rule that cannot be backtracked into.
    returnop = '.return'
    code.'append_format'(<<"        CODE", name, pirflags)
      .sub %0 :method :nsentry %1
          .param pmc adverbs      :slurpy :named
          .local pmc mob
          .local string target
          .local pmc mfrom, mpos
          .local int cpos, iscont
          $P0 = get_hll_global ['PGE'], '$!MATCH'
          (mob, cpos, target, mfrom, mpos, iscont) = $P0.'new'(self, adverbs :flat :named)
          .local int lastpos
          lastpos = length target
          if cpos > lastpos goto fail_rule
        CODE

  code_body:
    ##   generate the ustack only if we need it
    .local string expstr
    expstr = expcode
    code.'append_format'("          .local pmc cstack\n")
    code.'append_format'("          cstack = root_new ['parrot';'ResizableIntegerArray']\n")
    $I0 = index expstr, 'ustack'
    if $I0 < 0 goto code_body_1
    code.'append_format'("          .local pmc ustack\n")
    code.'append_format'("          ustack = root_new ['parrot';'ResizablePMCArray']\n")
  code_body_1:
    ##   generate the gpad only if we need it
    $I0 = index expstr, 'gpad'
    if $I0 < 0 goto code_body_2
    code.'append_format'("          .local pmc gpad\n")
    code.'append_format'("          gpad = root_new ['parrot';'ResizablePMCArray']\n")
  code_body_2:
    ##   set the captscope if we need it
    $I0 = index expstr, 'captscope'
    if $I0 < 0 goto code_body_3
    code.'append_format'("          .local pmc captscope, captob\n")
    code.'append_format'("          captscope = mob\n")
  code_body_3:

    code.'append_format'(<<"        CODE", PGE_CUT_RULE, returnop)
          .local int pos, rep, cutmark
        try_match:
          if cpos > lastpos goto fail_rule
          mfrom = cpos
          pos = cpos
          cutmark = 0
          local_branch cstack, R
          if cutmark <= %0 goto fail_cut
          inc cpos
          if iscont goto try_match
        fail_rule:
          cutmark = %0
        fail_cut:
          mob.'_failcut'(cutmark)
          %1 (mob)
          goto fail_cut
        succeed:
          mpos = pos
          %1 (mob)
        fail:
          local_return cstack
        CODE

    ##   add the "fail_match" target if we need it
    $I0 = index expstr, 'fail_match'
    if $I0 < 0 goto add_expcode
    code.'append_format'(<<"        CODE", PGE_CUT_MATCH)
        fail_match:
          cutmark = %0
          goto fail_cut
        CODE

  add_expcode:
    ##   add the expression code, then close off the sub
    code .= expcode
    code.'append_format'("      .end\n")
    .return (code)
.end


.sub 'getargs' :method
    .param pmc label
    .param pmc next
    .param pmc hash            :slurpy :named
    hash['L'] = label                                # %L = node's label
    hash['S'] = next                                 # %S = success target
    .local pmc quant
    $I0 = exists hash['quant']
    if $I0 == 0 goto end
    quant = hash['quant']
    $I0 = quant['min']
    $I1 = quant['max']
    $S2 = quant['backtrack']
    hash['m'] = $I0                                  # %m = min repetitions
    hash['n'] = $I1                                  # %n = max repetitions
    $S0 = $I0
    $S0 .= '..'
    $S1 = $I1
    $S0 .= $S1
    $S0 .= ' ('
    $S0 .= $S2
    $S0 .= ')'
    hash['Q'] = $S0                                  # %Q = printable quant
    hash['M'] = ''
    hash['N'] = ''
  quant_min:
    if $I0 > 0 goto quant_max
    hash['M'] = '### '                               # %M = # if min==0
  quant_max:
    if $I1 != PGE_INF goto end
    hash['N'] = '### '                               # %N = # if max==INF
  end:
    .return (hash)
.end


.sub 'gencapture' :method
    .param pmc label
    .local string cname
    .local pmc captgen, captsave, captback
    .local int iscapture, isarray
    cname = self['cname']
    iscapture = self['iscapture']
    isarray   = self['isarray']
    captgen   = new 'StringBuilder'
    captsave  = new 'StringBuilder'
    captback  = new 'StringBuilder'
    if iscapture == 0 goto end
    if isarray != 0 goto capt_array
    push captsave, 'captscope['
        push captsave, cname
        push captsave, "] = captob\n"
    push captback, 'delete captscope['
        push captback, cname
        push captback, "]\n"
    goto end
  capt_array:
    push captsave, '$P2 = captscope['
        push captsave, cname
        push captsave, "]\n"
    push captsave, 'push $P2, captob'
    push captback, '$P2 = captscope['
        push captback, cname
        push captback, "]\n"
    push captback, '$P2 = pop $P2'
    push captgen, '$I0 = defined captscope['
        push captgen, cname
        push captgen, "]\n"
    push captgen, 'if $I0 goto '
        push captgen, label
        push captgen, "_cgen\n"
     push captgen, "$P0 = root_new ['parrot';'ResizablePMCArray']\n"
     push captgen, 'captscope['
         push captgen, cname
         push captgen, "] = $P0\n"
     push captgen, 'local_branch cstack, '
         push captgen, label
         push captgen, "_cgen\n"
     push captgen, 'delete captscope['
         push captgen, cname
         push captgen, "]\n"
     push captgen, "goto fail\n"
     push captgen, label
         push captgen, "_cgen:\n"
  end:
    .return (captgen, captsave, captback)
.end


.namespace [ 'PGE';'Exp';'Literal' ]

.sub 'reduce' :method
    .param pmc next
    .return (self)
.end

.sub 'pir' :method
    .param pmc code
    .param string label
    .param string next

    .local pmc args
    args = self.'getargs'(label, next)
    .local string literal
    .local int litlen
    literal = self.'ast'()
    litlen = length literal

    args['I'] = ''
    $I0 = self['ignorecase']
    if $I0 == 0 goto ignorecase_end
    args['I'] = '$S0 = downcase $S0'
    literal = downcase literal
  ignorecase_end:

    $P0 = get_root_global ['parrot';'PGE';'Util'], 'pir_str_escape'
    literal = $P0(literal)

    code.'append_format'(<<"        CODE", litlen, literal, args :named :flat)
        %L: # literal
          $I0 = pos + %0
          if $I0 > lastpos goto fail
          $S0 = substr target, pos, %0
          %I
          if $S0 != %1 goto fail
          pos += %0
          goto %S\n
        CODE
    .return ()
.end


.namespace [ 'PGE';'Exp';'Concat' ]

.sub 'reduce' :method
    .param pmc next

    .local pmc children, exp
    .local int n
    children = self.'list'()
    n = elements children
  reduce_loop:
    if n <= 0 goto reduce_end
    dec n
    exp = self[n]
    exp = exp.'reduce'(next)
    self[n] = exp
    next = exp
    goto reduce_loop
  reduce_end:
    .local int i, j
    .local pmc exp0, exp1
    n = elements children
    i = 0
    j = 0
  concat_lit_loop:
    inc i
    if i >= n goto concat_lit_end
    exp1 = children[i]
    $I1 = isa exp1, ['PGE';'Exp';'Literal']
    if $I1 == 0 goto concat_lit_shift
    exp0 = children[j]
    $I0 = isa exp0, ['PGE';'Exp';'Literal']
    if $I0 == 0 goto concat_lit_shift
    $I0 = exp0['ignorecase']
    $I1 = exp1['ignorecase']
    if $I0 != $I1 goto concat_lit_shift
    $S0 = exp0.'ast'()
    $S1 = exp1.'ast'()
    $S0 = concat $S0, $S1
    exp0.'!make'($S0)
    goto concat_lit_loop
  concat_lit_shift:
    inc j
    if j >= i goto concat_lit_loop
    children[j] = exp1
    goto concat_lit_loop
  concat_lit_end:
    inc j
    children = j
    if j > 1 goto end
    exp = self[0]
    .return (exp)
  end:
    .return (self)
.end


.sub 'pir' :method
    .param pmc code
    .param string label
    .param string next
    .local pmc unique
    unique = get_root_global ['parrot';'PGE';'Util'], 'unique'

    .local pmc it, exp
    code.'append_format'("        %0: # concat\n", label)
    $P0 = self.'list'()
    it  = iter $P0
    exp = shift it
    $S0 = unique('R')
  iter_loop:
    unless it goto iter_end
    $P1 = shift it
    $S1 = unique('R')
    exp.'pir'(code, $S0, $S1)
    exp = $P1
    $S0 = $S1
    goto iter_loop
  iter_end:
    exp.'pir'(code, $S0, next)
    .return ()
.end


.namespace [ 'PGE';'Exp';'Quant' ]

.sub 'reduce' :method
    .param pmc next
    .local pmc exp0, sep
    exp0 = self[0]
    sep = self['sep']

    .local int backtrack, min, max
    backtrack = self['backtrack']
    min = self['min']
    max = self['max']
    if max != 1 goto reduce_exp0
    if min != max goto reduce_max1
    exp0['backtrack'] = backtrack
    exp0 = exp0.'reduce'(next)
    .return (exp0)

  reduce_max1:
    ##  special case of 0..1?: node
    if backtrack != PGE_BACKTRACK_NONE goto reduce_exp0
    $I0 = exists exp0['backtrack']
    if $I0 goto reduce_exp0
    exp0['backtrack'] = backtrack

  reduce_exp0:
    exp0 = exp0.'reduce'(next)
    self[0] = exp0
    if null sep goto reduce_exp0_1
    sep = sep.'reduce'(next)
    self['sep'] = sep
  reduce_exp0_1:
    .return (self)
.end

.sub 'pir' :method
    .param pmc code
    .param string label
    .param string next

    .local pmc unique
    unique = get_root_global ['parrot';'PGE';'Util'], 'unique'

    .local pmc exp, sep
    .local string explabel, seplabel, replabel, nextlabel
    exp = self[0]
    sep = self['sep']

    unless null sep goto outer_quant
    $I0 = can exp, 'pir_quant'
    if $I0 == 0 goto outer_quant
    $I0 = exp.'pir_quant'(code, label, next, self)
    if $I0 == 0 goto outer_quant
    .return ()

  outer_quant:
    .local pmc args
    args = self.'getargs'(label, next, 'quant' => self)

    .local int backtrack
    backtrack = self['backtrack']

    explabel = unique('R')
    nextlabel = explabel
    replabel = concat label, '_repeat'
    if null sep goto outer_quant_1
    seplabel = unique('R')
    nextlabel = concat label, '_sep'
  outer_quant_1:

    if backtrack == PGE_BACKTRACK_EAGER goto bt_eager
    if backtrack == PGE_BACKTRACK_NONE goto bt_none

  bt_greedy:
    args['c'] = 0
    args['C'] = '### '
    ##   handle 0..Inf as a special case
    $I0 = self['min']
    if $I0 != 0 goto bt_greedy_none
    $I0 = self['max']
    if $I0 != PGE_INF goto bt_greedy_none
    code.'append_format'(<<"        CODE", replabel, nextlabel, args :flat :named)
        %L:  # quant 0..Inf greedy
        %0:
          push ustack, pos
          local_branch cstack, %1
          pos = pop ustack
          if cutmark != 0 goto fail
          goto %S
        CODE
    goto end

  bt_none:
    $S0 = unique()
    args['c'] = $S0
    args['C'] = ''
    ##   handle 0..Inf as a special case
    $I0 = self['min']
    if $I0 != 0 goto bt_greedy_none
    $I0 = self['max']
    if $I0 != PGE_INF goto bt_greedy_none
    code.'append_format'(<<"        CODE", replabel, nextlabel, args :flat :named)
        %L:  # quant 0..Inf none
          local_branch cstack, %0
          if cutmark != %c goto fail
          cutmark = 0
          goto fail
        %0:
          push ustack, pos
          local_branch cstack, %1
          pos = pop ustack
          if cutmark != 0 goto fail
          local_branch cstack, %S
          if cutmark != 0 goto fail
          cutmark = %c
          goto fail
        CODE
    goto end

  bt_greedy_none:
    ##   handle greedy or none
    code.'append_format'(<<"        CODE", replabel, nextlabel, args :flat :named)
        %L:  # quant %Q greedy/none
          push gpad, 0
          local_branch cstack, %0
          $I0 = pop gpad
          %Cif cutmark != %c goto fail
          %Ccutmark = 0
          goto fail
        %0:
          rep = gpad[-1]
          %Nif rep >= %n goto %L_1
          inc rep
          gpad[-1] = rep
          push ustack, pos
          push ustack, rep
          local_branch cstack, %1
          rep = pop ustack
          pos = pop ustack
          if cutmark != 0 goto fail
          dec rep
        %L_1:
          %Mif rep < %m goto fail
          $I0 = pop gpad
          push ustack, rep
          local_branch cstack, %S
          rep = pop ustack
          push gpad, rep
          if cutmark != 0 goto fail
          %Ccutmark = %c
          goto fail\n
        CODE
    goto end

  bt_eager:
    ##   handle eager backtracking
    code.'append_format'(<<"        CODE", replabel, nextlabel, args :flat :named)
        %L:  # quant %Q eager
          push gpad, 0
          local_branch cstack, %0
          $I0 = pop gpad
          goto fail
        %0:
          rep = gpad[-1]
          %Mif rep < %m goto %L_1
          $I0 = pop gpad
          push ustack, pos
          push ustack, rep
          local_branch cstack, %S
          rep = pop ustack
          pos = pop ustack
          push gpad, rep
        %L_1:
          %Nif rep >= %n goto fail
          inc rep
          gpad[-1] = rep
          goto %1\n
        CODE

  end:
    if null sep goto sep_done
    code.'append_format'(<<"        CODE", nextlabel, explabel, seplabel)
        %0:
          if rep == 1 goto %1
          goto %2
        CODE
    sep.'pir'(code, seplabel, explabel)
  sep_done:
    exp.'pir'(code, explabel, replabel)
    .return ()
.end


.namespace [ 'PGE';'Exp';'Group' ]

.sub 'reduce' :method
    .param pmc next
    .local pmc exp

    $I0 = self['backtrack']
    if $I0 != PGE_BACKTRACK_NONE goto reduce_exp0
    ##   This group is non-backtracking, so concatenate a "cut group"
    ##   node (PGE::Exp::Cut) to its child.
    exp = self[0]
    $P0 = new ['PGE';'Exp';'Concat']
    $P0[0] = exp
    $P1 = new ['PGE';'Exp';'Cut']
    $P0[1] = $P1
    self[0] = $P0

  reduce_exp0:
    .local pmc group
    ##   Temporarily store this group as the current group.  Any
    ##   cut nodes we encounter will set a cutmark into this group.
    group = get_hll_global ['PGE';'Exp'], '$!group'
    set_hll_global ['PGE';'Exp'], '$!group', self
    exp = self[0]
    exp = exp.'reduce'(next)
    set_hll_global ['PGE';'Exp'], '$!group', group
    $I0 = self['cutmark']
    if $I0 > 0 goto keep_group
    $I0 = self['iscapture']
    if $I0 != 0 goto keep_group
    .return (exp)
  keep_group:
    .return (self)
.end

.sub 'pir' :method
    .param pmc code
    .param string label
    .param string next

    .local pmc exp0
    exp0 = self[0]

    .local int cutmark
    cutmark = self['cutmark']
    if cutmark > 0 goto has_cutmark
    exp0.'pir'(code, label, next)
    .return ()

  has_cutmark:
    .local string exp0label
    $P0 = get_root_global ['parrot';'PGE';'Util'], 'unique'
    exp0label = $P0('R')
    code.'append_format'(<<"        CODE", label, exp0label, cutmark)
        %0:  # group %2
          local_branch cstack, %1
          if cutmark != %2 goto fail
          cutmark = 0
          goto fail\n
        CODE
    exp0.'pir'(code, exp0label, next)
.end


.namespace [ 'PGE';'Exp';'CGroup' ]

.sub 'pir' :method :nsentry
    .param pmc code
    .param string label
    .param string next

    .local string explabel, expnext
    $P0 = get_root_global ['parrot';'PGE';'Util'], 'unique'
    explabel = $P0('R')
    expnext = concat label, '_close'

    .local pmc args
    args = self.'getargs'(label, next)

    .local string captgen, captsave, captback
    (captgen, captsave, captback) = self.'gencapture'(label)

    .local int cutmark
    cutmark = self['cutmark']
    args['c'] = cutmark
    args['C'] = '### '
    if cutmark == 0 goto cutmark_end
    args['C'] = ''
  cutmark_end:

    .local int isscope
    isscope = self['isscope']
    args['X'] = ''
    if isscope != 0 goto isscope_end
    args['X'] = '### '
  isscope_end:

    code.'append_format'(<<"        CODE", captgen, captsave, captback, 'E'=>explabel, args :flat :named)
        %L: # capture
          %0
          captob = captscope.'new'(captscope, 'pos'=>pos)
          push gpad, captscope
          push gpad, captob
          %Xcaptscope = captob
          local_branch cstack, %E
          captob = pop gpad
          captscope = pop gpad
          %Cif cutmark != %c goto fail
          %Ccutmark = 0
          goto fail
        %L_close:
          push ustack, captscope
          captob = pop gpad
          captscope = pop gpad
          $P1 = getattribute captob, '$.pos'
          $P1 = pos
          %1
          push ustack, captob
          local_branch cstack, %S
          captob = pop ustack
          %2
          push gpad, captscope
          push gpad, captob
          captscope = pop ustack
          goto fail\n
        CODE
    .local pmc exp
    exp = self[0]
    exp.'pir'(code, explabel, expnext)
    .return ()
.end


.namespace [ 'PGE';'Exp';'Subrule' ]

.sub 'reduce' :method
    .param pmc next
    .return (self)
.end

.sub 'pir' :method
    .param pmc code
    .param string label
    .param string next

    .local pmc args
    args = self.'getargs'(label, next)

    .local pmc escape
    escape = get_root_global ['parrot';'PGE';'Util'], 'pir_str_escape'

    .local string subarg
    subarg = ''
    $I0 = exists self['arg']
    if $I0 == 0 goto subarg_dba
    subarg = self['arg']
    subarg = escape(subarg)
    subarg = concat ', ', subarg
    args['A'] = $S0
  subarg_dba:
    $I0 = exists self['dba']
    if $I0 == 0 goto subarg_end
    $S0 = self['dba']
    $S0 = escape($S0)
    subarg .= ", 'dba'=>"
    subarg .= $S0
  subarg_end:

    .local string cname, captgen, captsave, captback
    (captgen, captsave, captback) = self.'gencapture'(label)

    .local string subname
    subname = self['subname']
  subrule:
    $I0 = 0
  subrule_1:
    $I1 = index subname, '::', $I0
    if $I1 == -1 goto subrule_2
    $I0 = $I1 + 2
    goto subrule_1
  subrule_2:
    if $I0 == 0 goto subrule_simple_name
    ##   The subrule is of the form <Grammar::rule>, which means we need
    ##   to create a Match object of the appropriate grammar (class) for it.
    .local string grammar, rname
    rname = substr subname, $I0
    $I0 -= 2
    grammar = substr subname, 0, $I0
    $P0 = split '::', grammar
    $P1 = get_root_global ['parrot';'PGE';'Util'], 'pir_key_escape'
    $P0 = $P1($P0 :flat)
    code.'append_format'(<<"        CODE", grammar, rname, $P0, args :flat :named)
        %L: # grammar subrule %0::%1
          captob = captscope.'new'(captscope, 'grammar'=>'%0')
          captob.'to'(pos)
          $P0 = get_hll_global %2, '%1'
        CODE
    goto subrule_match

  subrule_simple_name:
    ##   The subrule is of the form <rule>, which means we first look
    ##   for a method on the current match object, otherwise we do a
    ##   normal name lookup.
    code.'append_format'(<<"        CODE", subname, args :flat :named)
        %L: # subrule %0
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, '%0'
          if $I0 == 0 goto %L_1
          $P0 = find_method mob, '%0'
          goto %L_2
        %L_1:
          $P0 = find_name '%0'
          unless null $P0 goto %L_2
          die "Unable to find regex '%0'"
        %L_2:
        CODE

  subrule_match:
    $I0 = self['iszerowidth']
    if $I0 goto subrule_zerowidth
    $S0 = concat label, '_3'
    $I0 = self['backtrack']
    if $I0 != PGE_BACKTRACK_NONE goto subrule_match_1
    $S0 = next
  subrule_match_1:
    ##   Perform the subrule match, capturing the result as needed.
    ##   We either branch directly to the next node (PGE_BACKTRACK_NONE)
    ##   or to a small subroutine below that will keep backtracking into
    ##   the subrule until it no longer produces a match.
    code.'append_format'(<<"        CODE", PGE_CUT_MATCH, $S0, captgen, captsave, captback, subarg)
          $P2 = adverbs['action']
          captob = $P0(captob%5, 'action'=>$P2)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= %0 goto fail_match
          if $P1 < 0 goto fail
          %2
          %3
          pos = $P1
          local_branch cstack, %1
          %4
          goto fail
        CODE
    if $I0 == PGE_BACKTRACK_NONE goto end
    ##   Repeatedly backtrack into the subrule until there are no matches.
    code.'append_format'(<<"        CODE", PGE_CUT_MATCH, $S0, next)
        %1:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto %2
          push ustack, captob
          local_branch cstack, %2
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.'next'()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto %1
          if $P1 <= %0 goto fail_match
          goto fail\n
        CODE
    goto end
    .return()

  subrule_zerowidth:
    ##  this handles zero-width subrule matches, either positive
    ##  or negative.
    .local string test
    test = 'if'
    $I0 = self['isnegated']
    unless $I0 goto have_test
    test = 'unless'
  have_test:
    code.'append_format'(<<"        CODE", PGE_CUT_MATCH, test, next, subarg)
          captob = $P0(captob%3)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= %0 goto fail_match
          %1 $P1 < 0 goto fail
          $P1 = pos
          $P1 = getattribute captob, '$.from'
          $P1 = pos
          goto %2
        CODE
  end:
    .return()
.end


.namespace [ 'PGE';'Exp';'Alt' ]

.sub 'reduce' :method
    .param pmc next
    .local pmc exp0, exp1
    exp0 = self[0]
    exp0 = exp0.'reduce'(next)
    self[0] = exp0
    exp1 = self[1]
    exp1 = exp1.'reduce'(next)
    self[1] = exp1
    .return (self)
.end


.sub 'pir' :method
    .param pmc code
    .param string label
    .param string next
    .local pmc exp0, exp1
    .local string exp0label, exp1label
    $P0 = get_root_global ['parrot';'PGE';'Util'], 'unique'
    exp0label = $P0('R')
    exp1label = $P0('R')
    code.'append_format'(<<"        CODE", label, exp0label, exp1label)
        %0:  # alt %1, %2
          push ustack, pos
          local_branch cstack, %1
          pos = pop ustack
          if cutmark != 0 goto fail
          goto %2\n
        CODE
    exp0 = self[0]
    exp0.'pir'(code, exp0label, next)
    exp1 = self[1]
    exp1.'pir'(code, exp1label, next)
    .return ()
.end


.namespace [ 'PGE';'Exp';'Anchor' ]

.sub 'reduce' :method
    .param pmc next
    .return (self)
.end

.sub 'pir' :method
    .param pmc code
    .param pmc label
    .param pmc next
    .local string token, test
    token = self.'ast'()

    if token == '<?>' goto anchor_null
    if token == '^' goto anchor_bos
    if token == '$' goto anchor_eos
    if token == '^^' goto anchor_bol
    if token == '$$' goto anchor_eol
    if token == '<<' goto anchor_word_left
    if token == '>>' goto anchor_word_right
    if token == unicode:"\xab" goto anchor_word_left
    if token == unicode:"\xbb" goto anchor_word_right
    test = '!='
    if token == '\b' goto anchor_word
    test = '=='
    if token == '\B' goto anchor_word

  anchor_fail:
    code.'append_format'("        %0: # anchor fail %1\n", label, token)
    code.'append_format'("          goto fail\n")
    .return ()

  anchor_null:
    code.'append_format'("        %0: # anchor null %1\n", label, token)
    code.'append_format'("          goto %0\n", next)
    .return ()

  anchor_bos:
    code.'append_format'("        %0: # anchor bos\n", label)
    code.'append_format'("          if pos == 0 goto %0\n", next)
    code.'append_format'("          goto fail\n")
    .return ()

  anchor_eos:
    code.'append_format'("        %0: # anchor eos\n", label)
    code.'append_format'("          if pos == lastpos goto %0\n", next)
    code.'append_format'("          goto fail\n")
    .return ()

  anchor_bol:
    code.'append_format'(<<"        CODE", label, next, .CCLASS_NEWLINE)
        %0: # anchor bol
          if pos == 0 goto %1
          if pos == lastpos goto fail
          $I0 = pos - 1
          $I1 = is_cclass %2, target, $I0
          if $I1 goto %1
          goto fail\n
        CODE
    .return ()

  anchor_eol:
    code.'append_format'(<<"        CODE", label, next, .CCLASS_NEWLINE)
        %0: # anchor eol
          $I1 = is_cclass %2, target, pos
          if $I1 goto %1
          if pos != lastpos goto fail
          if pos < 1 goto %1
          $I0 = pos - 1
          $I1 = is_cclass %2, target, $I0
          if $I1 == 0 goto %1
          goto fail\n
        CODE
    .return ()

  anchor_word:
    code.'append_format'(<<"        CODE", label, next, .CCLASS_WORD, test)
        %0: # anchor word
          $I0 = 0
          if pos == 0 goto %0_1
          $I2 = pos - 1
          $I0 = is_cclass %2, target, $I2
        %0_1:
          $I1 = 0
          if pos >= lastpos goto %0_2
          $I1 = is_cclass %2, target, pos
        %0_2:
          if $I0 %3 $I1 goto %1
          goto fail
        CODE
    .return ()

  anchor_word_left:
    code.'append_format'(<<"        CODE", label, next, .CCLASS_WORD)
        %0: # left word boundary
          if pos >= lastpos goto fail
          $I0 = is_cclass %2, target, pos
          if $I0 == 0 goto fail
          if pos == 0 goto %1
          $I0 = pos - 1
          $I0 = is_cclass %2, target, $I0
          if $I0 goto fail
          goto %1
        CODE
    .return ()

  anchor_word_right:
    code.'append_format'(<<"        CODE", label, next, .CCLASS_WORD)
        %0: # right word boundary
          if pos == 0 goto fail
          $I0 = pos - 1
          $I0 = is_cclass %2, target, $I0
          if $I0 == 0 goto fail
          if pos >= lastpos goto %1
          $I0 = is_cclass %2, target, pos
          if $I0 goto fail
          goto %1
        CODE
    .return ()

.end


.namespace [ 'PGE';'Exp';'CCShortcut' ]

.sub 'reduce' :method
    .param pmc next

    .local string token
    token = self.'ast'()
    self['negate'] = 1
    if token == '\D' goto digit
    if token == '\S' goto space
    if token == '\W' goto word
    if token == '\N' goto newline
    self['negate'] = 0
    if token == '\d' goto digit
    if token == '\s' goto space
    if token == '\w' goto word
    if token == '\n' goto newline
    self['cclass'] = .CCLASS_ANY
    goto end
  digit:
    self['cclass'] = .CCLASS_NUMERIC
    goto end
  space:
    self['cclass'] = .CCLASS_WHITESPACE
    goto end
  word:
    self['cclass'] = .CCLASS_WORD
    goto end
  newline:
    self['cclass'] = .CCLASS_NEWLINE
  end:
    .return (self)
.end


.sub 'pir' :method
    .param pmc code
    .param string label
    .param string next
    .local int cclass, negate

    $S0 = self.'ast'()
    code.'append_format'("        %0: # cclass %1\n", label, $S0)
    code.'append_format'("          if pos >= lastpos goto fail\n")
    cclass = self['cclass']
    negate = self['negate']
    if cclass == .CCLASS_ANY goto end
    code.'append_format'("          $I0 = is_cclass %0, target, pos\n", cclass)
    code.'append_format'("          if $I0 == %0 goto fail\n", negate)
  end:
    code.'append_format'("          inc pos\n")
    code.'append_format'("          goto %0\n", next)
    .return ()
.end


.sub 'pir_quant' :method
    .param pmc code
    .param string label
    .param string next
    .param pmc quant

    .local pmc args
    .local int min, max, backtrack
    args = self.'getargs'(label, next, 'quant'=>quant)
    min = quant['min']
    max = quant['max']
    backtrack = quant['backtrack']

    ##  output initial label
    code.'append_format'("        %L: # cclass %0 %Q\n", self, args :flat :named)

    .local int cclass, negate
    cclass = self['cclass']
    negate = self['negate']
    if cclass == .CCLASS_ANY goto emit_dot
    .local string negstr
    negstr = '_not'
    if negate == 0 goto emit_find
    negstr = ''
  emit_find:
    code.'append_format'(<<"        CODE", negstr, cclass)
          $I0 = find%0_cclass %1, target, pos, lastpos
          rep = $I0 - pos
        CODE
    goto emit_pir
  emit_dot:
    code.'append_format'("          rep = lastpos - pos\n")

  emit_pir:
    code.'append_format'(<<"        CODE", args :flat :named)
          %Mif rep < %m goto fail
          %Nif rep <= %n goto %L_1
          %Nrep = %n
        %L_1:
        CODE

    if backtrack == PGE_BACKTRACK_NONE goto bt_none
    if backtrack == PGE_BACKTRACK_EAGER goto bt_eager

  bt_greedy:
    code.'append_format'(<<"        CODE", args :flat :named)
          pos += rep
        %L_2:
          if rep <= %m goto %S
          push ustack, pos
          push ustack, rep
          local_branch cstack, %S
          rep = pop ustack
          pos = pop ustack
          if cutmark != 0 goto fail
          dec pos
          dec rep
          goto %L_2
        CODE
    .return (1)

  bt_none:
    code.'append_format'("          pos += rep\n          goto %0\n", next)
    .return (1)

  bt_eager:
    code.'append_format'(<<"        CODE", args :flat :named)
          %Mpos += %m
          %Mrep -= %m
        %L_2:
          if rep == 0 goto %S
          push ustack, pos
          push ustack, rep
          local_branch cstack, %S
          rep = pop ustack
          pos = pop ustack
          if cutmark != 0 goto fail
          inc pos
          dec rep
          goto %L_2
        CODE
    .return (1)

.end

.namespace [ 'PGE';'Exp';'Cut' ]

.sub 'reduce' :method
    .param pmc next
    .local pmc group
    .local int cutmark

    cutmark = self['cutmark']
    if cutmark <= PGE_CUT_RULE goto end
    ##   This node is cutting a group.  We need to
    ##   get the current group's cutmark, or set
    ##   one if it doesn't already have one.
    group = get_hll_global ['PGE';'Exp'], '$!group'
    cutmark = group['cutmark']
    if cutmark > 0 goto has_cutmark
    $P1 = get_root_global ['parrot';'PGE';'Util'], 'unique'
    cutmark = $P1()
    group['cutmark'] = cutmark
  has_cutmark:
    self['cutmark'] = cutmark
  end:
    .return (self)
.end

.sub 'pir' :method
    .param pmc code
    .param string label
    .param string next

    .local int cutmark
    cutmark = self['cutmark']

    if cutmark > 0 goto group_cutmark
    code.'append_format'(<<"        CODE", label, next, cutmark)
        %0: # cut rule or match
          local_branch cstack, %1
          cutmark = %2
          goto fail_cut\n
        CODE
    .return ()

  group_cutmark:
    code.'append_format'(<<"        CODE", label, next, cutmark)
        %0: # cut %2
          local_branch cstack, %1
          cutmark = %2
          goto fail\n
        CODE
    .return ()
.end


.namespace [ 'PGE';'Exp';'Scalar' ]

.sub 'reduce' :method
    .param pmc next
    .return (self)
.end

.sub 'pir' :method
    .param pmc code
    .param string label
    .param string next

    .local string cname
    cname = self['cname']
    code.'append_format'(<<"        CODE", label, next, cname)
        %0: # scalar %2
          $P0 = mob[%2]
          $I0 = does $P0, 'array'
          if $I0 == 0 goto %0_1
          $P0 = $P0[-1]
        %0_1:
          $S1 = $P0
          $I1 = length $S1
          $I0 = pos + $I1
          if $I0 > lastpos goto fail
          $S0 = substr target, pos, $I1
          if $S0 != $S1 goto fail
          pos += $I1
          goto %1
        CODE
    .return ()
.end


.namespace [ 'PGE';'Exp';'EnumCharList' ]

.sub 'reduce' :method
    .param pmc next
    .return (self)
.end

.sub 'pir' :method
    .param pmc code
    .param string label
    .param string next

    .local pmc escape
    escape = get_root_global ['parrot';'PGE';'Util'], 'pir_str_escape'

    .local string charlist
    $S0 = self.'ast'()
    charlist = escape($S0)

    .local string test
    test = '<'
    $I0 = self['isnegated']
    if $I0 == 0 goto negated_end
    test = '>='
  negated_end:
    .local string incpos
    incpos = 'inc pos'
    $I0 = self['iszerowidth']
    if $I0 == 0 goto zerowidth_end
    incpos = '###   zero width'
  zerowidth_end:

    code.'append_format'(<<"        CODE", label, charlist, test, incpos, next)
        %0: # enumcharlist %1
          if pos >= lastpos goto fail
          $S0 = substr target, pos, 1
          $I0 = index %1, $S0
          if $I0 %2 0 goto fail
          %3
          goto %4
        CODE
    .return ()
.end


.namespace [ 'PGE';'Exp';'Newline' ]

.sub 'reduce' :method
    .param pmc next
    .return (self)
.end

.sub 'pir' :method
    .param pmc code
    .param string label
    .param string next
    code.'append_format'(<<"        CODE", label, next, .CCLASS_NEWLINE)
        %0: # newline
          $I0 = is_cclass %2, target, pos
          if $I0 == 0 goto fail
          $S0 = substr target, pos, 2
          inc pos
          if $S0 != "\\r\\n" goto %1
          inc pos
          goto %1
        CODE
    .return ()
.end


.namespace [ 'PGE';'Exp';'Conj' ]

.sub 'reduce' :method
    .param pmc next
    .local pmc exp0, exp1
    exp0 = self[0]
    exp0 = exp0.'reduce'(next)
    self[0] = exp0
    exp1 = self[1]
    exp1 = exp1.'reduce'(next)
    self[1] = exp1
    .return (self)
.end

.sub 'pir' :method
    .param pmc code
    .param string label
    .param string next

    .local string exp0label, exp1label, chk0label, chk1label
    $P0 = get_root_global ['parrot';'PGE';'Util'], 'unique'
    exp0label = $P0('R')
    exp1label = $P0('R')
    chk0label = concat label, '_chk0'
    chk1label = concat label, '_chk1'
    code.'append_format'(<<"        CODE", label, next, exp0label, chk0label, exp1label, chk1label)
        %0: # conj %2, %4
          push gpad, pos
          push gpad, pos
          local_branch cstack, %2
          $I0 = pop gpad
          $I0 = pop gpad
          goto fail
        %3:
          gpad[-1] = pos
          pos = gpad[-2]
          goto %4
        %5:
          $I0 = gpad[-1]
          if $I0 != pos goto fail
          $I0 = pop gpad
          $I1 = pop gpad
          push ustack, $I1
          push ustack, $I0
          local_branch cstack, %1
          $I0 = pop ustack
          $I1 = pop ustack
          push gpad, $I1
          push gpad, $I0
          goto fail\n
        CODE
    .local pmc exp0, exp1
    exp0 = self[0]
    exp0.'pir'(code, exp0label, chk0label)
    exp1 = self[1]
    exp1.'pir'(code, exp1label, chk1label)
    .return ()
.end

.namespace [ 'PGE';'Exp';'Closure' ]

.sub 'reduce' :method
    .param pmc next
    .return (self)
.end

.sub 'pir' :method
    .param pmc code
    .param string label
    .param string next

    .local pmc escape
    escape = get_root_global ['parrot';'PGE';'Util'], 'pir_str_escape'

    .local string value, lang
    value = self.'ast'()
    lang  = self['lang']
    value = escape(value)
    lang  = escape(lang)
    ##  to prevent recompiling every execution, this code makes use of
    ##  a global %!cache, keyed on the inline closure source.  There
    ##  could be a (unlikely) problem if the same source is sent to
    ##  two different compilers.  Also, if the sources can be lengthy
    ##  we might be well served to use a hashed representation of
    ##  the source.
    code.'append_format'(<<"        CODE", label, lang, value)
        %0: # closure
          $S1 = %2
          $P0 = get_hll_global ['PGE';'Match'], '%!cache'
          $P1 = $P0[$S1]
          unless null $P1 goto %0_1
          $P1 = compreg %1
          $P1 = $P1($S1)
          $P0[$S1] = $P1
        %0_1:
        CODE
    $I0 = self['iszerowidth']
    if $I0 goto closure_zerowidth
    code.'append_format'(<<"        CODE", next)
          mpos = pos
          ($P0 :optional, $I0 :opt_flag) = $P1(mob)
          if $I0 == 0 goto %0
          mob.'!make'($P0)
          push ustack, pos
          local_branch cstack, succeed
          pos = pop ustack
          null $P0
          mob.'!make'($P0)
          goto fail
        CODE
    .return ()
  closure_zerowidth:
    ##  we're doing a <?{{ or <!{{ assertion.
    .local string test
    test = 'if'
    $I0 = self['isnegated']
    unless $I0 goto have_test
    test = 'unless'
  have_test:
    code.'append_format'(<<"        CODE", test, next)
          mpos = pos
          $P0 = $P1(mob)
          %0 $P0 goto %1
          goto fail
        CODE
    .return ()
.end

.namespace [ 'PGE';'Exp';'Action' ]

.sub 'reduce' :method
    .param pmc next
    .return (self)
.end

.sub 'pir' :method
    .param pmc code
    .param string label
    .param string next
    .local pmc escape
    escape = get_root_global ['parrot';'PGE';'Util'], 'pir_str_escape'
    .local string actionname, actionkey
    code.'append_format'("        %0: # action\n", label)
    actionname = self['actionname']
    if actionname == '' goto end
    actionname = escape(actionname)
    actionkey = self['actionkey']
    if actionkey == '' goto have_actionkey
    actionkey = escape(actionkey)
    actionkey = concat ', ', actionkey
  have_actionkey:
    code.'append_format'(<<"        CODE", label, next, actionname, actionkey)
          $P1 = adverbs['action']
          if null $P1 goto %1
          $I1 = can $P1, %2
          if $I1 == 0 goto %1
          mpos = pos
          $P1.%2(mob%3)
          goto %1
        CODE
  end:
    .return ()
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
