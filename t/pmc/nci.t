use Parrot::Test tests => 1;

TODO: {
    local $TODO="t/pmc/nci doesn't work on Windows" if $^O =~ /Win32/;
    $TODO=$TODO;  #warnings

output_is(<<'CODE', <<'OUTPUT', "nic_d_d");
  loadlib P1, "libm.so"
  print "loaded\n"
  dlfunc P0, P1, "sqrt", "dd"
  print "dlfunced\n"
  set I0, 1	# prototype used - unchecked
  set I1, 0	# items on stack - unchecked
  set N5, 4.0
  invoke
  ne N5, 2.0, nok_1
  print "ok 1\n"
  ne I0, 0, nok_2	# test return value convention
  ne I1, 0, nok_2
  ne I2, 0, nok_2
  ne I3, 0, nok_2
  ne I4, 1, nok_2
  print "ok 2\n"
  end
nok_1: print "nok 1\n"
  print N5
  print "\n"
  end
nok_2: print "nok 2\n"
  end
CODE
loaded
dlfunced
ok 1
ok 2
OUTPUT


} # TODO

