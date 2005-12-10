# make -f tools/dev/ops_renum.mak
# renumbers ops/ops.num according to natural order

# directory for ops files
OPS_DIR = "src/ops"

GEN_OPSFILES =

OPS_FILES = \
	$(OPS_DIR)/core.ops \
	$(OPS_DIR)/bit.ops \
	$(OPS_DIR)/cmp.ops \
	$(OPS_DIR)/debug.ops \
	$(OPS_DIR)/dotgnu.ops \
	$(OPS_DIR)/io.ops \
	$(OPS_DIR)/math.ops \
	$(OPS_DIR)/object.ops \
	$(OPS_DIR)/pic.ops \
	$(OPS_DIR)/pmc.ops \
	$(OPS_DIR)/python.ops \
	$(OPS_DIR)/set.ops \
	$(OPS_DIR)/stack.ops \
	$(OPS_DIR)/string.ops \
	$(OPS_DIR)/sys.ops \
	$(OPS_DIR)/var.ops \
	$(GEN_OPSFILES)

all:
	perl tools/build/ops2pm.pl --renum $(OPS_FILES)

