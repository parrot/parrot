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
    literal is a string, it calls and returns quoted_string's tree method.

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

package P6C::quoted_string;
use P6C::Nodes;
use strict;
use P6C::Util qw(unimp error);

sub tree {
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
                push @flat, interpolate_expand($item)
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
        if (ref $item eq 'P6C::variable') {
            push (@short, escape($string)) if defined $string;
            my $var = $item->tree;
            my $sigil = $item->[1]->[1];

            if ($sigil eq '$') {
	            push @short, $var
	        }

            # XXX: @ context needs to join with .sep property
            elsif ($sigil eq '@') {
                my $space = new P6C::sv_literal type => 'PerlString',
                    lval => '" "';
                my $args  = new P6C::ValueList vals => [$space, $var];
                push (@short, new P6C::prefix name => 'join', args => $args);
            }

            # XXX: Needs to stringify with proper properties
            elsif ($sigil eq '%') {
                unimp qq("\%"\n)
            }
            elsif ($sigil eq '&') {
	            push @short, $var
	        }
            else {
	            error qq( attempted interpolation of unknown type.\n)
	        }

            $string='';
        }
        elsif (ref $item eq 'P6C::interpolated_value') {
            push (@short, escape($string)) if defined $string;
            push @short, $item->tree;
            $string='';

        }
        elsif (ref $item eq 'P6C::backslashed_expr') {
            push (@short, escape($string)) if defined $string;
            push @short, $item->tree;
            $string='';

        }
        else { $string.=$item }
    }

    push (@short, escape($string)) if defined $string;

    return \@short
}

sub concat_list {
    my ($list) = @_;
    my $type = 'PerlString';
    if (@$list > 1) {
        my $val = new P6C::Binop op => '_', l => make_node(shift @$list), r => make_node(shift @$list);
        while (@$list) {
            $val = new P6C::Binop op => '_', l => $val, r => make_node(shift @$list)
        }
        return $val;
    }
    elsif (ref $list->[0]) {
        return $list->[0]
    }
    else {
        return new P6C::sv_literal type => $type,
	    lval => (defined $list->[0] ? $list->[0] : '""')
    }
}

sub make_node {
    my $right = shift;
    my $type = 'PerlString';
    if (ref($right) !~ /P6C/) {
        $right = new P6C::sv_literal type => $type, lval => $right
    }
    return $right;
}

sub escape {
    my $string = shift;
    $string =~ s/(?<!\x5C)\x22/\\x22/g;
    $string =~ s/\x5C\x22/\\x22/g;
    return qq{"$string"};
}


package P6C::backslashed_expr;
use P6C::Nodes;
use strict;
use P6C::Util qw(unimp error);

sub tree {
    my $x = shift;
    my $val = "";
    if (ref $x->[1] eq 'P6C::base') {
	    $val = $x->[1]->tree->lval;
    }
    elsif ($x->[1] eq 'c') {
        return string_special($x->[3]->tree)
            if ref $x->[3] eq 'P6C::string_set';
        return string_special($x->[3]);
    }
    elsif ($x->[1] eq ':') {
        unimp qq("\\:[]")
    }
    elsif ($x->[1] =~ /u/i) {
        $val = uc $x->[2];
        $val = uc $x->[3] if @$x > 3
    }
    elsif ($x->[1] =~ /l/i) {
          $val = lc $x->[2];
          $val = lc $x->[3] if @$x > 3
      }

    elsif ($x->[1] eq 'x') {
        if (ref $x->[3] eq 'P6C::hex_set') {
            return $x->[3]->tree
    }
      elsif (@$x > 3) {
	        $val = '\\' . $x->[2] . $x->[3]
    }
    else {
            $val = '\\' . $x->[1] . $x->[2]
        }
    }
    elsif ($x->[1] eq '0') {
        return $x->[3]->tree if @$x > 3;
    }
    else {
        $val = '\\' . $x->[1];
        $val = "\\x5C" if ($x->[1] eq '\\');
    }
    return new P6C::sv_literal type => "PerlString", lval => qq{"$val"};
}

sub string_special {
    foreach (@_) {
        my $val="";
        if (substr($_,0,1) eq '^') {
            $_ = substr($_,1);
            $val = eval qq["\\c$_"];
            error ("Error in interpolation of control-char: $@"),die if $@;
        }
        else {
#            use charnames qw(:full);
            # The charnames doesn't seem to propagate into the eval""
            # for me -- sfink
            $val = eval qq[use charnames qw(:full); "\\N{$_}"];
            error ("Error in interpolation of control-char: $@"),die if $@;
        }
        $val = '\\x'.sprintf("%x",ord $val) if ord($val) < 256;
        $_ = new P6C::sv_literal type => "PerlString", lval => qq["$val"];
    }
    return @_
}


package P6C::interpolated_value;
use P6C::Nodes;
use strict;
use P6C::Util qw(unimp error);

sub tree {
    my $x = shift;
    my $sigil = $x->[1]->tree;
    my @values;
    if ($sigil eq '$') {
        push (@values, $x->[5]->tree);
    }

# XXX: @ context needs to join with $" (or its perl6 equiv)

    elsif ($sigil eq '@') {
        if (@{$x->[5][1]} > 1) {
            my $space = new P6C::sv_literal type => 'PerlString',
        lval => '" "';
            my $args  = new P6C::ValueList vals => [$space, $x->[5]->tree ];
            push (@values, new P6C::prefix name => 'join', args => $args);
        }
        else {
            push (@values, $x->[5]->tree);
        }
    }

# XXX: Unsure of how hashes are supposed to interpolate.
#      Data::Dumper style, perahps?

    elsif ($sigil eq '%') { unimp qq("%()"\n) }
    else { error qq( attempted interpolation of unknown type.\n) }
    return @values;
}


package P6C::string_set;
use P6C::Nodes;
use strict;

sub tree {
    my $x = shift;
    my @items;
    foreach (@{$x->[1]}) {
        push @items, $_->[1];
    }
    push @items, $x->[2];
    return @items
}

package P6C::number_set;
use strict;

sub tree {
    my $x = shift;
    my @items;
    foreach (@{$x->[1]}) {
        my $item = $_->[1]->[1]->tree;
        $item->type('PerlString');
        $item->lval('"'.$item->lval().'"');
        push @items, $item;
    }
    my $item = $x->[2]->tree;
    $item->type('PerlString');
    $item->lval('"'.$item->lval().'"');
    push @items, $item;
    return @items
}

package P6C::hex_set;
use strict;
use P6C::Nodes;

sub tree {
    my $x = shift;
    my @items;
    foreach (@{$x->[1]}) {
        push @items, P6C::quoted_string::make_node('"\\x'.$_->[1].'"');
    }
    push @items, P6C::quoted_string::make_node('"\\x'.$x->[2].'"');
    return @items
}

1;
