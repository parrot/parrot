# -*- perl -*-

package Regex;

use base 'Exporter';
BEGIN {
    @Regex::EXPORT_OK = qw(expr_to_tree tree_to_list list_to_pasm compile);
};

use Regex::State;
use Regex::Parse;
use Regex::PreOptimize;
use Regex::Optimize;
use Regex::Generate;

use Regex::Rewrite::Stackless;
#use Regex::CodeGen::Rx;
use Regex::CodeGen::Pasm;
use Regex::CodeGen::IMCC;

use strict;

# Class method to get a global state object
use vars qw($GLOBAL_STATE);
sub global_state {
    return $GLOBAL_STATE ||= Regex::State->new();
}

sub expr_to_tree {
    my ($expr, %options) = @_;

    $options{state} ||= global_state();

    my $parser = Regex::Parse->new(%options);
    return $parser->compile($expr);
}

sub tree_to_list {
    my ($tree, %options) = @_;

    $options{state} ||= global_state();

    # Tree optimizations
    unless ($options{'no-tree-optimize'}) {
        my $opt1 = Regex::PreOptimize->new();
        $tree = $opt1->optimize_tree($tree);
    }

    my $rewrite = Regex::Rewrite::Stackless->new(%options);
    my @code = $rewrite->run($tree);
    return @code if $options{'no-list-optimize'};

    my $opt2 = Regex::Optimize->new(%options);
    return $opt2->optimize(@code);
}

sub list_to_pasm {
    my ($code, %options) = @_;
    my $cgen;

    $options{state} ||= global_state();

    if (($options{output} || '') eq 'IMCC') {
        $cgen = Regex::CodeGen::IMCC->new(%options);
    } else {
        $cgen = Regex::CodeGen::Pasm->new(%options);
    }
    return $cgen->output(@$code);
}

sub compile {
    my ($expr, %options) = @_;

    $options{state} ||= global_state();

    my $tree = expr_to_tree($expr, %options);
    my @code = tree_to_list($tree, %options);
    return list_to_pasm(\@code, %options);
}

1;
