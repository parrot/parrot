=pod

=head1 nanoforth2 - a totally stripped down forth kernel

Like nanoforth but with PCC

Its intended to investigate dynamic compilation. It can read one line of
code and understands:

 +  add
 -  sub
 \d a single-digit number
 . print
 : x  compile single-letter word x
 ; end compile

=cut

.macro core(op, label)
    find_global P3, .label
    set P6[.op], P3
.endm

_main:
    getstdin P3
    readline S5, P3
    find_global P0, "_nano_forth_compiler"
    set I0, 1
    set I2, 1
    invokecc
    end

.pcc_sub _nano_forth_compiler:
    set P21, P1		#preserve ret cont
    set S17, S5		#input src code
    new P6, .PerlHash
    .core("+", "_add")
    .core("-", "_sub")
    .core(".", "_print")
    .core("0", "_const")
    .core("1", "_const")
    .core("2", "_const")
    .core("3", "_const")
    .core("4", "_const")
    .core("5", "_const")
    .core("6", "_const")
    .core("7", "_const")
    .core("8", "_const")
    .core("9", "_const")
    # .core(":", "_start_compile")
    new P5, .PerlArray
    new P10, .PerlInt
    store_global "compiling", P10

    #set S17, ": a + ; 2 1 a ."
    set I10, 0	# 1 = compile
parse:
    length I0, S17
    unless I0, fin
    # S17 is rest of input, S16 is current word
    substr S16, S17, 0, 1, ""
    eq S16, ':', _start_compile
    eq S16, ';', end_compile
    eq S16, ' ', parse
    eq S16, "\n", parse
    set P0, P6[S16]
    defined I0, P0
    unless I0, next
    find_global P10, "compiling"
    set I10, P10
    if I10, compile
    set I0, 1
    set I1, 0
    set I2, 1
    set I3, 2
    set I4, 0
    set S5, S16
    invokecc P0
    branch parse
compile:
    ord I2, S16
    lt I2, 0x30, no_num
    gt I2, 0x39, no_num
    sub I2, 0x30
    concat S18, "push P5, "
    set S2, I2
    concat S18, S2
    concat S18, "\n"
    branch parse
no_num:
    concat S18, 'set P0, P6["'
    concat S18, S16
    concat S18, '"]'
    concat S18, "\n"
    concat S18, "set I0, 1\n"
    concat S18, "set I1, 0\n"
    concat S18, "set I2, 1\n"
    concat S18, "set I3, 2\n"
    concat S18, "set I4, 0\n"
    concat S18, "invokecc\n"
    branch parse
next:
    printerr "? "
    printerr S16
    printerr "\n"
    branch syntax_error

end_compile:
    find_global P10, "compiling"
    set P10, 0
    concat S18, "null I0\n"
    concat S18, "null I3\n"
    concat S18, "invoke P11\n"
    # print "\n************\n"
    # print S18
    # print "\n************\n"
    compreg P2, "PASM"
    compile P3, P2, S18
    set P6[S19], P3
    branch parse
fin:
    set I5, 0
    invoke P21
syntax_error:
    printerr "syntax error\n"
    set I5, 1
    invoke P21

_start_compile:
    substr S16, S17, 0, 1, ""
    eq S16, " ", _start_compile
    # word to cpmpile
    set S19, S16
    # should check that S19 is alphabetic
    set S18, ".pcc_sub _entry_"
    concat S18, S19
    concat S18, ":\n"
    concat S18, "set P11, P1\n"
    find_global P10, "compiling"
    set P10, 1
    branch parse
# P5 = stack
# P6 = word hash
# S5 = input string
.pcc_sub _add:
    pop I16, P5
    pop I17, P5
    add I16, I17, I16
    push P5, I16
    null I0
    null I3
    invoke P1
.pcc_sub _sub:
    pop I16, P5
    pop I17, P5
    sub I16, I17, I16
    push P5, I16
    null I0
    null I3
    invoke P1
.pcc_sub _print:
    null I0
    null I3
    pop I16, P5
    print I16
    print "\n"
    null I0
    null I3
    invoke P1
# single digit 0..9 only
.pcc_sub _const:
    ord I16, S5
    sub I16, 0x30
    push P5, I16
    null I0
    null I3
    invoke P1

