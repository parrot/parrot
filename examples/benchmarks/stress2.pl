foreach (1..20) {
    my @arr;
    foreach (1..10) {
	$arr[$_] = buildarray();
    }
}

sub buildarray {
    my @foo;
    foreach (1..10000) {
	$foo[$_] = $_;
    }
    return \@foo;
}
