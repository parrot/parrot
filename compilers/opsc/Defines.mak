OPSC_DIR = compilers/opsc

OPSC_SOURCES_GENERATED = \
	$(OPSC_DIR)/gen/Ops/Compiler.pir \
	$(OPSC_DIR)/gen/Ops/Compiler/Actions.pir \
	$(OPSC_DIR)/gen/Ops/Compiler/Grammar.pir \
	$(OPSC_DIR)/gen/Ops/Compiler/Preprocessor.pir \
	$(OPSC_DIR)/gen/Ops/Compiler/Structs.pir \
	$(OPSC_DIR)/gen/Ops/Emitter.pir \
	$(OPSC_DIR)/gen/Ops/Trans.pir \
	$(OPSC_DIR)/gen/Ops/Trans/C.pir \
	$(OPSC_DIR)/gen/Ops/Trans/JIT.pir \
	$(OPSC_DIR)/gen/Ops/Op.pir \
	$(OPSC_DIR)/gen/Ops/OpLib.pir \
	$(OPSC_DIR)/gen/Ops/File.pir \
	$(OPSC_DIR)/gen/Ops/Renumberer.pir \
	$(OPSC_DIR)/gen/Ops/Util.pir \
	$(OPSC_DIR)/gen/Ops/JIT.pir

OPSC_SOURCES = \
	$(OPSC_DIR)/opsc.pir \
	$(OPSC_DIR)/src/builtins.pir \
	$(OPSC_SOURCES_GENERATED)

OPSC_CLEANUPS = \
	$(OPSC_DIR)/opsc.pbc \
	$(LIBRARY_DIR)/opsc.pbc \
	$(OPSC_SOURCES_GENERATED)

