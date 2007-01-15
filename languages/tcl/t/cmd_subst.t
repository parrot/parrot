#!perl

# the following lines re-execute this as a tcl script
# the \ at the end of these lines makes them a comment in tcl \
use lib qw(languages/tcl/lib tcl/lib lib ../lib ../../lib); # \
use Tcl::Test; #\
__DATA__

source lib/test_more.tcl
plan 14

eval_is {subst} \
  {wrong # args: should be "subst ?-nobackslashes? ?-nocommands? ?-novariables? string"} \
  {too few args}

eval_is {subst foo bar} \
  {bad switch "foo": must be -nobackslashes, -nocommands, or -novariables} \
  {too many args}

set foo ba
is [subst                {{$foo}}]   {{ba}} {subst: variable}
is [subst -nobackslashes {{$foo}}]   {{ba}} {subst -nobackslashes: variable}
is [subst -nocommands    {{$foo}}]   {{ba}} {subst -nocommands: variable}
is [subst -novariables   {{$foo}}] {{$foo}} {subst -novariables: variable}

is [subst                {{[set foo]}}] {{ba}} {subst: command}
is [subst -nobackslashes {{[set foo]}}] {{ba}} {subst -nobackslashes: command}
is [subst -nocommands    {{[set foo]}}] {{[set foo]}} {subst -nocommands: command}
is [subst -novariables   {{[set foo]}}] {{ba}} {subst -novariables: command}

is [subst {{\$foo \[set foo]}}]          {{$foo [set foo]}} {subst: backslash}
is [subst -nobackslashes {{\$foo \[set foo]}}]  {{\ba \ba}} {subst -nobackslashes: backslash}
is [subst -nocommands    {{\$foo}}]                {{$foo}} {subst -nobackslashes: backslash}
is [subst -novariables   {{\[set foo]}}]      {{[set foo]}} {subst -nobackslashes: backslash}
