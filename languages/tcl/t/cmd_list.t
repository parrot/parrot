#!perl

# the following lines re-execute this as a tcl script
# the \ at the end of these lines makes them a comment in tcl \
use lib qw(languages/tcl/lib tcl/lib lib ../lib ../../lib); # \
use Tcl::Test; #\
__DATA__

source lib/test_more.tcl

plan 18

is [list]     {}    {no elements}
is [list a]   {a}   {one element}
is [list a b] {a b} {two elements}

is [list a b {c {d e}}] {a b {c {d e}}} {spaces with braces}
is [list a b "c {d e}"] {a b {c {d e}}} {spaces with quotes}
is [list {1 2} {3 4}]   {{1 2} {3 4}}   {spaces in two elements}

is [list "} {"] {\}\ \{} {braces with spaces}
is [list \{ \}] {\{ \}}  {braces}

is [list "\n"]  "{\n}" {newline}
is [list ";"]   {{;}}  {semicolon}
is [list "\t"]  "{\t}" {tab}
is [list "$"]   {{$}}  {dollar}
is [list "\\"]  {\\}   {backslash}
is [list \[]    {{[}}  {open bracket}
is [list \]]    {\]}   {close bracket}

# hashes are protected only if they're the first char in the first element.
is [list #]     {{#}}    {comment hash}
is [list #foo]  {{#foo}} {comment hash}
is [list #foo #bar]  {{#foo} #bar} {comment hash}
