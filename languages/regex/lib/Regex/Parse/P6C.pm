package Regex::Parse::P6C;

use strict;
use Carp qw(confess);
use Regex::Ops::Tree;
use P6C::Util qw(is_string);

sub op { Regex::Ops::Tree->op(@_) }

=head1 B<convert>

Convert a P6C parse tree to a native tree.

=cut

sub convert_p6tree {
    my ($self, $tree, $ctx) = @_;
    if (ref($tree) eq 'P6C::rx_beg') {
        return $self->convert($tree, $ctx);
    } else {
        return op('scan' => [ $self->convert($tree, $ctx) ]);
    }
}

sub convert {
    my ($self, $tree, $ctx) = @_;

    my $type = ref($tree);

    my ($stem) = $type =~ /^P6C::(\w+)$/
      or confess "Unrecognized type '$type' (tree=$tree)";
    my $function = "convert_$stem";
    return $self->$function($tree, $ctx);
}

sub convert_rule {
    my ($self, $tree, $ctx) = @_;
    return $self->convert($tree->pat, $ctx);
}

sub convert_rx_alt {
    my ($self, $tree, $ctx) = @_;
    return op('alternate' => [ map { $self->convert($_, $ctx) } @{ $tree->branches } ]);
}

sub convert_rx_seq {
    my ($self, $tree, $ctx) = @_;
    return op('seq' => [ map { $self->convert($_, $ctx) } @{ $tree->things } ]);
}

use vars qw($PAREN); # FIXME!!!
sub convert_rx_atom {
    my ($self, $tree, $ctx) = @_;
    my $atom = $tree->atom;

    my $R;
    if (UNIVERSAL::can($atom, 'rx_val')) {
        $R = $self->convert($atom);
    } elsif (ref($atom) eq 'ARRAY') {
        # Codeblock
        $R = op('external' => [ 'code', [ $atom, $ctx ] ]);
    } elsif (UNIVERSAL::can($atom, 'type') && $atom->type eq 'PerlArray') {
        $R = op('external' => [ 'array', [ $atom, $ctx ] ]);
    } elsif ($atom->isa('P6C::sv_literal') && is_string($atom->type)) {
        $R = $self->convert_sv_literal($atom, $ctx);
    } else {
        $R = op('external' => [ 'string', [ $atom, $ctx ] ]);
    }

    if ($tree->capture) {
        return op('group' => [ $R, ++$PAREN ]); # FIXME!!!
    } else {
        return $R;
    }
}

sub convert_rx_repeat {
    my ($self, $tree, $ctx) = @_;
    die "Huh?" if $tree->negated;
    return op('multi_match' => [ $tree->min, $tree->max, $tree->greedy,
                                 $self->convert($tree->thing, $ctx) ]);
}

sub convert_rx_meta {
    my ($self, $tree, $ctx) = @_;
    die "unimplemented meta $tree";
}

# FIXME!!!
sub convert_rx_beg {
    my ($self, $tree, $ctx) = @_;
    return $self->convert($tree, $ctx);
}

sub convert_rx_end {
    my ($self, $tree, $ctx) = @_;
    return op('seq' => [ $self->convert($tree, $ctx), op('atend') ]);
}

sub convert_rx_charclass {
    die "unimplemented charclass";
}

sub convert_rx_oneof {
    die "unimplemented enumerated charclass";
}

sub convert_rx_assertion {
    die "unimplemented assertion";
}

sub convert_rx_call {
    die "unimplemented rule calling";
}

sub convert_sv_literal {
    use Data::Dumper;
    my ($self, $tree, $ctx) = @_;
    die Dumper($tree) unless $tree->type eq 'PerlString';
    my $literal = $tree->lval;
    die Dumper($tree) unless $literal =~ s/^\"//;
    die Dumper($tree) unless $literal =~ s/\"$//;

    return op('seq' => [ map { op('match' => [ ord($_) ]) } split(//, $literal) ]);
}

1;
