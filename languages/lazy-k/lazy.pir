# $Id$

=head1 DESCRIPTION

This is a lazy-k interpreter - basically a rewrite of lazy.cpp in PIR.
Lazy-k is a pure functional programming language following the SKI calculus

=head1 AUTHOR

leo

=head1 SEE ALSO

L<http://en.wikipedia.org/wiki/Lazy_K_programming_language>

=head1 TODO

 - (S(K ...)) syntax
 - iota/Jot syntax
 - chained commandline args and -e, -b

And a lot of comments in the source - sorry.

=cut

.sub _main @MAIN
    .param pmc argv
    .local int argc
    .local pmc in
    argc = argv
    if argc > 1 goto open_file
    in = getstdin
    goto run
open_file:
    $S0 = argv[1]
    in = open $S0, "<"
    $I0 = defined in
    if $I0 goto run
    printerr "can't open '"
    printerr $S0
    printerr "' for reading."
    exit 1
run:
    .local pmc prog, e
    $P0 = getinterp
    create_globals()
    e = global "I"
    prog = parse(in)
    ## _dumper( prog, "prog" )
    e = append(e, prog)

    .local pmc lr, NUL
    null NUL
    lr = new_expr('LR', NUL, NUL)
    e = new_apply(e, lr)
    ## deparse_e(e)
    ## trace 15
loop:
    $P0 = car(e)
    $I0 = church2int($P0)
    if $I0 < 256 goto put
	exit $I0
put:
    $S0 = chr $I0
    print $S0
    e = cdr(e)
    goto loop
.end

.sub compose
    .param pmc f
    .param pmc g
    .local pmc k1f,  NUL
    null NUL
    k1f = new_expr('K1', f, NUL)
    .return  new_expr('S2', k1f, g)
.end

.sub append
    .param pmc old
    .param pmc n
    .return compose(n, old)
.end

.sub church2int
    .param pmc church

    .local pmc e, Zero, Inc, result
    Inc = global "Inc"
    Zero = global "Zero"
    e = new_apply(church, Inc)
    e = new_apply(e, Zero)
    result = eval(e)
    $I0 = to_number(result)
    if $I0 == -1 goto err
	.return($I0)
err:
    printerr "invalid output format - not a number\n"
    exit 3
.end

.sub car
    .param pmc list
    .local pmc k
    k = global "K"
    .return new_apply(list, k)
.end

.sub cdr
    .param pmc list
    .local pmc ki
    ki = global "KI"
    .return new_apply(list, ki)
.end

.sub create_globals
    .local pmc e, NUL, K, S, KS, I, KI
    null NUL
    K = new_expr('K', NUL, NUL)
    global "K" = K
    S = new_expr('S', NUL, NUL)
    global "S" = S
    I = new_expr('I', NUL, NUL)
    global "I" = I
    KI = new_expr('K1', I, NUL)
    global "KI" = KI
    e = new_expr('S1', I, NUL)
    global "SI" = e
    KS = new_expr('K1', S, NUL)
    global "KS" = KS
    e = new_expr('K1', K, NUL)
    global "KK" = e
    e = new_expr('S2', KS, K)
    global "SKSK" = e
    e = new_expr('S2', I, KS)
    global "SIKS" = e

    e = new_expr('Inc', NUL, NUL)
    global "Inc" = e
    $P0 = new .Integer
    e = new_expr('Num', $P0, NUL)
    global "Zero" = e

    .local pmc cache
    cache = new FixedPMCArray
    cache = 257
    cache[0] = KI
    cache[1] = I
    global "church_cache" = cache

.end

.sub new_expr
    .param string type
    .param pmc lhs
    .param pmc rhs
    .local pmc expr
    expr = new FixedPMCArray
    expr = 3
    expr[0] = type
    expr[1] = lhs
    expr[2] = rhs
    .return (expr)
.end

.sub new_apply
    .param pmc lhs
    .param pmc rhs
    .return new_expr('A', lhs, rhs)
.end

.sub parse
    .param pmc io

    .local string ch
    .local pmc op, arg, NUL
    .local pmc I, K, S
    I = global "I"
    K = global "K"
    S = global "S"
    null NUL
loop:
    ch = read io, 1
    unless ch == '`' goto not_bq
	op = parse(io)
	arg = parse(io)
	.return new_apply(op, arg)
not_bq:
    unless ch == 'i' goto not_i
	.return (I)
not_i:
    unless ch == 'k' goto not_k
	.return (K)
not_k:
    unless ch == 's' goto not_s
	.return (S)
not_s:
not_e:
    unless ch == '#' goto not_comment
    swallow:
	ch = read io, 1
	if ch != "\n" goto swallow
	goto loop
not_comment:
    if ch == ' ' goto loop
    if ch == "\t" goto loop
    if ch == "\n" goto loop
    if ch == "\r" goto loop
    printerr "unrecogniced char in program '"
    printerr ch
    printerr "'\n"
    exit 1
.end

.sub drop_i1
    .param pmc expr
    .local pmc type
    .local string ts
loop:
    type = expr[0]
    ts = type
    if ts != 'I1' goto ret_e
	expr = expr[1]
    goto loop
ret_e:
    .return (expr)
.end

.sub int2church
    .param int i

    .local pmc cached, e
    cached = global "church_cache"
    if i < 0 goto i256
    if i > 256 goto i256
    goto ok
i256:
    i = 256
ok:
    e = cached[i]
    unless_null e,  ret
	.local pmc sksk, e, cm1
	sksk = global "SKSK"
	$I0 = i - 1
	cm1 = int2church($I0)
	e = new_expr('S2', sksk, cm1)
	cached[i] = e
ret:
    .return (e)
.end

.sub to_number
    .param pmc expr
    .local pmc type, arg1
    .local string ts
    type = expr[0]
    ts = type
    if ts != 'Num' goto ret1
    $P0 = expr[1]
    $I0 = $P0
    .return ($I0)
ret1:
    .return (-1)
.end

.sub apply
    .param pmc expr

    .local pmc type, lhs, rhs, arg1, arg2, NUL
    .local string ts
    arg1 = expr[1]
    arg2 = expr[2]
    lhs = arg1
    rhs = drop_i1(arg2)
    null NUL
    type = lhs[0]
    ts = type
    unless ts == 'K' goto not_k
	expr[0] = 'K1'
	expr[1] = rhs
	expr[2] = NUL
	.return()
not_k:
    unless ts == 'K1' goto not_k1
	expr[0] = 'I1'
	$P0 = lhs[1]
	expr[1] = $P0
	expr[2] = NUL
	.return()
not_k1:
    unless ts == 'I' goto not_i
	expr[0] = 'I1'
	expr[1] = rhs
	expr[2] = NUL
	.return()
not_i:
    unless ts == 'S' goto not_s
	expr[0] = 'S1'
	expr[1] = rhs
	expr[2] = NUL
	.return()
not_s:
    unless ts == 'S1' goto not_s1
	expr[0] = 'S2'
	$P0 = lhs[1]
	expr[1] = $P0
	expr[2] = rhs
	.return()
not_s1:
    unless ts == 'LR' goto not_lr
	lhs[0] = 'S2'
	.local pmc cc, k1c, s2ik1, i, io
	.local string s
	io = getstdin
	$I0 = 256
	unless io goto eof
	s = read io, 1
	if s == '' goto eof
	$I0 = ord s
    eof:
	cc = int2church($I0)
	i = global "I"
	k1c = new_expr('K1', cc, NUL)
	s2ik1 = new_expr('S2', i, k1c)
	lhs[1] = s2ik1
	$P0 = new_expr('LR', NUL, NUL)
	$P1 = new_expr('K1', $P0)
	lhs[2] = $P1
	goto s2
not_lr:
    unless ts == 'S2' goto not_s2
s2:
	## expr[0] = 'A'
	$P0 = lhs[1]
	$P1	= new_apply( $P0, rhs)
	expr[1] = $P1
	$P0 = lhs[2]
        $P2	= new_apply( $P0, rhs)
	expr[2] = $P2
	.return()
not_s2:
    unless ts == 'Inc' goto not_inc
	rhs = eval(rhs)
	$I0 = to_number(rhs)
	inc $I0
	if $I0 goto num_ok
	    printerr "invalid Inc of non-number\n"
	    exit 1
num_ok:
	$P0 = new Integer
	$P0 = $I0
	expr[0] = 'Num'
	expr[1] = $P0
	expr[2] = NUL
	.return()
not_inc:
    unless ts == 'Num' goto not_num
	printerr "invalid apply of number\n"
	exit 1
not_num:
    printerr "unknown expression: '"
    printerr ts
    printerr "'\n"
    exit 1
    .return()
.end

.sub deparse
    .param pmc expr
    .local pmc type, arg1, arg2
    .local string ts
    type = expr[0]
    ts = type
    unless ts == 'A' goto not_a
	print "("
	arg1 = expr[1]
	deparse(arg1)
	print " "
	arg2 = expr[2]
	deparse(arg2)
	print ")"
	.return()
not_a:
    unless ts == 'K' goto not_k
	print "K"
	.return()
not_k:
    unless ts == 'I' goto not_i
	print "I"
	.return()
not_i:
    unless ts == 'K1' goto not_k1
	print "[K"
	arg1 = expr[1]
	deparse(arg1)
	print "]"
	.return()
not_k1:
    unless ts == 'I1' goto not_i1
	print "[I"
	arg1 = expr[1]
	deparse(arg1)
	print "]"
	.return()
not_i1:
    unless ts == 'S' goto not_s
	print "S"
	.return()
not_s:
    unless ts == 'S1' goto not_s1
	print "[S"
	arg1 = expr[1]
	deparse(arg1)
	print "]"
	.return()

not_s1:
    unless ts == 'S2' goto not_s2
	print "[s"
	arg1 = expr[1]
	deparse(arg1)
	print " "
	arg2 = expr[2]
	deparse(arg2)
	print "]"
	.return()
not_s2:
    unless ts == 'LR' goto not_lr
	print "R"
	.return()
not_lr:
    unless ts == 'Inc' goto not_inc
	print "I"
	.return()
not_inc:
    unless ts == 'Num' goto not_num
	$I0 = expr[1]
	print $I0
	.return()
not_num:
    printerr "unknown expression: '"
    printerr ts
    printerr "'\n"
    exit 1
    .return()
.end

.sub deparse_e
    .param pmc expr
    deparse(expr)
    print "\n"
.end

.sub eval
    .param pmc expr
    .local pmc cur, arg1, type, next, prev, NUL
    .local string ts
    ##deparse_e(expr)
    cur = expr
    null prev
    null NUL
loop:
    cur = drop_i1(cur)
lpa:
    type = cur[0]
    ts = type
    if ts != 'A' goto not_a
	next = cur[1]
	next = drop_i1(next)
	cur[1] = prev
	prev = cur
	cur = next
	goto lpa
not_a:
    unless_null prev, isnt_nul
	.return (cur)
isnt_nul:
    next = cur
    cur = prev
    prev = cur[1]
    cur[1] = next
    apply(cur)
    goto loop
    .return (NUL)
.end

.include "library/dumper.imc"
# vim: ft=imc sw=4:
