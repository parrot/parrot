#!./parrot-nqp

class ABC {
    method () is pirflags<:vtable('get_number')> { 123.0 }
    method () is pirflags<:vtable('get_string')> { 'abc' }
}

plan(2);

my $abc := ABC.new;
ok($abc == 123,   "get_number vtable works");
ok($abc eq 'abc', "get_string vtable works");


