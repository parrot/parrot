# net2pbc
# Turns a .NET EXE or DLL file into Parrot bytecode.

.sub main :main
    .param pmc argv
	.local string program_name, filename, output, temp
	.local int pir_only, force, trace, quiet, standalone, elems
	.local string gen_pir, summary
	.local pmc pir_comp, pbc_out, fh, ops_lib

	# Parse command line.
	pir_only = 0
    force = 0
    standalone = 0
    trace = 0
	program_name = shift argv
GETARGS:
    elems = elements argv
	if elems == 0 goto ERRORARG
	temp = shift argv
	if temp == "-o" goto OUTPUTARG
	if temp == "-p" goto PIRARG
    if temp == "-f" goto FORCEARG
    if temp == "-t" goto TRACEARG
    if temp == "-tD" goto TRACEDETAILARG
    if temp == "-q" goto QUIETARG
    if temp == "-s" goto STANDALONEARG
	if temp == "" goto ERRORARG
	if filename != "" goto ERRORARG
	filename = temp
	goto GOTARGS
OUTPUTARG:
	output = shift argv
	goto GETARGS
PIRARG:
	pir_only = 1
	goto GETARGS
FORCEARG:
	force = 1
	goto GETARGS
TRACEARG:
	trace = 1
	goto GETARGS
TRACEDETAILARG:
    trace = 2
	goto GETARGS
QUIETARG:
    quiet = 1
	goto GETARGS
STANDALONEARG:
    standalone = 1
	goto GETARGS
ERRORARG:
	print "Usage: parrot net2pbc.pbc [-p] [-o output.pbc] input.exe\n"
	end
GOTARGS:
	
	# Hand over to the translator.
	(gen_pir, summary) = dotnet_to_pir(filename, force, standalone, trace)

    # Print translation summary.
    if quiet == 1 goto QUIET
    printerr summary
QUIET:

	# Dump PIR if that's all that's needed.
	if pir_only == 0 goto MAKEPBC
	print gen_pir
	end

MAKEPBC:
	if output != "" goto COMPILE
	output = filename
	output = concat ".pbc"
COMPILE:
	loadlib ops_lib, "dotnet_ops"
	pir_comp = compreg "PIR"
	pbc_out = pir_comp(gen_pir)
	fh = open output
	print fh, pbc_out
	close fh
	end
.end 

