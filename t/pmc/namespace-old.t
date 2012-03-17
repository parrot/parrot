#! perl
# Copyright (C) 2001-2009, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 32;
use Parrot::Config;

=head1 NAME

t/pmc/namespace.t - test the NameSpace PMC as described in PDD 21.

=head1 SYNOPSIS

    % prove t/pmc/namespace-old.t

=head1 DESCRIPTION

Test the NameSpace PMC as described in PDD21.

=cut

my $temp_a = "temp_a";
my $temp_b = "temp_b";

END {
    unlink( "$temp_a.pir", "$temp_a.pbc", "$temp_b.pir", "$temp_b.pbc" );
}

pir_output_is( <<'CODE', <<'OUTPUT', "HLL and vars" );
# initial storage of _tcl global variable...

.HLL '_Tcl'

.sub huh
  $P0 = new ['Integer']
  $P0 = 3.14
  set_global '$variable', $P0
.end

# start running HLL language
.HLL 'Tcl'

.sub foo :main
  huh()
  $P1 = get_root_namespace ['_tcl']
  $P2 = $P1['$variable']
  print $P2
  print "\n"
.end
CODE
3.14
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "HLL and namespace directives" );
.HLL '_Tcl'
.namespace ['Foo'; 'Bar']

.HLL 'Tcl'

.sub main :main
  $P0 = get_namespace
  $P1 = $P0.'get_name'()
  $S0 = join "::", $P1
  print $S0
  print "\n"
  end
.end
CODE
tcl
OUTPUT

SKIP:
{
    skip( "immediate test, doesn't with --run-pbc", 1 )
        if ( exists $ENV{TEST_PROG_ARGS} and $ENV{TEST_PROG_ARGS} =~ m/--run-pbc/ );

    pir_output_is( <<'CODE', <<'OUTPUT', "get_global in current" );
.HLL 'bork'
.namespace []

.sub a :immediate
  $P1 = new ['String']
  $P1 = "ok\n"
  set_global ['sub_namespace'], "eek", $P1
.end

.namespace [ 'sub_namespace' ]

.sub whee :main
 $P1 = get_global 'eek'
 print $P1
.end
CODE
ok
OUTPUT
}

pir_output_is( <<'CODE', <<'OUTPUT', "get_parent" );
.sub main :main
    .local pmc ns
    ns = get_hll_namespace ['Foo']
    ns = ns.'get_parent'()
    print ns
    print "\n"
.end
.namespace ['Foo']
.sub dummy
.end
CODE
parrot
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "get_global [''], \"print_ok\"" );
.namespace ['']

.sub print_ok
  print "ok\n"
  .return()
.end

.namespace ['foo']

.sub main :main
  $P0 = get_hll_global [''], 'print_ok'
  $P0()
  end
.end
CODE
ok
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "get_global with array ('')" );
.namespace ['']

.sub print_ok
  print "ok\n"
  .return()
.end

.namespace ['foo']

.sub main :main
  $P0 = new ['ResizableStringArray']
  $P0[0] = ''
  $P0 = get_hll_global $P0, 'print_ok'
  $P0()
  end
.end
CODE
ok
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "get_global with empty array" );
.namespace []

.sub print_ok
  print "ok\n"
  .return()
.end

.namespace ['foo']

.sub main :main
  $P0 = new ['ResizablePMCArray']
  $P0 = 0
  $P0 = get_hll_global $P0, 'print_ok'
  $P0()
  end
.end
CODE
ok
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Namespace.get_global() with array ('')" );
.namespace ['']

.sub print_ok
  print "ok\n"
  .return()
.end

.namespace ['foo']

.sub main :main
  $P1 = new ['ResizableStringArray']
  $P1[0] = ''
  $P1 = get_hll_global $P1, 'print_ok'
  $P1()
  end
.end
CODE
ok
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Namespace introspection" );
.sub main :main
    .local pmc f
    f = get_hll_global ['Foo'], 'dummy'
    f()
.end
.namespace ['Foo']
.sub dummy
    .local pmc interp, ns_caller
    interp = getinterp
    ns_caller = interp['namespace'; 1]
    print ns_caller
    print "\n"
.end
CODE
parrot
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Nested namespace introspection" );
.sub main :main
    .local string no_symbol

    .local pmc foo_ns
    foo_ns = get_hll_namespace [ 'Foo' ]
    $S0    = foo_ns
    print "Found namespace: "
    print $S0
    print "\n"

    .local pmc bar_ns
    bar_ns = foo_ns.'find_namespace'( 'Bar' )
    $S0    = bar_ns
    print "Found nested namespace: "
    print $S0
    print "\n"

    .local pmc baz_ns
    baz_ns    = bar_ns.'find_namespace'( 'Baz' )
    no_symbol = 'Baz'

    .local int is_defined
    is_defined = defined baz_ns
    if is_defined goto oops
    goto find_symbols

  oops:
    print "Found non-null '"
    print no_symbol
    print "'\n"
    .return()

  find_symbols:
    .local pmc a_sub
    a_sub = bar_ns.'find_sub'( 'a_sub' )
    $S0   = a_sub
    a_sub()
    print "Found sub: "
    print $S0
    print "\n"

    .local pmc some_sub
    some_sub  = bar_ns.'find_sub'( 'some_sub' )
    no_symbol = 'some_sub'

    is_defined = defined some_sub
    if is_defined goto oops

    .local pmc a_var
    a_var    = bar_ns.'find_var'( 'a_var' )
    print "Found var: "
    print a_var
    print "\n"

    .local pmc some_var
    some_var    = bar_ns.'find_var'( 'some_var' )
    no_symbol = 'some_var'

    is_defined = defined some_var
    if is_defined goto oops

.end

.namespace ['Foo']

.sub some_sub
.end

.namespace [ 'Foo'; 'Bar' ]

.sub a_sub
    .local pmc some_var
    some_var = new ['String']
    some_var = 'a string PMC'
    set_hll_global [ 'Foo'; 'Bar' ], 'a_var', some_var
.end
CODE
Found namespace: Foo
Found nested namespace: Bar
Found sub: a_sub
Found var: a string PMC
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'get_root_namespace' );
.sub main :main
    .local pmc root_ns
    root_ns = get_root_namespace
    .local int is_defined
    is_defined = defined root_ns
    unless is_defined goto NO_NAMESPACE_FOUND
        print "Found root namespace.\n"
    NO_NAMESPACE_FOUND:
.end
CODE
Found root namespace.
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'root namespace is not a class' );
.sub main :main
    .local pmc root_ns
    root_ns = get_root_namespace
    .local pmc root_class
    root_class = get_class root_ns
    .local int is_class
    is_class = defined root_class
    say is_class
.end
CODE
0
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'get_root_namespace "Foo"' );
.sub main :main
    .local pmc foo_ns
    foo_ns = get_root_namespace [ "foo" ]
    .local int is_defined
    is_defined = defined foo_ns
    unless is_defined goto NO_NAMESPACE_FOUND
        print "Found root namespace 'foo'.\n"
    NO_NAMESPACE_FOUND:
.end
.HLL 'Foo'
.sub dummy
.end
CODE
Found root namespace 'foo'.
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'get_root_namespace "Foo", not there' );
.sub main :main
    .local pmc foo_ns
    foo_ns = get_root_namespace [ "Foo" ]
    .local int is_defined
    is_defined = defined foo_ns
    if is_defined goto NAMESPACE_FOUND
        print "Didn't find root namespace 'Foo'.\n"
    NAMESPACE_FOUND:
.end

.namespace [ "NotFoo" ]
CODE
Didn't find root namespace 'Foo'.
OUTPUT

my $create_nested_key = <<'CREATE_NESTED_KEY';
.sub create_nested_key
    .param string name
    .param pmc other_names :slurpy

    .local pmc key
    key = new ['Key']
    key = name

    .local int elem
    elem = other_names

    if elem goto nested
    .return( key )

  nested:
    .local pmc tail
    tail = create_nested_key(other_names :flat)
    push key, tail

    .return( key )
.end
CREATE_NESTED_KEY

pir_output_is( <<"CODE", <<'OUTPUT', 'get_name()' );
$create_nested_key

.sub main :main
    .local pmc key
    key = create_nested_key( 'SingleName' )
    print_namespace( key )

    key = create_nested_key( 'Nested', 'Name', 'Space' )
    print_namespace( key )

    key = get_namespace

    .local pmc ns
    ns = key.'get_name'()

    .local string ns_name
    ns_name = join ';', ns
    print ns_name
    print "\\n"
.end

.sub 'print_namespace'
    .param pmc key

    .local pmc get_ns
    get_ns = get_global key, 'get_namespace'

    .local pmc ns
    ns = get_ns()

    .local pmc name_array
    name_array = ns.'get_name'()

    .local string name
    name = join ';', name_array

    print name
    print "\\n"
.end

.sub get_namespace
    .local pmc ns
    ns = get_namespace
    .return( ns )
.end

.namespace [ 'SingleName' ]

.sub get_namespace
    .local pmc ns
    ns = get_namespace
    .return( ns )
.end

.namespace [ 'Nested'; 'Name'; 'Space' ]

.sub get_namespace
    .local pmc ns
    ns = get_namespace
    .return( ns )
.end

CODE
parrot;SingleName
parrot;Nested;Name;Space
parrot
OUTPUT

pir_output_is( <<"CODE", <<'OUTPUT', 'add_namespace()' );
$create_nested_key

.sub main :main
    .local pmc root_ns
    root_ns = get_namespace

    .local pmc child_ns
    child_ns = new ['NameSpace']
    root_ns.'add_namespace'( 'Nested', child_ns )

    .local pmc grandchild_ns
    grandchild_ns = new ['NameSpace']
    child_ns.'add_namespace'( 'Grandkid', grandchild_ns )

    .local pmc great_grandchild_ns
    great_grandchild_ns = new ['NameSpace']
    grandchild_ns.'add_namespace'( 'Greatgrandkid', great_grandchild_ns )

    .local pmc parent
    parent = great_grandchild_ns.'get_parent'()
    print_ns_name( parent )

    parent = parent.'get_parent'()
    print_ns_name( parent )

    parent = parent.'get_parent'()
    print_ns_name( parent )
.end

.sub print_ns_name
    .param pmc namespace

    .local pmc ns
    ns = namespace.'get_name'()

    .local string ns_name
    ns_name = join ';', ns
    print ns_name
    print "\\n"
.end
CODE
parrot;Nested;Grandkid
parrot;Nested
parrot
OUTPUT

pir_output_like( <<'CODE', <<'OUTPUT', 'add_namespace() with error' );
.sub main :main
    .local pmc ns_child
    ns_child = subclass 'NameSpace', 'NSChild'

    .local pmc child
    child = new ['NSChild']

    .local pmc root_ns
    root_ns = get_namespace

    root_ns.'add_namespace'( 'Really nested', child )

    .local pmc not_a_ns
    not_a_ns = new ['Integer']

    push_eh _invalid_ns
    root_ns.'add_namespace'( 'Nested', not_a_ns )
    end

_invalid_ns:
    .local pmc exception
    .local string message
    .get_results( exception )

    message = exception
    print message
    print "\n"
.end
CODE
/Invalid type \d+ in add_namespace\(\)/
OUTPUT

pir_output_is( <<"CODE", <<'OUTPUT', 'add_sub()' );
$create_nested_key

.sub 'main' :main
    .local pmc report_ns
    report_ns = get_global 'report_namespace'

    .local pmc key
    key = create_nested_key( 'Parent' )

    .local pmc parent_ns
    parent_ns = get_namespace key
    parent_ns.'add_sub'( 'report_ns', report_ns )

    key = create_nested_key( 'Parent', 'Child' )

    .local pmc child_ns
    child_ns = get_namespace key
    child_ns.'add_sub'( 'report_ns', report_ns )

    .local pmc report_namespace
    report_namespace = get_global [ 'Parent' ], 'report_ns'
    report_namespace()

    report_namespace = get_global [ 'Parent'; 'Child' ], 'report_ns'
    report_namespace()
.end

.sub 'report_namespace'
    .local pmc namespace
    namespace = get_namespace

    .local pmc ns
    ns = namespace.'get_name'()

    .local string ns_name
    ns_name = join ';', ns
    print ns_name
    print "\\n"
.end

.namespace [ 'Parent' ]

.sub dummy
.end

.namespace [ 'Parent'; 'Child' ]

.sub dummy
.end
CODE
parrot
parrot
OUTPUT

pir_output_like( <<'CODE', <<'OUTPUT', 'add_sub() with error' );
.sub main :main
    .local pmc s_child
    s_child = subclass 'Sub', 'SubChild'

    .local pmc child
    child = new ['SubChild']

    .local pmc root_ns
    root_ns = get_namespace

    root_ns.'add_sub'( 'child', child )
    print "Added sub child\n"

    child = new ['Coroutine']
    root_ns.'add_sub'( 'coroutine', child )
    print "Added coroutine\n"

    child = new ['Eval']
    root_ns.'add_sub'( 'eval', child )
    print "Added eval\n"

    .local pmc not_a_sub
    not_a_sub = new ['Integer']

    push_eh _invalid_sub
    root_ns.'add_sub'( 'Nested', not_a_sub )
    end

_invalid_sub:
    .local pmc exception
    .local string message
    .get_results( exception )

    message = exception
    print message
    print "\n"
.end
CODE
/Added sub child
Added coroutine
Added eval
Invalid type \d+ in add_sub\(\)/
OUTPUT

pir_output_is( <<"CODE", <<'OUTPUT', 'add_var()' );
$create_nested_key

.sub 'main' :main
    .local pmc foo
    foo = new ['String']
    foo = 'Foo'

    .local pmc bar
    bar = new ['String']
    bar = 'Bar'

    .local pmc key
    key = create_nested_key( 'Parent' )

    .local pmc parent_ns
    parent_ns = get_namespace key
    parent_ns.'add_var'( 'foo', foo )

    key = create_nested_key( 'Parent', 'Child' )

    .local pmc child_ns
    child_ns = get_namespace key
    child_ns.'add_var'( 'bar', bar )

    .local pmc my_var
    my_var = get_global [ 'Parent' ], 'foo'
    print "Foo: "
    print my_var
    print "\\n"

    my_var = get_global [ 'Parent'; 'Child' ], 'bar'
    print "Bar: "
    print my_var
    print "\\n"
.end

.namespace [ 'Parent' ]

.sub dummy
.end

.namespace [ 'Parent'; 'Child' ]

.sub dummy
.end
CODE
Foo: Foo
Bar: Bar
OUTPUT

pir_output_is( <<"CODE", <<'OUTPUT', 'del_namespace()' );
$create_nested_key

.sub 'main' :main
    .local pmc root_ns
    root_ns = get_namespace

    .local pmc key
    key      = create_nested_key( 'Parent' )

    .local pmc child_ns
    child_ns = root_ns.'find_namespace'( key )

    key      = create_nested_key( 'Child' )

    .local pmc grandchild_ns
    grandchild_ns = child_ns.'find_namespace'( key )

    child_ns.'del_namespace'( 'Child' )

    key      = create_nested_key( 'Child' )

    grandchild_ns = child_ns.'find_namespace'( key )
    if_null grandchild_ns, CHECK_SIBLING
    print "Grandchild still exists\\n"

  CHECK_SIBLING:
    key      = create_nested_key( 'Sibling' )
    grandchild_ns = child_ns.'find_namespace'( key )
    if_null grandchild_ns, DELETE_PARENT
    print "Sibling not deleted\\n"

  DELETE_PARENT:
    key      = create_nested_key( 'Parent' )
    root_ns.'del_namespace'( 'Parent' )
    child_ns = root_ns.'find_namespace'( key )
    if_null child_ns, CHECK_UNCLE
    print "Child still exists\\n"

  CHECK_UNCLE:
    key      = create_nested_key( 'FunUncle' )
    grandchild_ns = root_ns.'find_namespace'( key )
    if_null grandchild_ns, DELETE_PARENT
    print "Fun uncle stuck around\\n"

  ALL_DONE:
.end

.namespace [ 'FunUncle' ]

.sub dummy
.end

.namespace [ 'Parent' ]

.sub dummy
.end

.namespace [ 'Parent'; 'Child' ]

.sub dummy
.end

.namespace [ 'Parent'; 'Sibling' ]

.sub dummy
.end
CODE
Sibling not deleted
Fun uncle stuck around
OUTPUT

pir_output_like( <<'CODE', <<'OUTPUT', 'del_namespace() with error' );
.sub dummy
.end

.sub main :main
    .local pmc not_a_ns
    not_a_ns = new ['ResizablePMCArray']

    set_global 'Not_A_NS', not_a_ns

    .local pmc root_ns
    root_ns = get_namespace
    delete_namespace( root_ns, 'dummy' )
    delete_namespace( root_ns, 'Not_A_NS' )
.end

.sub delete_namespace
    .param pmc    root_ns
    .param string name
    push_eh _invalid_ns
    root_ns.'del_namespace'( name )

_invalid_ns:
    .local pmc exception
    .local string message
    .get_results( exception )

    message = exception
    print message
    print "\n"
    .return()
.end
CODE
/Invalid type \d+ for 'dummy' in del_namespace\(\)
Invalid type \d+ for 'Not_A_NS' in del_namespace\(\)/
OUTPUT

pir_output_is( <<"CODE", <<'OUTPUT', 'del_sub()' );
.sub 'main' :main
    .local pmc root_ns
    root_ns = get_namespace

    .local pmc parent_ns
    parent_ns = root_ns.'find_namespace'( 'Parent' )
    parent_ns.'del_sub'( 'dummy' )

    .local pmc my_sub
    my_sub = get_global [ 'Parent' ], 'dummy'
    if_null my_sub, PARENT_NO_DUMMY
    print "Parent did not delete dummy\\n"

  PARENT_NO_DUMMY:
    my_sub = get_global [ 'Parent' ], 'no_dummy'
    my_sub()

    .local pmc child_ns
    child_ns = parent_ns.'find_namespace'( 'Child' )
    child_ns.'del_sub'( 'dummy' )

    my_sub = get_global [ 'Parent'; 'Child' ], 'dummy'
    if_null my_sub, CHILD_NO_DUMMY
    print "Child did not delete dummy\\n"
    my_sub()

  CHILD_NO_DUMMY:
    my_sub = get_global [ 'Parent'; 'Child' ], 'no_dummy'
    my_sub()
.end

.namespace [ 'Parent' ]

.sub dummy
.end

.sub no_dummy
    print "Parent is no dummy\\n"
.end

.namespace [ 'Parent'; 'Child' ]

.sub dummy
    print "Dummy sub!\\n"
.end

.sub no_dummy
    print "Child is no dummy\\n"
.end

CODE
Parent is no dummy
Child is no dummy
OUTPUT

pir_output_like( <<'CODE', <<'OUTPUT', 'del_sub() with error' );
.sub main :main
    .local pmc not_a_ns
    not_a_ns = new ['ResizablePMCArray']

    set_global 'Not_A_Sub', not_a_ns

    .local pmc root_ns
    root_ns = get_namespace

    push_eh _invalid_sub
    root_ns.'del_sub'( 'Not_A_Sub' )

_invalid_sub:
    .local pmc exception
    .local string message
    .get_results( exception )

    message = exception
    print message
    print "\n"
    .return()
.end
CODE
/Invalid type \d+ for 'Not_A_Sub' in del_sub\(\)/
OUTPUT

pir_output_is( <<"CODE", <<'OUTPUT', 'del_var()' );
.sub 'main' :main
    .local pmc foo
    foo = new ['String']
    foo = 'Foo'

    .local pmc bar
    bar = new ['String']
    bar = 'Bar'

    set_global [ 'Parent' ],          'Foo', foo
    set_global [ 'Parent'; 'Child' ], 'Bar', bar

    .local pmc root_ns
    root_ns = get_namespace

    .local pmc parent_ns
    parent_ns = root_ns.'find_namespace'( 'Parent' )
    parent_ns.'del_var'( 'Foo' )

    .local pmc child_ns
    child_ns = parent_ns.'find_namespace'( 'Child' )
    child_ns.'del_var'( 'Bar' )

    .local pmc my_var
    my_var = get_global [ 'Parent' ], 'Foo'
    if_null my_var, TEST_CHILD_VAR
    print "Parent Foo exists: "
    print my_var
    print "\\n"

  TEST_CHILD_VAR:
    my_var = get_global [ 'Parent'; 'Child' ], 'Bar'
    if_null my_var, ALL_DONE
    print "Child Bar exists: "
    print my_var
    print "\\n"

  ALL_DONE:
.end

.namespace [ 'Parent' ]

.sub dummy
.end

.namespace [ 'Parent'; 'Child' ]

CODE
OUTPUT

pir_error_output_like( <<'CODE', <<'OUTPUT', 'overriding find_method()' );
.sub 'main' :main
    $P0 = newclass 'Override'
    $P1 = new ['Override']
    $P2 = find_method $P1, 'foo'
.end

.namespace [ 'Override' ]

.sub 'find_method' :vtable
    .param string method
    say "Finding method"
.end
CODE
/Finding method/
OUTPUT

pir_output_is( <<'CODE', <<OUT, "iterate through a NameSpace PMC" );
.sub main :main
     $P0 = new ['String']
     $P0 = "Ook...BANG!\n"
     set_root_global [ "DUMMY"; "X"; "Y" ], "Explosion", $P0

     $P1 = new ['Integer']
     $P1 = 0
     set_root_global [ "DUMMY"; "X"; "Y" ], "T0", $P0

     .local pmc dummy_x_y_ns, it, res
     dummy_x_y_ns = get_root_namespace [ "DUMMY"; "X"; "Y" ]
     it   = iter dummy_x_y_ns
     res  = new ['ResizablePMCArray']
loop:
     unless it goto loop_end
     $S0 = shift it
     push res, $S0
     goto loop
loop_end:

     res.'sort'()
     $S0 = join ' ', res
     say $S0

.end
CODE
Explosion T0
OUT

pir_error_output_like( <<'CODE', <<OUT, "NameSpace with no class" );
.sub 'main' :main
    $P1 = new ['NameSpace']
    set_args '(0)', $P1
    tailcallmethod $P1, 'bob'
.end
CODE
/Null PMC access in get_string()/
OUT

pir_output_is( <<'CODE', <<OUT, "iterate through a NameSpace PMC" );
.namespace [ 'bar' ]

.sub 'main' :main
    .local pmc res
    res = new ['ResizablePMCArray']

    $P0 = get_namespace
    say $P0
    $I0 = elements $P0
    say $I0
    $P1 = iter $P0
  L1:
    unless $P1 goto L2
    $P2 = shift $P1
    $S0 = $P2
    push res, $S0
    goto L1
  L2:
    res.'sort'()
    $S0 = join "\n", res
    say $S0
    say 'OK'
.end

.sub 'foo'
    say 'foo'
.end
CODE
bar
2
foo
main
OK
OUT

pir_output_is( <<'CODE', <<'OUT', "make_namespace method");
.sub 'main' :main
    $P0 = split ';', 'perl6;Foo;Bar'
    $P1 = get_root_namespace
    $P2 = $P1.'make_namespace'($P0)
    $I0 = isa $P2, 'NameSpace'
    say $I0
    $P3 = get_root_namespace ['perl6';'Foo';'Bar']
    $I0 = isnull $P3
    say $I0
    $I0 = issame $P2, $P3
    say $I0
.end
CODE
1
0
1
OUT

pir_error_output_like( <<'CODE', <<'OUT', 'adding :anon sub to a namespace, TT #56' );
.namespace ['Foo']
.sub main :main
    .const 'Sub' $P0 = 'bar'

    set_global 'ok', $P0
    $P1 = get_global 'ok'
    say $P1
    $S0 = ok()
    say $S0
    $S0 = nok()
    say $S0
.end

.namespace []
.sub 'nok' :anon :subid('bar')
    .return( 'ok 1' )
.end
CODE
/
ok 1
Could not find sub nok/
OUT


pir_output_is( <<'CODE', <<'OUT', 'HLL_map on namespace', todo => 'GH #404');
.HLL 'tcl'

.sub 'foo' :anon :init
  $P1 = get_class 'NameSpace'
  $P2 = subclass $P1, 'BSNS'
  $P0 = getinterp
  $P0.'hll_map'($P1, $P2)
.end

.namespace ['a';'b';'c']

.sub 'hi'
  noop
.end

.namespace []

.sub 'blah' :main
  $P1 = get_hll_namespace ['a';'b';'c']
  $S0 = typeof $P1
  print 'ok 1 - '
  say $S0
.end
CODE
ok 1 - BSNS
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
