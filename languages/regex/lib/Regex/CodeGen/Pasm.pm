package Regex::CodeGen::Pasm;
use Regex::Ops::Tree (); # For mark()
use base 'Regex::CodeGen';
use strict;

my $fail_label = Regex::Ops::Tree::mark('FAIL');

sub output_preamble {
    my $self = shift;

    return ('new P0, .PerlArray',
            'new P1, .PerlArray',
            'set I1, 0',
            'length I2, S0',
            'set P0[0], 0');
}

sub output_match_succeeded {
    return ('set I0, 1',
            'set P1[0], I1');
}

sub output_match_failed {
    return ('set I0, 0',
            'set P1[0], -1');
}

############### SIMPLE OUTPUT ##############

sub output_advance {
    my ($self, $distance, $failLabel) = @_;
    $failLabel = $self->output_label_use($failLabel);
    return ("add I1, I1, $distance # pos++",
            "ge I1, I2, $failLabel # past end of input?",
            "set P0[0], I1 # group 0 start := pos");
}

# SLOW! Most of the time we probably don't need to check for end of string
sub output_match {
    my ($self, $code, $failLabel) = @_;
    my $comment = Regex::Ops::Tree::isplain($code) ? " # match '".chr($code)."'" : "";
    return (
            "ge I1, I2, ".$self->output_label_use($failLabel)." # is there anything left?",
            "ord I0, S0, I1 # I0 := S0[pos]",
            "ne I0, $code, ".$self->output_label_use($failLabel).$comment,
            "add I1, I1, 1 # pos++"
           );
}

sub output_start {
    my ($self, $n) = @_;
    return "set P0[$n], I1 # open group $n";
}

sub output_end {
    my ($self, $n) = @_;
    return "set P1[$n], I1 # close group $n";
}

sub output_delete {
    my ($self, $n) = @_;
    return "set P1[$n], -2 # delete group $n";
}

sub output_atend {
    my ($self, $failLabel) = @_;
    return ("le I0, I2, ".$self->output_label_use($failLabel)." # at end?");
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
	return ("save I1", 'print "PUSHED: "', 'bsr DUMPSTACK');
    } else {
	return "save I1 # pushindex";
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
		"set I1, I0",
		"bsr DUMPSTRING",
		"print \"  \"",
		"bsr DUMPSTACK");
    } else {
	return ("restore I0 # popindex",
		"eq I0, -1, ".$self->output_label_use($fallback)." # was a mark?",
		"set I1, I0 # nope, set pos := popped index");
    }
}

1;
