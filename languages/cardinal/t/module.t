#!/usr/bin/perl

use strict;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 2;

language_output_is('cardinal', <<'CODE', <<'OUT', 'simple module test');
module Test
  class Assertion1 < Exception; end
  class Assertion2 < Exception; end
  class Assertion3 < Exception; end
  class Assertion4 < Exception; end
end
CODE
OUT

language_output_is('cardinal', <<'CODE', <<'OUT', 'simple module test');
module Test
  class Assertion < Exception; end

  class Unit
    def self.autotest
    end

    class TestCase
      def setup; end
      def teardown; end
    end # class TestCase
  end # class Unit
end # module Test
CODE
OUT
