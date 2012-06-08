CFLAGS := -std=c99 -pedantic -Wall -Wextra -Wpadded
MAKE += --no-print-directory

HEADERS := m0.h murmur3.h
LIB_SOURCES := interp.c mob.c ops.c map.c string.c
BIN_SOURCES := main.c

SOURCES := $(LIB_SOURCES) $(BIN_SOURCES)
BINARIES := m0 m0-debug

.PHONY: all clean test

all: $(BINARIES)

clean:
	$(RM) $(BINARIES) $(SOURCES:%.c=%-dbg.o)

test:
	@$(MAKE) -C ../../.. m0_c_tests

m0: CFLAGS += -O3 -g
m0: $(HEADERS) $(SOURCES)
	$(CC) $(CFLAGS) -o $@ $(SOURCES)

m0-debug: CFlAGS += -O0 -g
m0-debug: $(SOURCES:%.c=%-dbg.o)
	$(CC) -o $@ $^

string.o: murmur3.h

$(SOURCES:%.c=%-dbg.o): %-dbg.o : %.c
	$(CC) $(CFLAGS) -c -o $@ $<

include tags.mk
