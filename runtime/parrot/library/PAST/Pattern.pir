#!./parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

.macro accessor(attrname)
.sub .attrname :method
    .param pmc value
    .param int has_value
    if has_value goto setattr
    value = self[.attrname]
    unless null value goto value_done
value_undef:
    value = new 'Undef'
value_done:
    .return (value)
setattr:
    self[.attrname] = value
    .return (value)
.end
.endm

.sub 'onload' :anon :init :load
    load_bytecode 'P6object.pbc'
    .local pmc p6meta, base
    p6meta = new 'P6metaclass'
    $S0 = 'name source pos returns arity named flat lvalue'
    $P0 = get_class 'Capture'
    base = p6meta.'new_class'('PAST::Pattern', 'parent'=>$P0, 'attrs'=>$S0)
    $S1 = 'blocktype closure control loadinit namespace multi hll'
    $S2 = 'nsentry symtable lexical compiler compiler_args subid pirflags'
    $S0 = concat $S1, $S2
    p6meta.'new_class'('PAST::Pattern::Block', 'parent'=>base, 'attrs'=>$S0)
    $S0 = 'pasttype pirop inline'
    p6meta.'new_class'('PAST::Pattern::Op', 'parent'=>base, 'attrs'=>$S0)
    p6meta.'new_class'('PAST::Pattern::Stmts', 'parent'=>base)
    $S0 = 'value'
    p6meta.'new_class'('PAST::Pattern::Val', 'parent'=>base, 'attrs'=>$S0)
    $S0 = 'scope isdecl namespace slurpy call_sig viviself vivibase multitype'
    p6meta.'new_class'('PAST::Pattern::Var', 'parent'=>base, 'attrs'=>$S0)
    p6meta.'new_class'('PAST::Pattern::VarList', 'parent'=>base)
.end

.namespace ['PAST'; 'Pattern']

.accessor('name')
.accessor('source')
.accessor('pos')

.accessor('returns')
.accessor('arity')
.accessor('named')
.accessor('flat')
.accessor('lvalue')

.sub 'ACCEPTS' :method
    .param pmc node
    .return (0) # .ACCEPTS should return false by default.
.end

.namespace ['PAST'; 'Pattern'; 'Block']

.accessor('blocktype')
.accessor('closure')
.accessor('control')
.accessor('loadinit')
.accessor('namespace')
.accessor('multi')
.accessor('hll')
.accessor('nsentry')
.accessor('symbtable')
.accessor('lexical')
.accessor('compiler')
.accessor('compiler_args')
.accessor('subid')
.accessor('pirflags')

.namespace ['PAST'; 'Pattern'; 'Op']

.accessor('pasttype')
.accessor('pirop')
.accessor('inline')

.namespace ['PAST'; 'Pattern'; 'Stmts']

.namespace ['PAST'; 'Pattern'; 'Val']

.accessor('value')

.namespace ['PAST'; 'Pattern'; 'Var']

.accessor('scope')
.accessor('isdecl')
.accessor('namespace')
.accessor('slurpy')
.accessor('call_sig')
.accessor('viviself')
.accessor('vivibase')
.accessor('multitype')

.namespace ['PAST'; 'Pattern'; 'VarList']

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
