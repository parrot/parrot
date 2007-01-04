#!perl

# the following lines re-execute this as a tcl script
# the \ at the end of these lines makes them a comment in tcl \
use lib qw(languages/tcl/lib tcl/lib lib ../lib ../../lib); # \
use Tcl::Test; #\
__DATA__

source lib/test_more.tcl
plan 22

eval_is {
  catch {unset a}
  set a whee
  set b "foo $a bar"
} {foo whee bar} {middle of ""}

eval_is {
  catch {unset a}
  set a whee
  set b "$a bar"
} {whee bar} {beginning of ""}

eval_is {
  catch {unset a}
  set a whee
  set b "bar $a"
} {bar whee} {end of ""}

eval_is {
  catch {unset a}
  set a whee
  set b $a
} whee {entire word}

eval_is {
   catch {unset a}
   set a(b) whee
   set b $a(b)
} whee {array, entire word}

eval_is {
  catch {unset a}
  set a 2
  set b $a(b)
} {can't read "a(b)": variable isn't array} {try to use scalar as array}

eval_is {
  catch {unset a}
  set a(b) 2
  set b $a
} {can't read "a": variable is array} {try to use array as scalar}

eval_is {
  catch {unset x}
  set x(0) 44
  set b ${x(0)}
} 44 {${} substitute an array item}

eval_is {
  catch {unset x}
  set x foo
  set b $::x
} foo {explicit global}

eval_is {
  namespace eval lib { variable version 0.1 }
  set b $::lib::version
} 0.1 {absolute namespace var}

eval_is {
  catch {unset x}
  set ::x foo
  set b $x
} foo {write to explicit global}

eval_is {
  namespace eval lib { variable version }
  set ::lib::version 0.1
  set b $::lib::version
} 0.1 {write to absolute namespace var}

eval_is {
  catch {unset array}
  array set array {test ok}
  set key test
  set b $array($key)
} ok {variable index into array}

eval_is {
  catch {unset bar}
  set b $foo($bar)
} {can't read "bar": no such variable} {invalid variable as key}

eval_is {
  catch {unset foo}
  array set foo {$ ok}
  set b $foo($)
} ok {single $ as index}

eval_is {
  catch {unset foo}
  array set foo {) ok}
  set key )
  set b $foo([set key])
} ok {use ) as a key}

eval_is {
  catch {unset array}
  catch {unset foo}
  array set array {a 1 b 2 c 3}
  set foo b
  set b $array([set foo)
} {missing close-bracket} {missing ] in subcommand as key}

eval_is {
  catch {unset array}
  catch {unset foo}
  array set array {a 1 b 2 c 3}
  set foo b
  set b $array([set foo]a)
} {can't read "array(ba)": no such element in array} {invalid key}

eval_is {
  catch {unset array}
  array set array {a 1 b 2 c 3}
  set ) b
  set b $array([set )])
} 2 {use literal ) inside the array key}

eval_is {
  catch {unset x}
  namespace eval foo {  proc bar {} { return ok }  }
  set x foo
  $x\::bar
} ok {namespace variable with escaped colon}


namespace eval foo {
    variable y 7
}
set x 5
namespace eval test {
    is [set foo::y] 7 {foo::y relative}
    is [set x]      5 {x relative}
}
