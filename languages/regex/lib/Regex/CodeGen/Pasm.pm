package Regex::CodeGen::Pasm;
use Regex::Ops::Tree (); # For mark()
use base 'Regex::CodeGen';
use strict;

my $fail_label = Regex::Ops::Tree::mark('FAIL');

my $R_TMP = 'I0';
my $R_POS = "I1";
my $R_LEN = "I2";

sub output_preamble {
    my $self = shift;

    my @ops = ('new P0, .PerlArray',
               'new P1, .PerlArray',
               "set $R_POS, 0",
               "length $R_LEN, S0",
               'set P0[0], 0');
    unshift(@ops,
            'set S0, P0[1]', 'bsr REGEX', 'bsr printResults', 'end',
            result_printer(),
            ($self->{startLabel} || 'REGEX').":")
      if $self->{DEBUG} || $self->{definePrintResults};
    return @ops;
}

sub result_printer {
    my $code = <<'END';
printResults:
    if I0, matched
    print "Match failed\n"
    end
matched:
    print "Match found\n"
    set I0, 0
printLoop:
    set I17, I0
    bsr printGroup
    add I0, I17, 1
    eq I16, 1, printLoop
    end
printGroup:
    set I5, P0
    lt I0, I5, groupDefined
    set I16, 0
    ret
groupDefined:
    set I3, P0[I0]
    set I4, P1[I0]
    eq I4, -2, skipPrint
    print I0
    print ": "
    print I3
    print ".."
    add I4, I4, -1 # Off by one
    print I4
    print "\n"
skipPrint:
    set I16, 1
    ret
END
    return split(/\n/, $code);
}


sub output_match_succeeded {
    return ('set I0, 1',
            "set P1[0], $R_POS");
}

sub output_match_failed {
    return ('set I0, 0',
            'set P1[0], -1');
}

sub value {
    my $name = shift;
    return $R_POS if $name eq 'pos';
    return $R_TMP if $name eq 'tmp';
    return $name;
}

sub dbgoto {
    my ($self, $label) = @_;
    return () unless $self->{DEBUG};
    return () unless $self->{DEBUG_SUPPORT};
    return ("bsr $label");
}

sub dbprint {
    my ($self, $what) = @_;
    return () unless $self->{DEBUG};
    my @ops;
    foreach my $part ($what =~ /((?:\%\w+)|[^\%]+)/g) {
        if ($part =~ /^%/) {
            push @ops, $self->output_print(substr($part, 1));
        } else {
            $part =~ s/(["'\\])/\\$1/g;
            $part =~ s/\n/\\n/g;
            push @ops, $self->output_print("\"$part\"");
        }
    }
    return @ops;
}

############### SIMPLE OUTPUT ##############

sub output_print {
    my ($self, $what) = @_;
    return ("print $what");
}

sub output_test {
    my ($self, $test, $val1, $val2, $dest) = @_;
    $val1 = value($val1);
    $val2 = value($val2);
    return "$test $val1, $val2, " . $self->output_label_use($dest);
}

sub output_eq {
    my ($self, $val1, $val2, $dest) = @_;
    $self->output_test('eq', $val1, $val2, $dest);
}

sub output_ne {
    my ($self, $val1, $val2, $dest) = @_;
    $self->output_test('ne', $val1, $val2, $dest);
}

sub output_lt {
    my ($self, $val1, $val2, $dest) = @_;
    $self->output_test('lt', $val1, $val2, $dest);
}

sub output_le {
    my ($self, $val1, $val2, $dest) = @_;
    $self->output_test('le', $val1, $val2, $dest);
}

sub output_gt {
    my ($self, $val1, $val2, $dest) = @_;
    $self->output_test('gt', $val1, $val2, $dest);
}

sub output_ge {
    my ($self, $val1, $val2, $dest) = @_;
    $self->output_test('ge', $val1, $val2, $dest);
}

sub output_if {
    my ($self, $reg, $dest) = @_;
    $reg = value($reg);
    return "if $reg, " . $self->output_label_use($dest);
}

sub output_unless {
    my ($self, $reg, $dest) = @_;
    $reg = value($reg);
    return "unless $reg, " . $self->output_label_use($dest);
}

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

    return ($self->dbprint("Changing pos: %I1 -> "),
            "add $R_POS, $distance # $comment",
            $self->dbprint("%I1\n"));
}

sub output_check {
    my ($self, $needed, $failLabel) = @_;
    my $fail = $self->output_label_use($failLabel);
    if ($needed == 1) {
        return "ge $R_POS, $R_LEN, $fail # need $needed more chars";
    } else {
        return "sub I0, $R_LEN, $R_POS # need $needed more chars",
               "lt I0, $needed, $fail";
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

sub output_setstart {
    my ($self, $group, $value) = @_;
    $value = $R_POS if $value eq 'pos';
    return "set P0[$group], $value # open group $group";
}

sub output_setend {
    my ($self, $group, $value) = @_;
    $value = $R_POS if $value eq 'pos';
    return "set P1[$group], $value # close group $group";
}

sub output_getstart {
    my ($self, $reg, $group) = @_;
    $reg = value($reg);
    return "set $reg, P0[$group] # get group $group start";
}

sub output_getend {
    my ($self, $reg, $group) = @_;
    $reg = value($reg);
    return "set $reg, P1[$group] # get group $group end";
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
	my @ops = (qq(print "PUSHED ).(@_>1?$_[1]:"mark").qq(\\n"));
	if (@_ > 1) {
	    push @ops, "save \"$_[1]\"";
	} else {
	    push @ops, "save \"mark\"";
	}
        return (@ops, $self->dbgoto('DUMPSTACK'));
    } else {
	return "save -1 # pushmark";
    }
}

sub output_pushindex {
    my ($self, $reg) = @_;
    $reg = value(defined($reg) ? $reg : 'pos');
    return $self->output_pushint($reg);
}

sub output_pushint {
    my ($self, $reg) = @_;
    $reg = value($reg);

    if ($self->{DEBUG}) {
	return ("save $reg", 'print "PUSHED "', "print $reg", 'print "\n"',
                $self->dbgoto('DUMPSTACK'));
    } else {
	return "save $reg # pushindex";
    }
}

use vars qw($DEBUG_LABEL);
sub output_popindex {
    my $self = shift;
    my ($reg, $fallback);
    if (@_ == 1) {
        ($reg, $fallback) = ('pos', @_);
    } elsif (@_ == 2) {
        ($reg, $fallback) = @_;
    } elsif (@_ == 0) {
        die "Must always have fallback defined!";
    } else {
        die "Too many arguments to popindex!";
    }

    $reg = value($reg);

    if ($self->{DEBUG}) {
	my $index_popped = { name => 'LABEL', label => '@_DEBUG_' . ++$DEBUG_LABEL };
	return ("print \"POPPED: \"",
		"entrytype I0, 0",
		"ne I0, 3, ".$self->output_label_use($index_popped),
		"restore S10",
		"print S10",
		"print \"\\n\"",
		"print \"  \"",
                $self->dbgoto('DUMPSTACK'),
		"branch ".$self->output_label_use($fallback),
		$self->output_label_def($index_popped),
		"restore I0",
		"set $R_POS, I0",
                $self->dbgoto('DUMPSTRING'),
		"print \"  \"",
                $self->dbgoto('DUMPSTACK'),
               );
    } else {
        # FIXME: Still have extra copy in many cases
        my @ops = ("restore I0 # popindex",
                   "eq I0, -1, ".$self->output_label_use($fallback)." # was a mark?");
        push @ops, "set $reg, I0 # nope, set pos := popped index"
          unless $reg eq 'I0';
        return @ops;
    }
}

sub output_peekindex {
    my $self = shift;
    my ($reg, $fallback);
    if (@_ == 1) {
        ($reg, $fallback) = ('pos', @_);
    } elsif (@_ == 2) {
        ($reg, $fallback) = @_;
    } elsif (@_ == 0) {
        die "Must always have fallback defined!";
    } else {
        die "Too many arguments to popindex!";
    }

    $reg = value($reg);

    return ("restore I0 # popindex",
            "save I0 # put it back (slow peekindex)",
            "eq I0, -1, ".$self->output_label_use($fallback)." # was a mark?",
            "set $reg, I0 # nope, set pos := popped index");
}

sub output_popint {
    my ($self, $reg) = @_;
    $reg = value($reg);
    if ($self->{DEBUG}) {
	return ("print \"POPPED INT: \"",
		"restore $reg",
                "print $reg",
                'print "\n"',
               );
    } else {
        return ("restore $reg # popint");
    }
}

1;
