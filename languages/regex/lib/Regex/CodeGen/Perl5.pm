package Regex::CodeGen::Perl5;
use Regex::Ops::Tree (); # For mark()
use base 'Regex::CodeGen';
use strict;

my $fail_label = Regex::Ops::Tree::mark('FAIL');

sub init_context {
    my ($self, $ctx) = @_;
    $ctx->{rx_match} ||= '$rx_match';
    $ctx->{rx_stack} ||= '$rx_stack';
    $ctx->{rx_tmp} ||= '$rx_tmp';
    $ctx->{rx_pos} ||= '$rx_pos';
    $ctx->{rx_len} ||= '$rx_len';
    $ctx->{rx_input} ||= '$rx_input';
    $self->SUPER::init_context($ctx);
}

sub value {
    my $name = shift;
    return '$rx_pos' if $name eq '<pos>';
    return '$rx_tmp' if $name eq '<tmp>';
    return '$rx_tmp' if $name eq '<ptmp>';
    return $name;
}

sub dbgoto {
    my ($self, $label) = @_;
    return () unless $self->{DEBUG};
    return () unless $self->{DEBUG_SUPPORT};
    return ("goto $label");
}

############### SIMPLE OUTPUT ##############

sub output_goto {
    my ($self, $where) = @_;
    return "goto ".$self->output_label_use($where).";";
}

sub output_terminate {
    return "";
}

sub output_advance {
    my ($self, $distance, $failLabel) = @_;
    $failLabel = $self->output_label_use($failLabel);
    return ("<rx_pos> += $distance; # pos++",
            "goto $failLabel if <rx_pos> > <rx_len>; # past end of input?",
            '<rx_match>{0}->[0] = <rx_pos>; # group 0 start := pos');
}

sub output_increment {
    my ($self, $distance, $failLabel) = @_;
    die "invalid distance" if $distance =~ /[^\d\-]/;
    return () if $distance == 0;

    if ($distance == 1) {
        return "<rx_pos>++;";
    } elsif ($distance == -1) {
        return "<rx_pos>--;";
    } elsif ($distance > 0) {
        return "<rx_pos> += $distance;";
    } elsif ($distance < 0) {
        return "<rx_pos> -= $distance;";
    }
}

sub output_add {
    my ($self, $var, $arg1, $arg2) = @_;
    my $realvar = value($var);
    return "$realvar = $arg1 + $arg2;" if defined($arg2);
    return "$realvar += $arg1;";
}

sub output_sub {
    my ($self, $var, $amount) = @_;
    $amount = 1 if ! defined $amount;
    my $realvar = value($var);
    return "$realvar -= $amount;";
}

sub output_set {
    my ($self, $reg, $value) = @_;
    $reg = value($reg);
    return "$reg = $value;";
}

sub output_print {
    my ($self, $what) = @_;
    $what = value($what);
    return ("print $what;");
}

sub output_test {
    my ($self, $test, $val1, $val2, $dest) = @_;
    $val1 = value($val1);
    $val2 = value($val2);
    return "goto " . $self->output_label_use($dest) . " if $val1 $test $val2;";
}

sub output_eq {
    my ($self, $val1, $val2, $dest) = @_;
    $self->output_test('==', $val1, $val2, $dest);
}

sub output_ne {
    my ($self, $val1, $val2, $dest) = @_;
    $self->output_test('!=', $val1, $val2, $dest);
}

sub output_lt {
    my ($self, $val1, $val2, $dest) = @_;
    $self->output_test('<', $val1, $val2, $dest);
}

sub output_le {
    my ($self, $val1, $val2, $dest) = @_;
    $self->output_test('<=', $val1, $val2, $dest);
}

sub output_gt {
    my ($self, $val1, $val2, $dest) = @_;
    $self->output_test('>', $val1, $val2, $dest);
}

sub output_ge {
    my ($self, $val1, $val2, $dest) = @_;
    $self->output_test('>=', $val1, $val2, $dest);
}

sub output_if {
    my ($self, $reg, $dest) = @_;
    $reg = value($reg);
    return "goto " . $self->output_label_use($dest) . " if $reg;";
}

sub output_unless {
    my ($self, $reg, $dest) = @_;
    $reg = value($reg);
    return "goto " . $self->output_label_use($dest) . " unless $reg;";
}

sub output_check {
    my ($self, $needed, $failLabel, $lenvar) = @_;
    $lenvar ||= "<rx_len>";
    my $fail = $self->output_label_use($failLabel);
    if ($needed eq "1") {
        return "goto $fail if <rx_pos> >= $lenvar; # need $needed more chars";
    } elsif ($needed eq "0") {
        return ();
    } else {
        return "goto $fail if $lenvar - <rx_pos> < $needed; # need $needed more chars";
    }
}

sub output_match {
    my ($self, $code, $failLabel) = @_;
    my $comment = Regex::Ops::Tree::isplain($code) ? " # match '".chr($code)."'" : "";
    my $fail = $self->output_label_use($failLabel);
    my @ops = ("goto $fail if ord(substr(<rx_input>, <rx_pos>, 1)) != $code;" . $comment);
    if ($self->{DEBUG}) {
        push @ops, 'print "matched('.chr($code).') at ";';
        push @ops, 'print <rx_pos>;';
        push @ops, 'print "\n";';
    }
    return @ops;
}

sub output_classmatch {
    my ($self, $incexc, $failLabel) = @_;

    my $passLabel = $self->{state}->genlabel("pass_charclass");
    my @ops = ("<rx_tmp> = ord(substr(<rx_input>, <rx_pos>)); # tmp = INPUT[pos]");
    my $fail = $self->output_label_use($failLabel);
    my $pass = $self->output_label_use($passLabel);

    while (@$incexc) {
        my $first = shift(@$incexc);
        my $last = shift(@$incexc);
        if (defined($last)) {
            push @ops, "goto $fail if <rx_tmp> < $first;"
              unless $first == 0;
            push @ops, "goto $pass if <rx_tmp> < $last;";
        } else {
            push @ops, "goto $pass if <rx_tmp> >= $first;";
        }
    }
    push @ops, "goto $fail;";

    push @ops, $self->output_label_def($passLabel);
    return @ops;
}

sub output_initgroup {
    my ($self, $group) = @_;
    return ("<rx_match>{\"$group\"} = [];");
}

sub output_setstart {
    my ($self, $group, $value) = @_;
    $DB::single = 1;
    $value = value($value);
    return qq!<rx_match>{"$group"}->[0] = $value; # open group $group!;
}

sub output_setend {
    my ($self, $group, $value, $adj) = @_;
    $value = value($value);
    my @ops;
    if ($adj) {
        push @ops, "<rx_tmp> = $value + $adj;";
        $value = "<rx_tmp>";
    }
    push @ops, qq!<rx_match>{"$group"}->[1] = $value; # close group $group!;
    return @ops;
}

sub output_getstart {
    my ($self, $reg, $group) = @_;
    $reg = value($reg);
    return qq!$reg = <rx_match>{"$group"}->[0]; # get group $group start!;
}

sub output_getend {
    my ($self, $reg, $group) = @_;
    $reg = value($reg);
    return qq!$reg = <rx_match>{"$group"}->[1]; # get group $group end!;
}

sub output_delete {
    my ($self, $n) = @_;
    return qq!<rx_match>{"$n"}->[1] = undef; # delete group $n!;
}

sub output_atend {
    my ($self, $failLabel) = @_;
    my $fail = $self->output_label_use($failLabel);
    return ($self->dbprint("At end: %<rx_pos> >= %<rx_len>?\n"),
            "goto $fail if <rx_pos> < <rx_len>; # at end?");
}

sub output_pushmark {
    my ($self) = @_;
    my @ops;
    if ($self->{DEBUG}) {
	push @ops, (qq(print "PUSHED ).(@_>1?$_[1]:"mark").qq(\\n";));
    }
    push @ops, "push \@<rx_stack>, -1; # pushmark";
    return @ops;
}

sub output_pushindex {
    my ($self, $reg) = @_;
    $reg = value(defined($reg) ? $reg : 'pos');
    return $self->output_pushint($reg);
}

sub output_pushint {
    my ($self, $reg, $db_desc) = @_;
    $reg = value($reg);

    if ($self->{DEBUG}) {
        my $desc = $db_desc ? " ($db_desc)" : "";
        return ("<rx_tmp> = \@<rx_stack>;",
                "push \@<rx_stack>, $reg;",
                $self->dbprint("PUSHED[\%<<rx_tmp>>] INT: \%<$reg>$desc\n"),
               );
    }
    return "push \@<rx_stack>, $reg;";
}

sub output_save {
    my ($self, $reg) = @_;
    $reg = value($reg);
    return ("push \@::STATESTACK, $reg;");
}

sub output_restore {
    my ($self, $reg) = @_;
    $reg = value($reg);
    return ("$reg = pop \@::STATESTACK;");
}

sub output_refresh {
    my ($self, $reg) = @_;
    $reg = value($reg);
    return ("$reg = \$::STATESTACK[-1]");
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

    my @ops = ("<rx_tmp> = pop \@<rx_stack>; # popindex");
    if ($self->{DEBUG}) {
        push @ops, 'print "POPPED: <rx_tmp>\n";';
    }

    # FIXME: Still have extra copy in many cases
    my $L_fallback = $self->output_label_use($fallback);
    push @ops, "goto $L_fallback if <rx_tmp> == -1; # was a mark?";
    push @ops, "$reg = <rx_tmp>; # nope, set pos := popped index"
      unless $reg eq '$<rx_tmp>';
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

    my $L_fallback = $self->output_label_use($fallback);
    return ("<rx_tmp> = <rx_stack>->[-1]; # peekindex",
            "goto $L_fallback if <rx_tmp> == -1; # was a mark?",
            "$reg = <rx_tmp>; # nope, set pos := popped index");
}

sub output_popint {
    my ($self, $reg, $db_desc) = @_;
    $reg = value($reg);
    if ($self->{DEBUG}) {
        my $desc = $db_desc ? " ($db_desc)" : "";
        return ("<rx_tmp> = \@<rx_stack>;",
                "$reg = pop \@<rx_stack>;",
                $self->dbprint("POPPED[\%<<rx_tmp>>] INT: \%<$reg>$desc\n"),
                );
    } else {
        return ("$reg = pop \@<rx_stack>; # popint");
    }
}

sub output_substr {
    my ($self, $dest, $src, $offset, $len) = @_;
    return ("$dest = substr($src, $offset, $len);");
}

sub output_length {
    my ($self, $dest, $string) = @_;
    return ("$dest = length $string;");
}

sub output_arg {
    my ($self, $name, $type, $value) = @_;
    $value = value($value);
    return "$value, ";
}

sub output_param {
    my ($self, $name, $type, $reg) = @_;
    $reg = value($reg);
    return "$reg, ";
}


sub output_return {
    my ($self, $rettype, $retval) = @_;
    $retval = value($retval);
    return ("return $retval;");
}

sub output_rule_def {
    my ($self, $name, $L_trymatch, $L_backup, $num_groups, $startup) = @_;
    my @ops;
#    if ($name ne 'default') {
        @ops = ("sub _rule_$name {", 'my ($rx_mode, $rx_input, $rx_pos, $rx_stack) = @_;');
#    }

    if ($self->{DEBUG}) {
        push @ops, qq(print "Calling $name at \$rx_pos\\n";);
        push @ops, qq(print "INPUT:\$rx_input\\n";);
        push @ops, qq(print "      " . (" " x \$rx_pos) . "^\\n";);
    }

    push @ops, split(/\n/, <<'END');
my %rx_match;
$rx_match{'!INPUT'} = $rx_input;
$rx_match{'!GROUPS'} ||= [];
my $rx_len = length($rx_input);
my $rx_tmp;
END

    push @ops, $self->output($startup, $self->{ctx});

    push @ops, "if (\$rx_mode) { goto " . $self->output_label_use($L_trymatch) . "} else { goto " . $self->output_label_use($L_backup) . "};";

    return @ops;
}

sub output_rule_end {
    my ($self, $name) = @_;
    return ("# End of rule $name", "}");
}

sub output_rule_pass {
    my ($self, $name) = @_;
    return split(/\n/, <<'END');
$rx_match{'!POS'} = $rx_pos;
$rx_match{'!RESULT'} = 1;
$rx_match{'0'}->[1] = $rx_pos - 1;
$rx_match{'!STACK'} = $rx_stack;
return \%rx_match;
END
}

sub output_rule_fail {
    my ($self, $name) = @_;
  return split(/\n/, <<'END');
$rx_match{'!POS'} = $rx_pos;
$rx_match{'!RESULT'} = undef;
$rx_match{'0'}->[1] = undef;
$rx_match{'!STACK'} = \$rx_stack;
return \%rx_match;
END
}

sub output_call_setup {
    my ($self, $name, $uid) = @_;
    return "my \$$uid;";
}

sub output_call {
    my ($self, $name, $mode, $uid) = @_;
    return split(/\n/, <<"END");
\$$uid = _rule_$name($mode, \$rx_input, \$rx_pos, \$rx_stack);
\$rx_pos = \$$uid\->{'!POS'};
END
}

sub output_call_result {
    my ($self, $uid, $name, $fail) = @_;
    my $fail_label = $self->output_label_use($fail);
    my @ops;
    if (defined $name) {
        push @ops, "\$rx_match{'$name'} = \$$uid;";
    }
    return (@ops, "goto $fail_label if ! \$$uid\->{'!RESULT'};");
}

1;
