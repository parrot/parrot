# Copyright (C) 2001-2006, Parrot Foundation.

=head1 NAME

config/auto/icu.pm - Detect International Components for Unicode (ICU)

=head1 DESCRIPTION

Determines whether ICU is available.  If so, configures ICU and adds
appropriate targets to the Makefile.

From the ICU home page (L<http://www.icu-project.org/>):  "ICU is a mature,
widely used set of C/C++ and Java libraries providing Unicode and
Globalization support for software applications."

=cut

package auto::icu;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Cwd qw(cwd);
use File::Basename;
use lib qw( lib );
use Parrot::Configure::Utils qw(capture_output);


sub _init {
    my $self = shift;
    my %data;
    $data{description}          = q{Is ICU installed};
    $data{result}               = q{};
    # The following key-value pairs are defined here rather than being buried
    # deep inside subroutines below.  Also, so that they can be overridden
    # during testing.
    $data{icuconfig_default}    = q{icu-config};
    $data{icu_headers}          = [ qw(ucnv.h utypes.h uchar.h) ];
    $data{icu_shared_pattern}   = qr/-licui18n\w*/;
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my ( $icushared_opt, $icuheaders_opt,
        $icuconfig_opt, $without_opt ) = $conf->options->get( qw|
            icushared
            icuheaders
            icu-config
            without-icu
    | );

    # If we haven't provided the path to a specific ICU configuration program
    # on the command line, then we probe to see if the program 'icu-config' is
    # available.

    # From the icu-config(1) man page
    # (L<http://linux.die.net/man/1/icu-config>):

    # "icu-config simplifies the task of building and linking
    # against ICU as compared to manually configuring user
    # makefiles or equivalent. Because icu-config is an executable
    # script, it also solves the problem of locating the ICU
    # libraries and headers, by allowing the system PATH to locate
    # it."

    # $icuconfig is a string holding the name of an executable program.
    # So if it's not provided on the command line -- or if it's explicitly
    # ruled out by being provided with the value 'none' -- an empty string
    # is its most appropriate value.

    my $icuconfig = $self->_handle_icuconfig_opt($icuconfig_opt);

    # Oooh, how I wish we had Perl 5.10's defined-or operator available!
    my $icushared = (defined $icushared_opt)
        ? $icushared_opt
        : undef;
    my $icuheaders = (defined $icuheaders_opt)
        ? $icuheaders_opt
        : undef;

    # $without_opt holds user's command-line value for --without-icu=?
    # If it's a true value, there's no point in going further.  We set the
    # values needed in the Parrot::Configure object, set the step result and
    # return.  If, however, it's a false value, then we're going to try to
    # configure with ICU and we proceed to probe for ICU.

    # 1st possible return point
    if ( $without_opt ) {
        $self->_set_no_configure_with_icu($conf, q{not requested});
        return 1;
    }

    my $autodetect  =   ( ! defined($icushared)  )
                            &&
                        ( ! defined($icuheaders) );

    my $without = 0;
    ($icuconfig, $autodetect, $without) = $self->_handle_autodetect(
        $conf,
        {
            icuconfig   => $icuconfig,
            autodetect  => $autodetect,
            without     => $without,
        }
    );
    # Inside _handle_autodetect(), $without can be set to 1 by
    # _handle_search_for_icu_config().  In that case, we're abandoning our
    # attempt to configure with ICU and so may return here.
    # 2nd possible return point
    if ( $without ) {
        $self->_set_no_configure_with_icu($conf, q{no icu-config});
        $conf->debug("Could not locate an icu-config program\n");
        return 1;
    }

    ($without, $icushared, $icuheaders) =
        $self->_try_icuconfig(
            $conf,
            {
                without         => $without,
                autodetect      => $autodetect,
                icuconfig       => $icuconfig,
                icushared       => $icushared,
                icuheaders      => $icuheaders,
            },
        );
    # 3rd possible return point
    if ( $without ) {
        $self->_set_no_configure_with_icu($conf, q{not found});
        return 1;
    }

    _verbose_report($conf, $icuconfig, $icushared, $icuheaders);

    $icuheaders = $self->_handle_icuconfig_errors( {
        icushared   => $icushared,
        icuheaders  => $icuheaders,
    } );
    # 4th possible return point.  This one is a step configuration failure
    # because we would have really expected it to succeed.
    return unless defined $icuheaders;

    my $icudir = dirname($icuheaders);
    $conf->data->set(
        has_icu    => 1,
        icu_shared => $icushared,
        icu_dir    => $icudir,
    );

    # Add -I $Icuheaders if necessary.
    my $header = "unicode/ucnv.h";
    $conf->data->set( TEMP_testheaders => "#include <$header>\n" );
    $conf->data->set( TEMP_testheader  => "$header" );
    $conf->cc_gen('config/auto/headers/test_c.in');

    # Clean up.
    $conf->data->set( TEMP_testheaders => undef );
    $conf->data->set( TEMP_testheader  => undef );
    eval { $conf->cc_build(); };
    my $ccflags_status = ( ! $@ && $conf->cc_run() =~ /^$header OK/ );
    _handle_ccflags_status(
        $conf,
        {
            ccflags_status  => $ccflags_status,
            icuheaders      => $icuheaders,
        },
    );
    $conf->cc_clean();
    $self->set_result("yes");
    # 5th possible return point; this is the only really successful return.
    return 1;
}

########## INTERNAL SUBROUTINES ##########

sub _set_no_configure_with_icu {
    my ($self, $conf, $result) = @_;
    $conf->data->set(
        has_icu    => 0,
        icu_shared => '',    # used for generating src/dynpmc/Makefile
        icu_dir    => '',
    );
    $self->set_result($result);
}

sub _handle_icuconfig_opt {
    my ($self, $icuconfig_opt) = @_;
    my $icuconfig;
    if ( ( ! $icuconfig_opt ) or ( $icuconfig_opt eq q{none} ) ) {
        $icuconfig = q{};
    }
    elsif ( $icuconfig_opt eq '1' ) {
        $icuconfig = $self->{icuconfig_default};
    }
    else {
        $icuconfig = $icuconfig_opt;
    }
    return $icuconfig;
}

sub _die_message {
    my $die = <<"HELP";
Something is wrong with your ICU installation!

   If you do not have a full ICU installation:

   --without-icu        Build parrot without ICU support
   --icu-config=(file)  Location of icu-config
   --icuheaders=(path)  Location of ICU headers without /unicode
   --icushared=(flags)  Full linker command to create shared libraries
HELP
#/
    return $die;
}

sub _handle_search_for_icu_config {
    my ($self, $conf, $arg) = @_;
    if ( $arg->{ret} ) {
        undef $arg->{icuconfig};
        $arg->{autodetect} = 0;
        $arg->{without}    = 1;
    }
    else {
        $arg->{icuconfig} = $self->{icuconfig_default};
        $conf->debug("icu-config found... good!\n");
    }
    return ( $arg->{icuconfig}, $arg->{autodetect}, $arg->{without} );
}

sub _handle_autodetect {
    my ($self, $conf, $arg) = @_;
    if ( $arg->{autodetect} ) {
        if ( ! $arg->{icuconfig} ) {

            my ( undef, undef, $ret ) =
                capture_output( $self->{icuconfig_default}, "--exists" );

            $conf->debug("Discovered $self->{icuconfig_default} --exists returns $ret\n");

            ($arg->{icuconfig}, $arg->{autodetect}, $arg->{without}) =
                $self->_handle_search_for_icu_config(
                    $conf,
                    {
                        icuconfig   => $arg->{icuconfig},
                        autodetect  => $arg->{autodetect},
                        without     => $arg->{without},
                        ret         => $ret,
                    }
                );
        }
    } # end $autodetect true
    else {
        $conf->debug(
            "Specified an ICU config parameter,\n",
            "ICU autodetection disabled.\n",
        );
    } # end $autodetect false
    return ( $arg->{icuconfig}, $arg->{autodetect}, $arg->{without} );
}

sub _try_icuconfig {
    my $self = shift;
    my $conf = shift;
    my $arg = shift;
    my $icushared = ( defined $arg->{icushared} )
        ? $arg->{icushared}
        : undef;
    my $icuheaders = ( defined $arg->{icuheaders} )
        ? $arg->{icuheaders}
        : undef;
    if (
        ( ! $arg->{without} )  &&
        $arg->{autodetect}    &&
        $arg->{icuconfig}
    ) {
        # ldflags
        $conf->debug("Trying $arg->{icuconfig} with '--ldflags'\n");
        $icushared = capture_output("$arg->{icuconfig} --ldflags");
        chomp $icushared;
        $conf->debug("icushared:  captured $icushared\n");
        ($icushared, $arg->{without}) =
            $self->_handle_icushared($icushared, $arg->{without});
        $conf->debug("For icushared, found $icushared and $arg->{without}\n");

        # location of header files
        $conf->debug("Trying $arg->{icuconfig} with '--prefix'\n");
        $icuheaders = capture_output("$arg->{icuconfig} --prefix");
        chomp($icuheaders);
        $conf->debug("icuheaders:  captured $icuheaders\n");
        ($icuheaders, $arg->{without}) =
            $self->_handle_icuheaders($conf, $icuheaders, $arg->{without});
        $conf->debug("For icuheaders, found $icuheaders and $arg->{without}\n");
    }

    return ($arg->{without}, $icushared, $icuheaders);
}

sub _handle_icushared {
    my $self = shift;
    my ($icushared, $without) = @_;
    if ( defined $icushared ) {
        chomp $icushared;
        $icushared =~ s/$self->{icu_shared_pattern}//;    # "-licui18n32" too
        if (length $icushared == 0) {
            $without = 1;
        }
        else {
            # on MacOS X there's sometimes an errornous \c at the end of the
            # output line. Remove it.
            # see TT #1722
            $icushared =~ s/\s\\c\s?/ /g;
        }
    }

    return ($icushared, $without);
}

sub _handle_icuheaders {
    my $self = shift;
    my ($conf, $icuheaders, $without) = @_;
    if ( defined $icuheaders ) {
        chomp $icuheaders;
        if (! -d $icuheaders) {
            $without = 1;
        }
        $icuheaders .= "/include";
        if (! -d $icuheaders) {
            $without = 1;
        }
    }
    return ($icuheaders, $without);
}

sub _verbose_report {
    my ($conf, $icuconfig, $icushared, $icuheaders) = @_;
    if ($conf->options->get('verbose')) {
        print "icuconfig: $icuconfig\n"  if defined $icuconfig;
        print "icushared='$icushared'\n" if defined $icushared;
        print "headers='$icuheaders'\n"  if defined $icuheaders;
    }
}

sub _handle_icuconfig_errors {
    my $self = shift;
    my $arg = shift;
    my $icuconfig_errors = 0;

    if ( ! defined $arg->{icushared} ) {
        warn "error: icushared not defined\n";
        $icuconfig_errors++;
    }

    if ( ! ( defined $arg->{icuheaders} and -d $arg->{icuheaders} ) ) {
        warn "error: icuheaders not defined or invalid\n";
        $icuconfig_errors++;
    }
    else {
        $arg->{icuheaders} =~ s![\\/]$!!;
        foreach my $header ( @{ $self->{icu_headers} } ) {
            $header = "$arg->{icuheaders}/unicode/$header";
            if  ( ! -e $header ) {
                $icuconfig_errors++;
                warn "error: ICU header '$header' not found\n";
            }
        }
    }

    if ($icuconfig_errors) {
        warn _die_message();
        return;
    }
    else {
        return $arg->{icuheaders};
    }
}

sub _handle_ccflags_status {
    my $conf = shift;
    my $arg = shift;
    if ($arg->{ccflags_status}) {
        # Ok, we don't need anything more.
        $conf->debug("Your compiler found the icu headers... good!\n");
    }
    else {
        my $icuheaders = $arg->{icuheaders};

        my $icuflags;
        if ($icuheaders =~ /\s/) {
            $icuflags = "-I \"$arg->{icuheaders}\"";
        }
        else {
            $icuflags = "-I $arg->{icuheaders}";
        }

        $conf->debug( "Adding $icuflags to ccflags for icu headers.\n");
        $conf->data->add( ' ', ccflags => $icuflags );
    }
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
