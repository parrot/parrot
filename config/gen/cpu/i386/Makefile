# use gcc/as to generate some files
# this file is not intended to be run during normal config
# but only by developers that change the source

.PHONY: memcpy_files

all: memcpy_files

memcpy_files: memcpy_mmx.c

memcpy_mmx.c: memcpy_mmx_in.c
	perl ../../../../tools/dev/as2c.pl memcpy_mmx_in > $@
	rm -f memcpy_mmx_in.s memcpy_mmx_in.o
