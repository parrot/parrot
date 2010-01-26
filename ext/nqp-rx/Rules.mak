## XXX does not cover .includes of core .pasm files

$(LIBRARY_DIR)/Regex.pbc: ext/nqp-rx/src/stage0/Regex-s0.pir $(PARROT)
	$(PARROT) -o $@ ext/nqp-rx/src/stage0/Regex-s0.pir

$(LIBRARY_DIR)/HLL.pbc: ext/nqp-rx/src/stage0/HLL-s0.pir $(PARROT)
	$(PARROT) -o $@ ext/nqp-rx/src/stage0/HLL-s0.pir

$(LIBRARY_DIR)/P6Regex.pbc: ext/nqp-rx/src/stage0/P6Regex-s0.pir $(PARROT)
	$(PARROT) -o $@ ext/nqp-rx/src/stage0/P6Regex-s0.pir

$(LIBRARY_DIR)/nqp-rx.pbc: ext/nqp-rx/src/stage0/NQP-s0.pir $(PARROT)
	$(PARROT) -o $@ ext/nqp-rx/src/stage0/NQP-s0.pir

## TT #1398 - pbc_to_exe cannot generate a specified target file
parrot-nqp.pbc : $(LIBRARY_DIR)/nqp-rx.pbc
	$(CP) $(LIBRARY_DIR)/nqp-rx.pbc $@

$(NQP_RX) : $(NQPRX_LIB_PBCS) $(PBC_TO_EXE) parrot-nqp.pbc
	$(PBC_TO_EXE) parrot-nqp.pbc

$(INSTALLABLENQP) : $(NQPRX_LIB_PBCS) src/install_config$(O) $(PBC_TO_EXE) parrot-nqp.pbc
	$(PBC_TO_EXE) parrot-nqp.pbc --install
