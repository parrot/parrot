#!/usr/bin/perl

use strict;
use lib qw(../../../lib .);
use Test::More tests => 9;
use run_tcl;

my($tcl,$expected);

$tcl = <<'EOTCL';
 if { 1 == 1 } {
   puts true
 } {
   puts false
 }
EOTCL
$expected = <<EOL;
true
EOL
is(output($tcl),$expected,"simple if");

$tcl = <<'EOTCL';
 if { 1 == 1 } {
   puts true
 } else {
   puts false
 }
EOTCL
$expected = <<EOL;
true
EOL
is(output($tcl),$expected,"simple if with else");

$tcl = <<'EOTCL';
 if { 1 != 1 } then {
   puts true
 } {
   puts false
 }
EOTCL
$expected = <<EOL;
false
EOL
is(output($tcl),$expected,"simple if with then");

$tcl = <<'EOTCL';
 if { 1 == 1 } then {
   puts true
 } else {
   puts false
 }
EOTCL
$expected = <<EOL;
true
EOL
is(output($tcl),$expected,"simple if with then, else");

$tcl = <<'EOTCL';
 if { 1 != 1 } then {
   puts true
 } elseif { 2==2 } {
   puts blue
 }
EOTCL
$expected = <<EOL;
blue
EOL
is(output($tcl),$expected,"simple if with then, elseif");

$tcl = <<'EOTCL';
 if { 1 != 1 } then {
   puts true
 } elseif { 2 != 2 } {
   puts blue
 } else {
   puts whee
 }
EOTCL
$expected = <<EOL;
whee
EOL
is(output($tcl),$expected,"simple if with then, elseif,else");

$tcl = <<'EOTCL';
 if { 1 != 1 } {
   puts true
 } elseif { 2 != 2 } {
   puts blue
 } {
   puts whee
 }
EOTCL
$expected = <<EOL;
whee
EOL
is(output($tcl),$expected,"simple if with elseif,implicit else");

$tcl = <<'EOTCL';
 if { 1 != 1 } {
   puts true
 }
EOTCL
$expected = "";
is(output($tcl),$expected,"simple if with implicit then, false");

$tcl = <<'EOTCL';
 if { 1 == 1 } {
   puts true
 }
EOTCL
$expected = <<EOL;
true
EOL
is(output($tcl),$expected,"simple if with implicit then, true");
