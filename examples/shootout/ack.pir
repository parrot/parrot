#!./parrot -Oc -Cj
#
# ackermann - ack(3, 9) is default 
# shootout runs ack(3, 11)
# time for ack(3,11):  0.8s (AMD X2@2000)
# by Leopold Toetsch

.sub main :main
    .param pmc argv
    .local int argc
    argc = elements argv
    .local int x, y, r
    x = 3
    y = 9
    if argc == 1 goto go
    $S0 = argv[1]
    if argc == 2 goto xdefault
    x = $S0
    $S0 = argv[2]
    y = $S0
    goto go
xdefault:    
    y = $S0
go:
    $P0 = getinterp
    $P0.'recursion_limit'(100000)
    r = ack(x, y)
    .local pmc args
    args = new .ResizableIntegerArray
    push args, x
    push args, y
    push args, r
    $S0 = sprintf "Ack(%d, %d) = %d\n", args
    print $S0
.end

.sub ack
    .param int x
    .param int y
    if x goto a1
	$I0 = y + 1
	.return ($I0)
a1:
    if y goto a2
	$I0 = x - 1
	$I1 = 1
	.return ack($I0, $I1)
a2:
    $I2 = y - 1
    $I3 = ack(x, $I2)
    $I4 = x - 1
    .return ack($I4, $I3)
.end
