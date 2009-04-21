# Copyright (C) 2001-2009, Parrot Foundation.
# $Id$

=head1 NAME

config/auto/jit - JIT Capability

=head1 DESCRIPTION

Determines whether there is JIT capability available.  Use the
C<--jitcapable> and C<--execcapable> options to override the default
value calculated specifically for your CPU architecture and operating
system.

Code formerly found in this step class used to determine characteristics
of the CPU has been moved into the preceding step class, auto::arch.

=cut

package auto::jit;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);
use Parrot::Configure::Utils qw(copy_if_diff);

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Determine JIT capability};
    $data{result}      = q{};
    $data{jit_is_working} = {
        i386 => 1,
        ppc  => 1,
    };
    $data{jitbase_default} = 'src/jit';   # base path for jit sources
    # jitcpuarch_platforms:  Those which should be examined for possibility of
    # exec capability.
    $data{jitcpuarch_platforms} = { map { $_ => 1 } qw( i386 ppc arm ) };
    # execcapable_oses:  Those which should have exec capability.
    $data{execcapable_oses} = { map { $_ => 1 }
        qw( openbsd freebsd netbsd linux darwin cygwin MSWin32 )
    };
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $verbose = $conf->options->get('verbose');
    $verbose and print "\n";

    my $cpuarch     = $conf->data->get('cpuarch');
    my $osname      = $conf->data->get('osname');
    my $nvsize      = $conf->data->get('nvsize');

    my $jitbase  = $self->{jitbase_default};   # base path for jit sources

    my $corejit = "$jitbase/$cpuarch/core.jit";
    print( qq{-e $corejit = },
        -e $corejit ? 'yes' : 'no', "\n" )
        if $verbose;

    my $jitcapable =
        $self->_check_jitcapability($corejit, $cpuarch, $osname, $nvsize);

    my $jitarchname = "$cpuarch-$osname";
    _handle_asm( {
        conf        => $conf,
        jitbase     => $jitbase,
        cpuarch     => $cpuarch,
        jitarchname => $jitarchname,
    } );

    # let developers override the default JIT capability
    $jitcapable = $conf->options->get('jitcapable')
        if defined $conf->options->get('jitcapable');

    if (! $jitcapable) {
        $conf->data->set(
            jitarchname    => 'nojit',
            jitcpuarch     => $cpuarch,
            jitcpu         => $cpuarch,
            jitosname      => $osname,
            jitcapable     => 0,
            execcapable    => 0,
            cc_hasjit      => '',
            TEMP_jit_o     => '',
            TEMP_exec_h    => '',
            TEMP_exec_o    => '',
            TEMP_exec_dep  => '',
        );
        $self->set_result('no');
        return 1;
    }

    my ( $jitcpuarch, $jitosname ) = split( /-/, $jitarchname );
    $conf->data->set(
        jitarchname => $jitarchname,
        jitcpuarch  => $jitcpuarch,
        jitcpu      => uc($jitcpuarch),
        jitosname   => uc($jitosname),
        jitcapable  => 1,
        cc_hasjit   => " -DHAS_JIT -D\U$jitcpuarch",
        TEMP_jit_o =>
'$(SRC_DIR)/jit$(O) $(SRC_DIR)/jit_cpu$(O) $(SRC_DIR)/jit_debug$(O) $(SRC_DIR)/jit_debug_xcoff$(O) $(SRC_DIR)/jit_defs$(O)'
    );

    my $execcapable = $self->_first_probe_for_exec(
        $jitcpuarch, $osname);
    $execcapable = $conf->options->get('execcapable')
        if defined $conf->options->get('execcapable');
    _handle_execcapable($conf, $execcapable);

    # test for executable malloced memory
    if ( -e "config/auto/jit/test_exec_${osname}_c.in" ) {
        print " (has_exec_protect " if $verbose;
        $conf->cc_gen("config/auto/jit/test_exec_${osname}_c.in");
        eval { $conf->cc_build(); };
        if ($@) {
            print " $@) " if $verbose;
        }
        else {
            my $exec_protect_test = (
                $conf->cc_run(0) !~ /ok/ && $conf->cc_run(1) =~ /ok/
            );
            _handle_exec_protect($conf, $exec_protect_test, $verbose);
        }
        $conf->cc_clean();
    }

    # RT #43146 use executable memory for this test if needed
    #
    # test for some instructions
    if ( $jitcpuarch eq 'i386' ) {
        $conf->cc_gen('config/auto/jit/test_c.in');
        eval { $conf->cc_build(); };
        unless ( $@ || $conf->cc_run() !~ /ok/ ) {
            $conf->data->set( jit_i386 => 'fcomip' );
        }
        $conf->cc_clean();
    }
    $self->set_result('yes');
    return 1;
}

#################### INTERNAL SUBROUTINES ####################

sub _check_jitcapability {
    my $self = shift;
    my ($corejit, $cpuarch, $osname, $nvsize) = @_;
    my $jitcapable = 0;
    if ( -e $corejit ) {

        # Just because there is a "$jitbase/$cpuarch/core.jit" file,
        # doesn't mean the JIT is working on that platform.
        # So build JIT per default only on platforms where JIT in known
        # to work. Building JIT on other platform most likely breaks the build.
        # Developer can always call: Configure.pl --jitcapable
        # This was discussed in RT #43145 (which has been resolved).
        if ( $self->{jit_is_working}->{$cpuarch} ) {
            $jitcapable = 1;
        }

        # Can only jit double. For long double see patch in TT #352.
        # float not yet planned.
        if ( $nvsize != 8 ) {
            $jitcapable = 0;
        }

        # Another exception
        if ( $cpuarch eq 'i386' && $osname eq 'darwin' ) {
            $jitcapable = 0;
        }
    }
    return $jitcapable;
}

sub _handle_asm {
    my $arg = shift;
    my $sjit = "$arg->{jitbase}/$arg->{cpuarch}/$arg->{jitarchname}.s";
    my $asm = "$arg->{jitbase}/$arg->{cpuarch}/asm.s";
    if ( -e $sjit ) {
        copy_if_diff( $sjit, "src/asmfun.S" );
        $arg->{conf}->data->set( asmfun_o => 'src/asmfun$(O)' );
    }
    elsif ( -e $asm ) {
        copy_if_diff( $asm, "src/asmfun.S" );
        $arg->{conf}->data->set( asmfun_o => 'src/asmfun$(O)' );
    }
    else {
        $arg->{conf}->data->set( asmfun_o => '' );
    }
}

sub _first_probe_for_exec {
    my $self = shift;
    my ($jitcpuarch, $osname) = @_;
    my $execcapable = 0;
    if ( $self->{jitcpuarch_platforms}->{$jitcpuarch} ) {
        $execcapable = 1;
        unless ( $self->{execcapable_oses}->{$osname} ) {
            $execcapable = 0;
        }
    }
    return $execcapable;
}

sub _handle_execcapable {
    my ($conf, $execcapable) = @_;
    if ($execcapable) {
        my $cpuarch = $conf->data->get('cpuarch');
        $conf->data->set(
            TEMP_exec_h =>
'$(SRC_DIR)/jit.h $(INC_DIR)/exec.h $(SRC_DIR)/exec_dep.h $(SRC_DIR)/exec_save.h',
            TEMP_exec_o =>
                '$(SRC_DIR)/exec$(O) $(SRC_DIR)/exec_cpu$(O) $(SRC_DIR)/exec_dep$(O) $(SRC_DIR)/exec_save$(O)',
            TEMP_exec_dep =>
                "\$(SRC_DIR)/exec_dep.c : \$(SRC_DIR)/jit/$cpuarch/exec_dep.c\n"
                . "\t\$(CP) \$(SRC_DIR)/jit/$cpuarch/exec_dep.c \$(SRC_DIR)/exec_dep.c",
            execcapable => 1
        );
    }
    else {
        $conf->data->set(
            TEMP_exec_h   => '',
            TEMP_exec_o   => '',
            TEMP_exec_dep => '',
            execcapable   => 0,
        );
    }
    return 1;
}

sub _handle_exec_protect {
    my ($conf, $exec_protect_test, $verbose) = @_;
    if ($exec_protect_test) {
        $conf->data->set( has_exec_protect => 1 );
        print "yes) " if $verbose;
    }
    else {
        print "no) " if $verbose;
    }
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
