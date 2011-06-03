# Copyright (C) 2005-2009, Parrot Foundation.

package init::hints::darwin;

use strict;
use warnings;

use lib qw( lib );
use File::Spec ();
use base qw(Parrot::Configure::Step);
use Parrot::BuildUtil;

our %defaults = (
    uname           => `uname -r`,
    sw_vers         => `sw_vers -productVersion`,
    problem_flags   => [ qw( ccflags ldflags ) ],
    architectures   => [ qw( i386 ppc64 ppc x86_64 ) ],
    fink_conf       => q{/sw/etc/fink.conf},
    ports_base_dir  => q{/opt/local},
);

sub runstep {
    my ( $self, $conf ) = @_;

    my $share_ext = $conf->option_or_data('share_ext');
    my $version   = $conf->option_or_data('VERSION');

    # The hash referenced by $flagsref is the list of options that have -arch
    # flags added to them implicitly through config/init/defaults.pm when
    # using Apple's Perl 5.8 build to run Configure.pl (it's a
    # multi-architecture build).  This doesn't play nice with getting parrot
    # to build on PPC systems and causes all sorts of fun issues with lipo and
    # friends.  So, it's time to remove all -arch flags set in $conf->data and
    # force a single, native architecture to being the default build.

    my $flagsref = _strip_arch_flags($conf);

    # And now, after possibly losing a few undesired compiler and linker
    # flags, on to the main Darwin config.

    my $libs = _strip_ldl_as_needed( $conf->data->get( 'libs' ) );

    my $deploy_target = _set_deployment_environment();

    my $lib_dir = $conf->data->get('build_dir') . "/blib/lib";
    $flagsref->{ldflags} .= ' -L"' . $lib_dir . '"';

    if ($deploy_target =~ /^10\.(5|6|7)$/) {
        $flagsref->{ccflags} .= ' -pipe -fno-common ';
    }
    else {
        $flagsref->{ccflags} .= ' -pipe -fno-common -Wno-long-double ';
    }

    $flagsref->{linkflags} .= " -undefined dynamic_lookup";

    _probe_for_libraries($conf, $flagsref, 'fink');
    _probe_for_libraries($conf, $flagsref, 'macports');

    for my $flag ( keys %$flagsref ) {
        $flagsref->{$flag} =~ s/^\s+//;
    }

    my $osvers = `/usr/sbin/sysctl -n kern.osrelease`;
    chomp $osvers;

    $conf->data->set(
        darwin              => 1,
        osx_version         => $deploy_target,
        osvers              => $osvers,
        ccflags             => $flagsref->{ccflags},
        ldflags             => $flagsref->{ldflags},
        ccwarn              => "-Wno-shadow",
        libs                => $libs,
        share_ext           => '.dylib',
        load_ext            => '.bundle',
        link                => 'c++',
        linkflags           => $flagsref->{linkflags},
        ld                  => 'c++',
        ld_share_flags      => '-dynamiclib -undefined dynamic_lookup',
        ld_load_flags       => '-undefined dynamic_lookup -bundle',
        memalign            => 'some_memalign',
        has_dynamic_linking => 1,

        # TT #344:  When built against a dynamic libparrot,
        # installable_parrot records the path to the blib version
        # of the library.

        parrot_is_shared       => 1,
        libparrot_shared       => "libparrot.$version$share_ext",
        libparrot_shared_alias => "libparrot$share_ext",
        rpath                  => "-L",
        libparrot_soname       => "-install_name "
            . '"'
            . $conf->data->get('libdir')
            . '/libparrot'
            . $conf->data->get('share_ext')
            . '"'
    );
}

#################### INTERNAL SUBROUTINES ####################

sub _precheck {
    my ($conf, $flag, $stored) = @_;
    $conf->debug(
        "Checking $flag...\n",
        "Pre-check: " . ($stored || '(nil)') . "\n",
    );
}

sub _strip_arch_flags_engine {
    my ($arches, $stored, $flagsref, $flag) = @_;
    for my $arch ( @{ $arches } ) {
        $stored =~ s/-arch\s+$arch//g;
        $stored =~ s/\s+/ /g;
        $flagsref->{$flag} = $stored;
    }
    return $flagsref;
}

sub _postcheck {
    my ($conf, $flagsref, $flag) = @_;
    my $f = $flagsref->{$flag} || '(nil)';
    $conf->debug("Post-check: $f\n");
}

sub _strip_arch_flags {
    my ($conf) = @_;
    my $flagsref  = { map { $_ => '' } @{ $defaults{problem_flags} } };

    $conf->debug("\nStripping -arch flags due to Apple multi-architecture build problems:\n");
    for my $flag ( keys %{ $flagsref } ) {
        my $stored = $conf->data->get($flag) || '';

        _precheck($conf, $flag, $stored);

        $flagsref = _strip_arch_flags_engine(
            $defaults{architectures}, $stored, $flagsref, $flag
        );

        _postcheck($conf, $flagsref, $flag);
    }
    return $flagsref;
}

sub _strip_ldl_as_needed {
    my $libs = shift;
    my $OSVers = $defaults{uname};
    chomp $OSVers;
    {
        local $^W;
        $OSVers =~ /(\d+)/;
        if ( $1 >= 7 ) {
            $libs =~ s/-ldl//;
        }
    }
    return $libs;
}

sub _set_deployment_environment {
    unless (defined $ENV{'MACOSX_DEPLOYMENT_TARGET'}) {
        my $OSX_vers = $defaults{sw_vers};
        chomp $OSX_vers;
        # remove minor version
        $OSX_vers =join '.', (split /[.]/, $OSX_vers)[0,1];
        $ENV{'MACOSX_DEPLOYMENT_TARGET'} = $OSX_vers;
    }
    return $ENV{'MACOSX_DEPLOYMENT_TARGET'};
}

sub _probe_for_fink {
    my $conf = shift;
    # Per fink(8), this is location for Fink configuration file, presumably
    # regardless of where Fink itself is installed.
    my $fink_conf    = $defaults{fink_conf};
    unless (-f $fink_conf) {
        $conf->debug("Fink configuration file not located\n");
        return;
    }
    my $fink_conf_str = Parrot::BuildUtil::slurp_file($fink_conf);
    my @lines = split /\n/, $fink_conf_str;
    my $fink_base_dir;
    while (defined (my $l = shift @lines) ) {
        chomp $l;
        next unless $l =~ /^Basepath:\s(.*)/;
        $fink_base_dir = $1;
        last;
    }
    unless (defined $fink_base_dir) {
        $conf->debug("Fink configuration file defective:  no 'Basepath'\n");
        return;
    }
    my $fink_lib_dir = qq{$fink_base_dir/lib};
    my $fink_include_dir = qq{$fink_base_dir/include};
    my @unlocateables;
    foreach my $dir ($fink_base_dir, $fink_lib_dir, $fink_include_dir) {
        push @unlocateables, $dir unless (-d $dir);
    }
    if (@unlocateables) {
        $conf->debug("Could not locate Fink directories:  @unlocateables\n");
        return;
    }
    else {
        my %addl_flags = (
            linkflags => "-L$fink_lib_dir",
            ldflags   => "-L$fink_lib_dir",
            ccflags   => "-I$fink_include_dir",
        );
        return \%addl_flags;
    }
}

sub _probe_for_macports {
    my $conf = shift;
    my $ports_base_dir = $defaults{ports_base_dir};
    my $ports_lib_dir = qq{$ports_base_dir/lib};
    my $ports_include_dir = qq{$ports_base_dir/include};
    my @unlocateables;
    foreach my $dir ($ports_base_dir, $ports_lib_dir, $ports_include_dir) {
        push @unlocateables, $dir unless (-d $dir);
    }
    if (@unlocateables) {
        $conf->debug("Could not locate Macports directories:  @unlocateables\n");
        return;
    }
    else {
        my %addl_flags = (
            linkflags => "-L$ports_lib_dir",
            ldflags   => "-L$ports_lib_dir",
            ccflags   => "-I$ports_include_dir",
        );
        return \%addl_flags;
    }
}

sub _probe_for_libraries {
    my ($conf, $flagsref, $library) = @_;
    my $no_library_option = "darwin_no_$library";
    my $title = ucfirst(lc($library));
    unless ($conf->options->get( $no_library_option ) ) {
        my $addl_flags_ref;
        if ($library eq 'fink') {
            $addl_flags_ref = _probe_for_fink($conf);
        }
        if ($library eq 'macports') {
            $addl_flags_ref = _probe_for_macports($conf);
        }
        my $rv = _add_to_flags( $conf, $addl_flags_ref, $flagsref, $title );
        return $rv;
    }
    return;
}

sub _add_to_flags {
    my ( $conf, $addl_flags_ref, $flagsref, $title ) = @_;
    if ( defined $addl_flags_ref ) {
        foreach my $addl ( keys %{ $addl_flags_ref } ) {
            my %seen;
            if ( defined $flagsref->{$addl} ) {
                my @elements = split /\s+/, $flagsref->{$addl};
                %seen = map {$_, 1} @elements;
            }
            $flagsref->{$addl} .= " $addl_flags_ref->{$addl}"
                unless $seen{ $addl_flags_ref->{$addl} };
        }
        $conf->debug("Probe for $title successful\n");
    }
    else {
        $conf->debug("Probe for $title unsuccessful\n");
    }
    return 1;
}

1;

################### DOCUMENTATION ###################

=head1 NAME

init::hints::Darwin - hints for the Darwin compiler

=head1 DESCRIPTION

The functionality in this package is run automatically during configuration
step F<init::hints> when run on Darwin.

Among other things, this step probes for Fink and Macports libraries --
functionality previously provided by configuration steps F<auto::fink> and
F<auto::macports>, which have now been eliminated.

Should you not want to search for either of these packages, you may specify
the command-line options C<darwin_no_fink> and/or C<darwin_no_macports>.

The functionality is tested in F<t/steps/init/hints/darwin-01.t>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
