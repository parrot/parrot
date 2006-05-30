#! perl
# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 4;

=head1 NAME

t/pmc/sparse_perlarray.t - testing sparse arrays using the PerlArray PMC

=head1 SYNOPSIS

    % prove t/pmc/sparse_perlarray.t

=head1 DESCRIPTION

Tests various PMCs using the C<PerlArray> PMC for sparse array access.
Once we have sparse array access in a core PMC, we can move these tests.

=cut


my $SPEEDUP = $ENV{RUNNING_MAKE_TEST} ? "gc_debug 0\n" : "";
pasm_output_is($SPEEDUP . <<'CODE', <<'OUTPUT', "IntList: direct access");
    loadlib P20, 'perl_group'
       new P0, .IntList
	set S0, ""
	set S1, "abcdefghijklmnopqrst"
        set I10, 100000
	set I0, 0
lp:
	set P0[I0], I0
	inc I0
	mod I9, I0, 100
	ne I9, 0, lp1
	# force GC => 142 DOD + 142 collects / 10^5 accesses
    loadlib P20, 'perl_group'
    find_type I21, 'PerlArray'
    new P1,I21
	set P1[I0], I0
	concat S0, S1, S1
	set S2, S0
	set S0, S1
	set S2, ""
lp1:
	le I0, I10, lp

	set I0, 0
lp2:
	set I1, P0[I0]
	ne I0, I1, err
	inc I0
	le I0, I10, lp2
	print "ok\n"
	end
err:
        print "err: wanted "
	print I0
	print " got "
	print I1
	print "\n"
	end
CODE
ok
OUTPUT

pasm_output_is($SPEEDUP . <<'CODE', <<'OUTPUT', "IntList: shift/unshift");
    loadlib P20, 'perl_group'
        new P0, .IntList
	set I10, 100000
	set S0, ""
	set S1, "abcdefghijklmnopqrst"
	set I0, 0
lp:
        unshift P0, I0
	inc I0
	mod I9, I0, 100
	ne I9, 0, lp1
	# force GC => 124 DOD + 124 collects / 10^5 accesses
	# need .PerlArray here - it auto extends - intlist doesnt
    loadlib P20, 'perl_group'
    find_type I21, 'PerlArray'
    new P1,I21
	set P1[I0], I0
	concat S0, S1, S1
	set S2, S0
	set S0, S1
	set S2, ""
lp1:
	ne I0, I10, lp
lp2:
	dec I0
	shift I1, P0
	ne I0, I1, err
	ne I0, 0, lp2
	print "ok 1\n"
	set I1, P0
	set I0, 0
	ne I0, 0, err
	print "ok 2\n"
	end
err:
        print "err: wanted "
	print I0
	print " got "
	print I1
	print "\n"
	end
CODE
ok 1
ok 2
OUTPUT


pasm_output_is($SPEEDUP . <<'CODE', <<'OUTPUT', "ResizableBooleanArray: direct access");
    loadlib P20, 'perl_group'
    new P0, .ResizableBooleanArray
    set S0, ""
    set S1, "abcdefghijklmnopqrst"
    set I10, 100000
    set I0, 0
lp:
    mod I2, I0, 2
    set P0[I0], I2
    inc I0
    mod I9, I0, 100
    ne I9, 0, lp1
    # force GC => 142 DOD + 142 collects / 10^5 accesses
    loadlib P20, 'perl_group'
    find_type I21, 'PerlArray'
    new P1,I21
    set P1[I0], I0
    concat S0, S1, S1
    set S2, S0
    set S0, S1
    set S2, ""
lp1:
    le I0, I10, lp

    set I0, 0
lp2:
    mod I2, I0, 2
    set I1, P0[I0]
    ne I2, I1, err
    inc I0
    le I0, I10, lp2
    print "ok\n"
    end
err:
    print "err: wanted "
    print I0
    print " got "
    print I1
    print "\n"
    end
CODE
ok
OUTPUT


pasm_output_is($SPEEDUP . <<'CODE', <<'OUTPUT', "ResizableStringArray: direct access");
    new P0, .ResizableStringArray
    set S0, ""
    set S1, "abcdefghijklmnopqrst"
    set I10, 100000
    set I0, 0
lp:
    mod I2, I0, 2
    set S30, I2
    set P0[I0], S30
    inc I0
    mod I9, I0, 100
    ne I9, 0, lp1
    # force GC => 142 DOD + 142 collects / 10^5 accesses
    loadlib P20, 'perl_group'
    find_type I21, 'PerlArray'
    new P1,I21
    set P1[I0], I0
    concat S0, S1, S1
    set S2, S0
    set S0, S1
    set S2, ""
lp1:
    le I0, I10, lp

    set I0, 0
lp2:
    mod I2, I0, 2
    set S29, P0[I0]
    set I16, S29
    ne I2, I16, err
    inc I0
    le I0, I10, lp2
    print "ok\n"
    end
err:
    print "err: wanted "
    print I0
    print " got "
    print S29
    print "\n"
    end
CODE
ok
OUTPUT

