#!/usr/bin/perl -w

use lib 'lib';
use Regex;
use strict;

my $operation;
my $expr;
my $tree_opt = 1;
my $list_opt = 1;
my $debug = 0;
my $output;
my $subname;
while (@ARGV) {
    $_ = shift;
    if (/--no(-?)optimize/) {
        $tree_opt = 0;
        $list_opt = 0;
    } elsif (/--optimize=(.*)/) {
        my $opts = $1;
        $tree_opt = ($opts =~ /t/i);
        $list_opt = ($opts =~ /l/i);
    } elsif (/--debug/ || $_ eq '-d') {
        $debug = 1;
    } elsif (/--output-file=(.*)/) {
        $output = $1;
    } elsif (/--sub-name=(.*)/) {
        $subname = $1;
    } elsif ($_ eq '-o') {
        $output = shift;
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

my $ctx = { };
my $tree = Regex::expr_to_tree($expr, $ctx, %options);

if ($operation eq 'unparse' || $operation eq 'render') {
    print $tree->render(), "\n";
    exit;
} elsif ($operation eq 'dump') {
    print $tree->dump_tree(), "\n";
    exit;
}

my $code = Regex::tree_to_list($tree, $ctx, 'regex_done', 'regex_done',
                               %options);

my @asm = Regex::list_to_pasm($code, $ctx, %options);

local *OUTPUT;
if (! defined $output || $output eq '-') {
    open(OUTPUT, ">&STDOUT");
} else {
    open(OUTPUT, ">$output") or die "create $output: $!";
}

if ($subname) {
    print OUTPUT <<"END";
.sub $subname
  .param string rx_input
  .local pmc rx_match
  .local pmc rx_ptmp
  .local int rx_tmp
  .local int rx_len
  .local pmc rx_stack
  .local int rx_pos
  new rx_stack, .PerlArray
  rx_pos = 0
END
}
print OUTPUT join("\n", @asm), "\n";
if ($subname) {
    print OUTPUT <<"END";
  regex_done:
#    P5 = rx_match
#    end
#    P1 = find_global "_do_end_op"
    .pcc_begin_return
    .return rx_match
    .pcc_end_return
.end

.sub _do_end_op
  print "Ending, dude!\\n"
  end
.end

END
}
