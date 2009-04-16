#!./parrot nqp.pbc

# method ops (just method calls for now)

plan(3);

class Foo {
  method blarg() {
    'ok 1 # method calls work';
  }
  method blargless() {
    'ok 3 # argument-less method calls work'
  }
}

class Bar {
  method blarg() {
    'not ok 1';
  }
}

sub blarg() {
  'ok 2 # regular subs aren\'t confused with methods';
}

my $foo := Foo.new();

say($foo.blarg());
say(blarg());
say($foo.blargless);
