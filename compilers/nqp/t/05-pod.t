#!./parrot nqp.pbc

# check pod

say('1..4');

say("ok 1");

=head1 POD comment

This next line should not be executed because it is inside
of a valid pod statement.

print("not ");

=cut

say("ok 2 # POD comments end");

=for comment

say("ok 3 # = for terminated by a new line");

=for comment
print("not ");

say("ok 4 # actually comment out something");
