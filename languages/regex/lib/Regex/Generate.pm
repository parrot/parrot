package Regex::Generate;
use strict;

############### SIMPLE OUTPUT ##############

sub output_nop {
    return "nop";
}

sub output_terminate {
    return "terminate";
}

sub output_increment {
    my $var = shift;
    return "$var++";
}

sub output_assign {
    my ($var, $val) = @_;
    return "$var := $val";
}

sub output_atend {
    return "atend";
}

sub output_advance {
    my $distance = shift || 1;
    return "advance $distance";
}

#  sub output_fork {
#      my ($label) = @_;
#      return "fork $label->[1]";
#  }

#  sub output_reverse_fork {
#      my ($label) = @_;
#      return "reverse_fork $label->[1]";
#  }

sub output_onfail {
    my ($label) = @_;
    return "onfail $label->[1]";
}

sub output_match {
    my ($byte) = @_;
    return "match '$byte'";
}

sub output_classmatch {
    my ($class) = @_;
    return "classmatch '$class'";
}

sub output_start {
    my ($n) = @_;
    return "start $n";
}

sub output_end {
    my ($n) = @_;
    return "end $n";
}

sub output_fail {
    return "fail";
}

sub output_if {
    my ($a, $cond, $b, $where) = @_;
    return "if $a $cond $b goto $where->[1]";
}

sub output_goto {
    my ($where) = @_;
    return "goto $where->[1]";
}

sub output_label {
    my ($label, $reachable) = @_;
    return "$label:" . ($reachable ? "" : " (unreachable)");
}

##################################

use vars qw(%OUTPUT);
sub gather {
    foreach (keys %Regex::Generate::) {
	next unless /^output_(\w+)$/;
	$OUTPUT{$1} = $Regex::Generate::{$_};
    }
}
gather();

sub output {
    my @r;
    my $curlabel = "\t";
    for my $op (@_) {
	if (! ref($op)) {
	    push @r, $curlabel . $op;
	    $curlabel = "\t";
	} elsif ($op->[0] eq 'label') {
	    $curlabel = "$op->[1]:" . $curlabel;
	} elsif (my $outfunc = $OUTPUT{$op->[0]}) {
	    my @args = @$op;
	    shift(@args);
	    push @r, $curlabel . $outfunc->(@args);
	    $curlabel = "\t";
	} else {
	    die "Unable to output $op->[0]";
	}
    }
    return @r;
}

1;
