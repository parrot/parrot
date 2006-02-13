# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/auto/yacc.pm - parser generator

=head1 DESCRIPTION

Determines whether C<yacc> is installed and if it's actually C<bison>.

=cut

package inter::yacc;

use strict;

use vars qw( $description $result @args $prompt $util );

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step qw( :inter capture_output check_progs );

$util        = 'yacc';
$description = "Determining whether $util is installed";
$prompt      = "Do you have a parser generator, like bison or yacc?";
@args        = qw( yacc ask maintainer );

sub runstep
{
    my ($self, $conf) = @_;
    
    my $verbose = $conf->options->get('verbose');

    # undef means we don't have bison... default to not having bison
    $conf->data->set(bison_version => undef);

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

    $prog = check_progs(['bison -v -y', 'yacc', 'byacc'], $verbose);

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

    # if '--version' returns a string assume that this is bison.
    # if this is bison pretending to be yacc '--version' doesn't work
    if ($stdout =~ /Bison .*? (\d+) \. (\d+) (\w)? /x) {
        $conf->data->set(bison_version => $3 ? "$1.$2$3" : "$1.$2");
    }

    $conf->data->set($util => $prog);
    $self->set_result('yes');

    return $self;
}

1;
