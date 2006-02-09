#!/usr/bin/perl

use strict;
use lib qw(tcl/lib ./lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 2;
use Test::More;

language_output_is("tcl",<<'TCL',<<OUT,"flush no args");
 flush
TCL
wrong # args: should be flush "channelId"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"flush too many args");
 flush the monkeys
TCL
wrong # args: should be flush "channelId"
OUT

# XXX test actual flushing.
