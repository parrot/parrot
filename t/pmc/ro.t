#! perl
# Copyright (C) 2006 The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 17;

=head1 NAME

t/pmc/ro.t -- tests read-only value support

=head1 SYNOPSIS

	% prove t/pmc/ro.t

=head1 DESCRIPTION

Tests automatically generated read-only PMC support.

=cut

my $library = <<'CODE';
.sub make_readonly
    .param pmc arg
    .local pmc one
    one = new Integer
    one = 1
    setprop arg, '_ro', one
.end

.sub make_writable
    .param pmc arg
    .local pmc zero 
    zero = new Integer
    zero = 0
    setprop arg, '_ro', zero
.end
CODE

pir_output_unlike($library . <<'CODE', <<'OUTPUT', "Integer set read-only is not writable");
.sub main :main
    .local pmc foo

    foo = new Integer
    foo = 42

    make_readonly(foo)
    foo = 43
    print "NOT OKAY"
.end
CODE
/NOT OKAY/
OUTPUT

pir_output_is($library . <<'CODE', <<'OUTPUT', "Integer set read-only can be read");
.sub main :main
    .local pmc foo
    .local pmc tmp

    foo = new Integer
    foo = 42

    make_readonly(foo)
    print foo
    print "\n"
    $I0 = foo
    $S0 = foo
    print $I0
    print "\n"
    print $S0
    print "\n"
    
    tmp = new Integer
    add tmp, foo, foo
    print tmp
    print "\n"

    $P0 = foo
    n_add foo, foo, foo
    print foo
    print "\n"

    print $P0
    print "\n"
.end
CODE
42
42
42
84
84
42
OUTPUT
    
pir_output_unlike(<<"CODE", <<'OUTPUT', "PerlInteger");
$library
.sub main :main
    .local pmc foo

    foo = new PerlInteger
    foo = 42

    make_readonly(foo)
    foo = 43
    print "NOT OKAY"
.end
CODE
/NOT OKAY/
OUTPUT

pir_output_is($library . <<'CODE', <<'OUTPUT', "Integer stays Integer");
.sub main :main
    .local pmc foo
    
    foo = new Integer
    foo = 42

    make_readonly(foo)
    typeof $S0, foo
    print $S0
    print "\n"
.end
CODE
Integer
OUTPUT


pir_output_unlike($library . <<'CODE', <<'OUTPUT', "Integer add");
.sub main :main
    .local pmc foo

    foo = new Integer
    foo = 42

    make_readonly(foo)
    add foo, 16, foo
    print "NOT OKAY\n"
.end
CODE
/NOT OKAY/
OUTPUT

pir_output_unlike($library .<<'CODE', <<'OUTPUT', "Complex i_add");
.sub main :main
    .local pmc foo
    
    foo = new Complex
    foo[0] = 1.0
    foo[1] = 1.0
    make_readonly(foo)
    add foo, foo, 4
    print "NOT OKAY\n"
.end
CODE
/NOT OKAY/
OUTPUT

{
    # The ROTest dynpmc has opposite of normal logic for set/get integer
    # and 'reader' and 'writer' NCI methods.
    # The values are [should work with read-only, is todo test].
    my %tests = (
        # these first two tests would test overriding of the default
        # read-onlyness notion of vtable methods
        q{value = 42} => [1, 0],
        q{$I0 = value} => [0, 0],
        # these make sure NCI methods check does-write flags
        # 'writer' is marked as writing; 'reader' is not.
        q{$I0 = value.'reader'(42)} => [1, 0],
        q{$I0 = value.'writer'(42)} => [0, 0],
    );
    for my $test (keys %tests) {
        my $code = $library . <<"CODE";
.loadlib 'rotest'
.sub main :main
    .local int type
    .local pmc value
    type = find_type 'ROTest'
    value = new type
    #READONLYTEST
    $test
    print "reached end\\n"
.end
CODE
        {
            my ($readonly, $todo) = @{$tests{$test}};
            # first make sure it works without the make_readonly
            pir_output_is($code, "reached end\n", "ROTest (dry run) ($test)");
            local $TODO = $todo;
            $code =~ s/#READONLYTEST/make_readonly(value)/;
            if ($readonly) {
                pir_output_is($code, "reached end\n",
                    "ROTest (read-only/okay) ($test)");
            } else {
                pir_output_isnt($code, "reached end\n", 
                    "ROTest (read-only/fail) ($test)");
            }
        }
    }
}

pir_output_unlike($library . <<'CODE', <<'OUTPUT', "ResizablePMCArray (non-recursive part)");
.sub main :main
    .local pmc foo
    .local pmc three
    .local pmc four
    
    foo = new ResizablePMCArray
    three = new Integer
    three = 3
    four = new Integer
    four = 4

    foo = 3
    foo[0] = three
    foo[1] = three
    foo[2] = three
    make_readonly(foo)

    foo[0] = four
    print "NOT OKAY\n"
.end
CODE
/NOT OKAY/
OUTPUT

pir_output_unlike($library . <<'CODE', <<'OUTPUT', "Objects");
.sub main :main
    .local pmc fooclass
    .local pmc foo

    $P0 = new Integer
    $P0 = 1

    fooclass = newclass 'Foo'
    addattribute fooclass, 'bar'
    foo = new 'Foo' 
    setattribute foo, 'bar', $P0
    make_readonly(foo)
    inc $P0
    setattribute foo, 'bar', $P0
    print "NOT OKAY\n"
.end
CODE
/NOT OKAY/
OUTPUT


# XXX: should this work?
{local $TODO = 1;
pir_output_unlike($library . <<'CODE', <<'OUTPUT', "ResizablePMCArray -- Recursive");
.sub main :main
    .local pmc foo
    .local pmc three
    .local pmc tmp

    foo = new ResizablePMCArray
    three = new Integer
    three = 3

    foo = 1
    foo[0] = three

    print "before make_readonly\n"
    make_readonly(foo)
    print "after\n"

    # three = 4 # should fail -- is that what we want 
    tmp = foo[0]
    tmp = 4
    print "NOT OKAY\n"
    tmp = foo[0]
    print tmp
.end
CODE
/NOT OKAY/
OUTPUT
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
