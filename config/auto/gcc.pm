# Copyright (C) 2001-2015, Parrot Foundation.

=head1 NAME

config/auto/gcc.pm - GNU C Compiler

=head1 DESCRIPTION

Determines whether the C compiler is actually C<gcc>.

=cut

package auto::gcc;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':auto';


sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Is your C compiler actually gcc};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;
    my $gnucref = _probe_for_gcc($conf);
    my $rv = $self->_evaluate_gcc($conf, $gnucref);
    return $rv;
}

sub _probe_for_gcc {
    my $conf = shift;
    $conf->cc_gen("config/auto/gcc/test_c.in");
    $conf->cc_build();
    my %gnuc = eval $conf->cc_run() or die "Can't run the test program: $!";
    $conf->cc_clean();
    return \%gnuc;
}

sub _evaluate_gcc {
    my ($self, $conf, $gnucref) = @_;

    # Set empty noonline and gccversion to undef.
    # This will also trigger any hints-file callbacks that depend on
    # knowing whether or not we're using gcc.
    $conf->data->set( noinline => '' );

    # This key should always exist unless the program couldn't be run,
    # which should have been caught by the 'die' above.
    unless ( exists $gnucref->{__GNUC__} ) {
        $conf->data->set( gccversion => undef );
        return 1;
    }

    my $major = $gnucref->{__GNUC__};
    my $minor = $gnucref->{__GNUC_MINOR__};
    my $intel = $gnucref->{__INTEL_COMPILER};

    if ( defined $intel || !defined $major ) {
        $conf->debug(" (no) ");
        $self->set_result('no');
        $conf->data->set( gccversion => undef );
        return 1;
    }
    if ( $major =~ tr/0-9//c ) {
        undef $major;    # Don't use it
    }
    if ( defined $minor and $minor =~ tr/0-9//c ) {
        undef $minor;    # Don't use it
    }
    if ( ! defined $major ) {
        $conf->debug(" (no) ");
        $self->set_result('no');
        $conf->data->set( gccversion => undef );
        return 1;
    }
    my $gccversion = $major;
    $gccversion .= ".$minor" if defined $minor;
    $self->set_result("yes, $gccversion");

    # necessary platform adjustments
    my $m = $conf->options->get('m');
    if ($m) {
        my $archname = $conf->data->get('archname');
        my $has_libpath_override;
        # other multilib platforms usually default to 32bit.
        # untested: sparc64, arm64
        if ( $archname =~ /^(amd|mips|powerpc|arm|sparc)64/ && $m eq '32' ) {
            my $abi = $1 eq 'mips' ? '-mabi=32' : '-m32';
            $archname =~ s/64// unless $archname =~ /amd64/;
            for my $cc (qw(cc cxx link ld)) {
                $conf->data->add( ' ', $cc, $abi );
            }
            # and lib flags: lib64 => lib
            for my $lib (qw(ld_load_flags ld_share_flags ldflags linkflags
                            libdir embed-ldflags inst_libparrot_linkflags rpath_lib)) {
                my $item = $conf->data->get($lib);
                # TODO: if lib32 exists use that
                if ($item) {
                    my $olditem = $item;
                    $item =~ s/lib64/lib/g;
                    if ($olditem ne $item and !$conf->options->get($lib)) {
                        $conf->data->set( $lib, $item );
                        $conf->debug( "Set has_libpath_override to lib64, changing $lib to $item" );
                        $has_libpath_override++;
                    }
                }
            }
            $conf->data->set( 'has_libpath_override', 'lib64' ) if $has_libpath_override;
        }
        # GH #1181: override the default, ignore the inherited libpaths.
        elsif ( $archname =~ /^(i386|mips|powerpc|arm|sparc)/ && $m eq '64' ) {
            my $abi = $1 eq 'mips' ? '-mabi=64' : '-m64';
            # 'mips' or 'powerpc-linux-gnu-thread-multi'
            $archname =~ s/(mips|powerpc|arm|sparc)([^6]|$)/${1}64${2}/;
            for my $cc (qw(cc cxx link ld)) {
                $conf->data->add( ' ', $cc, $abi );
            }
            # and lib flags: lib or libx32 or lib32 => lib64
            for my $lib (qw(ld_load_flags ld_share_flags ldflags linkflags
                            libdir embed-ldflags inst_libparrot_linkflags rpath_lib)) {
                my $item = $conf->data->get($lib);
                if ($item) {
                    my $olditem = $item;
                    $item =~ s/\/lib([^6]|$)/\/lib64${1}/g;
                    if ($olditem ne $item and !$conf->options->get($lib)) {
                        $conf->data->set( $lib, $item );
                        $conf->debug( "Set has_libpath_override to lib, changing $lib to $item" );
                        $has_libpath_override++;
                    }
                }
            }
            $conf->data->set( 'has_libpath_override', 'lib' ) if $has_libpath_override;
        }
        $conf->data->set( 'archname', $archname );
        $gnucref = _probe_for_gcc($conf);
    }

    $conf->data->set( sym_export => '__attribute__ ((visibility("default")))' )
        if $gccversion >= 4.0 && !$conf->data->get('sym_export');
    $conf->data->set( noinline => '__attribute__ ((noinline))' );

    # sneaky check for g++
    my $cc = $conf->data->get('cc');
    my $gpp = (index($cc, '++') > 0) ? 1 : 0;

    # even sneakier check for clang
    my $clang = $conf->data->get('cc') =~ /clang/ ? 1 : 0;

    # and set -x c++ for clang++
    if ($clang and $gpp and index($cc, '-x c++') < 1) {
        $conf->data->set('cc' => $cc.' -x c++');
    }

    $conf->data->set(
        gccversion => $gccversion,
        'g++'      => $gpp,
        clang      => $clang
    );
    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
