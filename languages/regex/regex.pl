#!/usr/bin/perl -w

use lib 'lib';
use Regex::Parse;
use Regex::PreOptimize;
use Regex::Optimize;
use Regex::Generate;

use Regex::Rewrite::Rx;
use Regex::CodeGen::Pasm;
use strict;

my $parser = Regex::Parse->new();
my $opt1 = Regex::PreOptimize->new();
my $rewrite = Regex::Rewrite::Rx->new();
my $opt2 = Regex::Optimize->new();
my $cgen = Regex::CodeGen::Pasm->new();

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

# dumpTree($tree);

my @code = $rewrite->run($tree);
my @asm = $cgen->output(@code);
print join("\n", @asm), "\n";

print "================= OPTIMIZED ===============\n";
my @optcode = $opt2->optimize(@code);
my @optasm = $cgen->output(@optcode);
print join("\n", @optasm), "\n";

sub dumpTree {
    my ($tree, $indent) = @_;
    $indent ||= '';
    my ($op, @args) = @$tree;
    my @children = grep { ref($_) && ref($_) eq 'regex_op' } @args;
    my @params = map { ref($_) ? '' : $_ } @args;
    print "$indent$op(".join(",",@params).")\n";
    return if @children == 0;

    $indent =~ s/`-/  /;
    $indent =~ s/-/ /g;
    for (@children[0..$#children-1]) {
        dumpTree($_, "$indent|-");
    }
    dumpTree($children[-1], "$indent`-");
}
