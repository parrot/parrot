#!/usr/bin/perl -w

# $Id$
# bignum all test.
# This allows lots of tests to be run, parsed out of *.decTest, available
# from: http://www2.hursley.ibm.com/decimal/dectest.html

my ($test, $one, $two, $result, $prec, $round, $maxexp,
    $extended, $skip ,$op, @conds, $line, $arrow);

my ($testsrun, $testspass, $testsfail) = (0,0,0);
$maxexp = 10000;
while (<>) {
    chomp;
    next if /^\s*--/;
    next unless /\S/;
    /^precision:\s+(\d+)/ && do {
	$precision = $1; next;
    };
    /^rounding:\s*(\w+)/ && do {
	$round =$1; next;
    };
    /^extended:\s*(\d+)/ && do {
	$extended = $1;next;
    };
    /^version/ && next;
    /^maxexponent:\s*(\d+)/i && do {
	$expskip = 1 if $1 > $maxexp; next;
    };

    ($test, $op, $one, $two,$arrow, $result, @conds) = split(/\s+/, $_);


    if ($round !~ /^(half_up|half_even|down)$/) {
	print "$test ok \# skip, $round not available\n";
	next;
    }

    if ($op =~ /^(power|rescale)$/) {
	print "$test ok \# skip, $op not implemented\n";
	next;
    }

    if ($two eq '->') { # unary op
	($two, $result, @conds) = ('0', $arrow, @conds);
    }

    if (!defined($result)) {
	print "$test skip\n";
	next;
    }

    if ($extended||$expskip) {
	print "$test ok \# skip\n";
	next;
    }

    for ($one, $two, $result) {
	s/^'|'$//g;
    }

    $testsrun += 2;
    my ($output) = `perl bignum_test.pl $one $two $op $precision $round 0`;
    chomp($output);
    if ($result eq $output || ($result eq '?' && $output =~ /except/i)) {
	print "$test ok\n";
	$testspass++;
    }
    else {
	print "$test not ok\n";
	print "  $one $op $two\n    (p:$precision r:$round)\n";
	print " => `$output'\n";
	print " ex `$result'\n";
	$testsfail++;
    }

    my ($ld_out) = `perl bignum_test.pl $one $two $op $precision $round 1`;
    chomp($ld_out);

    if (@conds && "@conds" =~ /Lost_digits/) {
	if ($ld_out =~ /Exception 512/) {
	    print "$test lost_digits ok\n";
	    $testspass++;
	}
	else {
	    print "$test lost_digits not ok\n";
	    print "  $one $op $two\n    (p:$precision r:$round)\n";
	    print " => `$output'\n";
	    print " ex `$result' (digits lost)\n";
	    $testsfail++;
	}
    }
    else {
	if ($ld_out !~ /Exception 512/) {
	    print "$test lost_digits ok\n";
	    $testspass++;
	}
	else {
	    print "$test lost_digits not ok\n";
	    print "  $one $op $two\n    (p:$precision r:$round)\n";
	    print " => `$output'\n";
	    print " ex `$result' ()\n";
	    $testsfail++;
	}
    }

}

print "Ran $testsrun tests ($testspass,$testsfail) = ".
    sprintf("%2.00d",100*$testspass/$testsrun )."%\n";
