#!../../parrot tcl.pbc

source lib/test_more.tcl
plan 48

eval_is {array}\
  {wrong # args: should be "array option arrayName ?arg ...?"}\
  {array, no args}

eval_is {array exists}\
  {wrong # args: should be "array option arrayName ?arg ...?"}\
  {array, good subcommand, no array}

eval_is {array bork foo}\
  {bad option "bork": must be anymore, donesearch, exists, get, names, nextelement, set, size, startsearch, statistics, or unset}\
  {array, bad subcommand, bad arary}

eval_is {
 set b(c) 2
 array exists b
} 1 {array exists yes}

eval_is {
 set a 2
 array exists a
} 0 {array exists no}

eval_is {array exists q} 0 {array exists missing}

eval_is {array exists a b}\
  {wrong # args: should be "array exists arrayName"}\
  {array exists too many args}

eval_is {
  proc test {} {
      array set foo [list 1 2 3 4]
      return [array exists foo]
  }
  test
} 1 {array exists lexical}

eval_is {array size a b}\
  {wrong # args: should be "array size arrayName"}\
  {array size too many args}

eval_is {
 catch {unset a}
 set a(1) 1
 array size a
} 1 {array size 1}

eval_is {
 catch {unset a}
 set a(1) 1; set a(2) 2
 array size a
} 2 {array size 2}

eval_is {
 catch {unset a}
 set a 1
 array size a
} 0 {array not array}

eval_is {
 catch {unset a}
 array set a [list a b]
 set a(a)
} b {array set list}

eval_is {
 catch {unset a}
 array set a [list a b c d e f]
 list $a(a) $a(c) $a(e)
} {b d f} {array set multi list}

eval_is {
 catch {unset a}
 set a(a) b
 array set a [list c d e f]
 list $a(a) $a(c) $a(e)
} {b d f} {array set preserve old values}

eval_is {
 catch {unset a}
 array set a {a b}
 set a(a)
} b {array set}

eval_is {
 catch {unset a}
 array set a {a b c d e f}
 list $a(a) $a(c) $a(e)
} {b d f} {array set multi}

eval_is {array set a a}\
  {list must have an even number of elements}\
  {array set uneven}

eval_is {array set a [list a b]} \
  {}\
  {array set return value}

eval_is {
  catch {unset a}
  set a 44
  array set a {1 2 3 4}
} {can't set "a(1)": variable isn't array}\
  {array set not array}

eval_is {
  catch {unset a}
  array set a [list a b]
  array get a
} {a b} {array get}

eval_is {
  catch {unset a}
  array set a [list a {b c}]
  array get a
} {a {b c}} {array get, insure list results} \
  {TODO {currently using a string}}

eval_is {
  catch {unset a}
  array set a [list a b c d]
  array get a a
} {a b} {array get with pattern}

eval_is {
  catch {unset a}
  array set a [list apple 1 orange 2 aardvark 3]
  lsort [array get a a*]
} {1 3 aardvark apple}\
  {array get, with pattern}

eval_is {
  catch {unset a}
  array set a [list apple 1 orange 2 aardvark 3]
  array get a zippy*
} {} {array get, with bad pattern}

eval_is {
  catch {unset a}
  array get a
} {} {array get, bad array}

eval_is {
  catch {unset a}
  array get a a
} {} {array get, bad array with pattern}

eval_is {array get a b c}\
  {wrong # args: should be "array get arrayName ?pattern?"}\
  {array get, too many args}

eval_is {
  catch {unset a}
  array set a [list a b]
  list [array unset a] [array get a]
} {{} {}} {array unset, effect & return value}

eval_is {
  catch {unset a}
  array set a [list a b c d]
  list [array unset a a] [array get a]
} {{} {c d}} {array unset, with pattern & return value}

eval_is {
  catch {unset a}
  array set a [list apple 1 orange 2 aardvark 3]
  list [array unset a a*] [array get a]
} {{} {orange 2}} {array unset with pattern}

eval_is {
  catch {unset a}
  array set a [list apple 1 orange 2 aardvark 3]
  list [array unset a zippy*] [lsort [array get a]]
} {{} {1 2 3 aardvark apple orange}}\
  {array unset, with bad pattern}

eval_is {
  catch {unset a}
  array unset a
} {} {array unset, bad array}

eval_is {
  catch {unset a}
  array unset a monkey*
} {} {array unset, bad array, pattern}

eval_is {
  array unset monkey my monkey monkey
} {wrong # args: should be "array unset arrayName ?pattern?"}\
  {array unset, too many args}

eval_is {
  catch {unset a}
  array names a
} {} {array names, no array}

eval_is {
  catch {unset a}
  array set a [list {b c} a]
  array names a
} {{b c}} {array names, insure list results} \
  {TODO {currently using a string}}

eval_is {array names a b c} \
  {bad option "b": must be -exact, -glob, or -regexp} \
  {array names, bad option} \
  {SKIP {this test doesn't work in tclsh8.5...}}  

eval_is {array names a b c d}\
  {wrong # args: should be "array names arrayName ?mode? ?pattern?"}\
  {array names, too many args}

eval_is {
  catch {unset a}
  set a(monkey) see
  array names a
} {monkey} {array names, no pattern}

eval_is {
  catch {unset a}
  set a(monkey1) see
  set a(monkey2) do
  array names a monkey*
} {monkey1 monkey2}\
  {array names, default glob pattern}

eval_is {
  catch {unset a}
  set a(monkey1) see
  set a(monkey2) do
  array names a cat*
} {} {array names, default glob pattern failure}

eval_is {
  catch {unset a}
  set a(monkey1) see
  set a(monkey2) do
  array names a -glob monkey*
} {monkey1 monkey2} {array names, explicit glob pattern}

eval_is {
  catch {unset a}
  set a(monkey1) see
  set a(monkey2) do
  array names a -glob cat*
} {} {array names, explicit glob pattern failure}

eval_is {
  catch {unset a}
  set a(monkey1) see
  set a(monkey2) do
  array names a -exact monkey1
} {monkey1} {array names, explicit exact match}

eval_is {
  catch {unset a}
  set a(monkey1) see
  set a(monkey2) do
  array names a -exact cat5
} {} {array names, explicit exact match failure}

eval_is {
  catch {unset a}
  set a(monkey1) see
  set a(monkey2) do
  set a(ferret)  don't
  array names a -regexp ^mon.*
} {monkey1 monkey2} {array names, explicit regexp match}

eval_is {
  catch {unset a}
  set a(monkey1) see
  set a(monkey2) do
  array names a -regexp cat
} {} {array names, explicit regexp match failure}
