# Copyright (C) 2001-2005, The Perl Foundation.
# $Id$

=head1 NAME

config/auto/lex.pm - lexical analyzer generator

=head1 DESCRIPTION

Determines whether C<lex> is installed and if it's actually C<flex>.

=cut

package inter::lex;

use strict;

use vars qw( $description @args $prompt $util );

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step qw( :inter capture_output check_progs );

$util        = 'lex';
$description = "Determining whether $util is installed";
$prompt      = "Do you have a lexical analyzer generator like flex or lex?";
@args        = qw( lex ask maintainer );

sub runstep
{
    my ($self, $conf) = @_;

    my $verbose = $conf->options->get('verbose');

    # undef means we don't have flex... default to not having flex
    $conf->data->set(flex_version => undef);

    unless ($conf->options->get('maintainer')) {
        $conf->data->set($util => 'echo');
        $self->set_result('skipped');
        return $self;
    }

    my $prog;

    # precedence of sources for the program:
    # default -> probe -> environment -> option -> ask
    $prog ||= $conf->options->get($util);
    $prog ||= $ENV{uc($util)};

    # never override the user.  If a non-existent program is specified then
    # the user is responsible for the consequences.
    if (defined $prog) {
        $conf->data->set($util => $prog);
        $self->set_result('yes');
        return $self;
    }

    $prog = check_progs(['flex', 'lex'], $verbose);

    unless ($prog) {

        # fall back to default
        $self->set_result('no');
        return $self;
    }

    if ($conf->options->get('ask')) {
        $prog = prompt($prompt, $prog ? $prog : $conf->data->get($util));
    }

    my ($stdout, $stderr, $ret) = capture_output($prog, '--version');

    # don't override the user even if the program they provided appears to be
    # broken
    if ($ret == -1 and !$conf->options->get('ask')) {

        # fall back to default
        $self->set_result('no');
        return $self;
    }

    # if '--version' returns a string assume that this is flex.
    # flex calls it self by $0 so it will claim to be lex if invoked as `lex`
    if ($stdout =~ /f?lex .*? (\d+) \. (\d+) \. (\d+)/x) {
        $conf->data->set(flex_version => "$1.$2.$3");
    }

    $conf->data->set($util => $prog);
    $self->set_result('yes');

    return $self;
}

1;
