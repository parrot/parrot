#! perl -w

# $Id$
# bignum all test.
# This allows lots of tests to be run, parsed out of *.decTest, available
# from: http://www2.hursley.ibm.com/decimal/dectest.html

my ($test, $one, $two, $result, $prec, $round, $maxexp,
    $skip ,$op, @conds, $line, $arrow);

my ($testsrun, $testspass, $testsfail, $extended) = (0,0,0,0);
$maxexp = 999999999;
while (<>) {
    chomp;
    next if /^\s*--/;
    s/\s*--.*$//; # and hope it's not quoted
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
	$expskip = 1 if ($1 > $maxexp);
	if ($1 <= $maxexp) {
	    $expskip = 0;
	}
	next;
    };

    ($test, $op, $one, $two,$arrow, $result, @conds) = split(/\s+/, $_);

    # skip null tests
    if ($one eq '#' || $two eq '#') {
	print "$test ok \# skip, null test\n";
	next;
    } 
    
    if ($round !~ /^(half_up|half_even|down|floor|ceiling)$/) {
	print "$test ok \# skip, $round not available\n";
	next;
    }

    if ($op =~ /^(power|rescale)$/) {
	print "$test ok \# skip, $op not implemented\n";
	next;
    }

    if ($two eq '->') { # unary op
	unshift(@conds, $result) if defined $result;
	($two, $result, @conds) = ('0', $arrow,@conds);
    }

    if (!defined($result)) {
	print "$test skip\n";
	next;
    }

    if ($expskip) {
	print "$test ok \# skip\n";
	next;
    }

    for ($one, $two, $result) {
	s/^'|'$//g;
    }

    $testsrun += 2;
    my ($output) = `perl bignum_test.pl $one $two $op $precision $round $extended`;
    chomp($output);
    my @out = split(/\s+/, $output);
    if ($result eq $out[0] || ($result eq '?')) {
	print "$test ok\n";
	$testspass++;
    }
    else {
	print "$test not ok\n";
	print "  $one $op $two\n    (p:$precision r:$round)\n";
	print " => `",join("'`",@out),"'\n";
	print " ex `$result', ", (@conds ? join(" ", @conds):'-'), "\n";
	$testsfail++;
    }
    # check flag status
    my (%conds, %outs);
    my $tpass = 0;
    if (@conds) {
	# need to map conditions, as signals and conditions don't quite mesh
	my %map = (Division_impossible => 'Invalid_operation',
		   Division_undefined => 'Invalid_operation');
	foreach (@conds) {
	    if ($map{$_}) {
		$_ = $map{$_};
	    }
	}
	if (@out >1) {
	    $conds{$_} = 1 foreach @conds;
	    $outs{$_} = 1 foreach @out[1..(@out-1)];
	    $tpass = 1;
	    foreach (keys %conds) {
		$tpass = 0 unless $outs{$_};
	    }
	    foreach (keys %outs) {
		$tpass = 0 unless $conds{$_};
	    }
	}
    }
    elsif (@out == 1) {
	$tpass = 1;
    }

    if ($tpass) {
	print "$test ok\n";
	$testspass++;
    }
    else {
	print "$test not ok\n";
	print "  $one $op $two\n    (p:$precision r:$round)\n";
	print " => `",join("'`",@out),"'\n";
	print " ex `$result', ", (@conds ? join(" ", @conds):'-'), "\n";
	$testsfail++;
    }

}

print "Ran $testsrun tests ($testspass,$testsfail) = ".
    sprintf("%2.00d",100*$testspass/$testsrun )."%\n";
