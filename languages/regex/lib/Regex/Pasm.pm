package Regex::Pasm;
use strict;

my $fail_label = Regex::Rewrite::mark('RE_FAIL');

# Return a set of asm_op's for a preamble
sub preamble {
    return bless([ 'preamble' ], 'asm_op');
}

# Return a set of asm_op's for a postamble
sub postamble {
    return $fail_label, bless([ 'postamble' ], 'asm_op');
}

sub output_preamble {
    return ('new P0, PerlRegex',
            're_bind P0, S0',
            output_onfail($fail_label));
}

sub output_postamble {
    return ('re_failed P0',
            'ret');
}

############### SIMPLE OUTPUT ##############

sub output_nop {
    return "set I0, I0";
}

sub output_incr {
    my $var = shift;
    return "add $var, $var, 1";
}

sub output_assign {
    my ($var, $val) = @_;
    return "set $var, $val";
}

sub output_accept {
    return ('re_succeeded P0', 'ret');
}

sub output_terminate {
    return; # Nothing to do
    return 'ret # terminate';
}

sub output_atend {
    return output_advance(1), output_advance(-1); # Temporary hack!
}

sub output_advance {
    my $distance = shift || 1;
    return "re_advance P0, $distance";
}

sub output_onfail {
    my ($label) = @_;
    return "re_onfail ".output_label_use($label);
}

sub output_bytematch {
    my ($byte) = @_;
    my $comment = '';
    if ($byte =~ /^[\w ]$/) {
        $comment = " # '$byte'";
    }
    return "re_match_char P0, ".ord($byte).$comment;
}

sub output_classmatch {
    my ($class) = @_;
    return "re_match_class P0, $class";
}

sub output_start {
    my ($n) = @_;
    return "re_opengroup P0, $n";
}

sub output_end {
    my ($n) = @_;
    return "re_closegroup P0, $n";
}

sub output_fail {
    return "re_fail P0";
}

sub output_if {
    my ($a, $cond, $b, $where) = @_;
    $where = output_label_use($where);
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
    my ($where) = @_;
    return "branch ".output_label_use($where);
}

sub output_label_use {
    my $label = shift;
    ($label = $label->[1]) =~ s/^@/\$/;
    return $label;
}

##################################

sub output_label_def {
    my ($label, $reachable) = @_;
    ($label = $label->[1]) =~ s/^@/\$/;
    return "$label:";
}

use vars qw(%OUTPUT);
sub gather {
    foreach (keys %Regex::Pasm::) {
	next unless /^output_(\w+)$/;
	$OUTPUT{$1} = $Regex::Pasm::{$_};
    }
}
gather();

sub render {
    my @r;
    for my $op (@_) {
        die if ! ref $op;
        die if $op->[0] eq 'label';
        my $outfunc = $OUTPUT{$op->[0]} or die "unable to render $op->[0]";
        my @args = @$op;
        shift(@args);
        push @r, $outfunc->(@args);
    }
    return @r;
}

sub output {
    my @r;
    my $label = '';
    for my $op (preamble(), @_, postamble()) {
        die $op if ! ref $op;

        if ($op->[0] eq 'label') {
            $label .= output_label_def($op);
        } else {
            foreach my $line (render($op)) {
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

1;
