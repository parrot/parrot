main:	print		"test 1\n"
	branch		$ok
$ng:	print		"ng 1\n"
	branch		test2
$ok:	print		"ok 1\n"

test2:	print		"test 2\n"
	branch		$ok
$ng:	print		"ng 2\n"
	branch		done
$ok:	print		"ok 2\n"

done:	end
	

