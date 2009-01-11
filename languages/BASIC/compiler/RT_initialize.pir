# $Id$

.const int TYPE = 0
.const int VALUE = 1
.sub _main :main
	$P0 = new 'Hash'
	set_global "BASICARR", $P0
	$P0 = new 'ResizablePMCArray'
	set_global "READDATA", $P0
	$P0 = new 'Hash'
	set_global "RESTOREINFO", $P0
	$P0=new 'Hash'
	$P0["value"]=0
	set_global "READPOINTER", $P0
	$P0=new 'Hash'
	$P0["value"]=20021107
	set_global "RANDSEED", $P0
	$P0=new 'Hash'
	$P0["value"]=0
	set_global "PRINTCOL", $P0
	$P0=new 'Hash'
	set_global "DEBUGGER", $P0
	$P0=new 'Hash'
	set_global "COMMON", $P0
	$P0=new 'ResizablePMCArray'
	fdopen $P1, 0, "r"	# STDIN and friends...
        $P1 = getstdin
	$P0[0]=$P1
        $P1 = getstdout
	#Don't buffer stdout...
        $I0 = pioctl $P1, 3, 0
	$P0[1]=$P1
        $P1 = getstderr
	$P0[2]=$P1
	set_global "FDS", $P0

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
