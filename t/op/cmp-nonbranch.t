#!perl
# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 77;


=head1 NAME

t/op/cmp-nonbranch.t - Non-branching conditionals

=head1 SYNOPSIS

        % prove t/op/cmp-nonbranch.t

=head1 DESCRIPTION

Tests all non-branching conditional operators.

=cut


pir_output_is(<<'CODE', <<OUTPUT, 'issame: failure and success');
.sub 'test' :main
  init:
    $P0 = new .Integer
    $P1 = new .String
    bsr test_it   # not ok
    $P0 = new .String
    bsr test_it   # not ok
    $P1 = $P0
    bsr test_it   # ok
    $P0 = new .Null
    $P1 = new .Null
    bsr test_it   # ok -- Null is a singleton
    end

  test_it:
    $I0 = issame $P0, $P1

  test:
    if $I0 goto ok
  nok:
    print 'not '
  ok:
    print "ok\n"
    ret
.end
CODE
not ok
not ok
ok
ok
OUTPUT


pir_output_is(<<'CODE', <<OUTPUT, 'isntsame: failure and success');
.sub 'test' :main
  init:
    $P0 = new .Integer
    $P1 = new .String
    bsr test_it   # ok
    $P0 = new .String
    bsr test_it   # ok
    $P1 = $P0
    bsr test_it   # not ok
    $P0 = new .Null
    $P1 = new .Null
    bsr test_it   # not ok -- Null is a singleton
    end

  test_it:
    $I0 = isntsame $P0, $P1

  test:
    if $I0 goto ok
  nok:
    print 'not '
  ok:
    print "ok\n"
    ret
.end
CODE
ok
ok
not ok
not ok
OUTPUT


pir_output_is(<<'CODE', <<OUTPUT, 'istrue: failure and success');
.sub 'test' :main
  init:
    $P0 = new .Integer
    $P0 = 0
    bsr test_it   # not ok
    $P0 = 1
    bsr test_it   # ok
    end

  test_it:
    $I0 = istrue $P0

  test:
    if $I0 goto ok
  nok:
    print 'not '
  ok:
    print "ok\n"
    ret
.end
CODE
not ok
ok
OUTPUT



pir_output_is(<<'CODE', <<OUTPUT, 'isfalse: failure and success');
.sub 'test' :main
  init:
    $P0 = new .Integer
    $P0 = 0
    bsr test_it   # ok
    $P0 = 1
    bsr test_it   # not ok
    end

  test_it:
    $I0 = isfalse $P0

  test:
    if $I0 goto ok
  nok:
    print 'not '
  ok:
    print "ok\n"
    ret
.end
CODE
ok
not ok
OUTPUT



pir_output_is(<<'CODE', <<OUTPUT, 'isnull: failure and success');
.sub 'test' :main
  init:
    $S0 = 'FUBAR'
    bsr test_it
    $S0 = 'Null' # this is a valid pmc type -- you can't trick parrot :)
    bsr test_it
    $S0 = 'Integer'
    bsr test_it
    end

  test_it:
    $I0 = 0
    push_eh fubar
    $I1 = find_type $S0
    new $P0, $I1
    clear_eh
    goto test

  fubar:
    $I0 = isnull $P0

  test:
    if $I0 goto ok
  nok:
    print 'not '
  ok:
    print "ok\n"
    ret
.end
CODE
ok
not ok
not ok
OUTPUT


pasm_output_is(<<'CODE', <<OUTPUT, "isgt_i_i_i");
        set I1, 111
        set I2, 222
        set I3, 333
        isgt I1, I2, I3
        print I1
        set I2, I3
        isgt I1, I2, I3
        print I1
        inc I2
        isgt I1, I2, I3
        print I1
        print "\n"
        end
CODE
001
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isgt_i_ic_i");
        set I1, 111
        set I3, 333
        isgt I1, 222, I3
        print I1
        isgt I1, 333, I3
        print I1
        isgt I1, 334, I3
        print I1
        print "\n"
        end
CODE
001
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isgt_i_i_ic");
        set I1, 111
        set I2, 222
        isgt I1, I2, 223
        print I1
        isgt I1, I2, 222
        print I1
        isgt I1, I2, 221
        print I1
        print "\n"
        end
CODE
001
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isgt_i_ic_ic");
        set I1, 111
        isgt I1, 222, 223
        print I1
        isgt I1, 222, 222
        print I1
        isgt I1, 222, 221
        print I1
        print "\n"
        end
CODE
001
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isgt_i_n_n");
        set I1, 111
        set N2, 2.22
        set N3, 3.33
        isgt I1, N2, N3
        print I1
        set N2, N3
        isgt I1, N2, N3
        print I1
        inc N2
        isgt I1, N2, N3
        print I1
        print "\n"
        end
CODE
001
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isgt_i_nc_n");
        set I1, 111
        set N3, 3.33
        isgt I1, 2.22, N3
        print I1
        isgt I1, 3.33, N3
        print I1
        isgt I1, 3.34, N3
        print I1
        print "\n"
        end
CODE
001
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isgt_i_n_nc");
        set I1, 111
        set N2, 2.22
        isgt I1, N2, 2.23
        print I1
        isgt I1, N2, 2.22
        print I1
        isgt I1, N2, 2.21
        print I1
        print "\n"
        end
CODE
001
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isgt_i_nc_nc");
        set I1, 111
        isgt I1, 2.22, 2.23
        print I1
        isgt I1, 2.22, 2.22
        print I1
        isgt I1, 2.22, 2.21
        print I1
        print "\n"
        end
CODE
001
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isgt_i_s_s");
        set I1, 111
        set S2, "Aaa"
        set S3, "Bbb"
        isgt I1, S2, S3
        print I1
        set S2, S3
        isgt I1, S2, S3
        print I1
        set S2, "Ccc"
        isgt I1, S2, S3
        print I1
        print "\n"
        end
CODE
001
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isgt_i_sc_s");
        set I1, 111
        set S3, "Bbb"
        isgt I1, "Aaa", S3
        print I1
        isgt I1, "Bbb", S3
        print I1
        isgt I1, "Ccc", S3
        print I1
        print "\n"
        end
CODE
001
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isgt_i_s_sc");
        set I1, 111
        set S2, "Bbb"
        isgt I1, S2, "Ccc"
        print I1
        isgt I1, S2, "Bbb"
        print I1
        isgt I1, S2, "Aaa"
        print I1
        print "\n"
        end
CODE
001
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isgt_i_sc_sc");
        set I1, 111
        isgt I1, "Bbb", "Ccc"
        print I1
        isgt I1, "Bbb", "Bbb"
        print I1
        isgt I1, "Bbb", "Aaa"
        print I1
        print "\n"
        end
CODE
001
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isge_i_i_i");
        set I1, 111
        set I2, 222
        set I3, 333
        isge I1, I2, I3
        print I1
        set I2, I3
        isge I1, I2, I3
        print I1
        inc I2
        isge I1, I2, I3
        print I1
        print "\n"
        end
CODE
011
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isge_i_ic_i");
        set I1, 111
        set I3, 333
        isge I1, 222, I3
        print I1
        isge I1, 333, I3
        print I1
        isge I1, 334, I3
        print I1
        print "\n"
        end
CODE
011
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isge_i_i_ic");
        set I1, 111
        set I2, 222
        isge I1, I2, 223
        print I1
        isge I1, I2, 222
        print I1
        isge I1, I2, 221
        print I1
        print "\n"
        end
CODE
011
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isge_i_ic_ic");
        set I1, 111
        isge I1, 222, 223
        print I1
        isge I1, 222, 222
        print I1
        isge I1, 222, 221
        print I1
        print "\n"
        end
CODE
011
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isge_i_n_n");
        set I1, 111
        set N2, 2.22
        set N3, 3.33
        isge I1, N2, N3
        print I1
        set N2, N3
        isge I1, N2, N3
        print I1
        inc N2
        isge I1, N2, N3
        print I1
        print "\n"
        end
CODE
011
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isge_i_nc_n");
        set I1, 111
        set N3, 3.33
        isge I1, 2.22, N3
        print I1
        isge I1, 3.33, N3
        print I1
        isge I1, 3.34, N3
        print I1
        print "\n"
        end
CODE
011
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isge_i_n_nc");
        set I1, 111
        set N2, 2.22
        isge I1, N2, 2.23
        print I1
        isge I1, N2, 2.22
        print I1
        isge I1, N2, 2.21
        print I1
        print "\n"
        end
CODE
011
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isge_i_nc_nc");
        set I1, 111
        isge I1, 2.22, 2.23
        print I1
        isge I1, 2.22, 2.22
        print I1
        isge I1, 2.22, 2.21
        print I1
        print "\n"
        end
CODE
011
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isge_i_s_s");
        set I1, 111
        set S2, "Aaa"
        set S3, "Bbb"
        isge I1, S2, S3
        print I1
        set S2, S3
        isge I1, S2, S3
        print I1
        set S2, "Ccc"
        isge I1, S2, S3
        print I1
        print "\n"
        end
CODE
011
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isge_i_sc_s");
        set I1, 111
        set S3, "Bbb"
        isge I1, "Aaa", S3
        print I1
        isge I1, "Bbb", S3
        print I1
        isge I1, "Ccc", S3
        print I1
        print "\n"
        end
CODE
011
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isge_i_s_sc");
        set I1, 111
        set S2, "Bbb"
        isge I1, S2, "Ccc"
        print I1
        isge I1, S2, "Bbb"
        print I1
        isge I1, S2, "Aaa"
        print I1
        print "\n"
        end
CODE
011
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isge_i_sc_sc");
        set I1, 111
        isge I1, "Bbb", "Ccc"
        print I1
        isge I1, "Bbb", "Bbb"
        print I1
        isge I1, "Bbb", "Aaa"
        print I1
        print "\n"
        end
CODE
011
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isle_i_i_i");
        set I1, 111
        set I2, 222
        set I3, 333
        isle I1, I2, I3
        print I1
        set I2, I3
        isle I1, I2, I3
        print I1
        inc I2
        isle I1, I2, I3
        print I1
        print "\n"
        end
CODE
110
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isle_i_ic_i");
        set I1, 111
        set I3, 333
        isle I1, 222, I3
        print I1
        isle I1, 333, I3
        print I1
        isle I1, 334, I3
        print I1
        print "\n"
        end
CODE
110
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isle_i_i_ic");
        set I1, 111
        set I2, 222
        isle I1, I2, 223
        print I1
        isle I1, I2, 222
        print I1
        isle I1, I2, 221
        print I1
        print "\n"
        end
CODE
110
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isle_i_ic_ic");
        set I1, 111
        isle I1, 222, 223
        print I1
        isle I1, 222, 222
        print I1
        isle I1, 222, 221
        print I1
        print "\n"
        end
CODE
110
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isle_i_n_n");
        set I1, 111
        set N2, 2.22
        set N3, 3.33
        isle I1, N2, N3
        print I1
        set N2, N3
        isle I1, N2, N3
        print I1
        inc N2
        isle I1, N2, N3
        print I1
        print "\n"
        end
CODE
110
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isle_i_nc_n");
        set I1, 111
        set N3, 3.33
        isle I1, 2.22, N3
        print I1
        isle I1, 3.33, N3
        print I1
        isle I1, 3.34, N3
        print I1
        print "\n"
        end
CODE
110
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isle_i_n_nc");
        set I1, 111
        set N2, 2.22
        isle I1, N2, 2.23
        print I1
        isle I1, N2, 2.22
        print I1
        isle I1, N2, 2.21
        print I1
        print "\n"
        end
CODE
110
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isle_i_nc_nc");
        set I1, 111
        isle I1, 2.22, 2.23
        print I1
        isle I1, 2.22, 2.22
        print I1
        isle I1, 2.22, 2.21
        print I1
        print "\n"
        end
CODE
110
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isle_i_s_s");
        set I1, 111
        set S2, "Aaa"
        set S3, "Bbb"
        isle I1, S2, S3
        print I1
        set S2, S3
        isle I1, S2, S3
        print I1
        set S2, "Ccc"
        isle I1, S2, S3
        print I1
        print "\n"
        end
CODE
110
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isle_i_sc_s");
        set I1, 111
        set S3, "Bbb"
        isle I1, "Aaa", S3
        print I1
        isle I1, "Bbb", S3
        print I1
        isle I1, "Ccc", S3
        print I1
        print "\n"
        end
CODE
110
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isle_i_s_sc");
        set I1, 111
        set S2, "Bbb"
        isle I1, S2, "Ccc"
        print I1
        isle I1, S2, "Bbb"
        print I1
        isle I1, S2, "Aaa"
        print I1
        print "\n"
        end
CODE
110
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isle_i_sc_sc");
        set I1, 111
        isle I1, "Bbb", "Ccc"
        print I1
        isle I1, "Bbb", "Bbb"
        print I1
        isle I1, "Bbb", "Aaa"
        print I1
        print "\n"
        end
CODE
110
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "islt_i_i_i");
        set I1, 111
        set I2, 222
        set I3, 333
        islt I1, I2, I3
        print I1
        set I2, I3
        islt I1, I2, I3
        print I1
        inc I2
        islt I1, I2, I3
        print I1
        print "\n"
        end
CODE
100
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "islt_i_ic_i");
        set I1, 111
        set I3, 333
        islt I1, 222, I3
        print I1
        islt I1, 333, I3
        print I1
        islt I1, 334, I3
        print I1
        print "\n"
        end
CODE
100
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "islt_i_i_ic");
        set I1, 111
        set I2, 222
        islt I1, I2, 223
        print I1
        islt I1, I2, 222
        print I1
        islt I1, I2, 221
        print I1
        print "\n"
        end
CODE
100
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "islt_i_ic_ic");
        set I1, 111
        islt I1, 222, 223
        print I1
        islt I1, 222, 222
        print I1
        islt I1, 222, 221
        print I1
        print "\n"
        end
CODE
100
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "islt_i_n_n");
        set I1, 111
        set N2, 2.22
        set N3, 3.33
        islt I1, N2, N3
        print I1
        set N2, N3
        islt I1, N2, N3
        print I1
        inc N2
        islt I1, N2, N3
        print I1
        print "\n"
        end
CODE
100
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "islt_i_nc_n");
        set I1, 111
        set N3, 3.33
        islt I1, 2.22, N3
        print I1
        islt I1, 3.33, N3
        print I1
        islt I1, 3.34, N3
        print I1
        print "\n"
        end
CODE
100
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "islt_i_n_nc");
        set I1, 111
        set N2, 2.22
        islt I1, N2, 2.23
        print I1
        islt I1, N2, 2.22
        print I1
        islt I1, N2, 2.21
        print I1
        print "\n"
        end
CODE
100
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "islt_i_nc_nc");
        set I1, 111
        islt I1, 2.22, 2.23
        print I1
        islt I1, 2.22, 2.22
        print I1
        islt I1, 2.22, 2.21
        print I1
        print "\n"
        end
CODE
100
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "islt_i_s_s");
        set I1, 111
        set S2, "Aaa"
        set S3, "Bbb"
        islt I1, S2, S3
        print I1
        set S2, S3
        islt I1, S2, S3
        print I1
        set S2, "Ccc"
        islt I1, S2, S3
        print I1
        print "\n"
        end
CODE
100
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "islt_i_sc_s");
        set I1, 111
        set S3, "Bbb"
        islt I1, "Aaa", S3
        print I1
        islt I1, "Bbb", S3
        print I1
        islt I1, "Ccc", S3
        print I1
        print "\n"
        end
CODE
100
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "islt_i_s_sc");
        set I1, 111
        set S2, "Bbb"
        islt I1, S2, "Ccc"
        print I1
        islt I1, S2, "Bbb"
        print I1
        islt I1, S2, "Aaa"
        print I1
        print "\n"
        end
CODE
100
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "islt_i_sc_sc");
        set I1, 111
        islt I1, "Bbb", "Ccc"
        print I1
        islt I1, "Bbb", "Bbb"
        print I1
        islt I1, "Bbb", "Aaa"
        print I1
        print "\n"
        end
CODE
100
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "iseq_i_i_i");
        set I1, 111
        set I2, 222
        set I3, 333
        iseq I1, I2, I3
        print I1
        set I2, I3
        iseq I1, I2, I3
        print I1
        inc I2
        iseq I1, I2, I3
        print I1
        print "\n"
        end
CODE
010
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "iseq_i_ic_i");
        set I1, 111
        set I3, 333
        iseq I1, 222, I3
        print I1
        iseq I1, 333, I3
        print I1
        iseq I1, 334, I3
        print I1
        print "\n"
        end
CODE
010
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "iseq_i_i_ic");
        set I1, 111
        set I2, 222
        iseq I1, I2, 223
        print I1
        iseq I1, I2, 222
        print I1
        iseq I1, I2, 221
        print I1
        print "\n"
        end
CODE
010
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "iseq_i_ic_ic");
        set I1, 111
        iseq I1, 222, 223
        print I1
        iseq I1, 222, 222
        print I1
        iseq I1, 222, 221
        print I1
        print "\n"
        end
CODE
010
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "iseq_i_n_n");
        set I1, 111
        set N2, 2.22
        set N3, 3.33
        iseq I1, N2, N3
        print I1
        set N2, N3
        iseq I1, N2, N3
        print I1
        inc N2
        iseq I1, N2, N3
        print I1
        print "\n"
        end
CODE
010
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "iseq_i_nc_n");
        set I1, 111
        set N3, 3.33
        iseq I1, 2.22, N3
        print I1
        iseq I1, 3.33, N3
        print I1
        iseq I1, 3.34, N3
        print I1
        print "\n"
        end
CODE
010
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "iseq_i_n_nc");
        set I1, 111
        set N2, 2.22
        iseq I1, N2, 2.23
        print I1
        iseq I1, N2, 2.22
        print I1
        iseq I1, N2, 2.21
        print I1
        print "\n"
        end
CODE
010
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "iseq_i_nc_nc");
        set I1, 111
        iseq I1, 2.22, 2.23
        print I1
        iseq I1, 2.22, 2.22
        print I1
        iseq I1, 2.22, 2.21
        print I1
        print "\n"
        end
CODE
010
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "iseq_i_s_s");
        set I1, 111
        set S2, "Aaa"
        set S3, "Bbb"
        iseq I1, S2, S3
        print I1
        set S2, S3
        iseq I1, S2, S3
        print I1
        set S2, "Ccc"
        iseq I1, S2, S3
        print I1
        print "\n"
        end
CODE
010
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "iseq_i_sc_s");
        set I1, 111
        set S3, "Bbb"
        iseq I1, "Aaa", S3
        print I1
        iseq I1, "Bbb", S3
        print I1
        iseq I1, "Ccc", S3
        print I1
        print "\n"
        end
CODE
010
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "iseq_i_s_sc");
        set I1, 111
        set S2, "Bbb"
        iseq I1, S2, "Ccc"
        print I1
        iseq I1, S2, "Bbb"
        print I1
        iseq I1, S2, "Aaa"
        print I1
        print "\n"
        end
CODE
010
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "iseq_i_sc_sc");
        set I1, 111
        iseq I1, "Bbb", "Ccc"
        print I1
        iseq I1, "Bbb", "Bbb"
        print I1
        iseq I1, "Bbb", "Aaa"
        print I1
        print "\n"
        end
CODE
010
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isne_i_i_i");
        set I1, 111
        set I2, 222
        set I3, 333
        isne I1, I2, I3
        print I1
        set I2, I3
        isne I1, I2, I3
        print I1
        inc I2
        isne I1, I2, I3
        print I1
        print "\n"
        end
CODE
101
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isne_i_ic_i");
        set I1, 111
        set I3, 333
        isne I1, 222, I3
        print I1
        isne I1, 333, I3
        print I1
        isne I1, 334, I3
        print I1
        print "\n"
        end
CODE
101
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isne_i_i_ic");
        set I1, 111
        set I2, 222
        isne I1, I2, 223
        print I1
        isne I1, I2, 222
        print I1
        isne I1, I2, 221
        print I1
        print "\n"
        end
CODE
101
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isne_i_ic_ic");
        set I1, 111
        isne I1, 222, 223
        print I1
        isne I1, 222, 222
        print I1
        isne I1, 222, 221
        print I1
        print "\n"
        end
CODE
101
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isne_i_n_n");
        set I1, 111
        set N2, 2.22
        set N3, 3.33
        isne I1, N2, N3
        print I1
        set N2, N3
        isne I1, N2, N3
        print I1
        inc N2
        isne I1, N2, N3
        print I1
        print "\n"
        end
CODE
101
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isne_i_nc_n");
        set I1, 111
        set N3, 3.33
        isne I1, 2.22, N3
        print I1
        isne I1, 3.33, N3
        print I1
        isne I1, 3.34, N3
        print I1
        print "\n"
        end
CODE
101
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isne_i_n_nc");
        set I1, 111
        set N2, 2.22
        isne I1, N2, 2.23
        print I1
        isne I1, N2, 2.22
        print I1
        isne I1, N2, 2.21
        print I1
        print "\n"
        end
CODE
101
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isne_i_nc_nc");
        set I1, 111
        isne I1, 2.22, 2.23
        print I1
        isne I1, 2.22, 2.22
        print I1
        isne I1, 2.22, 2.21
        print I1
        print "\n"
        end
CODE
101
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isne_i_s_s");
        set I1, 111
        set S2, "Aaa"
        set S3, "Bbb"
        isne I1, S2, S3
        print I1
        set S2, S3
        isne I1, S2, S3
        print I1
        set S2, "Ccc"
        isne I1, S2, S3
        print I1
        print "\n"
        end
CODE
101
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isne_i_sc_s");
        set I1, 111
        set S3, "Bbb"
        isne I1, "Aaa", S3
        print I1
        isne I1, "Bbb", S3
        print I1
        isne I1, "Ccc", S3
        print I1
        print "\n"
        end
CODE
101
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isne_i_s_sc");
        set I1, 111
        set S2, "Bbb"
        isne I1, S2, "Ccc"
        print I1
        isne I1, S2, "Bbb"
        print I1
        isne I1, S2, "Aaa"
        print I1
        print "\n"
        end
CODE
101
OUTPUT

pasm_output_is(<<'CODE', <<OUTPUT, "isne_i_sc_sc");
        set I1, 111
        isne I1, "Bbb", "Ccc"
        print I1
        isne I1, "Bbb", "Bbb"
        print I1
        isne I1, "Bbb", "Aaa"
        print I1
        print "\n"
        end
CODE
101
OUTPUT



