package Regex::CodeGen::Pasm;
use Regex::RegexOps ();
use base 'Regex::CodeGen';
use strict;

my $fail_label = Regex::RegexOps::mark('FAIL');

sub output_preamble {
    my $self = shift;

    return ('new P0, PerlArray',
            'new P1, PerlArray',
            'set I1, 0',
            'length I2, S0',
            'set_keyed P0, 0, 0');
}

sub output_match_succeeded {
    return ('set I0, 1',
            'set_keyed P1, 0, I1');
}

sub output_match_failed {
    return ('set I0, 0',
            'set_keyed P1, 0, -1');
}

############### SIMPLE OUTPUT ##############

sub output_advance {
    my ($self, $distance, $failLabel) = @_;
    $failLabel = $self->output_label_use($failLabel);
    return ("add I1, I1, $distance",
            "ge I1, I2, $failLabel",
            "set_keyed P0, 0, I1");
}

# SLOW! Most of the time we probably don't need to check for end of string
sub output_bytematch {
    my ($self, $byte, $failLabel) = @_;
    return (
            "ge I1, I2, ".$self->output_label_use($failLabel),
            "ord I0, S0, I1",
            "ne I0, ".ord($byte).", ".$self->output_label_use($failLabel),
            "add I1, I1, 1"
           );
}

sub output_start {
    my ($self, $n) = @_;
    return "set_keyed P0, $n, I1";
}

sub output_end {
    my ($self, $n) = @_;
    return "set_keyed P1, $n, I1";
}

sub output_atend {
    my ($self, $failLabel) = @_;
    return ("le I0, I2, ".$self->output_label_use($failLabel));
}

sub output_pushmark {
    my ($self) = @_;
    return "save -1";
}

sub output_pushindex {
    my ($self) = @_;
    return "save I1";
}

sub output_popindex {
    my ($self, $fallback) = @_;
    die "Must always have fallback defined!" if ! $fallback;

    return ("restore I0",
            "eq I0, -1, ".$self->output_label_use($fallback),
            "set I1, I0");
}

1;
