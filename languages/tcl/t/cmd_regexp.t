#!perl

# the following lines re-execute this as a tcl script
# the \ at the end of these lines makes them a comment in tcl \
use lib qw(languages/tcl/lib tcl/lib lib ../lib ../../lib); # \
use Tcl::Test; #\
__DATA__

source lib/test_more.tcl
plan 7

proc regexp_is {pattern string reason} {
    eval_is "regexp {$pattern} {$string}" 1 $reason 
}

proc regexp_isnt {pattern string reason} {
    eval_is "regexp {$pattern} {$string}" 0 $reason 
}

eval_is {regexp} \
  {wrong # args: should be "regexp ?switches? exp string ?matchVar? ?subMatchVar subMatchVar ...?"} {no args}

# http://www.tcl.tk/man/tcl8.5/TclCmd/re_syntax.htm

regexp_is   asdf asdf "literal, t"
regexp_isnt asdf fdsa "literal, f"

regexp_is a* bbb   "*, true"
regexp_is a* bab   "*, true"
regexp_is a* baab  "*, true"
regexp_is a* baaab "*, true"

# +

# ?

# {m}

# {m,}

# {m,n}

# *?

# +?

# {m}?

# {m,}?

# {m,n}?

# m,n - restricted to 0, 255

#(re)

#(?:re)

#()

#(?:)

#[]

#[^]

#[a-z]

#[a-c-e] (boom)

#[:joe:]

#[[:<:]]

#[[:>:]]

#.

#\k

#\c

#{

#x

#^

#$

#(?=re)

#(?!re)

# Re may NOT end with \

# \a

# \b

# \B

# \cX

# \e

# \f

# \n

# \r

# \t

# \uwxyz

# \Ustuvwxyz

# \v

# \xhhh

# \0

# \xy

# \xyz

# \d

# \s

# \w

# \D

# \S

# \W

# Interaction of [] and \d: e.g. [a-c\d] vs. [a-c\D]

# \A

# \m

# \M

# \y

# \Y

# \Z

# \m

# \mnn

# ***  (ARE)

# ***= (literal)

# (?b)

# (?c)

# (?e)

# (?i)

# (?m)

# (?n)

# (?p)

# (?q)

# (?s)

# (?t)

# (?w)

# (?x)

# Match earliest.

# Match longest

# BRE: |

# BRE: +

# BRE: ?

# BRE: \{

# BRE: \}

# BRE: \(

# BRE: \)

# BRE: ^

# BRE: $

# BRE: *

# BRE: \<

# BRE: \>

# -expanded

# -indices

# -line

# -linestop

# -lineanchor

# -nocase

# -all

# -inline

# -start

# --

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
