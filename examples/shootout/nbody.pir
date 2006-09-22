#!./parrot -j
# The Computer Language Shootout
# http://shootout.alioth.debian.org/
# 
# Contributed by Joshua Isom
# speed up  from 1m25 to 6s by Leopold Toetsch
# changed default value to 1000 to match shootout default (karl)

.const int x = 0
.const int y = 1
.const int z = 2
.const int vx = 3
.const int vy = 4
.const int vz = 5
.const int m = 6

# save on repetition of code
.macro InitBodies (bodies, i, num1, num2, num3, num4, num5, num6, num7)
	$N0 = .num4 * 365.24
	$N1 = .num5 * 365.24
	$N2 = .num6 * 365.24
	$N3 = .num7 * 39.478417604357428
	$P0 = new .FixedFloatArray
	$P0 = 7
	.bodies[.i] = $P0
	.bodies[.i; x] = .num1
	.bodies[.i; y] = .num2
	.bodies[.i; z] = .num3
	.bodies[.i; vx] = $N0
	.bodies[.i; vy] = $N1
	.bodies[.i; vz] = $N2
	.bodies[.i; m] = $N3
.endm

.sub main :main
	.param pmc argv
	.local int argc, n, nbodies
	argc = argv
	n = 1000
	unless argc > 1 goto argsok
	$S0 = argv[1]
	n = $S0
argsok:
	.local pmc bodies
	bodies = new .FixedPMCArray
	bodies = 5
	# Sun
	.InitBodies(bodies, 0, 0, 0, 0, 0, 0, 0, 1)
	# Jupiter
	.InitBodies(bodies, 1,
	 4.84143144246472090e+00,
	-1.16032004402742839e+00,
	-1.03622044471123109e-01,
	 1.66007664274403694e-03,
	 7.69901118419740425e-03,
	-6.90460016972063023e-05,
	 9.54791938424326609e-04)
	# Saturn
	.InitBodies(bodies, 2,
	 8.34336671824457987e+00,
	 4.12479856412430479e+00,
	-4.03523417114321381e-01,
	-2.76742510726862411e-03,
	 4.99852801234917238e-03,
	 2.30417297573763929e-05,
	 2.85885980666130812e-04)
	# Uranus
	.InitBodies(bodies, 3,
	 1.28943695621391310e+01,
	-1.51111514016986312e+01,
	-2.23307578892655734e-01,
	 2.96460137564761618e-03,
	 2.37847173959480950e-03,
	-2.96589568540237556e-05,
	 4.36624404335156298e-05)
	# Neptune
	.InitBodies(bodies, 4,
	 1.53796971148509165e+01,
	-2.59193146099879641e+01,
	 1.79258772950371181e-01,
	 2.68067772490389322e-03,
	 1.62824170038242295e-03,
	-9.51592254519715870e-05,
	 5.15138902046611451e-05)

	nbodies = bodies
	offset_momentum(nbodies, bodies)
	$N0 = energy(nbodies, bodies)
	.local pmc spf
	spf = new .FixedFloatArray
	spf = 1
	spf[0] = $N0
	$S0 = sprintf "%.9f\n", spf
	print $S0
	.local int i
	i = 0
beginfor:
	unless i < n goto endfor
		advance(nbodies, bodies, 0.01)
	inc i
	goto beginfor
endfor:
	
	$N0 = energy(nbodies, bodies)
	spf[0] = $N0
	$S0 = sprintf "%.9f\n", spf
	print $S0
	exit 0
.end

.sub offset_momentum
	.param int nbodies
	.param pmc bodies
	.local float px, py, pz
	px = 0.0
	py = 0.0
	pz = 0.0
	.local int i
	i = 0
beginfor:
	unless i < nbodies goto endfor
	$N0 = bodies[i; vx]
	$N1 = bodies[i; m]
	$N0 *= $N1
	px += $N0
	$N0 = bodies[i; vy]
	$N1 = bodies[i; m]
	$N0 *= $N1
	py += $N0
	$N0 = bodies[i; vz]
	$N1 = bodies[i; m]
	$N0 *= $N1
	pz += $N0
	inc i
	goto beginfor
endfor:
	# bodies[0].vx = - px / solar_mass;
	px /= -39.478417604357428
	bodies[0; vx] = px
	py /= -39.478417604357428
	bodies[0; vy] = py
	pz /= -39.478417604357428
	bodies[0; vz] = pz
.end

.sub energy
	.param int nbodies
	.param pmc bodies
	.local float e, tmp
	.local int i, j
	e = 0.0
	i = 0
beginfor_0:
	unless i < nbodies goto endfor_0

	# e += 0.5 * b->mass * (b->vx * b->vx + b->vy * b->vy + b->vz * b->vz);
	$N0 = bodies[i; m] # mass
	$N0 *= 0.5

	$N1 = bodies[i; vx] # vx
	$N3 = pow $N1, 2.0
	
	$N1 = bodies[i; vy] # vy
	$N2 = pow $N1, 2.0
	$N3 += $N2
	
	$N1 = bodies[i; vz] # vz
	$N2 = pow $N1, 2.0
	$N3 += $N2

	$N0 *= $N3
	
	e += $N0
	
	j = i + 1
beginfor_1:
	unless j < nbodies goto endfor_1
	.local float dx, dy, dz, distance

	# dx = b->x - b2->x;
	$N0 = bodies[i; x]
	$N1 = bodies[j; x]
	dx = $N0 - $N1

	# dy = b->y - b2->y;
	$N0 = bodies[i; y]
	$N1 = bodies[j; y]
	dy = $N0 - $N1

	# dz = b->z - b2->z;
	$N0 = bodies[i; z]
	$N1 = bodies[j; z]
	dz = $N0 - $N1

	# distance = sqrt(dx * dx + dy * dy + dz * dz);
	$N0 = dx * dx
	$N1 = dy * dy
	$N2 = dz * dz
	$N0 += $N1
	$N0 += $N2
	distance = sqrt $N0
	
	# e -= (b->mass * b2->mass) / distance;
	$N0 = bodies[i; m]
	$N1 = bodies[j; m]
	$N0 *= $N1
	$N0 /= distance
	e -= $N0
	
	inc j
	goto beginfor_1
endfor_1:

	inc i
	goto beginfor_0
endfor_0:
	.return(e)
.end

.sub advance
	.param int nbodies
	.param pmc bodies
	.param float dt
	.local int i, j
	.local float dx, dy, dz, distance, mag
	.local float bx, by, bz, bm, bvx, bvy, bvz
	.local float b2x, b2y, b2z, b2m
	.local pmc bi, bj
	i = 0
beginfor_0:
	unless i < nbodies goto endfor_0
	bi = bodies[i]
	bx = bi[x]
	by = bi[y]
	bz = bi[z]
	bm = bi[m]
	bvx = bi[vx]
	bvy = bi[vy]
	bvz = bi[vz]
	
	j = i + 1
	beginfor_1:
		unless j < nbodies goto endfor_1
		bj = bodies[j]
		b2x = bj[x]
		b2y = bj[y]
		b2z = bj[z]
		b2m = bj[m]

		# dx = b->x - b2->x;
		dx = bx - b2x
		# dy = b->y - b2->y;
		dy = by - b2y
		# dz = b->z - b2->z;
		dz = bz - b2z

		# distance = sqrt(dx * dx + dy * dy + dz * dz);
		$N0 = dx * dx
		$N1 = dy * dy
		$N0 += $N1
		$N1 = dz * dz
		$N0 += $N1
		distance = sqrt $N0

		# mag = dt / (distance * distance * distance);
		$N0 = distance * distance
		$N0 *= distance
		mag = dt / $N0

		# b->vx -= dx * b2->mass * mag;
		$N0 = dx * b2m
		$N0 *= mag
		bvx -= $N0

		# b->vy -= dy * b2->mass * mag;
		$N0 = dy * b2m
		$N0 *= mag
		bvy -= $N0

		# b->vz -= dz * b2->mass * mag;
		$N0 = dz * b2m
		$N0 *= mag
		bvz -= $N0

		# b2->vx += dx * b->mass * mag;
		$N0 = dx * bm
		$N0 *= mag
		$N1 = bj[vx]
		$N1 += $N0
		bj[vx] = $N1

		# b2->vy += dy * b->mass * mag;
		$N0 = dy * bm
		$N0 *= mag
		$N1 = bj[vy]
		$N1 += $N0
		bj[vy] = $N1

		# b2->vz += dz * b->mass * mag;
		$N0 = dz * bm
		$N0 *= mag
		$N1 = bj[vz]
		$N1 += $N0
		bj[vz] = $N1

		inc j
		goto beginfor_1
	endfor_1:
	bi[vx] = bvx
	bi[vy] = bvy
	bi[vz] = bvz

	inc i
	goto beginfor_0
endfor_0:

	i = 0
beginfor_2:
	unless i < nbodies goto endfor_2
	bi = bodies[i]
	# b->x += dt * b->vx;
	$N0 = bi[vx]
	$N1 = dt * $N0
	$N0 = bi[x]
	$N0 += $N1
	bi[x] = $N0

	# b->y += dt * b->vy;
	$N0 = bi[vy]
	$N1 = dt * $N0
	$N0 = bi[y]
	$N0 += $N1
	bi[y] = $N0

	# b->z += dt * b->vz;
	$N0 = bi[vz]
	$N1 = dt * $N0
	$N0 = bi[z]
	$N0 += $N1
	bi[z] = $N0

	inc i
	goto beginfor_2
endfor_2:
	
.end
