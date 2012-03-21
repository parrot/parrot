#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.

=head1 NAME

t/library/sha.t - test SHA256 library

=head1 SYNOPSIS

        % prove t/library/sha.t

=head1 DESCRIPTION

Tests the SHA256 library. You can create the test results using
the command-line sha256sum like this:

 $ echo -n Hello World! | sha256sum
 7f83b1657ff1fc53b92dc18148a1d65dfc2d4b1fa3d677284addd200126d9069  -

As well as testing the SHA256 library itself, it is useful for spotting
regressions in the parrot VM, JIT and GC

=cut

.include 'load_bytecode.pir'

.sub main :main
    '__load_bytecode'("Digest/sha256.pbc")

    .include 'test_more.pir'
    plan(7)

    test_basic()
    test_miscellaneous_words()
    test_object_interface()
    test_large_string()
.end


.sub test_large_string
    $P0 = sha256sum(<<'STUFF')
8b7df143d91c716ecfa5fc1730022f6b421b05cedee8fd52b1fc65a96030ad52
8b7df143d91c716ecfa5fc1730022f6b421b05cedee8fd52b1fc65a96030ad52
8b7df143d91c716ecfa5fc1730022f6b421b05cedee8fd52b1fc65a96030ad52
8b7df143d91c716ecfa5fc1730022f6b421b05cedee8fd52b1fc65a96030ad52
STUFF
    $S0 = sha256_hex($P0)
    is($S0, "ccfde36946f532554229ff876ab56a3170a78cc2e02c9893c5b7e5bcfe27681b", "sha256: large string")
.end

.sub test_basic
    $P0 = sha256sum("blah")
    $S0 = sha256_hex($P0)
    is($S0, "8b7df143d91c716ecfa5fc1730022f6b421b05cedee8fd52b1fc65a96030ad52", "Basic SHA test")
.end

.sub test_miscellaneous_words
    $P0 = sha256sum ("Hello")
    $S0 = sha256_hex($P0)
    is($S0, '185f8db32271fe25f561a6fc938b2e264306ec304eda518007d1764826381969', 'sha256 Hello')

    $P0 = sha256sum ("Goodbye")
    $S0 = sha256_hex($P0)
    is($S0, 'c015ad6ddaf8bb50689d2d7cbf1539dff6dd84473582a08ed1d15d841f4254f4', 'sha256 Goodbye')

    $P0 = sha256sum ("Parrot")
    $S0 = sha256_hex($P0)
    is($S0, '21957106f22269fcf84cfd8bcd7b11c353b8155582ec8eae584dc876457787f8', 'sha256 Parrot')

    $P0 = sha256sum ("Hello World!")
    $S0 = sha256_hex($P0)
    is($S0, '7f83b1657ff1fc53b92dc18148a1d65dfc2d4b1fa3d677284addd200126d9069', 'sha256 Hello World')
.end

.sub test_object_interface
    $P0 = new ["Digest";"SHA256"]
    $P0."sha_sum"("Hello")
    $S0 = $P0."sha_hex"()
    is($S0, '185f8db32271fe25f561a6fc938b2e264306ec304eda518007d1764826381969', 'sha256 Hello via object interface')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
