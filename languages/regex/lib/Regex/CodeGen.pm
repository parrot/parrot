package Regex::CodeGen;
require 'Regex.pm';
use strict;

sub new {
    my ($proto, %options) = @_;
    my $self = bless \%options, (ref($proto) || $proto);
    $self->init();
    return $self;
}

sub init {
    my $self = shift;
    $self->{state} ||= Regex->global_state();
}

sub init_context {
}

# Convert "x%<foo>y" to
#   print "x"
#   print foo
#   print "y"
#
sub dbprint {
    my ($self, $what) = @_;
    return () unless $self->{DEBUG};
    my $ctx = $self->{ctx};
    $what = "\%<<rx_pos>>: $what";

    my @ops;
    foreach my $part ($what =~ /((?:\%\<[\<\>\w]+\>)|[^\%]+)/g) {
        if ($part =~ /^\%/) {
            push @ops, $self->output_print(substr($part, 2, -1));
        } else {
            $part =~ s/(["'\\])/\\$1/g;
            $part =~ s/\n/\\n/g;
            push @ops, $self->output_print("\"$part\"");
        }
    }
    return @ops;
}

sub render {
    my ($self, $op) = @_;

    die if ! ref $op;
    die if $op->{name} eq 'LABEL';
    my $method = "output_$op->{name}";
    $DB::single = 1 if $method =~ /HASH/;
    $DB::single = 1 if $method eq "output_";
    return $self->$method(@{ $op->{args} });
}

sub lookup_var {
    my ($self, $var, $ctx) = @_;
    return $ctx->{$var} || $var;
}

sub output {
    my ($self, $ops, $ctx) = @_;

    if (ref($ops->[0]) eq 'LABEL_COMMENTS') {
        $self->{_label_comments} = shift(@$ops);
    }

    $self->{ctx} = $ctx;

    my @r;
    my $label = '';
    for my $op (@$ops) {
        die $op if ! ref $op;

        if ($op->{name} eq 'LABEL') {
            $label .= $self->output_label_def($op);
        } else {
            foreach my $line ($self->render($op)) {
                $line =~ s/<(\w+)>/$self->lookup_var($1, $ctx)/eg;
                if (length($label) >= 8) {
                    push @r, $label;
                    $label = '';
                }
                if (ref($line)) {
                    push @r, "$label";
                    push @r, $line;
                } else {
                    push @r, "$label\t$line";
                }
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

sub output_increment {
    my ($self, $var, $amount) = @_;
    $amount = 1 if ! defined($amount);
    return "add $var, $amount";
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
    # return "ret";
}

sub output_label_use {
    my ($self, $label) = @_;
    $DB::single = 1 if ! ref $label || ! $label->{label};
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

sub output_comment {
    my ($self, $string) = @_;
    return map { "# $_" } split(/\n/, $string);
}

sub output_literal {
    my ($self, @args) = @_;
    return join(" ", @args);
}

1;
