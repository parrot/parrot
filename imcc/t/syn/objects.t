#!perl
use strict;
use TestCompiler tests => 2;

##############################
# Parrot Calling Conventions


output_is(<<'CODE', <<'OUT', "meth call syntax");
.sub _main
    .local pmc class
    .local pmc obj
    find_global $P0, "_meth"
    store_global "Foo", "_meth", $P0
    newclass class, "Foo"
    find_type $I0, "Foo"
    new obj, $I0
    obj._meth()
    obj->_meth()
    print "done\n"
    end
.end
.sub _meth
    print "in meth\n"
.end
CODE
in meth
in meth
done
OUT

output_is(<<'CODE', <<'OUT', "meth call syntax(argc)");
.sub _main
    .local pmc class
    .local pmc obj
    find_global $P0, "_meth"
    store_global "Foo", "_meth", $P0
    newclass class, "Foo"
    find_type $I0, "Foo"
    new obj, $I0
    $P0 = new PerlString
    $P0 = "ok\n"
    obj. _meth($P0)
    print "done\n"
    end
.end
.sub _meth
    .param pmc s
    print "in meth\n"
    print s
.end
CODE
in meth
ok
done
OUT
