# -*- perl -*-

package Regex;

use base 'Exporter';
BEGIN {
    @Regex::EXPORT_OK = qw(expr_to_tree tree_to_list list_to_pasm compile);
};

use Regex::State;
use Regex::Parse;
use Regex::TreeOptimize;
use Regex::Optimize;

use Regex::Rewrite;
use Regex::CodeGen::IMCC;

use strict;

# Class method to get a global state object
use vars qw($GLOBAL_STATE);
sub global_state {
    return $GLOBAL_STATE ||= Regex::State->new();
}

sub expr_to_tree {
    my ($expr, $ctx, %options) = @_;

    $options{state} ||= global_state();

    my $parser = Regex::Parse->new(%options);
    return $parser->compile($expr, $ctx);
}

sub tree_to_list {
    my ($tree, $ctx, $pass_label, $fail_label, %options) = @_;

    $options{state} ||= global_state();

    # Tree optimizations
    unless ($options{'no-tree-optimize'}) {
        my $opt1 = Regex::TreeOptimize->new();
        $tree = $opt1->optimize_tree($tree, $ctx);
    }

    my $rewrite = Regex::Rewrite->new(%options);
    my $code = $rewrite->run($tree, $ctx,
                             $pass_label, $fail_label);
    return $code if $options{'no-list-optimize'};

    $ctx->{external_labels}{$pass_label} = 1;
    $ctx->{external_labels}{$fail_label} = 1;

    my $opt2 = Regex::Optimize->new(%options);
    $code->{code} = [ $opt2->optimize($code->{code}, $ctx) ];
    return $code;
}

sub list_to_pasm {
    my ($list_regex, $ctx, %options) = @_;
    my $cgen;

    $options{state} ||= global_state();
    $options{module} ||= "Regex::CodeGen::IMCC";

    if ($options{module} ne 'Regex::CodeGen::IMCC') {
      eval "use $options{module}";
      die $@ if $@;
    }

    $cgen = $options{module}->new(%options);
    $cgen->init_context($ctx);
    return $cgen->output($list_regex->{code}, $ctx);
}

sub compile {
    my ($expr, $ctx, $pass_label, $fail_label, %options) = @_;

    $options{state} ||= global_state();

    my $trees = expr_to_tree($expr, $ctx, %options);
    for my $tree (@$trees) {
        my $code = tree_to_list($tree, $ctx, $pass_label, $fail_label, %options);
        return list_to_pasm($code, $ctx, %options);
    }
    # Heh. Fixme.
}

1;
