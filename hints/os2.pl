# This hints file is very specific to a particular os/2 configuration.
# A more general one would be appreciated, should anyone actually be
# using OS/2
$c{libs} = "-lm -lsocket -lcExt -lbsd";
$c{iv} = "long";
$c{nv} = "double";
$c{opcode_t}="long";
$c{ccflags} = "-I. -fno-strict-aliasing -mieee-fp -I./include";
$c{ldflags} = "-Zexe";
$c{perl} = "perl"; # avoids case-mangling in make
