package Regex::CodeGen::IMCC;
use Regex::Ops::Tree (); # For mark()
use base 'Regex::CodeGen::Pasm';
use strict;

my $fail_label = Regex::Ops::Tree::mark('FAIL');

sub init {
    my $self = shift;
    $self->{R_STARTS} ||= '$P0';
    $self->{R_ENDS} ||= '$P1';
    $self->{R_STACK} ||= '$P2';
    $self->{R_TMP} ||= '$I0';
    $self->{R_POS} ||= '$I1';
    $self->{R_LEN} ||= '$I2';
    $self->{R_INPUT} ||= '$S0';
    $self->SUPER::init();
    return $self;
}

#sub mktemp {
#    
#}

sub pushop { "push" };
sub popop { "pop" };

sub output_preamble {
    my $self = shift;

    my @ops;

    push @ops, ("set ?R_POS, 0 # initialize pos",
                "length ?R_LEN, ?R_INPUT # cache the length in ?R_LEN",
                "set ?R_STARTS[0], 0");

#     if ($self->{DEBUG} || $self->{definePrintResults}) {
#         unshift(@ops,
#                 "set ?R_INPUT, ?R_STARTS[1]",
#                 'bsr REGEX',
#                 'bsr printResults',
#                 'end',
#                 result_printer(),
#                 ($self->{startLabel} || 'REGEX').":");
#     }

    return @ops;
}

sub result_printer {
    my $code = <<'END';
printResults:
    if $I0 goto matched
    print "Match failed\n"
    end
matched:
    print "Match found\n"
    set $I0, 0
printLoop:
    set $I17, I0
    bsr printGroup
    add $I0, $I17, 1
    eq $I16, 1, printLoop
    end
printGroup:
    set $I5, $P0
    lt $I0, $I5, groupDefined
    set $I16, 0
    ret
groupDefined:
    set $I3, $P0[I0]
    set $I4, $P1[I0]
    eq $I4, -2, skipPrint
    print $I0
    print ": "
    print $I3
    print ".."
    add $I4, $I4, -1 # Off by one
    print $I4
    print "\n"
skipPrint:
    set $I16, 1
    ret
END
    return split(/\n/, $code);
}

sub output_match_succeeded {
    return ('set ?R_TMP, 1',
            "set ?R_ENDS[0], ?R_POS");
}

sub output_match_failed {
    return ('set ?R_TMP, 0',
            "set ?R_ENDS[0], -2");
}

sub output_terminate {
#    return "ret";
    return "";
}

sub output_if {
    my ($self, $reg, $dest) = @_;
    $reg = Regex::CodeGen::Pasm::value($reg);
    return "if $reg goto " . $self->output_label_use($dest);
}

sub output_unless {
    my ($self, $reg, $dest) = @_;
    $reg = Regex::CodeGen::Pasm::value($reg);
    return "unless $reg goto " . $self->output_label_use($dest);
}

1;
