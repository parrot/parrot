$c{libs} = "-lm -lsocket -lcExt -lbsd";
$c{iv} = "long";
$c{nv} = "double";
$c{opcode_t}="long";
$c{ccflags} = "-I. -fno-strict-aliasing -mieee-fp -I./include";
$c{ldflags} = "-Zexe -Zmt";
$c{perl} = "perl"; # avoids case-mangling in make
