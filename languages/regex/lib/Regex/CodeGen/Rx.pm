package Regex::CodeGen::Rx;
use Regex::Ops::Tree ();
use base 'Regex::CodeGen';
use strict;

my $fail_label = Regex::Ops::Tree::mark('FAIL');

sub output_preamble {
    my $self = shift;

    return 'rx_allocinfo P0, S0';
}

sub output_match_succeeded {
    return 'rx_succeed P0';
}

sub output_match_failed {
    return 'rx_fail P0';
}

############### SIMPLE OUTPUT ##############

sub output_advance {
    my ($self, $distance, $failLabel) = @_;
    $failLabel = $self->output_label_use($failLabel);
    if ($distance eq '1') {
        return "rx_advance P0, $failLabel";
    } elsif ($distance =~ /\D/) {
        die "Unimplemented: variable-length advances with rx backend";
    } else {
        return ("rx_advance P0, $failLabel") x $distance;
    }
}

sub output_match {
    my ($self, $byte, $failLabel) = @_;
    return "rx_literal P0, \"$byte\", ".$self->output_label_use($failLabel);
}

sub output_classmatch {
    my ($self, $class, $failLabel) = @_;
    return "rx_oneof P0, $class, ".$self->output_label_use($failLabel);
}

sub output_start {
    my ($self, $n) = @_;
    return "rx_startgroup P0, $n";
}

sub output_end {
    my ($self, $n) = @_;
    return "rx_endgroup P0, $n";
}

sub output_atend {
    my ($self, $failLabel) = @_;
    return ("rx_zwa_atend P0, ".$self->output_label_use($failLabel));
}

sub output_pushmark {
    my ($self) = @_;
    return "rx_pushmark P0";
}

sub output_pushindex {
    my ($self) = @_;
    return "rx_pushindex P0";
}

sub output_popindex {
    my ($self, $fallback) = @_;
    die "Must always have fallback defined!" if ! $fallback;
    return "rx_popindex P0, ".$self->output_label_use($fallback);
}

1;
