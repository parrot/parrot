CFLAGS := -std=c99 -pedantic -Wall -Wextra

all: m0 m0-debug

m0 : m0.h interp.c mob.c ops.c
	$(CC) $(CFLAGS) -O3 -g -o m0 mob.c interp.c ops.c

m0-debug : m0.h interp.c mob.c ops.c
	$(CC) $(CFLAGS) -O0 -g -o m0-debug mob.c interp.c ops.c

clean:
	rm -f *.o m0 m0-debug

include tags.mk
