#!./parrot -j
#
# spectralnorm.pir N         (N = 100 for shootout)
# by Michal Jurosz

.sub eval_A
	.param int i
	.param int j

	# return 1.0/((i+j)*(i+j+1)/2+i+1);
	$N0 = i + j
	$N1 = $N0 + 1
	$N0 *= $N1
	$N0 /= 2
	$N0 += i
	$N0 += 1
	$N0 = 1 / $N0
	.return ($N0)
.end


.sub eval_A_times_u
	.param int N
	.param pmc u
	.param pmc Au

	.local int i, j

	i = 0
beginfor_i:
	unless i < N goto endfor_i
		Au[i] = 0
		j = 0
	beginfor_j:
		unless j < N goto endfor_j
			# Au[i]+=eval_A(i,j)*u[j]
			$N0 = eval_A(i,j)
			$N1 = u[j]
			$N0 *= $N1
			$N1 = Au[i]
			$N0 += $N1
			Au[i] = $N0

		inc j
		goto beginfor_j
	endfor_j:

	inc i
	goto beginfor_i
endfor_i:
.end


.sub eval_At_times_u
	.param int N
	.param pmc u
	.param pmc Au

	.local int i, j

	i = 0
beginfor_i:
	unless i < N goto endfor_i
		Au[i] = 0
		j = 0
	beginfor_j:
		unless j < N goto endfor_j
			# Au[i]+=eval_A(j,i)*u[j]
			$N0 = eval_A(j,i)
			$N1 = u[j]
			$N0 *= $N1
			$N1 = Au[i]
			$N0 += $N1
			Au[i] = $N0

		inc j
		goto beginfor_j
	endfor_j:

	inc i
	goto beginfor_i
endfor_i:
.end	


.sub eval_AtA_times_u
	.param int N
	.param pmc u
	.param pmc AtAu

	.local pmc v
	v = new .FixedFloatArray
	v = N

	eval_A_times_u(N,u,v)
	eval_At_times_u(N,v,AtAu)
.end


.sub main :main
	.param pmc argv
	$S0 = argv[1]
	.local int N
	N = $S0

	.local pmc u, v
	u = new .FixedFloatArray
	u = N
	v = new .FixedFloatArray
	v = N

	.local int i

	i = 0
beginfor_init:
	unless i < N goto endfor_init
		u[i] = 1
	inc i
	goto beginfor_init
endfor_init:


	i = 0
beginfor_eval:
	unless i < 10 goto endfor_eval
	    eval_AtA_times_u(N,u,v)
	    eval_AtA_times_u(N,v,u)
	inc i
	goto beginfor_eval
endfor_eval:

	.local float vBv, vv
  	vBv = 0.0
  	vv = 0.0

	i = 0
beginfor_calc:
	unless i < N goto endfor_calc
		# vBv+=u[i]*v[i]; vv+=v[i]*v[i];
		$N0 = u[i]
		$N1 = v[i]
		$N0 *= $N1
		vBv += $N0
		$N0 = $N1
		$N0 *= $N0
		vv += $N0
	inc i
	goto beginfor_calc
endfor_calc:
  	
	# print "%0.9f" % (sqrt(vBv/vv))
	$N0 = vBv / vv
	$N0 = sqrt $N0
	.local pmc spf
	spf = new .FixedFloatArray
	spf = 1
	spf[0] = $N0
	$S0 = sprintf "%.9f\n", spf
	print $S0
	exit 0
.end
