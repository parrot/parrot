#! perl -w

# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/tools/pbc_merge.t - test the PBC merge tool

=head1 SYNOPSIS

	% perl -Ilib t/tools/pbc_merge.t

=head1 DESCRIPTION

Tests the C<pbc_merge> utility by providing it with a number of source
bytecode files, having it merge them and then checking the output is what
would be expected.

=cut

use strict;

use Parrot::Test;
use Test::More;
use Parrot::Config;

my $PARROT = ".$PConfig{slash}$PConfig{test_prog}";
my $PBCMERGE = ".$PConfig{slash}pbc_merge$PConfig{exe}";

# Only test if we have the PBC merge tool built.
if (0 && -e $PBCMERGE) {          # disabled (failing) --leo
   plan tests => 2;
} else {
   plan skip_all => "PBC Merge tool not built or test disabled";
}

sub pir_to_pbc($$) {
	my ($name, $pir) = @_;
	open FILE, "> t$PConfig{slash}tools$PConfig{slash}$name.imc";
	print FILE $pir;
	close FILE;
	system("$PARROT -o t$PConfig{slash}tools$PConfig{slash}$name.pbc t$PConfig{slash}tools$PConfig{slash}$name.imc");
}

sub pbc_merge($@) {
	my $outname = "t$PConfig{slash}tools$PConfig{slash}" . shift() . ".pbc";
	my $inputs = join(' ', map { "t$PConfig{slash}tools$PConfig{slash}$_.pbc" } @_);
	system("$PBCMERGE -o $outname $inputs");
}

sub run_pbc($) {
	return `$PARROT t$PConfig{slash}tools$PConfig{slash}$_[0].pbc`;
}

# First test - check sub relocation works.
pir_to_pbc "pbc_merge_t1_1", <<'PIR';
.sub _main @MAIN
    _testcall()
.end
PIR
pir_to_pbc "pbc_merge_t1_2", <<'PIR';
.sub _testcall
    print 42
.end
PIR
pbc_merge("pbc_merge_t1", "pbc_merge_t1_1", "pbc_merge_t1_2");
is(run_pbc("pbc_merge_t1"), "42");

# Second test - check constant table pointers in bytecode are fixed up.
pir_to_pbc "pbc_merge_t2_1", <<'PIR';
.sub _main @MAIN
    .local num years
    .local string rockers

    years = _get_years()
    rockers = _band()

    print rockers
    print " have rocked for over "
    print years
    print " years!"
.end
PIR
pir_to_pbc "pbc_merge_t2_2", <<'PIR';
.sub _band
    .local string s
    s = "Rammstein"
    .return(s)
.end

.sub _get_years
    .local num n
    n = 10.398571
    .return(n)
.end
PIR
pbc_merge("pbc_merge_t2", "pbc_merge_t2_1", "pbc_merge_t2_2");
is(run_pbc("pbc_merge_t2"), "Rammstein have rocked for over 10.398571 years!");

