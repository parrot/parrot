# Cola (0.0.11.0) generated
#
# Mandelbrot set (see languages/cola/examples/mandelbrot.cola
#
.sub _MAIN
	.arg ""
	call _Mandelbrot__Main
	end
	ret
.end
.sub _Console__WriteLine
	saveall
	.param string	s
	.arg s
	call __puts
LBL0:	restoreall
	ret
.end
.sub _Mandelbrot__Main
	saveall
	.local int	k
	.local float	i
	.local float	c
	.local string	b
	.local float	Z
	.local float	C
	.local float	z
	.local int	y
	.local int	x
	.local float	t
	.local float	r
	b = " .:,;!/>)|&IH%*#"
	y = 30
LBL2:
	if y <= 0 goto LBL4
LBL3:
	$N0 = y
	$N1 = $N0 * 0.1
	C = $N1 - 1.5
	x = 0
LBL6:
	if x >= 75 goto LBL8
LBL7:
	$N2 = x
	$N3 = $N2 * 0.04
	$N4 = 2
	c = $N3 - $N4
	z = 0.0
	Z = 0.0
	r = c
	i = C
	k = 0
LBL10:
	if k >= 112 goto LBL12
LBL11:
	$N5 = z * z
	$N6 = Z * Z
	$N7 = $N5 - $N6
	t = $N7 + r
	$N8 = 2.0 * z
	$N9 = $N8 * Z
	Z = $N9 + i
	z = t
	$N10 = z * z
	$N11 = Z * Z
	$N12 = $N10 + $N11
	if $N12 <= 10.0 goto LBL16
LBL14:
	goto LBL12
LBL16:
LBL13:
	$I13 = k
	inc k
	goto LBL10
LBL12:
	$I14 = k % 16
	$S15 = b[$I14]
	.arg $S15
	call __puts
LBL9:
	$I16 = x
	inc x
	goto LBL6
LBL8:
	.arg "\n"
	call __puts
LBL5:
	$I17 = y
	dec y
	goto LBL2
LBL4:
LBL1:	restoreall
	ret
.end

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

.eom
