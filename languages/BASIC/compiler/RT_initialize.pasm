.const int TYPE = 0
.const int VALUE = 1
.local string JUMPLABEL
.sub _main
	$P0 = new PerlHash 
	store_global "BASICARR", $P0
	$P0 = new PerlArray
	store_global "READDATA", $P0
	$P0 = new PerlHash
	store_global "RESTOREINFO", $P0
	$P0=new PerlHash
	$P0["value"]=0
	store_global "READPOINTER", $P0
	$P0=new PerlHash
	$P0["value"]=20021107
	store_global "RANDSEED", $P0
	$P0=new PerlHash
	$P0["value"]=0
	store_global "PRINTCOL", $P0
	$P0=new PerlHash
	store_global "DEBUGGER", $P0

	JUMPLABEL = ""

	call _data_run
	call _platform_setup
	call _basicmain_run
	end

.end	        
