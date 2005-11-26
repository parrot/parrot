# $Id$

=pod

=head1 nanoforth - a totally stripped down forth kernel

Its intended to investigate dynamic compilation. It can read one line of
code and understands:

 +  add
 -  sub
 \d a number (single digit only)
 . print
 : x  compile single-letter word x
 ; end compile

This code uses the same compile/call scheme as Dan's languages/forth
compiler and is therefor equally broken. The C<jsr> opcode does not allow
to branch into different code segments, or better it works only if bounds
checking is disabled.

=cut

.macro core(op, label)
    set_addr I3, .label
    set P16[.op], I3
.endm

_main:
    new P16, .PerlHash
    .core("+", _add)
    .core("-", _sub)
    .core(".", _print)
    .core("0", _const)
    .core("1", _const)
    .core("2", _const)
    .core("3", _const)
    .core("4", _const)
    .core("5", _const)
    .core("6", _const)
    .core("7", _const)
    .core("8", _const)
    .core("9", _const)
    .core(":", _start_compile)

    getstdin P3
    readline S17, P3
    set I1, 0	# 1 = compile
parse:
    length I0, S17
    unless I0, fin
    # S17 is rest of input, S16 is current word
    substr S16, S17, 0, 1, ""
    eq S16, ';', end_compile
    eq S16, ' ', parse
    eq S16, "\n", parse
    set I3, P16[S16]
    unless I3, next
    if I1, compile
    jsr I3
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
    concat S18, "\nset I16, "
    set S1, I3
    concat S18, S1
    concat S18, "\njsr I16\n"
    branch parse
next:
    printerr "? "
    printerr S16
    printerr "\n"
    branch syntax_error

end_compile:
    set I1, 0
    concat S18, "ret\n"
    ## print S18
    compreg P2, "PASM"
    compile P1, P2, S18
    # dan's hack
    set I16, P1[1]
    # alternate - not working
    find_global P3, "_entry"
    get_addr I17, P3
    eq I16, I17, ok
    ok:
    # end
    set P16[S19], I16
    branch parse
fin:
    print "\n"
    end
syntax_error:
    print "syntax error\n"
    end
_start_compile:
    substr S16, S17, 0, 1, ""
    eq S16, " ", _start_compile
    # word to cpmpile
    set S19, S16
    set S18, "noop\n.pcc_sub _entry:\n"
    set I1, 1
    ret
_add:
    restore I16
    restore I17
    add I16, I17, I16
    save I16
    ret
_sub:
    restore I16
    restore I17
    sub I16, I17, I16
    save I16
    ret
_print:
    restore I16
    print I16
    ret
# single digit 0..9 only
_const:
    ord I16, S16
    sub I16, 0x30
    save I16
    ret

