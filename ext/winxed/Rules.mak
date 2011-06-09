# Build winxed snapshot.

$(WINXED_LANG): ext/winxed/compiler.pir $(PARROT)
	$(MKPATH) runtime/parrot/languages/winxed
	$(PARROT) -o $@ ext/winxed/compiler.pir

winxed.pbc: ext/winxed/driver.pir $(PARROT)
	$(PARROT) -o $@ ext/winxed/driver.pir

$(WINXED) : winxed.pbc $(PBC_TO_EXE)
	$(PBC_TO_EXE) winxed.pbc

$(INSTALLABLEWINXED) : winxed.pbc src/install_config$(O) $(PBC_TO_EXE)
	$(PBC_TO_EXE) winxed.pbc --install
