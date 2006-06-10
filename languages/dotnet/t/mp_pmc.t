#!perl -w

use Test::More;
use DotNetTesting;
use strict;

use Test::More tests => 9;

# Testing class for the managed pointer PMC and related ops. Note that this
# does not consider translating any .NET code, just tests the functionality.
is (run_pir(<<'PIR'), <<'OUTPUT', 'int reg');
.sub main :main
	.local int the_test
    .local pmc ptr
	$P0 = loadlib "dotnet_ops"
    $P0 = loadlib "dotnet_runtime"
    
    # Get the pointer.
    the_test = 20
    ptr = net_reg_ptr the_test
    
    # Call function, passing the pointer.
    inc_reg_indirect(ptr)

    # Print output.
    print "Jonathan will be "
    print the_test
    print " years old tomorrow! :-O\n"
.end

.sub inc_reg_indirect
    .param pmc ptr
    .local int tmp

    # Get register's value indirectly, increment it and store back indirectly.
    tmp = ptr.load_int()
    inc tmp
    ptr.store_int(tmp)
.end
PIR
Jonathan will be 21 years old tomorrow! :-O
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'float reg');
.sub main :main
	.local num the_test
    .local pmc ptr
	$P0 = loadlib "dotnet_ops"
    $P0 = loadlib "dotnet_runtime"
    
    # Get the pointer.
    the_test = 2.4
    ptr = net_reg_ptr the_test
    
    # Call function, passing the pointer.
    double_reg_indirect(ptr)

    # Print output.
    print the_test
    print "\n"
.end

.sub double_reg_indirect
    .param pmc ptr
    .local num tmp

    # Get register's value indirectly, increment it and store back indirectly.
    tmp = ptr.load_float()
    tmp = tmp * 2
    ptr.store_float(tmp)
.end
PIR
4.800000
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'pmc reg');
.sub main :main
	.local pmc the_test
    .local pmc ptr
	$P0 = loadlib "dotnet_ops"
    $P0 = loadlib "dotnet_runtime"
    
    # Get the pointer.
    the_test = new Float
    the_test = 42.2
    ptr = net_reg_ptr the_test
    
    # Call function, passing the pointer.
    change_to_Integer(ptr)

    # Print output.
    print the_test
    print "\n"
.end

.sub change_to_Integer
    .param pmc ptr
    .local pmc tmp
    .local int tmp2

    # Get register's value indirectly, increment it and store back indirectly.
    tmp = ptr.load_pmc()
    tmp2 = tmp
    tmp = new Integer
    tmp = tmp2
    ptr.store_pmc(tmp)
.end
PIR
42
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'int element');
.sub main :main
	.local int the_test
    .local pmc ptr, arr
	$P0 = loadlib "dotnet_ops"
    $P0 = loadlib "dotnet_runtime"
    
    # Set up an array.
    arr = new FixedIntegerArray
    arr = 3
    arr[0] = 40
    arr[1] = 41
    arr[2] = 43

    # Get pointer to second element.
    ptr = net_ldelema arr, 1
    
    # Use the pointer to get value, increment it, store it again.
    the_test = ptr.load_int()
    print the_test
    print "\n"
    inc the_test
    ptr.store_int(the_test)

    # Print array element.
    the_test = arr[1]
    print the_test
    print "\n"
.end
PIR
41
42
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'float element');
.sub main :main
	.local num the_test
    .local pmc ptr, arr
	$P0 = loadlib "dotnet_ops"
    $P0 = loadlib "dotnet_runtime"
    
    # Set up an array.
    arr = new FixedFloatArray
    arr = 3
    arr[0] = 14.2
    arr[1] = 5.9
    arr[2] = 18.7

    # Get pointer to second element.
    ptr = net_ldelema arr, 1
    
    # Use the pointer to get value, increment it, store it again.
    the_test = ptr.load_float()
    print the_test
    print "\n"
    the_test = the_test * 2
    ptr.store_float(the_test)

    # Print array element.
    the_test = arr[1]
    print the_test
    print "\n"
.end
PIR
5.900000
11.800000
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'pmc element');
.sub main :main
    .local pmc ptr, arr, the_test
	$P0 = loadlib "dotnet_ops"
    $P0 = loadlib "dotnet_runtime"
    
    # Set up an array.
    arr = new FixedFloatArray
    arr = 3
    the_test = new Float
    the_test = 14.2
    arr[0] = the_test
    the_test = new Float
    the_test = 5.9
    arr[1] = the_test
    the_test = new Float
    the_test = 18.7
    arr[2] = the_test

    # Get pointer to second element.
    ptr = net_ldelema arr, 1
    
    # Use the pointer to get value, increment it, store it again.
    the_test = ptr.load_pmc()
    print the_test
    print "\n"
    the_test = new Float
    the_test = 11.8
    ptr.store_float(the_test)

    # Print array element.
    the_test = arr[1]
    print the_test
    print "\n"
.end
PIR
5.9
11.8
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'int field');
.sub main :main
    .local int the_test
    .local pmc ptr, obj
	$P0 = loadlib "dotnet_ops"
    $P0 = loadlib "dotnet_runtime"
    
    # Set up an object with an integer field.
    $P0 = newclass "monkey"
    addattribute $P0, "age"
    obj = new "monkey"
    $P1 = new Integer
    $P1 = 20
    setattribute obj, "age", $P1

    # Get pointer to name field.
    ptr = net_ldflda obj, "age"
    
    # Use the pointer to get the age attribute and change it.
    the_test = ptr.load_int()
    print "The monkey was "
    print the_test
    print " years old.\n"
    inc the_test
    ptr.store_int(the_test)

    # Print attribute.
    $P1 = getattribute obj, "age"
    print "The monkey is now "
    print $P1
    print " years old.\n"
.end
PIR
The monkey was 20 years old.
The monkey is now 21 years old.
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'float field');
.sub main :main
    .local num the_test
    .local pmc ptr, obj
	$P0 = loadlib "dotnet_ops"
    $P0 = loadlib "dotnet_runtime"
    
    # Set up an object with a float field.
    $P0 = newclass "monkey"
    addattribute $P0, "height"
    obj = new "monkey"
    $P1 = new Float
    $P1 = 1.79
    setattribute obj, "height", $P1

    # Get pointer to name field.
    ptr = net_ldflda obj, "height"
    
    # Use the pointer to get the height attribute and change it.
    the_test = ptr.load_float()
    print "The monkey was "
    print the_test
    print " meters tall.\n"
    the_test = 1.82
    ptr.store_float(the_test)

    # Print attribute.
    $P1 = getattribute obj, "height"
    print "The monkey is now "
    print $P1
    print " meters tall.\n"
.end
PIR
The monkey was 1.790000 meters tall.
The monkey is now 1.82 meters tall.
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'pmc field');
.sub main :main
    .local pmc the_test, ptr, obj
	$P0 = loadlib "dotnet_ops"
    $P0 = loadlib "dotnet_runtime"
    
    # Set up an object with a field.
    $P0 = newclass "monkey"
    addattribute $P0, "name"
    obj = new "monkey"
    $P1 = new String
    $P1 = "Derek"
    setattribute obj, "name", $P1

    # Get pointer to name field.
    ptr = net_ldflda obj, "name"
    
    # Use the pointer to get the name attribute and change it.
    the_test = ptr.load_pmc()
    print "The monkey was called "
    print the_test
    print ".\n"
    $P1 = new String
    $P1 = "Bradley"
    ptr.store_pmc($P1)

    # Print attribute.
    the_test = getattribute obj, "name"
    print "The monkey is now called "
    print the_test
    print ".\n"
.end
PIR
The monkey was called Derek.
The monkey is now called Bradley.
OUTPUT
