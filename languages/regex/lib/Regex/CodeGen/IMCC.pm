package Regex::CodeGen::IMCC;
use Regex::Ops::Tree (); # For mark()
use base 'Regex::CodeGen';
use strict;

my $fail_label = Regex::Ops::Tree::mark('FAIL');

sub init_context {
    my ($self, $ctx) = @_;
    $ctx->{rx_match} ||= 'rx_match';
    $ctx->{rx_stack} ||= 'rx_stack';
    $ctx->{rx_ptmp} ||= 'rx_ptmp';
    $ctx->{rx_tmp} ||= 'rx_itmp';
    $ctx->{rx_pos} ||= 'rx_pos';
    $ctx->{rx_len} ||= 'rx_len';
    $ctx->{rx_input} ||= 'rx_input';
    $self->SUPER::init_context($ctx);
}

sub pushop { "push" };
sub popop { "pop" };

sub output_match_succeeded {
    return ('set <rx_match>["!POS"], <rx_pos>',
            'set <rx_match>["!RESULT"], 1',
            'add <rx_tmp>, <rx_pos>, -1',
            'set <rx_match>["0";1], <rx_tmp>');
}

sub output_match_failed {
    return ('set <rx_match>["!POS"], <rx_pos>',
            'set <rx_match>["!RESULT"], 0',
            'set <rx_match>["0";1], -2');
}

sub value {
    my $name = shift;
    return '<rx_pos>' if $name eq 'pos' || $name eq '<pos>';
    return '<rx_tmp>' if $name eq 'tmp' || $name eq '<tmp>';
    return '<rx_ptmp>' if $name eq 'ptmp' || $name eq '<ptmp>';
    return $name;
}

sub dbgoto {
    my ($self, $label) = @_;
    return () unless $self->{DEBUG};
    return () unless $self->{DEBUG_SUPPORT};
    return ("bsr $label");
}

############### SIMPLE OUTPUT ##############

sub output_terminate {
    return "";
}

sub output_advance {
    my ($self, $distance, $failLabel) = @_;
    $failLabel = $self->output_label_use($failLabel);
    return ("add <rx_pos>, $distance # pos++",
            "gt <rx_pos>, <rx_len>, $failLabel # past end of input?",
            'set <rx_match>["0";0], <rx_pos> # group 0 start := pos');
}

sub output_increment {
    my ($self, $distance, $failLabel) = @_;
    die "invalid distance" if $distance =~ /[^\d\-]/;
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

    return ("add <rx_pos>, $distance # $comment");
}

sub output_add {
    my ($self, $var, $arg1, $arg2) = @_;
    my $realvar = value($var);
    return "add $realvar, $arg1, $arg2" if defined($arg2);
    return "add $realvar, $arg1";
}

sub output_sub {
    my ($self, $var, $amount) = @_;
    $amount = 1 if ! defined $amount;
    my $realvar = value($var);
    return "sub $realvar, $amount";
}

sub output_set {
    my ($self, $reg, $value) = @_;
    $reg = value($reg);
    return "set $reg, $value";
}

sub output_print {
    my ($self, $what) = @_;
    $what = value($what);
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
    $lenvar ||= "<rx_len>";
    my $fail = $self->output_label_use($failLabel);
    if ($needed eq "1") {
        return "ge <rx_pos>, $lenvar, $fail # need $needed more chars";
    } elsif ($needed eq "0") {
        return ();
    } else {
        return "sub <rx_tmp>, $lenvar, <rx_pos> # need $needed more chars",
               "lt <rx_tmp>, $needed, $fail";
    }
}

sub output_match {
    my ($self, $code, $failLabel) = @_;
    my $comment = Regex::Ops::Tree::isplain($code) ? " # match '".chr($code)."'" : "";
    my @ops =
      (
       "ord <rx_tmp>, <rx_input>, <rx_pos> # tmp = INPUT[pos]",
       "ne <rx_tmp>, $code, ".$self->output_label_use($failLabel).$comment,
      );
    if ($self->{DEBUG}) {
        push @ops, 'print "matched('.chr($code).') at "';
        push @ops, 'print rx_pos';
        push @ops, 'print "\n"';
    }
    return @ops;
}

sub output_classmatch {
    my ($self, $incexc, $failLabel) = @_;

    my $passLabel = $self->{state}->genlabel("pass_charclass");
    my @ops = ("ord <rx_tmp>, <rx_input>, <rx_pos> # tmp = INPUT[pos]");
    my $fail = $self->output_label_use($failLabel);
    my $pass = $self->output_label_use($passLabel);

    while (@$incexc) {
        my $first = shift(@$incexc);
        my $last = shift(@$incexc);
        if (defined($last)) {
            push @ops, "lt <rx_tmp>, $first, $fail"
              unless $first == 0;
            push @ops, "lt <rx_tmp>, $last, $pass";
        } else {
            push @ops, "ge <rx_tmp>, $first, $pass";
        }
    }
    push @ops, "branch $fail";

    push @ops, $self->output_label_def($passLabel);
    return @ops;
}

sub output_initgroup {
    my ($self, $group) = @_;
    return ("new <rx_ptmp>, \"MatchRange\" # new group \"$group\"",
            "set <rx_match>[\"$group\"], <rx_ptmp>");
}

sub output_setstart {
    my ($self, $group, $value) = @_;
    $value = value($value);
    return qq!set <rx_match>["$group";0], $value # open group $group!;
}

sub output_setend {
    my ($self, $group, $value, $adj) = @_;
    $value = value($value);
    my @ops;
    if ($adj) {
        push @ops, "add <rx_tmp>, $value, $adj";
        $value = "<rx_tmp>";
    }
    push @ops, qq!set <rx_match>["$group";1], $value # close group $group!;
    return @ops;
}

sub output_getstart {
    my ($self, $reg, $group) = @_;
    $reg = value($reg);
    return qq!set $reg, <rx_match>["$group";0] # get group $group start!;
}

sub output_getend {
    my ($self, $reg, $group) = @_;
    $reg = value($reg);
    return qq!set $reg, <rx_match>["$group";1] # get group $group end!;
}

sub output_delete {
    my ($self, $n) = @_;
    return qq!set <rx_match>["$n";1], -2 # delete group $n!;
}

sub output_atend {
    my ($self, $failLabel) = @_;
    my $fail = $self->output_label_use($failLabel);
    return ($self->dbprint("At end: %<rx_pos> >= %<rx_len>?\n"),
            "lt <rx_pos>, <rx_len>, $fail # at end?");
}

sub output_pushmark {
    my ($self) = @_;
    my @ops;
    if ($self->{DEBUG}) {
	push @ops, (qq(print "PUSHED ).(@_>1?$_[1]:"mark").qq(\\n"));
    }
    push @ops, $self->pushop . " <rx_stack>, -1 # pushmark";
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
        return ("set <rx_tmp>, <rx_stack>",
                $self->pushop . " <rx_stack>, $reg",
                $self->dbprint("PUSHED[\%<<rx_tmp>>] INT: \%<$reg>$desc\n"),
               );
    }
    return $self->pushop . " <rx_stack>, $reg";
}

sub output_save {
    my ($self, $reg) = @_;
    $reg = value($reg);
    return ("save $reg");
}

sub output_restore {
    my ($self, $reg) = @_;
    $reg = value($reg);
    return ("restore $reg");
}

sub output_refresh {
    my ($self, $reg) = @_;
    $reg = value($reg);
    return ("restore $reg", "save $reg");
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

    my @ops = ($self->popop . " <rx_tmp>, <rx_stack> # popindex");
    if ($self->{DEBUG}) {
        push @ops, 'print "POPPED: "', "print <rx_tmp>", 'print "\n"';
    }

    # FIXME: Still have extra copy in many cases
    push @ops, "eq <rx_tmp>, -1, ".$self->output_label_use($fallback)." # was a mark?";
    push @ops, "set $reg, <rx_tmp> # nope, set pos := popped index"
      unless $reg eq '<rx_tmp>';
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

    return ("set <rx_tmp>, <rx_stack>[-1\] # peekindex",
            "eq <rx_tmp>, -1, ".$self->output_label_use($fallback)." # was a mark?",
            "set $reg, <rx_tmp> # nope, set pos := popped index");
}

sub output_popint {
    my ($self, $reg, $db_desc) = @_;
    $reg = value($reg);
    if ($self->{DEBUG}) {
        my $desc = $db_desc ? " ($db_desc)" : "";
        return ("set <rx_tmp>, <rx_stack>",
                $self->popop . " $reg, <rx_stack>",
                $self->dbprint("POPPED[\%<<rx_tmp>>] INT: \%<$reg>$desc\n"),
                );
    } else {
        return ($self-> popop . " $reg, <rx_stack> # popint");
    }
}

sub output_substr {
    my ($self, $dest, $src, $offset, $len) = @_;
    return ("substr $dest, $src, $offset, $len");
}

sub output_length {
    my ($self, $dest, $string) = @_;
    return ("length $dest, $string");
}

sub output_arg {
    my ($self, $name, $type, $value) = @_;
    $value = value($value);
    $DB::single = 1 unless length($value);
    return ".arg $value";
}

sub output_param {
    my ($self, $name, $type, $reg) = @_;
    $reg = value($reg);
    return ".param $type $reg";
}


sub output_return {
    my ($self, $rettype, $retval) = @_;
    $retval = value($retval);
    return (".return $retval",
            "ret");
}

sub output_declare {
    my ($self, $var, $type) = @_;
    return (".local $type $var");
}

sub output_rule_def {
    my ($self, $name, $L_trymatch, $L_backup, $num_groups, $startup) = @_;

    my $trymatch = $self->output_label_use($L_trymatch);
    my $backup = $self->output_label_use($L_backup);

    my @ops = split(/\n/, <<"END");
.sub _$name
  .param int <rx_mode>
  .param string <rx_input>
  .param int <rx_pos>
  .param pmc <rx_stack>

  .local pmc <rx_match>
  .local pmc <rx_ptmp>
  .local int <rx_tmp>
  .local int <rx_len>
  <rx_match> = new "Match"
  <rx_match>["!INPUT"] = <rx_input>
  <rx_match>["!GROUPS"] = $num_groups
  length <rx_len>, <rx_input> # cache the length in <rx_len>

END

    push @ops, $self->output($startup, $self->{ctx});

    push @ops, split(/\n/, <<"END");
  if <rx_mode> goto $trymatch
  goto $backup
END

    return @ops;
}

sub output_rule_end {
    my ($self, $name) = @_;
    return ("end", ".end # End of rule $name");
}

sub output_rule_pass {
    my ($self, $name) = @_;
    return ($self->output_match_succeeded(),
            ".return (<rx_match>)");
}

sub output_rule_fail {
    my ($self, $name) = @_;
    return ($self->output_match_failed(),
            ".return (<rx_match>)");
}

sub output_call_setup {
    my ($self, $name, $uid) = @_;
    return ".local pmc $uid";
}

sub output_call {
    my ($self, $name, $mode, $uid) = @_;
    return split(/\n/, <<"END");
$uid = _$name($mode, <rx_input>, <rx_pos>, <rx_stack>)
<rx_pos> = $uid\['!POS']
END
}

sub output_call_result {
    my ($self, $uid, $name, $fail) = @_;
    my $fail_label = $self->output_label_use($fail);
    my @ops;
    if (defined $name) {
        push @ops, "<rx_match>['$name'] = $uid";
    }
    return (@ops,
            "<rx_tmp> = $uid\['!RESULT']",
            "unless <rx_tmp>, $fail_label");
}

sub output_code {
    my ($self, $code) = @_;
    # Assume, for now, that the code is PIR code
    return ("# START EMBEDDED PIR CODE",
            split(/\n/, substr($code, 1, -1)),
            "# END EMBEDDED PIR CODE");
}

1;
