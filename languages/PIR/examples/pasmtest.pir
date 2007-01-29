.sub x
	.local string s
	s = "hello"
	load_bytecode s
	branch $I0
	.local int i
	bsr 1
	bsr $I0
	noop
	noop
	end 
.end

	
.sub x
	.local string s
	s = "hello"
	load_bytecode s
	branch $I0
	.local int i
	bsr 1
	bsr $I0
	noop
	noop
	end 
.end

	