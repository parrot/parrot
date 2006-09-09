# $Id$

PERL = /usr/bin/perl

# default
all:

# This is a listing of all targets, that are meant to be called by users
help:
	@echo ""
	@echo "Following targets are available for the user:"
	@echo ""
	@echo "Building:"
	@echo "  all:               Nothing to do yet."
	@echo "                     This is the default."
	@echo ""
	@echo "Testing:"
	@echo "  test:              Run the test suite."
	@echo "  test-php:          Run the test suite."
	@echo "  test-phc-to-past:  Run the test suite."
	@echo ""
	@echo "Cleaning:"
	@echo "  clean:             makes clean-test."
	@echo "  distclean:         makes clean-test."
	@echo "  clean-test:        Clean up temporary files from testing."
	@echo ""
	@echo "Misc:"
	@echo "  help:              Print this help message."
	@echo ""

test: test-php test-phc-to-past

test-php: 
	- pwd ; cd .. && $(PERL) -I../lib -I plumhead/lib plumhead/t/harness --with-php

test-phc-to-past:
	- pwd ; cd .. && $(PERL) -I../lib -I plumhead/lib plumhead/t/harness --with-phc-to-past

# For smoke testing build only the Implementation in Python
build: 

clean: clean-test

clean-test: 
	$(RM_F) \
    "t/*.php" "t/*.pir" "t/*.out"

realclean: clean
	$(RM_F) \
    Makefile

distclean: realclean
