# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/auto/make.pm - make utility

=head1 DESCRIPTION

Determines whether C<make> is installed and if it's actually GNU C<make>.

=cut

package Configure::Step;

use strict;

use vars qw( $description @args $prompt $util );
use Parrot::Configure::Step qw( :inter capture_output check_progs );

$util           = 'make';
$description    = "Determining whether $util is installed";
$prompt         = "Do you have a make utility like 'gmake' or 'make'?";
@args           = qw( make ask );

sub runstep {
    my %args;
    @args{@args}=@_;

    # undef means we don't have GNU make... default to not having it
    Parrot::Configure::Data->set(gmake_version => undef);

    my $prog;
    # precedence of sources for the program:
    # default -> probe -> environment -> option -> ask
    $prog ||= $args{$util};
    $prog ||= $ENV{uc($util)};

    # never override the user.  If a non-existent program is specified then
    # the user is responsible for the consequences.
    if (defined $prog) {
        Parrot::Configure::Data->set($util => $prog);
        $Configure::Step::result = 'yes';
        return undef;
    }

    $prog = check_progs(['gmake', 'make']);

    unless ($prog) {
        # fall back to default
        $Configure::Step::result = 'no';
        return undef;
    }

    if ($args{ask}) {
        $prog = prompt($prompt, $prog ? $prog : Parrot::Configure::Data->get($util));
    }

    my ($stdout, $stderr, $ret) = capture_output($prog, '--version');

    # don't override the user even if the program they provided appears to be
    # broken
    if ($ret == -1 and ! $args{ask}) {
        # fall back to default
        $Configure::Step::result = 'no';
        return undef;
    }

    # if '--version' returns a string assume that this is gmake.
    if ($stdout =~ /GNU \s+ Make \s+ (\d+) \. (\d+)/x) {
        Parrot::Configure::Data->set(gmake_version => "$1.$2");
    }

    Parrot::Configure::Data->set($util => $prog);
    $Configure::Step::result = 'yes';
}

1;
