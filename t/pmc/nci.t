use Parrot::Test tests => 2;

TODO: {
    local $TODO="t/pmc/nci doesn't work on Windows" if $^O =~ /Win32/;
    $TODO=$TODO;  #warnings

output_is(<<'CODE', <<'OUTPUT', "nic_d_d");
  loadlib P1, "libm.so"
  print "loaded\n"
  dlfunc P0, P1, "sqrt", "dd"
  print "dlfunced\n"
  set N5, 4.0
  invoke
  ne N5, 2.0, nok_1
  print "ok 1\n"
  end
nok_1: print "nok 1\n"
  print N5
  print "\n"
  end

CODE
loaded
dlfunced
ok 1
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "nic_i_d");
  loadlib P1, "libm.so"
  print "loaded\n"
  dlfunc P0, P1, "lrint", "id"
  print "dlfunced\n"
  set N5, 4.1
  invoke
  ne I5, 4, nok_1
  print "ok 1\n"
  end
nok_1: print "nok 1\n"
  print I5
  print "\n"
  end

CODE
loaded
dlfunced
ok 1
OUTPUT

} # TODO

