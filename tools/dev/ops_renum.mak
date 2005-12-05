# make -f tools/dev/ops_renum.mak
# renumbers ops/ops.num according to natural order
#
GEN_OPSFILES =
OPS_FILES = ops/core.ops ops/bit.ops ops/cmp.ops ops/debug.ops ops/dotgnu.ops  ops/io.ops ops/math.ops ops/object.ops ops/pic.ops ops/pmc.ops ops/python.ops ops/set.ops ops/stack.ops ops/string.ops ops/sys.ops ops/var.ops $(GEN_OPSFILES)

all:
	perl tools/build/ops2pm.pl --renum $(OPS_FILES)

