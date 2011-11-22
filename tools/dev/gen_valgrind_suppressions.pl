#! perl

# Copyright (C) 2009, Parrot Foundation.

use strict;
use warnings;
use IO::File;

# This is written with unix-like systems very much in mind.  Feel free to
# update this if/when valgrind is ported to other platforms.
die "Must be run in (built) parrot source directory.\n" unless -f 'parrot';

# create t/op/say_1.pir if necessary
`prove t/op/say.t` unless -f 't/op/say_1.pir';

my $pipe = IO::File->new( "valgrind --suppressions=tools/dev/parrot.supp"
                         ." --freelist-vol=1000000000 --num-callers=500"
                         ." --leak-check=full --leak-resolution=high"
                         ." --show-reachable=yes ./parrot --leak-test"
                         ." t/op/say_1.pir 2>&1 |" );

# simple state machine.
my ($line, $type);
while(defined($line = $pipe->getline)) {
    chomp($line);
    if($line =~ /^==(\d+)== (.+)$/) {
        my ($pid, $message) = ($1, $2);
        if($message eq 'Conditional jump or move depends on uninitialised value(s)') {
            $type = 'Cond';
        }
        if($message eq 'Use of uninitialised value of size 8') {
            $type = 'Value8';
        }
        if($message eq 'Use of uninitialised value of size 4') {
            $type = 'Value4';
        }
        elsif($message =~ /   at (0x[0-9A-F]+): (\S+) \((.+)\)$/) {
            my ($offset, $symbol, $object) = ($1, $2, $3);
            if($object =~ m|in /lib[^/]*/ld-.+\.so$|) {
                # suppress GNU ld error.
                my $supp_name = lc("gnuld-$symbol-$type");
                $supp_name =~ s/[-_]+/-/g;
                emit($supp_name, $symbol, "Memcheck:$type", '/lib*/ld-*.so');
            }
        }
    }
}

my %already_emitted;
sub emit {
    my ($name, $symbol, $type, $object) = @_;
    return if exists($already_emitted{$name});
    print("{\n");
    print("   $name\n");
    print("   $type\n");
    print("   fun:$symbol\n");
    print("   obj:$object\n");
    print("}\n");
    $already_emitted{$name} = 1;
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
