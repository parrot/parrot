new P1, .PerlInt
set P1, 0
new P3, .PerlInt
set P3, 0
new P4, .PerlInt
set P4, 10000
new P6, .PerlInt
new P5, .PerlInt
new P7, .PerlInt
new P8, .PerlInt
new P9, .PerlInt
set P9, 0

LOOP:
  save P1
  bsr PRPMECHECK
  restore I9
  unless I9, NOTPRPME
#PSPRPME:
  inc P9
  assign P7, P1
NOTPRPME:
  inc P1
  ne P1,P4, LOOP

DONE:
#  end
  print "N primes calculated to "
  print P1
  print " is "
  print P9
  print "\n"
  print "last is: "
  print P7
  print "\n"
  end

PRPMECHECK:
 saveall
 restore P5
 lt P5,1,ret0
 assign P6,P5
 dec P6
NLOOP:
  le P6, 1, ret1
  cmod P8, P5, P6
  eq P8, 0, ret0
  dec P6
  branch NLOOP
  # is prime
ret1:
  set I0, 1
  save I0
  restoreall
  ret
ret0:
  set I0, 0
  save I0
  restoreall
  ret

