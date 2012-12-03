#!./parrot-nqp

# Copyright (C) 2012, Parrot Foundation.

Q:PIR {
        # We want Test::More features for testing. Not NQP's builtin.
        .include "test_more.pir"
        load_bytecode "dumper.pbc"
};

plan(2);

my $x := 5;

my $sub := sub foo() {
    $x++;
    ok(1, 'sub sucessfully called from Task');
}

my $task := pir::new__PSP('Task', $sub);

ok(1, 'created a Task PMC from nqp');

pir::schedule__0P($task);
ok(1, 'scheduled a task');
pir::wait__0P($task);

ok(1,'wait on a task');

# Local Variables:
#   mode: nqp
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
