# use gcc/as to generate some files
# this file is not intended to be run during normal config
# but only by developers that change the source


all: memcpy_files

memcpy_files: memcpy_mmx.c memcpy_sse.c

memcpy_mmx.c: memcpy_mmx_in.c ../../../../tools/dev/as2c.pl
	perl ../../../../tools/dev/as2c.pl memcpy_mmx_in > $@
	rm -f memcpy_mmx_in.s memcpy_mmx_in.o

memcpy_sse.c: memcpy_sse_in.c ../../../../tools/dev/as2c.pl
	perl ../../../../tools/dev/as2c.pl memcpy_sse_in > $@
	rm -f memcpy_sse_in.s memcpy_sse_in.o

