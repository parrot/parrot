=pod

=head1 nanoforth2 - a totally stripped down forth kernel

Like nanoforth but with PCC

Its intended to investigate dynamic compilation. It can read one line of
code and understands:

 +  add
 -  sub
 \d a number
 . print
 : x  compile single-letter word x
 ; end compile

=cut

.macro core(op, label)
    find_global P3, .label
    set P16[.op], P3
.endm

_main:
    getstdin P3
    readline S5, P3
    find_global P0, "_nano_forth_compiler"
    invokecc
    end

.pcc_sub _nano_forth_compiler:
    set P21, P1		#preserve ret cont
    set S17, S5		#input src code
    new P16, .PerlHash
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
    .core(":", "_start_compile")

    #set S17, ": a + ; 2 1 a ."
    set I1, 0	# 1 = compile
parse:
    length I0, S17
    unless I0, fin
    # S17 is rest of input, S16 is current word
    substr S16, S17, 0, 1, ""
    eq S16, ';', end_compile
    eq S16, ' ', parse
    eq S16, "\n", parse
    set P0, P16[S16]
    defined I0, P0
    unless I0, next
    if I1, compile
    invokecc P0
    branch parse
compile:
    ord I2, S16
    lt I2, 0x30, no_num
    gt I2, 0x39, no_num
    sub I2, 0x30
    concat S18, "save "
    set S2, I2
    concat S18, S2
    concat S18, "\n"
    branch parse
no_num:
    concat S18, "pushbottomp\n"
    concat S18, 'set P0, P16["'
    concat S18, S16
    concat S18, '"]'
    concat S18, "\ninvokecc\n"
    concat S18, "popbottomp\n"
    branch parse
next:
    printerr "? "
    printerr S16
    printerr "\n"
    branch syntax_error

end_compile:
    set I1, 0
    concat S18, "invoke P1\n"
    ## print S18
    compreg P2, "PASM"
    compile P1, P2, S18
    # find _entry_X
    set S0, "_entry_"
    concat S0, S19
    find_global P3, S0
    set P16[S19], P3
    branch parse
fin:
    set I5, 0
    invoke P21
syntax_error:
    printerr "syntax error\n"
    set I5, 1
    invoke P21

.pcc_sub _start_compile:
    substr S16, S17, 0, 1, ""
    eq S16, " ", _start_compile
    # word to cpmpile
    set S19, S16
    # should check that S19 is alphabetic
    set S18, ".pcc_sub _entry_"
    concat S18, S19
    concat S18, ":\n"
    set I1, 1
    invoke P1
.pcc_sub _add:
    restore I16
    restore I17
    add I16, I17, I16
    save I16
    invoke P1
.pcc_sub _sub:
    restore I16
    restore I17
    sub I16, I17, I16
    save I16
    invoke P1
.pcc_sub _print:
    restore I16
    print I16
    print "\n"
    invoke P1
# single digit 0..9 only
.pcc_sub _const:
    ord I16, S16
    sub I16, 0x30
    save I16
    invoke P1

