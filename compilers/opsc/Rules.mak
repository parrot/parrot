$(LIBRARY_DIR)/opsc.pbc: $(NQP_RX) $(OPSC_SOURCES) $(NQPRX_LIB_SETTING)
	$(PARROT) -o $(LIBRARY_DIR)/opsc.pbc $(OPSC_DIR)/opsc.pir

$(OPSC_DIR)/gen/Ops/Compiler.pir: $(OPSC_DIR)/src/Ops/Compiler.pm $(NQP_RX)
	$(NQP_RX) --target=pir --output=$@  $(OPSC_DIR)/src/Ops/Compiler.pm

$(OPSC_DIR)/gen/Ops/Compiler/Actions.pir: $(OPSC_DIR)/src/Ops/Compiler/Actions.pm $(NQP_RX)
	$(NQP_RX) --target=pir --output=$@ $(OPSC_DIR)/src/Ops/Compiler/Actions.pm

$(OPSC_DIR)/gen/Ops/Compiler/Grammar.pir: $(OPSC_DIR)/src/Ops/Compiler/Grammar.pm $(NQP_RX)
	$(NQP_RX) --target=pir --output=$@ $(OPSC_DIR)/src/Ops/Compiler/Grammar.pm

$(OPSC_DIR)/gen/Ops/Emitter.pir: $(OPSC_DIR)/src/Ops/Emitter.pm $(NQP_RX)
	$(NQP_RX) --target=pir --output=$@ $(OPSC_DIR)/src/Ops/Emitter.pm

$(OPSC_DIR)/gen/Ops/File.pir: $(OPSC_DIR)/src/Ops/File.pm $(NQP_RX)
	$(NQP_RX) --target=pir --output=$@ $(OPSC_DIR)/src/Ops/File.pm

$(OPSC_DIR)/gen/Ops/Op.pir: $(OPSC_DIR)/src/Ops/Op.pm $(NQP_RX)
	$(NQP_RX) --target=pir --output=$@ $(OPSC_DIR)/src/Ops/Op.pm

$(OPSC_DIR)/gen/Ops/OpLib.pir: $(OPSC_DIR)/src/Ops/OpLib.pm $(NQP_RX)
	$(NQP_RX) --target=pir --output=$@  $(OPSC_DIR)/src/Ops/OpLib.pm

$(OPSC_DIR)/gen/Ops/Trans.pir: $(OPSC_DIR)/src/Ops/Trans.pm $(NQP_RX)
	$(NQP_RX) --target=pir --output=$@ $(OPSC_DIR)/src/Ops/Trans.pm

$(OPSC_DIR)/gen/Ops/Trans/C.pir: $(OPSC_DIR)/src/Ops/Trans/C.pm $(NQP_RX)
	$(NQP_RX) --target=pir --output=$@ $(OPSC_DIR)/src/Ops/Trans/C.pm

# Target to force rebuild opsc from main Makefile
$(OPSC_DIR)/ops2c.nqp: $(LIBRARY_DIR)/opsc.pbc

$(OPS2C): $(OPSC_DIR)/ops2c.nqp $(LIBRARY_DIR)/opsc.pbc $(NQP_RX) $(PBC_TO_EXE)
	$(NQP_RX) --target=pir $(OPSC_DIR)/ops2c.nqp >ops2c.pir
	$(PARROT) -o ops2c.pbc ops2c.pir
	$(PBC_TO_EXE) ops2c.pbc

$(INSTALLABLEOPS2C): $(OPS2C) src/install_config$(O)
	$(PBC_TO_EXE) ops2c.pbc --install

opsc: $(LIBRARY_DIR)/opsc.pbc

# Local variables:
#   mode: makefile
# End:
# vim: ft=make:
