#!/usr/bin/perl -w

use lib 'lib';
use Regex::Parse;
use Regex::PreOptimize;
use Regex::Optimize;
use Regex::Generate;

#my $mode = 'Re';
my $mode = 'Rx';
eval "use Regex::Rewrite::$mode";
die $@ if $@;
eval "use Regex::CodeGen::$mode";
die $@ if $@;

my $parser = Regex::Parse->new();
my $opt1 = Regex::PreOptimize->new();
my $rewrite = "Regex::Rewrite::$mode"->new();
my $opt2 = Regex::Optimize->new();
my $cgen = "Regex::CodeGen::$mode"->new();

#my $top = compile("^foo");
#my $top = compile("(.+)+");
#my $top = compile("^.{1,3}");
#my $top = compile("^.*");
#my $top = compile("^.{3,}");
#my $top = compile("^a|b");
#my $top = compile("^tour|to|tournament");
#my $top = Parse::compile("^hell|hello|help");

my $expr = shift || "hell|hello|help\$";

my $tree = $parser->compile($expr);
$tree = $opt1->pre_rewrite_optimize($tree);
my @code = $rewrite->run($tree);
my @asm = $cgen->output(@code);
print join("\n", @asm), "\n";

print "================= OPTIMIZED ===============\n";
my @optcode = $opt2->optimize(@code);
my @optasm = $cgen->output(@optcode);
print join("\n", @optasm), "\n";
