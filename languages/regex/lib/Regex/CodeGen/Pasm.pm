package Regex::CodeGen::Pasm;
use Regex::Ops::Tree (); # For mark()
use base 'Regex::CodeGen';
use strict;

my $fail_label = Regex::Ops::Tree::mark('FAIL');

my $R_POS = "I1";
my $R_LEN = "I2";

sub output_preamble {
    my $self = shift;

    return ('new P0, .PerlArray',
            'new P1, .PerlArray',
            "set $R_POS, 0",
            "length $R_LEN, S0",
            'set P0[0], 0');
}

sub output_match_succeeded {
    return ('set I0, 1',
            "set P1[0], $R_POS");
}

sub output_match_failed {
    return ('set I0, 0',
            'set P1[0], -1');
}

############### SIMPLE OUTPUT ##############

sub output_advance {
    my ($self, $distance, $failLabel) = @_;
    $failLabel = $self->output_label_use($failLabel);
    return ("add $R_POS, $distance # pos++",
            "ge $R_POS, $R_LEN, $failLabel # past end of input?",
            "set P0[0], $R_POS # group 0 start := pos");
}

sub output_increment {
    my ($self, $distance, $failLabel) = @_;
    return () if $distance == 0;

    my $comment;
    if ($distance == 1) {
        $comment = "pos++";
    } elsif ($distance == -1) {
        $comment = "pos--";
    } elsif ($distance > 0) {
        $comment = "pos += $distance";
    } elsif ($distance < 0) {
        $comment = "pos -= ".(-$distance);
    }

    return "add $R_POS, $distance # $comment";
}

sub output_check {
    my ($self, $needed, $failLabel) = @_;
    my $fail = $self->output_label_use($failLabel);
    if ($needed == 1) {
        return "ge $R_POS, $R_LEN, $fail # need $needed more chars";
    } else {
        return "sub I0, $R_LEN, $R_POS # need $needed more chars",
               "le I0, ".($needed+1).", $fail";
    }
}

sub output_match {
    my ($self, $code, $failLabel) = @_;
    my $comment = Regex::Ops::Tree::isplain($code) ? " # match '".chr($code)."'" : "";
    return (
            "ord I0, S0, $R_POS # I0 := S0[pos]",
            "ne I0, $code, ".$self->output_label_use($failLabel).$comment,
           );
}

sub output_start {
    my ($self, $n) = @_;
    return "set P0[$n], $R_POS # open group $n";
}

sub output_end {
    my ($self, $n) = @_;
    return "set P1[$n], $R_POS # close group $n";
}

sub output_delete {
    my ($self, $n) = @_;
    return "set P1[$n], -2 # delete group $n";
}

sub output_atend {
    my ($self, $failLabel) = @_;
    my $fail = $self->output_label_use($failLabel);
    return ("le I0, $R_LEN, $fail # at end?");
}

sub output_pushmark {
    my ($self) = @_;
    if ($self->{DEBUG}) {
	my @ops = ('print "PUSHED: "');
	if (@_ > 1) {
	    push @ops, "save \"$_[1]\"";
	} else {
	    push @ops, "save \"mark\"";
	}
	return (@ops, 'bsr DUMPSTACK');
    } else {
	return "save -1 # pushmark";
    }
}

sub output_pushindex {
    my ($self) = @_;
    if ($self->{DEBUG}) {
	return ("save $R_POS", 'print "PUSHED: "', 'bsr DUMPSTACK');
    } else {
	return "save $R_POS # pushindex";
    }
}

use vars qw($DEBUG_LABEL);
sub output_popindex {
    my ($self, $fallback) = @_;
    die "Must always have fallback defined!" if ! $fallback;

    if ($self->{DEBUG}) {
	my $index_popped = [ 'label', '@_DEBUG_' . ++$DEBUG_LABEL ];
	return ("print \"POPPED: \"",
		"entrytype I0, 0",
		"ne I0, 3, ".$self->output_label_use($index_popped),
		"restore S10",
		"print S10",
		"print \"\\n\"",
		"print \"  \"",
		"bsr DUMPSTACK",
		"branch ".$self->output_label_use($fallback),
		$self->output_label_def($index_popped),
		"restore I0",
		"set $R_POS, I0",
		"bsr DUMPSTRING",
		"print \"  \"",
		"bsr DUMPSTACK");
    } else {
	return ("restore I0 # popindex",
		"eq I0, -1, ".$self->output_label_use($fallback)." # was a mark?",
		"set $R_POS, I0 # nope, set pos := popped index");
    }
}

1;
