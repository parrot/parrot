package Regex::CodeGen;
use strict;

sub new {
    my ($proto, %opts) = @_;
    my $self = bless \%opts, (ref($proto) || $proto);
    $self->init();
    return $self;
}

sub init {
    my $self = shift;
    $self->{_markers} = {};
}

sub render {
    my ($self, $op) = @_;

    die if ! ref $op;
    die if $op->{name} eq 'LABEL';
    my $method = "output_$op->{name}";
    $DB::single = 1 if $method =~ /HASH/;
    return $self->$method(@{ $op->{args} });
}

sub output {
    my $self = shift;

    if (ref($_[0]) eq 'LABEL_COMMENTS') {
        $self->{_label_comments} = shift;
    }

    my @r;
    my $label = '';
    for my $op (@_) {
        die $op if ! ref $op;

        if ($op->{name} eq 'LABEL') {
            $label .= $self->output_label_def($op);
        } else {
            foreach my $line ($self->render($op)) {
                $line =~ s/\?(\w+)/$self->{$1}/g;
                if (length($label) >= 8) {
                    push @r, $label;
                    $label = '';
                }
                push @r, "$label\t$line";
                $label = '';
            }
        }
    }
    return @r;
}

############### Backend-neutral translations ##############

sub output_nop {
    return "noop";
}

sub output_incr {
    my ($self, $var) = @_;
    return "add $var, $var, 1";
}

sub output_assign {
    my ($self, $var, $val) = @_;
    return "set $var, $val";
}

sub output_if {
    my $self = shift;
    my ($a, $cond, $b, $where) = @_;
    $where = $self->output_label_use($where);
    if ($cond eq '==') {
        return "eq $a, $b, $where";
    } elsif ($cond eq '!=') {
        return "ne $a, $b, $where";
    } elsif ($cond eq '<') {
        return "lt $a, $b, $where";
    } elsif ($cond eq '<=') {
        return "le $a, $b, $where";
    } elsif ($cond eq '>') {
        return "gt $a, $b, $where";
    } elsif ($cond eq '>=') {
        return "ge $a, $b, $where";
    } else {
        die "Huh? cond $cond";
    }
}

sub output_goto {
    my ($self, $where) = @_;
    return "branch ".$self->output_label_use($where);
}

sub output_terminate {
    return "ret";
}

sub output_label_use {
    my ($self, $label) = @_;
    $DB::single = 1 if ! ref $label;
    ($label = $label->{label}) =~ s/^@//; # FIXME: local labels?
    return "$label";
}

sub output_label_def {
    my ($self, $label, $reachable) = @_;
    my $comment = $self->{_label_comments}{$label->{label}};
    $comment = $comment ? "\n\t# $comment" : "";
    ($label = $label->{label}) =~ s/^@//; # FIXME: local labels?
    return "$label:\n$comment";
}

sub output_push_reg {
    my ($self, $reg) = @_;
    return "save $reg";
}

sub output_pop_reg {
    my ($self, $reg) = @_;
    return "restore $reg";
}

1;
