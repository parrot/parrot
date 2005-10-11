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
    new_pad 0
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
    new_pad -1

    .local string ch
    .local pmc op, arg, pair
    .const .Sub pr = "pr"
    .const .Sub i  = "i"
    .const .Sub k  = "k"
    .const .Sub s  = "s"
    .const .Sub c  = "c"
    .const .Sub d  = "d"
    .const .Sub v  = "v"
    .const .Sub e  = "e"
    .const .Sub rd  = "rd"
    .const .Sub rc  = "rc"
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
	.return clos(pr, "x", arg)
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
	.return clos(rc, "ch", arg)
not_rc:
    unless ch == 'r' goto not_r
	arg = new .String
	arg = "\n"
	.return clos(pr,  "x",arg)
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

#
# create a closure of the passed in function
#
.sub clos
    .param pmc f
    .param string x
    .param pmc arg
    .local pmc cl
    new_pad -1
    store_lex -1, x, arg
    cl = new .Closure
    $I0 = get_addr f
    set_addr cl,  $I0
    # set the name of the closure
    .const .Sub pr = "pr"
    unless f == pr goto no_pr
    if arg == "\n" goto nl
	$S0 = '.'
	$S1 = arg
	$S0 .= $S1
	cl = $S0
	goto done
nl:
	cl = 'r'
	goto done

unlno_pr:
	$S0 = f
	cl = $S0
done:
    .return (cl)
.end

#
# create a closure of the passed in function, with 2 args
#
.sub clos2
    .param pmc f
    .param string x
    .param pmc arg
    .param string y
    .param pmc arg2
    .local pmc cl
    new_pad -1
    store_lex -1, x, arg
    store_lex -1, y, arg2
    cl = new .Closure
    $I0 = get_addr f
    set_addr cl,  $I0
    $S0 = f
    cl = $S0
    .return (cl)
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
	.const .Sub d1 = "d1"
	car = exp[0]
	cdr = exp[1]
	# this is tricky - we have to apply car
	# but discard it if it's delayed
	# else this doesn't play together with call/cc
	op = ev(car)
	if car != d goto not_d
	.return clos(d1, "F", cdr)

    not_d:
	arg = ev(cdr)
	.return op(arg)
no_ar:
    .return (exp)
no_pair:
    printerr "no pair\n"
    exit 1
.end

# .x print
# r  print newline
.sub pr
    .param pmc arg
    .local pmc x
    x = find_lex "x"
    ## print '#'
    print x
    ## print '#'
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
    .return clos(k1, "x", arg)
.end

# `kX contant function
.sub k1
    .param pmc arg
    .local pmc x
    x = find_lex -1, "x"
    .return (x)
.end

# s substitution
.sub s
    .param pmc arg
    .const .Sub s1  = "s1"
    .return clos(s1, "x", arg)
.end

# `sX substitution first partial
.sub s1
    .param pmc arg
    .const .Sub s2  = "s2"
    .local pmc x
    x = find_lex -1, 'x'
    .return clos2(s2, "x", x, "y", arg)
.end

# ``sXY substitution application
.sub s2
    .param pmc z
    .local pmc x, y, f1, f2
    x = find_lex -1, 'x'
    y = find_lex -1, 'y'
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
    cc = clos(c1, "cc", cc)
    .return x(cc)
.end

# <cont>
.sub c1
    .param pmc x
    .local pmc cc
    cc = find_lex -1, 'cc'
    cc(x)
    printerr "not reached\n"
    exit 1
.end

# d delay
.sub d
    printerr "not reached\n"
    exit 1
.end

# `dF promise
.sub d1
    .param pmc y
    .local pmc x, f
    f = find_lex -1, 'F'
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

# ?x compare character read
.sub rc
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
    .const .Sub pr = "pr"
	s = clone cchar
        p = clos(pr, "x", s)
        .return x(p)
void:
        .const .Sub v = "v"
        .return x(v)
.end

.include "library/dumper.imc"
# vim: ft=imc sw=4:
