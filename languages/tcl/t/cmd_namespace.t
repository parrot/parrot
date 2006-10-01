#!/usr/bin/perl

use strict;
use lib qw(tcl/lib ./lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 36;
use Test::More;
use vars qw($TODO);

language_output_is( "tcl", <<'TCL', <<OUT, "namespace: no args" );
   namespace
TCL
wrong # args: should be "namespace subcommand ?arg ...?"
OUT

language_output_is( "tcl", <<'TCL', <<OUT, "namespace: bad subcommand" );
   namespace asdf
TCL
bad option "asdf": must be children, code, current, delete, eval, exists, export, forget, import, inscope, origin, parent, qualifiers, tail, or which
OUT

language_output_is( "tcl", <<'TCL', <<OUT, "namespace qualifiers: no args" );
   namespace qualifiers
TCL
wrong # args: should be "namespace qualifiers string"
OUT

language_output_is( "tcl", <<'TCL', <<OUT, "namespace qualifiers: too many args" );
   namespace qualifiers string string
TCL
wrong # args: should be "namespace qualifiers string"
OUT

language_output_is( "tcl", <<'TCL', <<OUT, "namespace qualifiers: simple" );
   puts [namespace qualifiers ::a::b::c]
TCL
::a::b
OUT

language_output_is( "tcl", <<'TCL', <<OUT, "namespace qualifiers: extra colons" );
   puts [namespace qualifiers :::a:::b::c]
TCL
:::a:::b
OUT

language_output_is( "tcl", <<'TCL', <<OUT, "namespace tail: no args" );
   namespace tail
TCL
wrong # args: should be "namespace tail string"
OUT

language_output_is( "tcl", <<'TCL', <<OUT, "namespace qualifiers: too many args" );
   namespace tail string string
TCL
wrong # args: should be "namespace tail string"
OUT

language_output_is( "tcl", <<'TCL', <<OUT, "namespace tail: simple" );
   puts [namespace tail ::a::b::c]
TCL
c
OUT

language_output_is( "tcl", <<'TCL', <<OUT, "namespace tail: extra colons" );
   puts [namespace tail :::a:::b::c]
TCL
c
OUT

language_output_is( "tcl", <<'TCL', <<OUT, "namespace exists: no args" );
   namespace exists
TCL
wrong # args: should be "namespace exists name"
OUT

language_output_is( "tcl", <<'TCL', <<OUT, "namespace exists: too many args" );
   namespace exists a a
TCL
wrong # args: should be "namespace exists name"
OUT

language_output_is( "tcl", <<'TCL', <<OUT, "namespace exists: failure" );
   puts [namespace exists a]
TCL
0
OUT

language_output_is( "tcl", <<'TCL', <<OUT, "namespace exists: global implicit" );
   puts [namespace exists {}]
TCL
1
OUT

language_output_is( "tcl", <<'TCL', <<OUT, "namespace exists: global explicit" );
   puts [namespace exists ::]
TCL
1
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', "namespace eval - bad args" );
  namespace eval foo
TCL
wrong # args: should be "namespace eval name arg ?arg...?"
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', "namespace eval foo {}" );
  namespace eval foo {}
  puts [namespace exists foo]
TCL
1
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', "namespace eval foo {}" );
  namespace eval foo { proc bar {} {puts ok} }
  foo::bar
TCL
ok
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', "namespace eval foo { namespace eval bar {} }" );
  namespace eval foo {
    namespace eval bar {
      proc baz {} {puts ok}
    }
  }
  foo::bar::baz
TCL
ok
OUT

language_output_is( 'tcl', <<'TCL', <<'OUT', 'namespace eval - return value' );
puts [namespace eval foo {
    set a ok
    set a
}]
TCL
ok
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', "namespace delete foo bar" );
  namespace eval foo {}
  namespace eval bar {}
  puts [namespace exists foo]
  puts [namespace exists bar]
  namespace delete foo bar
  puts [namespace exists foo]
  puts [namespace exists bar]
TCL
1
1
0
0
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', "namespace current - too many args" );
namespace current foo
TCL
wrong # args: should be "namespace current"
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', "namespace current - global" );
  puts [namespace current]
TCL
::
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', "namespace current - ::foo" );
  namespace eval foo { proc test {} {puts [namespace current]} }
  foo::test
TCL
::foo
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', "namespace parent ::" );
  puts [namespace parent ""]
TCL

OUT

language_output_is( "tcl", <<'TCL', <<'OUT', "namespace parent ::foo" );
  namespace eval foo {}
  puts [namespace parent foo]
TCL
::
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', "namespace parent - ::foo" );
namespace eval foo {puts [namespace parent]}
TCL
::
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', "namespace parent - too many args" );
  namespace parent foo bar
TCL
wrong # args: should be "namespace parent ?name?"
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', "namespace children - too many args" );
  namespace children a b c
TCL
wrong # args: should be "namespace children ?name? ?pattern?"
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', "namespace children, no args" );
  puts [namespace children]
TCL
::tcl
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', "namespace children, ::" );
  puts [namespace children ::]
TCL
::tcl
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', "namespace children after eval, ordering" );
  namespace eval Bob {}
  namespace eval audreyt {}
  puts [namespace children ::]
TCL
::audreyt ::Bob ::tcl
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', "namespace children, multiple levels " );
  namespace eval audreyt { namespace eval Bob {} }
  puts [namespace children]
  puts [namespace children ::audreyt]
TCL
::audreyt ::tcl
::audreyt::Bob
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', "namespace children, bad namespace" );
  namespace children what?
TCL
unknown namespace "what?" in namespace children command
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', "namespace children, pattern" );
  puts [namespace children :: *t*]
TCL
::tcl
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', "namespace children, missed pattern" );
  puts [namespace children :: a]
TCL

OUT

