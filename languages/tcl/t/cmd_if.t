#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 9;

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
language_output_is("tcl",$tcl,$expected,"simple if");

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
language_output_is("tcl",$tcl,$expected,"simple if with else");

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
language_output_is("tcl",$tcl,$expected,"simple if with then");

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
language_output_is("tcl",$tcl,$expected,"simple if with then, else");

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
language_output_is("tcl",$tcl,$expected,"simple if with then, elseif");

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
language_output_is("tcl",$tcl,$expected,"simple if with then, elseif,else");

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
language_output_is("tcl",$tcl,$expected,"simple if with elseif, implicit else");

$tcl = <<'EOTCL';
 if { 1 != 1 } {
   puts true
 }
EOTCL
$expected = "";
language_output_is("tcl",$tcl,$expected,"simple if with implicit then, false");

$tcl = <<'EOTCL';
 if { 1 == 1 } {
   puts true
 }
EOTCL
$expected = <<EOL;
true
EOL
language_output_is("tcl",$tcl,$expected,"simple if with implicit then, true");
