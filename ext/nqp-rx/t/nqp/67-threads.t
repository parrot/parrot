#!./parrot-nqp

# Copyright (C) 2012, Parrot Foundation.

plan(4);

my $x := "ok 3 - sub sucessfully called from Task";
my $sub := sub foo() {
    say($x);
}

say("# Task ...");
my $task := pir::new__PSP('Task', $sub);

say("ok 1 - created a Task PMC from nqp");

pir::schedule__0P($task);
say("ok 2 - scheduled a task");
pir::wait__0P($task);

say("ok 4 - wait on a task");

# Local Variables:
#   mode: nqp
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
