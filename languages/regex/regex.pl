#!/usr/bin/perl -w

use lib 'lib';
use Regex;
use Regex::Driver;
use strict;

my $operation;
my $expr;
my $expr_file;
my $tree_opt = 1;
my $list_opt = 1;
my $debug = 0;
my $output;
my $subname;
my $language = "pir";
my $main;

while (@ARGV) {
    $_ = shift;
    if (/--no(-?)optimize/) {
        $tree_opt = 0;
        $list_opt = 0;
    } elsif (/--optimize=(.*)/) {
        my $opts = $1;
        $tree_opt = ($opts =~ /t/i);
        $list_opt = ($opts =~ /l/i);
    } elsif (/--main/ || $_ eq '-m') {
        $main = 1;
    } elsif (/--debug/ || $_ eq '-d') {
        $debug = 1;
    } elsif (/--output-file=(.*)/) {
        $output = $1;
    } elsif (/--file=(.*)/) {
        $expr_file = $1;
    } elsif (/--language=(.*)/) {
        $language = lc($1);
        $language = 'perl5' if $language eq 'perl';
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

if (! defined $expr && ! defined $expr_file) {
    die "need expression!";
}

if (defined $expr_file) {
    local *IN;
    local $/;
    open(IN, "<$expr_file")
      or die "open $expr_file: $!";
    $expr = <IN>;
    close IN;
}

$operation ||= "compile";

my %options;
$options{'no-tree-optimize'} = 1 if ! $tree_opt;
$options{'no-list-optimize'} = 1 if ! $list_opt;
$options{'DEBUG'} = 1 if $debug;
$options{subname} = $subname if $subname;
$options{emit_main} = 1 if $main;

if ($language eq 'pir') {
  $options{module} = "Regex::CodeGen::IMCC";
} elsif ($language eq 'perl5') {
  $options{module} = "Regex::CodeGen::Perl5";
} else {
  die "unknown language '$language'\n";
}

my $ctx = { };
my $trees = Regex::expr_to_tree($expr, $ctx, %options);

if ($operation eq 'unparse' || $operation eq 'render') {
    print $_->render(), "\n" foreach (@$trees);
    exit;
} elsif ($operation eq 'dump') {
    print $_->dump_tree(), "\n" foreach (@$trees);
    exit;
}

local *OUTPUT;
if (! defined $output || $output eq '-') {
    open(OUTPUT, ">&STDOUT");
} else {
    open(OUTPUT, ">$output") or die "create $output: $!";
}

my $driver = Regex::Driver->new($language, %options);

$driver->output_header(*OUTPUT);

for my $rule (@$trees) {
    $driver->output_rule(*OUTPUT, $subname, $rule, $ctx, %options);
}

$driver->output_footer(*OUTPUT);
