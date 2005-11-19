# $Id$

=head1 DESCRIPTION

This is an unlambda interpreter.
unlambda is a pure functional programming language with mostly eager
evaluation following the SKI calculus (+ a few extensions).

The parrot implementation uses closures, continuations, and tailcalls.

=head1 AUTHOR

leo

=head1 SEE ALSO

L<http://www.madore.org/~david/programs/unlambda/>

=cut

.sub _main :main
    .param pmc argv
    .local int argc
    .local pmc in, cchar
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
    .local pmc prog
    $P0 = getinterp
    $P0."recursion_limit"(50000)
    prog = parse(in)
    cchar = new .String
    global "cchar" = cchar
    # _dumper( prog, "prog" )
    ev(prog)
.end

#
# create a parse tree of the program
#
.sub parse
    .param pmc io

    .local string ch
    .local pmc op, arg, pair
    .const .Sub i  = "i"
    .const .Sub k  = "k"
    .const .Sub s  = "s"
    .const .Sub c  = "c"
    .const .Sub d  = "d"
    .const .Sub v  = "v"
    .const .Sub e  = "e"
    .const .Sub rd  = "rd"
    .const .Sub pc  = "pc"
loop:
    ch = read io, 1
    unless ch == '`' goto not_bq
	op = parse(io)
	arg = parse(io)
	pair = new FixedPMCArray
	pair = 2
	pair[0] = op
	pair[1] = arg
	.return (pair)
not_bq:
    unless ch == '.' goto not_dot
	$S0 = read io, 1
	arg = new .String
	arg = $S0
	.return clos_pr(arg)
not_dot:
    unless ch == '@' goto not_rd
	.return (rd)
not_rd:
    unless ch == '|' goto not_pc
	.return (pc)
not_pc:
    unless ch == '?' goto not_rc
	$S0 = read io, 1
	arg = new .String
	arg = $S0
	.return clos_rc(arg)
not_rc:
    unless ch == 'r' goto not_r
	arg = new .String
	arg = "\n"
	.return clos_pr(arg)
not_r:
    unless ch == 'i' goto not_i
	.return (i)
not_i:
    unless ch == 'k' goto not_k
	.return (k)
not_k:
    unless ch == 's' goto not_s
	.return (s)
not_s:
    unless ch == 'v' goto not_v
	.return (v)
not_v:
    unless ch == 'c' goto not_c
	.return (c)
not_c:
    unless ch == 'd' goto not_d
	.return (d)
not_d:
    unless ch == 'e' goto not_e
	.return (e)
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

# debugging helper
.sub unparse
    .param pmc exp
    $I0 = typeof exp
    unless $I0 == .FixedPMCArray goto no_ar
	$I1 = elements exp
	if $I1 != 2 goto no_pair
	.local pmc car, cdr
	print "`"
	car = exp[0]
	cdr = exp[1]
	unparse(car)
	unparse(cdr)
	.return()
no_ar:
    $S0 = exp
    print $S0
.end

# debugging helper
.sub unparse_all
    .param pmc exp
    unparse(exp)
    print "\n"
.end

#
# evaluate an expression
#
.sub ev
    .param pmc exp
    ## unparse_all(exp)
    $I0 = typeof exp
    unless $I0 == .FixedPMCArray goto no_ar
	$I1 = elements exp
	if $I1 != 2 goto no_pair
	.local pmc car, cdr, op, arg
	.const .Sub d  = "d"
	car = exp[0]
	cdr = exp[1]
	# this is tricky - we have to apply car
	# but discard it if it's delayed
	# else this doesn't play together with call/cc
	op = ev(car)
	if car != d goto not_d
	.return clos_d1(cdr)

    not_d:
	arg = ev(cdr)
	.return op(arg)
no_ar:
    .return (exp)
no_pair:
    printerr "no pair\n"
    exit 1
.end

#
# create a closure for pr
#

.sub clos_pr
    .param pmc arg
    .local pmc cl
    .lex 'x', arg
    .const .Sub pr = "pr"
    cl = newclosure pr
    .return (cl)
.end

# .x print
# r  print newline
.sub pr :outer(clos_pr)
    .param pmc arg
    .local pmc x
    x = find_lex "x"
    print x
    .return (arg)
.end

# i identy
.sub i
    .param pmc arg
    .return (arg)
.end

# k constant generator
.sub k
    .param pmc arg
    .const .Sub k1  = "k1"
    .return clos_k1(arg)
.end

.sub clos_k1
    .param pmc arg
    .local pmc cl
    .lex 'x', arg
    .const .Sub k1 = "k1"
    cl = newclosure k1
    .return (cl)
.end

# `kX contant function
.sub k1 :outer(clos_k1)
    .param pmc arg
    .local pmc x
    x = find_lex "x"
    .return (x)
.end

# s substitution
.sub s
    .param pmc arg
    .return clos_s1("x", arg)
.end

.sub clos_s1
    .param pmc arg
    .local pmc cl
    .lex 'x', arg
    .const .Sub s1 = "s1"
    cl = newclosure s1
    .return (cl)
.end

# `sX substitution first partial
.sub s1 :outer(clos_s1)
    .param pmc arg
    .local pmc x
    x = find_lex 'x'
    .return clos_s2(x, arg)
.end

#
# create a closure for s2 with 2 args
#
.sub clos_s2
    .param pmc arg
    .param pmc arg2
    .local pmc cl
    .lex 'x', arg
    .lex 'y', arg2
    .const .Sub s2 = "s2"
    cl = newclosure s2
    .return (cl)
.end

# ``sXY substitution application
.sub s2 :outer(clos_s2)
    .param pmc z
    .local pmc x, y, f1, f2
    x = find_lex 'x'
    y = find_lex 'y'
    f1 = x(z)
    f2 = y(z)
    .return f1(f2)
.end

.include "interpinfo.pasm"

# v void
.sub v
    .param pmc arg
    .param pmc self
    self = interpinfo .INTERPINFO_CURRENT_SUB
    .return (self)
.end

# c call/cc
.sub c
    .param pmc x
    .local pmc cc, c1
    cc = interpinfo .INTERPINFO_CURRENT_CONT
    .const .Sub c1 = "c1"
    cc = clos_c1(cc)
    .return x(cc)
.end

.sub clos_c1
    .param pmc arg
    .local pmc cl
    .lex 'cc', arg
    .const .Sub c1 = "c1"
    cl = newclosure c1
    .return (cl)
.end

# <cont>
.sub c1 :outer(clos_c1)
    .param pmc x
    .local pmc cc
    cc = find_lex 'cc'
    cc(x)
    printerr "not reached\n"
    exit 1
.end

# d delay
.sub d
    printerr "not reached\n"
    exit 1
.end

.sub clos_d1
    .param pmc arg
    .local pmc cl
    .lex 'F', arg
    .const .Sub d1 = "d1"
    cl = newclosure d1
    .return (cl)
.end

# `dF promise
.sub d1 :outer(clos_d1)
    .param pmc y
    .local pmc x, f
    f = find_lex 'F'
    x = ev(f)
    .return x(y)
.end

# e exit
.sub e
    .param pmc x
    $I0 = x
    exit $I0
.end

# @ read
.sub rd
    .param pmc x
    .local pmc cchar, i, v, io
    .local string ch
    io = getstdin
    ch = ''
    unless io goto void
    ch = read io, 1
    cchar = global "cchar"
    cchar = ch
    if ch == '' goto void
       .const .Sub i = "i"
       .return x(i)
void:
       .const .Sub v = "v"
       .return x(v)
.end

.sub clos_rc
    .param pmc arg
    .local pmc cl
    .lex 'ch', arg
    .const .Sub rc = "rc"
    cl = newclosure rc
    .return (cl)
.end

# ?x compare character read
.sub rc :outer(clos_rc)
    .param pmc x
    .local pmc cchar, i, v
    .local string ch
    cchar = global "cchar"
    ch = cchar
    if ch == '' goto void
       .const .Sub i = "i"
       $P0 = find_lex "ch"
       $S0 = $P0
       if $S0 != ch goto void
       .return x(i)
void:
       .const .Sub v = "v"
       .return x(v)
.end

# | reprint character read
.sub pc
    .param pmc x
    .local pmc cchar, i, v, pr, p, s
    .local string ch
    cchar = global "cchar"
    ch = cchar
    if ch == '' goto void
	s = clone cchar
        p = clos_pr(s)
        .return x(p)
void:
        .const .Sub v = "v"
        .return x(v)
.end

.include "library/dumper.imc"
# vim: ft=imc sw=4:
