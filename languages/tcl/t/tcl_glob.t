#!../../parrot tcl.pbc

source lib/test_more.tcl

plan 29

    ok [string match {b?n*a} banana]
    ok [string match {b?n*a} bznza]
    ok [string match {b?n*a} bana]

not_ok [string match {b?n*a} bnan]

    ok [string match {b\?n*a} b?nana]
not_ok [string match {b\?n*a} banana]
    ok [string match {b?n\*a} ban*a]
not_ok [string match {b?n\*a} banana]

    ok [string match {?n?*} bnan]
    ok [string match {?n?*} ana]
not_ok [string match {?n?*} an]

set TODO {TODO "globbing needs to be specialised for Tcl"}

# character classes

    ok [string match {[ab]*} apple] "" $TODO
    ok [string match {[ab]*} boot]  "" $TODO
    ok [string match {[ab]*} a]     "" $TODO

not_ok [string match {[ab]*} ring]  "" $TODO

    ok [string match {[0-9]} 0]     "" $TODO
    ok [string match {[0-9]} 5]     "" $TODO
    ok [string match {[0-9]} 9]     "" $TODO
not_ok [string match {[0-9]} a]     "" $TODO

not_ok [string match {[^d-f]} z]    "" $TODO
not_ok [string match {[^d-f]} c]    "" $TODO
not_ok [string match {[!d-f]} g]    "" $TODO
    ok [string match {[!d-f]} d]    "" $TODO
    ok [string match {[^d-f]} e]    "" $TODO
    ok [string match {[^d-f]} f]    "" $TODO

# braces should be literal

    ok [string match {{az,bz}} "{az,bz}"] "" $TODO
not_ok [string match {{az,bz}} "bz"]      "" $TODO
    ok [string match {[a-z]{5}} "b{5}"]   "" $TODO
not_ok [string match {[a-z]{5}} "bbbbb"]  "" $TODO
