package P6C::Tree::String;
use P6C::Nodes;
use strict;
use vars qw(@EXPORT_OK @ISA);
require Exporter;
@EXPORT_OK = qw(concat_string);
@ISA = qw(Exporter);


=head1 B<P6C::Tree>

This is the string interpolation section.  Here's a rundown:

1.) The string is parsed with the C<quoted_string> rule in the grammar.
    - Unlike perl5, the string is checked straight through, rather than finding
      the end and then parsing the middle.
    - While much slower, this allows for strings like: C<"%var{"one"}"> which
      would be syntactically illegal in perl5.
    - C<quoted_string> shouldn't be included in the grammar bare, but rather
      through sv_literal; this is because the C<quoted_string> parse object
      doesn't have a tree method.  Not only would it would be horribly complex,
      it would be impossible to capture spaces between string atoms without
      specifying the return value inside the rule.

2.) Next, C<sv_literal>'s tree method is called.  After discovering that the
    literal is a string, it calls and returns
    C<P6C::Tree::String::concat_string>.

3.) C<concat_string> first removes the parse object name, and then calls
    C<P6C::Tree::String::interpolate_expand>.

4.) C<interpolate_expand> deals with embedded strings (aka "\q{}" and '\qq{}')
    by flattening a potentially tree-like structure into a list.

5.) This list is then passed to C<interpolate_concat_literal>, which does 3
    things: "interpolates" variables and interpolated_values by calling their
    tree structures upon them, escapes backslashes and quotes in strings, and
    also performs a runtime speed optimization by concatting successive literal
    strings together.

6.) The modified list is next passed to C<concat_list>, which turns the list
    into a node representation.  Literal strings are turned into
    C<sv_literal>'s, and lists longer than 1 item are concatted with the C<_>
    (concat) binop.

7.) Finally, the node representation is returned.

=cut

sub concat_string {
    my ($x) = @_;
    shift @$x;
    my $expand = [interpolate_expand($x)];
    my $p_one  = interpolate_concat_literal($expand);
    my $s3 = concat_list($p_one);
    return $s3;
}

sub interpolate_expand {
    my ($list) = shift;
    my @flat;
    foreach my $item (@$list) {
        if (defined $item) {
            if (ref $item eq 'ARRAY') {
                    push (@flat, interpolate_expand($item))
            }
            else {
                push @flat, $item
            }
        }
    }
    return @flat
}

sub interpolate_concat_literal {
    my $list = shift;
    my (@short, $string);
    foreach my $item (@$list)
    {

# XXX: Each P6C::variable type should be handled differently
#      e.g., arrays should be joined with $", and hashes need
#      something weird done to them.

        if (ref $item eq 'P6C::variable') {
            push (@short, escape($string)) if defined $string;
            push (@short, $item->tree);
            $string='';
        }
        elsif (ref $item eq 'P6C::interpolated_value') {

            push (@short, escape($string)) if defined $string;
            push (@short, $item->tree);
            $string='';

        }
        else { $string.=$item }
    }

    push (@short, escape($string)) if defined $string;

    return \@short
}

sub concat_list
{
    my ($list) = @_;
    my $type = 'PerlString';
    if (@$list > 1) {

        my $val = new P6C::Binop op => '_', l => make_node(shift @$list), r => make_node(shift @$list);
        while (@$list) {
            $val = new P6C::Binop op => '_', l => $val, r => make_node(shift @$list)
        }
        return $val;
    }
    elsif (ref($list->[0]) =~ /P6C/) {
        return $list->[0]
    }
    else {
        return new P6C::sv_literal type => $type,
	    #lval => ($list->[0] || '""')
	    lval => (defined $list->[0] ? $list->[0] : '""')
    }
}

sub make_node
{
    my $right = shift;
    my $type = 'PerlString';
    if (ref($right) !~ /P6C/) {
        $right = new P6C::sv_literal type => $type, lval => $right
    }
    return $right;
}

sub escape
{
    my $string = shift;
    $string =~ s/(?<!\x5C)\x22/\\x22/g;
    $string =~ s/\x5C\x22/\\x22/g;
    return qq{"$string"};
}

1;
