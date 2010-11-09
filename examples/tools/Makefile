#
# Copyright (C) 2009, Parrot Foundation.
#
# Makefile for pbc_checker

CXX= g++
CXXFLAGS = -Wall -Wextra
LD = g++

pbc_checker: pbc_checker.o
	$(LD) -o pbc_checker pbc_checker.o

pbc_checker.o: pbc_checker.cpp
	$(CXX) $(CXXFLAGS) -c pbc_checker.cpp

clean:
	rm -f pbc_checker
	rm -f *.o

# End
