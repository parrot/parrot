my @arr;
foreach (1..10) {
    $arr[$_] = buildarray();
}

my @arr1;
foreach (1..20) {
    $arr1[$_] = buildarray();
}

my @arr2;
foreach (1..20) {
    $arr2[$_] = buildarray();
}

sub buildarray {
    my @foo;
    foreach (1..10000) {
	$foo[$_] = $_;
    }
    return \@foo;
}
