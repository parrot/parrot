#!./parrot nqp.pbc

plan(3);

class Foo {
    method foo() { 1 };

    method uno() {
        self.foo();
    };
    
    method des() {
        if 1 {
            self.foo();
        }
    };
    
    method tres($a) {
        if 1 {
            self.foo();
        }
    };
};

ok(Foo.new.uno, "Can access self within method");
ok(Foo.new.des, "Can access self within sub-block");
ok(Foo.new.tres(42), "Can access self within method with signature");

