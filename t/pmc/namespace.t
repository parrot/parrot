#! parrot
# Copyright (C) 2006-2007, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/namepspace.t - test NameSpace PMC

=head1 SYNOPSIS

    % prove t/pmc/namespace.t

=head1 DESCRIPTION

Tests the NameSpace PMC. Some things that it tests specifically:

=over 4

=item* Creating new NameSpace PMCs

=item* Verify that things which are supposed to return a NameSpace actually
do.

=item* Various forms of get_global opcode

=item* Finding and calling Subs which are stored in the NameSpace

=item* Methods on the NameSpace PMC

=item* Building NameSpace hierarchies on the fly

=item* HLL NameSpaces

=back

=cut

.namespace []

.sub main :main
    .include 'test_more.pir'
    plan(51)

    create_namespace_pmc()
    verify_namespace_type()
    get_global_opcode()
    get_sub_from_namespace_hash()
    access_sub_in_namespace()
    get_namespace_from_sub()
    build_namespaces_at_runtime()
    hll_namespaces()
    namespace_methods()
.end

# L<PDD21/Namespace PMC API/=head4 Untyped Interface>
.sub 'create_namespace_pmc'
    push_eh eh1
    $P0 = new ['NameSpace']
    pop_eh
    ok(1, "Create new Namespace PMC")
    goto _end
  eh1:
    ok(0, "Could not create Namespace PMC")
  _end:
.end

.sub 'verify_namespace_type'
    $P0 = get_global "Foo"
    typeof $S0, $P0
    is($S0, "NameSpace", "A NameSpace is a NameSpace")

    # root namespace
    $P0 = get_root_namespace
    typeof $S0, $P0
    is($S0, "NameSpace", "Root NameSpace is a NameSpace")

    # parrot namespace
    $P1 = $P0["parrot"]
    typeof $S0, $P1
    is($S0, "NameSpace", "::parrot NameSpace is a NameSpace")

    # get_namespace with no args
    $P0 = get_namespace
    typeof $S0, $P1
    is($S0, "NameSpace", "Current NameSpace is a NameSpace")

    # Prove that HLL namespace names are mangled to lower-case
    $P0 = get_root_namespace ["MyHLL"]
    $I0 = isnull $P0
    is($I0, 1, "HLL NameSpace names are stored lowercase")

    $P0 = get_root_namespace ["myhll"]
    $I0 = isnull $P0
    is($I0, 0, "HLL NameSpaces are name-mangled lowercase")

    # Get an HLL namespace and verify that it's a NameSpace PMC
    $P0 = get_root_namespace ["myhll"]
    $S0 = typeof $P0
    is($S0, "NameSpace", "HLL NameSpaces are NameSpaces too")

.end

# L<PDD21//>
.sub 'get_global_opcode'
    push_eh eh1
    $P0 = get_global "baz"
    $S0 = $P0()
    pop_eh
    is($S0, "", "Can get_global a .sub")
    goto test2
  eh1:
    ok(0, "Cannot get_global a .sub")

  test2:
    push_eh eh2
    $P0 = get_global ["Foo"], "baz"
    $S0 = $P0()
    pop_eh
    is($S0, "Foo", "Get Sub from NameSpace")
    goto test3
  eh2:
    ok(0, "Cannot get Sub from NameSpace Foo")

  test3:
    push_eh eh3
    $P0 = get_global ["Foo";"Bar"], "baz"
    $S0 = $P0()
    pop_eh
    is($S0, "Foo::Bar", "Get Sub from nested NameSpace")
    goto test4
  eh3:
    ok(0, "Cannot get Sub from NameSpace Foo::Bar")

  test4:
    push_eh eh4
    $P0 = get_global ["Foo"], "SUB_THAT_DOES_NOT_EXIST"
    $P0()
    ok(0, "Found and invoked a non-existant sub")
    goto test5
  eh4:
    # Should we check the exact error message here?
    ok(1, "Cannot invoke a Sub that doesn't exist")

  test5:
    # this used to behave differently from the previous case.
    push_eh eh5
    $P0 = get_global ["Foo";"Bar"], "SUB_THAT_DOES_NOT_EXIST"
    $P0()
    ok(0, "Found and invoked a non-existant sub")
    goto test6
  eh5:
    # Should we check the exact error message here?
    ok(1, "Cannot invoke a Sub that doesn't exist")

  test6:
    push_eh eh6
    $P0 = get_global [ iso-8859-1:"François" ], "baz"
    $S0 = $P0()
    is($S0, iso-8859-1:"François", "Found sub in ISO-8859 NameSpace")
    goto test7
  eh6:
    ok(0, "Cannot find sub in ISO-8859 NameSpace")

  test7:
    push_eh eh7
    $P0 = get_global [ "Foo";iso-8859-1:"François" ], "baz"
    $S0 = $P0()
    is($S0, iso-8859-1:"Foo::François", "Found sub in nested ISO-8859 NameSpace")
    goto test8
  eh7:
    ok(0, "Cannot find sub in ISO-8859 NameSpace")

  test8:
# TODO: This should probably be possible. We should be able to look up a
#       string if it is iso-8895-1 and we are Unicode
#    push_eh eh8
#    $P0 = get_global [ unicode:"François" ], "baz"
#    $I0 = isnull $P0
#    is($I0, 0, "Find Sub in an ISO-8859-1 NameSpace looked up by a Unicode name")

#    $S0 = $P0()
#    say $S0
#    is($S0, iso-8859-1:"François", "ISO-8859 NameSpace with Unicode name")
#    goto _end
#  eh8:
#    ok(0, "Cannot find ISO-8859 NameSpace using Unicode name")

  _end:
.end

.sub 'get_sub_from_namespace_hash'
    #See that a NameSpace does Hash
    $P0 = get_global "Foo"
    $I0 = does $P0, 'hash'
    ok($I0, "Namespace does hash")

    # Use a hash key to get a Sub in a namespace
    $P1 = $P0["baz"]
    $S0 = $P1()
    is($S0, "Foo", "Get the Sub from the NameSpace as a Hash")

    # Use hash keys to get Subs and nested NameSpaces in NameSpaces
    $P1 = $P0["Bar"]
    $P2 = $P1["baz"]
    $S0 = $P2()
    is($S0, "Foo::Bar", "Get the Sub from the nested NameSpace as a Hash")

    # Use nested keys to access nested NameSpaces
    $P1 = $P0[ "Bar";"baz" ]
    $S0 = $P1()
    is($S0, "Foo::Bar", "Get Sub from nested NameSpace with multi-key")

    # Alias a namespace and access it by Key
    $P1 = $P0["Bar"]
    set_global "TopBar", $P1
    $P2 = get_global ["TopBar"], "baz"
    is($S0, "Foo::Bar", "Alias namespace")

    # Get nested NameSpace with ISO-8859 name
    $P1 = $P0[ iso-8859-1:"François" ]
    $P2 = $P1["baz"]
    $S0 = $P2()
    is($S0, iso-8859-1:"Foo::François", "Hash-get nested ISO-8859 NameSpace")

    $P1 = $P0[ iso-8859-1:"François";"baz" ]
    $S0 = $P1()
    is($S0, iso-8859-1:"Foo::François", "Hash-get nested ISO-8859 NameSpace Sub")

    $P0 = get_global iso-8859-1:"François"
    $P1 = $P0[ "baz" ]
    $S0 = $P1()
    is($S0, iso-8859-1:"François", "Hash-get ISO-8859 NameSpace")
.end

.sub 'access_sub_in_namespace'
    # Direct access of sub that does exist in current namespace
    $S0 = baz()
    $P0 = get_global "baz"
    $S1 = $P0()
    is($S0, $S1, "Direct and Indirect Sub calls")

    # Direct access of sub that doesn't exist in current namespace
    push_eh eh
    'SUB_AINT_THERE'()
    ok(0, "Directly called a sub that doesn't exist")
    goto _end
  eh:
    ok(1, "Can't direct call a sub that doesn't exist")
  _end:
.end

.sub 'get_namespace_from_sub'
    # root namespace is "parrot"
    $P0 = get_global "baz"
    $P1 = $P0."get_namespace"()
    $S0 = $P1
    is($S0, "parrot", "Get the root namespace from a sub in the root namespace")

    # Get an explicit namespace
    $P0 = get_global ["Foo"], "baz"
    $P1 = $P0."get_namespace"()
    $S0 = $P1
    is($S0, "Foo", "Get the namespace from a Sub in the NameSpace")

    # Get namespace from the current sub
    .include 'interpinfo.pasm'
    $P0 = interpinfo .INTERPINFO_CURRENT_SUB
    $P1 = $P0."get_namespace"()
    $S0 = $P1
    is($S0, "parrot", "Get namespace from current sub")

    # Now get the current sub again
    $P2 = $P1["get_namespace_from_sub"]
    $S0 = typeof $P2
    is($S0, "Sub", "Get the current sub from namespace from current sub")
.end

.sub 'build_namespaces_at_runtime'
    $P0 = get_root_namespace
    $P1 = $P0["parrot"]
    $P3 = new ['NameSpace']
    $P1["Temp1"] = $P3
    $P2 = $P3.'get_name'()
    $S0 = join '::', $P2
    is($S0, "parrot::Temp1", "Add a NameSpace with a given name")

    # test VTABLE_get_string while we are here
    $S0 = $P1
    is($S0, "parrot", "get_string on HLL NameSpace")

    $S0 = $P3
    is($S0, "Temp1", "get_string on NameSpace")
.end

.sub 'hll_namespaces'
    # Fetch HLL Global using an RSA. Current HLL == parrot
    $P4 = new ['FixedStringArray']
    $P4 = 1
    $P4[0] = 'Foo'
    $P0 = get_hll_namespace $P4
    $P2 = $P0.'get_name'()
    $S0 = join '::', $P2
    is($S0, "parrot::Foo", "get_hll_namespace_p")

    # Get an HLL namespace using a key. Current HLL == parrot
    $P2 = get_hll_namespace ["Foo"]
    $P2 = $P2.'get_name'()
    $S0 = join '::', $P2
    is($S0, "parrot::Foo", "get_hll_namespace_kc")

    # Get a sub from an HLL Namespace using a key. Current HLL == parrot
    $P0 = get_hll_namespace ["Foo"]
    $P1 = $P0["baz"]
    $S0 = $P1()
    is($S0, "Foo", "get a Sub from a HLL namespace")

    # find something an a different .HLL
    push_eh eh1
    $P0 = get_root_namespace ["myhll"]
    $P1 = $P0["baz"]
    $S0 = $P1()
    pop_eh
    is($S0, "MyHLL", "Found Sub in HLL namespace by key")
    goto test2
  eh1:
    ok(0, "Cannot find sub in HLL NameSpace by key")

  test2:
    $P0 = get_root_namespace ["myhll";"baz"]
    $I0 = isnull $P0
    is($I0, 1, "get_root_namespace only returns NameSpace PMCs")
.end

.sub 'namespace_methods'
    $P0 = get_namespace

    # make_namespace returns the existing namespace if it exists
    $P1 = $P0.'make_namespace'("Foo")
    $P2 = $P1["baz"]
    $S0 = $P2()
    is($S0, "Foo", "make_namespace does not overwrite existing NS")

    # First we don't have it...
    $P1 = $P0["NewNamespace1"]
    $I0 = isnull $P1
    is($I0, 1, "something that doesn't exist really doesn't")

    # ...now we do!
    $P1 = $P0.'make_namespace'("NewNamespace1")
    $P2 = $P1["baz"]    
    $I0 = isnull $P2
    is($I0, 1, "make_namespace also creates new namespaces")

    $P1 = new ["NameSpace"]
    $P0.'add_namespace'("NewNamespace2", $P1)
    $P2 = $P0["NewNamespace2"]
    is($P1, $P2, "add_namespace adds a new namespace")

    # test add_sub

    $P1 = new 'Integer'
    $P1 = 25
    $P0.'add_var'("My_Integer", $P1)
    $P2 = $P0["My_Integer"]
    is($P1, $P2, "add_var adds a variable to the namespace")

    # We've already tested NameSpace."get_name" elsewhere in this file

    $P1 = $P0.'find_namespace'("Foo")
    $P2 = $P1["baz"]
    $S0 = $P2()
    is($S0, "Foo", "find_namespace finds a .namespace constant")

    $P1 = $P0.'find_namespace'("NewNamespace1")
    $S0 = typeof $P1
    is($S0, "NameSpace", "find_namespace finds a namespace added at runtime")

    $P1 = $P0.'find_sub'("baz")
    $S0 = $P1()
    is($S0, "", "find_sub finds a sub like it should")

    $P1 = $P0.'find_sub'("NewNamespace1")
    $I0 = isnull $P1
    is($I0, 1, "find_sub won't find a non-sub")

    $P1 = $P0.'find_sub'("DOESNT EXIST")
    $I0 = isnull $P1
    is($I0, 1, "find_sub won't find something that doesn't exist")

    $P1 = $P0.'find_var'("My_Integer")
    $I0 = $P1
    is($I0, 25, "find_var finds a variable we've saved in a namespace")

    $P1 = $P0.'find_var'("ALSO DOESNT EXIST")
    $I0 = isnull $P1
    is($I0, 1, "find_var won't find something that doesn't exist")

    $P1 = $P0.'find_var'("baz")
    $S0 = typeof $P1
    is($S0, "Sub", "find_var also finds subs")
    $S0 = $P1()
    is($S0, "", "find_var finds the correct sub")

    # Test del_namespace. Test that it deletes an existing namespace, and that
    # it won't delete something that isn't a namespace

    # Test del_sub. Test that it deletes an existing sub and that it
    # won't delete something that isn't a sub

    # Test del_var. It will delete any type of thing
.end

##### TEST NAMESPACES AND FUNCTIONS #####
# These functions and namespaces are used for the tests above

.namespace []

.sub 'baz'
    .return("")
.end

.namespace ["Foo"]
.sub 'baz'
    .return("Foo")
.end

.namespace ["Foo";"Bar"]
.sub 'baz'
    .return("Foo::Bar")
.end

.namespace [ iso-8859-1:"François" ]
.sub 'baz'
    .return(iso-8859-1:"François")
.end

.namespace [ "Foo"; iso-8859-1:"François" ]
.sub 'baz'
    .return(iso-8859-1:"Foo::François")
.end

.HLL "MyHLL"

.sub 'baz'
    .return("MyHLL")
.end
