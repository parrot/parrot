# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/auto/make.pm - make utility

=head1 DESCRIPTION

Determines whether C<make> is installed and if it's actually GNU C<make>.

=cut

package inter::make;

use strict;

use vars qw( $description $result @args $prompt $util );

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step qw( :inter capture_output check_progs );

$util           = 'make';
$description    = "Determining whether $util is installed";
$prompt         = "Do you have a make utility like 'gmake' or 'make'?";
@args           = qw( make ask );

sub runstep {
    my ($self, $conf) = @_;

    # undef means we don't have GNU make... default to not having it
    $conf->data->set(gmake_version => undef);

    my $prog;
    # precedence of sources for the program:
    # default -> probe -> environment -> option -> ask
    $prog ||= $conf->options->get($util);
    $prog ||= $ENV{uc($util)};

    # never override the user.  If a non-existent program is specified then
    # the user is responsible for the consequences.
    if (defined $prog) {
        $conf->data->set($util => $prog);
        $result = 'yes';
    } else {
        $prog = check_progs(['gmake', 'mingw32-make', 'nmake', 'make']);

        unless ($prog) {
            # fall back to default
            $result = 'no';
            return undef;
        }
    }
    
    if ($conf->options->get('ask')) {
        $prog = prompt($prompt, $prog ? $prog : $conf->data->get($util));
    }

    my ($stdout, $stderr, $ret) = capture_output($prog, '--version');

    # don't override the user even if the program they provided appears to be
    # broken
    if ($ret == -1 and ! $conf->options->get('ask')) {
        # fall back to default
        $result = 'no';
        return undef;
    }

    # if '--version' returns a string assume that this is gmake.
    if ($stdout =~ /GNU \s+ Make \s+ (\d+) \. (\d+)/x) {
        $conf->data->set(gmake_version => "$1.$2");
    }

    $conf->data->set($util => $prog);
    $result = 'yes';

    # setup make_C
    if ($conf->data->get('gmake_version')) {
        $conf->data->set(make_c => "$prog -C" );
    } else {
        # get the default value
        my $make_c = $conf->data->get('make_c');

        # FIXME this is an ugly hack
        # replace the value for $(MAKE) with the actual path or we'll end up
        # with a variable that recursively refers to itself
        $make_c =~ s/\$\(MAKE\)/$prog/;
        
        $conf->data->set(make_c => $make_c);
    }
}

1;
