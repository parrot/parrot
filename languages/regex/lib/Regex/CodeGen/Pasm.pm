package Regex::CodeGen::Pasm;
use Regex::Ops::Tree (); # For mark()
use base 'Regex::CodeGen';
use strict;

my $fail_label = Regex::Ops::Tree::mark('FAIL');

sub init {
    my $self = shift;
    $self->SUPER::init();
    $self->{R_STARTS} ||= 'P0';
    $self->{R_ENDS} ||= 'P1';
    $self->{R_STACK} ||= 'P2';
    $self->{R_TMP} ||= 'I0';
    $self->{R_POS} ||= 'I1';
    $self->{R_LEN} ||= 'I2';
    $self->{R_INPUT} ||= 'S0';
    return $self;
}

sub pushop { "push" };
sub popop { "pop" };

sub output_preamble {
    my $self = shift;

    my @ops = ("new ?R_STARTS, .IntList",
               "new ?R_ENDS, .IntList",
               "new ?R_STACK, .IntList",
               "set ?R_POS, 0",
               "length ?R_LEN, ?R_INPUT",
               "set ?R_STARTS[0], 0");
    unshift(@ops,
            "set ?R_INPUT, ?R_STARTS[1]", 'bsr REGEX', 'bsr printResults', 'end',
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
            "set ?R_ENDS[0], ?R_POS");
}

sub output_match_failed {
    return ('set I0, 0',
            "set ?R_ENDS[0], -2");
}

sub value {
    my $name = shift;
    return '?R_POS' if $name eq 'pos';
    return '?R_TMP' if $name eq 'tmp';
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

sub output_advance {
    my ($self, $distance, $failLabel) = @_;
    $failLabel = $self->output_label_use($failLabel);
    return ("add ?R_POS, $distance # pos++",
            "ge ?R_POS, ?R_LEN, $failLabel # past end of input?",
            "set ?R_STARTS[0], ?R_POS # group 0 start := pos");
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
            "add ?R_POS, $distance # $comment",
            $self->dbprint("%I1\n"));
}

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

sub output_check {
    my ($self, $needed, $failLabel, $lenvar) = @_;
    $lenvar ||= "?R_LEN";
    my $fail = $self->output_label_use($failLabel);
    if ($needed eq "1") {
        return "ge ?R_POS, $lenvar, $fail # need $needed more chars";
    } else {
        return "sub ?R_TMP, $lenvar, ?R_POS # need $needed more chars",
               "lt ?R_TMP, $needed, $fail";
    }
}

sub output_match {
    my ($self, $code, $failLabel) = @_;
    my $comment = Regex::Ops::Tree::isplain($code) ? " # match '".chr($code)."'" : "";
    return (
            "ord ?R_TMP, ?R_INPUT, ?R_POS # tmp = INPUT[pos]",
            "ne ?R_TMP, $code, ".$self->output_label_use($failLabel).$comment,
           );
}

sub output_classmatch {
    my ($self, $incexc, $failLabel) = @_;

    my $passLabel = $self->{state}->genlabel("pass_charclass");
    my @ops = ("ord ?R_TMP, ?R_INPUT, ?R_POS # tmp = INPUT[pos]");
    my $fail = $self->output_label_use($failLabel);
    my $pass = $self->output_label_use($passLabel);

    while (@$incexc) {
        my $first = shift(@$incexc);
        my $last = shift(@$incexc);
        if (defined($last) && ($first != $last)) {
            push @ops, "lt ?R_TMP, $first, $fail"
              unless $first == 0;
            push @ops, "le ?R_TMP, $last, $pass";
        } else {
            push @ops, "eq ?R_TMP, $first, $pass";
            if (!defined($last)) {
                push @ops, "branch $fail";
            }
        }
    }

    push @ops, $self->output_label_def($passLabel);
    return @ops;
}

sub output_setstart {
    my ($self, $group, $value) = @_;
    $value = value($value);
    return "set ?R_STARTS[$group], $value # open group $group";
}

sub output_setend {
    my ($self, $group, $value) = @_;
    $value = value($value);
    return "set ?R_ENDS[$group], $value # close group $group";
}

sub output_getstart {
    my ($self, $reg, $group) = @_;
    $reg = value($reg);
    return "set $reg, ?R_STARTS[$group] # get group $group start";
}

sub output_getend {
    my ($self, $reg, $group) = @_;
    $reg = value($reg);
    return "set $reg, ?R_ENDS[$group] # get group $group end";
}

sub output_delete {
    my ($self, $n) = @_;
    return "set ?R_ENDS[$n], -2 # delete group $n";
}

sub output_atend {
    my ($self, $failLabel) = @_;
    my $fail = $self->output_label_use($failLabel);
    return ("le ?R_TMP, ?R_LEN, $fail # at end?");
}

sub output_pushmark {
    my ($self) = @_;
    my @ops;
    if ($self->{DEBUG}) {
	push @ops, (qq(print "PUSHED ).(@_>1?$_[1]:"mark").qq(\\n"));
    }
    push @ops, $self->pushop . " ?R_STACK, -1 # pushmark";
    return @ops;
}

sub output_pushindex {
    my ($self, $reg) = @_;
    $reg = value(defined($reg) ? $reg : 'pos');
    return $self->output_pushint($reg);
}

sub output_pushint {
    my ($self, $reg) = @_;
    $reg = value($reg);

    my @ops = ($self->pushop . " ?R_STACK, $reg # pushindex");
    if ($self->{DEBUG}) {
	push @ops, 'print "PUSHED "', "print $reg", 'print "\n"',
                   $self->dbgoto('DUMPSTACK');
    }
    return @ops;
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

    my @ops = ($self->popop . " ?R_TMP, ?R_STACK # popindex");
    if ($self->{DEBUG}) {
        push @ops, 'print "POPPED: "', "print ?R_TMP", 'print "\n"';
    }

    # FIXME: Still have extra copy in many cases
    push @ops, "eq ?R_TMP, -1, ".$self->output_label_use($fallback)." # was a mark?";
    push @ops, "set $reg, ?R_TMP # nope, set pos := popped index"
      unless $reg eq '?R_TMP';
    return @ops;
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

    return ("set ?R_TMP, ?R_STACK[-1\] # peekindex",
            "eq ?R_TMP, -1, ".$self->output_label_use($fallback)." # was a mark?",
            "set $reg, ?R_TMP # nope, set pos := popped index");
}

sub output_popint {
    my ($self, $reg) = @_;
    $reg = value($reg);
    if ($self->{DEBUG}) {
	return ("print \"POPPED INT: \"",
		$self->popop . " $reg, ?R_STACK",
                "print $reg",
                'print "\n"',
               );
    } else {
        return ($self-> popop . " $reg, ?R_STACK # popint");
    }
}

1;
