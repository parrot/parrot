=head1 B<P6C::IMCC::ExtRegex>

This package and its subpackages implement regular expressions using
an external (ir)regular expression compiler (located in
parrot/languages/regex).

=head2 Methods

=over

=cut

package P6C::IMCC::ExtRegex;
use base 'Regex';
use Regex::State;
use P6C::IMCC::ExtRegex::Adapter;
use P6C::IMCC::ExtRegex::Rewrite;
use P6C::IMCC::ExtRegex::CodeGen;

use strict;
use P6C::IMCC ':all';

use vars qw(@EXPORT_OK);
@EXPORT_OK = qw(node_to_tree tree_to_list list_to_pasm emit_extregex_code);

=item B<node_to_tree>

=cut

sub node_to_tree {
    my ($tree, $ctx, %options) = @_;
    my $adapter = P6C::IMCC::ExtRegex::Adapter->new(%options);
    return $adapter->convert_p6tree($tree, $ctx);
}

=item B<tree_to_list>

=cut

sub tree_to_list {
    my ($tree, $ctx, $pass_label, $fail_label, %options) = @_;

    # Tree optimizations
    unless ($options{'no-tree-optimize'}) {
        my $opt1 = Regex::PreOptimize->new();
        $tree = $opt1->optimize_tree($tree, $ctx);
    }

#    Regex::Ops::Tree::dump_tree($tree);

    my $rewrite = P6C::IMCC::ExtRegex::Rewrite->new(%options);
    my $regex = $rewrite->run($tree, $ctx, $pass_label, $fail_label);
    return $regex if $options{'no-list-optimize'};

    my $opt2 = Regex::Optimize->new(%options);
    $regex->{code} = [ $opt2->optimize($regex->{code}, $ctx) ];
    return $regex;
}

=item B<list_to_pasm>

=cut

sub list_to_pasm {
    my ($list_regex, $ctx, %options) = @_;
    my $cgen;

    $cgen = P6C::IMCC::ExtRegex::CodeGen->new(%options);
    return { back => $cgen->output_label_use($list_regex->{lastback}),
             code => [ $cgen->output($list_regex->{code}, $ctx) ],
           }
}

=item B<emit_extregex_code>

=cut

sub emit_extregex_code {
    my ($statements) = @_;
    foreach (@$statements) {
        if (ref($_)) {
            $_->();
        } else {
            code($_);
        }
    }
}

=back

=cut

1;
