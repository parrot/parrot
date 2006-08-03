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
    my ($self, $conf, %p) = @_;

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
        $self->set_result('user defined');
        return $self;
    }

    $prog = check_progs(['flex', 'lex'], $verbose);

    unless ($prog) {
        $self->set_result('no lex program was found');
        return;
    }

    # XXX should --ask be handled like the other user defines or checked for
    # version requirements?
    if ($conf->options->get('ask')) {
        $prog = prompt($prompt, $prog ? $prog : $conf->data->get($util));
    }

    my ($stdout, $stderr, $ret) = capture_output($prog, '--version');

    # don't override the user even if the program they provided appears to be
    # broken
    if ($ret == -1 and !$conf->options->get('ask')) {
        # fall back to default
        $self->set_result(
                'lex program does not exist or does not understand --version');
        return;
    }

    # if '--version' returns a string assume that this is flex.
    # flex calls it self by $0 so it will claim to be lex if invoked as `lex`
    if ($stdout =~ /f?lex .*? (\d+) \. (\d+) \. (\d+)/x) {
        my ($prog_major, $prog_minor, $prog_patch) = ($1, $2, $3);
        my $prog_version = "$1.$2.$3";

        # is there a version requirement?
        if (exists $p{require}) {
            my ($rmajor, $rminor, $rpatch) =
                $p{require} =~ /(\d+) \. (\d+) \. (\d+)/x;
            unless ((defined $rmajor)
                and (defined $rminor)
                and (defined $rpatch)) {
                $self->set_result("could not understand version requirement");
                return;
            }

            unless (($prog_major >= $rmajor)
                and ($prog_minor >= $rminor)
                and ($prog_patch >= $rpatch)) {
                $self->set_result("found flex version $prog_version"
                        . " but at least $rmajor.$rminor.$rpatch is required");
                return;
            }
        }

        $conf->data->set(prog_version => $prog_version);
        $self->set_result("flex $prog_version");
        $conf->data->set($util => $prog);
    } else {
        $self->set_result(
                'lex program does not exist or does not understand --version');
        return;
    }

    return $self;
}

1;
