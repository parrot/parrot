# -*- perl -*-

package Regex;

use base 'Exporter';
BEGIN {
    @Regex::EXPORT_OK = qw(expr_to_tree tree_to_list list_to_pasm compile);
};

use Regex::Parse;
use Regex::PreOptimize;
use Regex::Optimize;
use Regex::Generate;

use Regex::Rewrite::Stackless;
#use Regex::CodeGen::Rx;
use Regex::CodeGen::Pasm;

use strict;

sub expr_to_tree {
    my ($expr, %options) = @_;

    my $parser = Regex::Parse->new();
    my $tree = $parser->compile($expr);
    return $tree if $options{'no-tree-optimize'};

    my $opt1 = Regex::PreOptimize->new();
    return $opt1->optimize_tree($tree);
}

sub tree_to_list {
    my ($tree, %options) = @_;

    my $rewrite = Regex::Rewrite::Stackless->new(DEBUG => $options{DEBUG});
    my @code = $rewrite->run($tree);
    return @code if $options{'no-list-optimize'};

    my $opt2 = Regex::Optimize->new();
    return $opt2->optimize(@code);
}

sub list_to_pasm {
    my ($code, %options) = @_;
    my $cgen = Regex::CodeGen::Pasm->new(DEBUG => $options{DEBUG});
    return $cgen->output(@$code);
}

sub compile {
    my ($expr, %options) = @_;
    my $tree = expr_to_tree($expr, %options);
    my @code = tree_to_list($tree, %options);
    return list_to_pasm(\@code, %options);
}

1;
