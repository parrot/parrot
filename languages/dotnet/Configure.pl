# $Id$

# #############################################################################
# .NET CLI To PIR Translator
# Copyright (C) 2005-2007, Jonathan Worthington
# $Id$
# #############################################################################
# Configure Script
# ################
# This file detects various configuration settings and generates various files
# that will be used in the build process.
# #############################################################################

# pragmata
use strict;
use warnings;
use lib '../../lib';    # probably fails when parrot_path is passed in

# core Perl 5 modules
use Getopt::Long;

# Parrot specific Perl 5 modules
use Parrot::Config;

# Parse command line.
my ( $parrot_path, $mono_lib_path, $srm );
GetOptions(
    'parrot=s'  => \$parrot_path,
    'srm=s'     => \$srm,
    'monolib=s' => \$mono_lib_path
);

# Get Parrot configuration.
$parrot_path ||= '../..';
$parrot_path =~ s|/|\\|g if $^O =~ /win32/i;

$srm ||= 'OptRegister';
die "No such SRM module!\n" unless -e "build/SRM/$srm.pm";

my %config = get_parrot_config( $parrot_path, $srm );

# Generate makefile.
generate_makefile(\%config);

# Generate Config.pm.
generate_config_pm(\%config);

# ########################
# Get Parrot Configuration
# ########################
sub get_parrot_config {
    my ( $parrot_path, $srm ) = @_;

    # Try to include config information from Parrot tree.
    my %config = %Parrot::Config::PConfig
        or die "Unable to locate Parrot::Config.\n";

    # Return configuration.
    return ( %config, trans_parrot_path => $parrot_path, srm => $srm );
}

# ######################
# Generate the makefile.
# ######################
sub generate_makefile {
    my ( $config ) = @_;

    # Generate class library make instructions.
    my $class_lib_make = generate_classlib_make($mono_lib_path);

    # Read in makefile template.
    open my $in_fh, '<', 'config/Makefile.in'
        or die "Unable to open config/Makefile.in\n";
    my $makefile = join( '', <$in_fh> );
    close $in_fh;

    # Sub in config data.
    for ( keys %{$config} ) {
        # warnings flags aren't substituted in Makefile.in; skip them
        next if m/^-W/g;

        $makefile =~ s/\${$_}/$config->{$_}/g;
    }
    $makefile =~ s/\$\{build_dir\}/$parrot_path/g;

    my $local_mono_lib_path = $mono_lib_path || q{};
    $makefile =~ s/\$\{trans_mono_lib_path\}/$local_mono_lib_path/g;

    $makefile =~ s/\$\{trans_class_library\}/$class_lib_make/g;

    # Write makefile.
    open my $out_fh, '>', 'Makefile' or die "Unable to open Makefile\n";
    print $out_fh $makefile;
    close $out_fh;

    return;
}

# ###################
# Generate Config.pm.
# ###################
sub generate_config_pm {
    my ( $config ) = @_;

    # Read in template.
    open my $in_fh, '<', 'config/N2PConfig_pm.in'
        or die "Unable to open config/N2PConfig_pm.in\n";
    my $config_pm = join( '', <$in_fh> );
    close $in_fh;

    # Sub in config data.
    for ( keys %{$config} ) {
        # warnings flags aren't substituted in config/N2PConfig_pm.in; skip them
        next if m/^-W/g;
        $config_pm =~ s/\${$_}/$config->{$_}/g;
    }

    # Write.
    open my $out_fh, '>', 'config/N2PConfig.pm'
        or die "Unable to open config/N2PConfig.pm\n";
    print $out_fh $config_pm;
    close $out_fh;

    return;
}

# ##########################################################
# Generate makefile instructions to translate class library.
# ##########################################################
sub generate_classlib_make {
    my ( $mono_class_lib ) = @_;

    if ( ! $mono_class_lib) {
        # Just say that we weren't configured with mono path, so no can do.
        return "\techo Oops, I was not configured with the path to Mono class library.\n";
    }

    # Generate code to translate each library.
    my @libs = qw/
        mscorlib
        System
        Accessibility
        I18N.CJK
        I18N.MidEast
        I18N.Other
        I18N.Rare
        I18N.West
        I18N
        ICSharpCode.SharpZipLib
        Microsoft.JScript
        Microsoft.VisualBasic
        Microsoft.VisualC
        Microsoft.Vsa
        Mono.CompilerServices.SymbolWriter
        Mono.Data.SqliteClient
        Mono.Data.SybaseClient
        Mono.Data.Tds
        Mono.Data.TdsClient
        Mono.Data
        Mono.GetOptions
        Mono.Http
        Mono.Posix
        Mono.Security.Win32
        Mono.Security
        System.Data
        System.Design
        System.DirectoryServices
        System.Drawing.Design
        System.Drawing
        System.EnterpriseServices
        System.Management
        System.Messaging
        System.Runtime.Remoting
        System.Runtime.Serialization.Formatters.Soap
        System.Security
        System.ServiceProcess
        System.Web.Services
        System.Web
        System.Xml
        /;

    #             System.Windows.Forms ### XXX Removed - bugz0r
    my $code = q{};
    foreach (@libs) {
        $code .= "\t\$(PARROT) -G net2pbc.pbc -f -p \"$mono_class_lib/$_.dll\" > $_.pir\n";
        $code .= "\t\$(PARROT) -o $_.pbc $_.pir\n";
        $code .= "\t\$(RM_F) $_.pir\n";
    }

    return $code;
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
