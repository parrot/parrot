#! perl -w

use lib 'lib';
use Regex;
use strict;

my $operation;
my $expr;
my $tree_opt = 1;
my $list_opt = 1;
my $debug = 0;
foreach (@ARGV) {
    if (/--no(-?)optimize/) {
        $tree_opt = 0;
        $list_opt = 0;
    } elsif (/--optimize=(.*)/) {
        my $opts = $1;
        $tree_opt = ($opts =~ /t/i);
        $list_opt = ($opts =~ /l/i);
    } elsif (/--debug/ || $_ eq '-d') {
        $debug = 1;
    } elsif (! defined $expr) {
        $expr = $_;
    } elsif (! defined $operation) {
        $operation = $_;
    } else {
        die "too many args!";
    }
}

die "need expression!" if ! defined $expr;
$operation ||= "compile";

my %options;
$options{'no-tree-optimize'} = 1 if ! $tree_opt;
$options{'no-list-optimize'} = 1 if ! $list_opt;
$options{'DEBUG'} = 1 if $debug;

my $tree = Regex::expr_to_tree($expr, %options);

if ($operation eq 'unparse' || $operation eq 'render') {
    print $tree->render(), "\n";
    exit;
} elsif ($operation eq 'dump') {
    print $tree->dump_tree(), "\n";
    exit;
}

my $code = Regex::tree_to_list($tree, %options);

my @asm = Regex::list_to_pasm($code, %options);

print join("\n", @asm), "\n";
