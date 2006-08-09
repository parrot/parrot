#!/usr/bin/perl

use strict;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;

language_output_is('cardinal', <<'CODE', <<'OUT', 'simple conditional test');
class ClassA
  puts "Evaluating class"

  def initialize
    @a = 10
  end

  def a
    puts @a
  end
end

aobj = ClassA.new
aobj.a
CODE
OUT
