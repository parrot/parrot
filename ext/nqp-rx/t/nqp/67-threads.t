#!./parrot-nqp

# Copyright (C) 2012, Parrot Foundation.

plan(3);

my $x := "ok 2 - sub sucessfully called from Task";
my $sub := sub foo() {
    say($x);
}

say("# Task ...");
my $task := pir::new__PSP('Task', $sub);

say("ok 1 - created a Task PMC from nqp");

pir::schedule__0P($task);
pir::wait__0P($task);

say("ok 3 - wait on a task");

# Local Variables:
#   mode: nqp
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
