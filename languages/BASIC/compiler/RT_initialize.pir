# $Id$

.const int TYPE = 0
.const int VALUE = 1
.sub _main :main
	$P0 = new .Hash
	store_global "BASICARR", $P0
	$P0 = new .ResizablePMCArray
	store_global "READDATA", $P0
	$P0 = new .Hash
	store_global "RESTOREINFO", $P0
	$P0=new .Hash
	$P0["value"]=0
	store_global "READPOINTER", $P0
	$P0=new .Hash
	$P0["value"]=20021107
	store_global "RANDSEED", $P0
	$P0=new .Hash
	$P0["value"]=0
	store_global "PRINTCOL", $P0
	$P0=new .Hash
	store_global "DEBUGGER", $P0
	$P0=new .Hash
	store_global "COMMON", $P0
	$P0=new .ResizablePMCArray
	fdopen $P1, 0, "r"	# STDIN and friends...
        $P1 = getstdin
	$P0[0]=$P1
        $P1 = getstdout
	#Don't buffer stdout...
        $I0 = pioctl $P1, 3, 0
	$P0[1]=$P1
        $P1 = getstderr
	$P0[2]=$P1
	store_global "FDS", $P0

	_data()
	_platform_setup()
	_basicmain()
	_platform_shutdown()
	end
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
