CFLAGS := -std=c99 -pedantic -Wall -Wextra -Wpadded
MAKE += --no-print-directory

LIB_SOURCES := interp.c mob.c ops.c
BIN_SOURCES := main.c

SOURCES := $(LIB_SOURCES) $(BIN_SOURCES)
BINARIES := m0 m0-debug

.PHONY: all clean test

all: $(BINARIES)

clean:
	$(RM) $(BINARIES)

test:
	@$(MAKE) -C ../../.. m0_c_tests

m0: CFLAGS += -O3 -g
m0-debug: CFlAGS += -O0 -g

m0 m0-debug: m0.h $(SOURCES)
	$(CC) $(CFLAGS) -o $@ $(SOURCES)

include tags.mk
