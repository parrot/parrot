#!perl

# the following lines re-execute this as a tcl script
# the \ at the end of these lines makes them a comment in tcl \
use lib qw(languages/tcl/lib tcl/lib lib ../lib ../../lib); # \
use Tcl::Test; #\
__DATA__

source lib/test_more.tcl

plan 13 ;# from outer space. (HAH!)

# [file exists]
eval_is {file exists} \
  {wrong # args: should be "file exists name"} \
  {[file exists] too few args}

eval_is {file exists foo bar} \
  {wrong # args: should be "file exists name"} \
  {[file exists] too many args}

# this should fail everywhere
is [file exists :%:/bar] 0 {[file exists] does not exist}

# we really should create a file to test this, but since our "source" line
# above means we have to have that path to this file..
is [file exists lib/test_more.tcl] 1 {[file exists] does exist}

# [file rootname]
eval_is {file rootname} \
  {wrong # args: should be "file rootname name"} \
  {[file rootname] too few args}
eval_is {file rootname foo bar} \
  {wrong # args: should be "file rootname name"} \
  {[file rootname] too many args}

is [file rootname file] file  \
  {[file rootname] filename only}

is [file rootname file.ext] file \
  {[file rootname] filename with extension}

is [file rootname f..i.le.ext] f..i.le \
  {[file rootname] filename with dots and extension}

# [file dirname]
eval_is {file dirname} \
  {wrong # args: should be "file dirname name"} \
  {[file dirname] too few args}
eval_is {file dirname foo bar} \
  {wrong # args: should be "file dirname name"} \
  {[file dirname] too many args}

is [file dirname .] .  \
  {[file dirname] dirname dot}

is [file dirname file.ext] .  \
  {[file dirname] dirname simple file}

