# Some basic routines for Cola programs
# Autoincluded in generated PIR code

.emit

__puts:
pushs
restore S31
print S31
pops
ret

__puti:
pushi
restore I31
print I31
popi
ret

__putf:
pushn
restore N31
print N31
popn
ret

__substr:
pushi
pushn
pushs
restore I31
restore I30
restore S31
substr S30, S31, I30, I31
save S30
pops
popn
popi
ret

__strlen:
pushs
pushi
restore S0
length I0, S0
save I0
pops
popi
ret

__strchop:
pushs
restore S0
chopn S0, 1
save S0
pops
ret

__strrep:
pushs
pushi
restore S30
restore I31
restore I30
restore S31
substr S31, I30, I31, S30
save S31
pops
popi
ret

__ord:
pushs
pushi
restore S0
ord I0, S0
save I0
pops
popi
ret

__gets:
pushs
read S0, 512
save S0
pops
ret

__sleep:
pushi
restore I0
sleep I0
popi
ret

.eom
