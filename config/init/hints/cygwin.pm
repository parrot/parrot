# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

package init::hints::cygwin;

use strict;

sub runstep
{
    my ($self, $conf) = @_;

    # cygwin's perl is compiled with -lutil, which for some reason is not
    # in the standard installation, so we get rid of it
    my $libs = $conf->data->get('libs');
    $libs =~ s/-lutil\b//g;

    # A note about building shared libraries:  Perl5 uses the 'ld2' tool, which
    # is installed as part of the perl5 installation.  So far, it appears
    # parrot can get by with simply using gcc -shared, so we override the
    # perl5 Configure defaults and use 'gcc -shared' instead of 'ld2'.
    # If this later causes problems, it might be worth revisiting.
    # A. Dougherty 9/9/2002
    $conf->data->set(
        ld                  => 'gcc',
        ld_share_flags      => '-shared',
        ld_load_flags       => '-shared',
        libs                => $libs,
        has_dynamic_linking => 1,
        parrot_is_shared    => 1
    );

    # We need to define inet_aton on Cygwin.  The contents of the --define
    # switch are in $_[2].  XXX EVIL EVIL EVIL HACK.  If you need to do this
    # elsewhere, please do everyone a favor and write a proper interface for
    # modifying the command-line args, or even better do something to make the
    # define interface not suck.
    # XXX CLI options shouldn't be being modified like this  
    my $define = $conf->options->get('define');
    unless ($define) {
        $define = 'inet_aton';
    } elsif ($define !~ /inet_[ap]ton/) {
        $define = join(',', 'inet_aton', $define);
    }
    $conf->options->set(define => $define);
}

1;
