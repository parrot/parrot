package Regex::CodeGen::Re;
use Regex::RegexOps ();
use base 'Regex::CodeGen';
use strict;

sub output_preamble {
    my $self = shift;

    return (
            'new P0, PerlRegex',
            're_bind P0, S0'
           );
}

############### SIMPLE OUTPUT ##############

sub output_advance {
    my $self = shift;
    my $distance = shift || 1;
    return "re_advance P0, $distance";
}

sub output_onfail {
    my ($self, $label) = @_;
    return "re_onfail P0, ".$self->output_label_use($label);
}

sub output_match {
    my ($self, $byte) = @_;
    my $comment = '';
    if ($byte =~ /^[\w ]$/) {
        $comment = " # '$byte'";
    }
    return "re_match P0, ".ord($byte).$comment;
}

sub output_classmatch {
    my ($self, $class) = @_;
    return "re_match_class P0, $class";
}

sub output_start {
    my ($self, $n) = @_;
    return "re_opengroup P0, $n";
}

sub output_end {
    my ($self, $n) = @_;
    return "re_closegroup P0, $n";
}

sub output_fail {
    return "re_fail P0";
}

sub output_match_succeeded {
    return "re_succeeded P0";
}

sub output_match_failed {
    return "re_failed P0";
}

1;
