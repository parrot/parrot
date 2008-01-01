# Copyright (C) 2001-2007, The Perl Foundation.
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

use Parrot::Configure::Step qw(copy_if_diff);

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Determining architecture, OS and JIT capability};
    $data{args}        = [ qw( jitcapable miniparrot execcapable verbose ) ];
    $data{result}      = q{};
    $data{jit_is_working} = {
        i386 => 1,
        ppc  => 1,
    };
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    if ( $conf->options->get('miniparrot') ) {
        $self->set_result('skipped');
        return 1;
    }

    my $verbose = $conf->options->get('verbose');
    $verbose and print "\n";

    my $cpuarch     = $conf->data->get('cpuarch');
    my $osname      = $conf->data->get('osname');

    my $jitbase  = 'src/jit';   # base path for jit sources

    my $corejit = "$jitbase/$cpuarch/core.jit";
    print( qq{-e $corejit = },
        -e $corejit ? 'yes' : 'no', "\n" )
        if $verbose;

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

        # Another exception
        if ( $cpuarch eq 'i386' && $osname eq 'darwin' ) {
            $jitcapable = 0;
        }
    }

    my $jitarchname = "$cpuarch-$osname";
    my $sjit = "$jitbase/$cpuarch/$jitarchname.s";
    my $asm = "$jitbase/$cpuarch/asm.s";
    if ( -e $sjit ) {
        copy_if_diff( $sjit, "src/asmfun.s" );
        $conf->data->set( asmfun_o => 'src/asmfun$(O)' );
    }
    elsif ( -e $asm ) {
        copy_if_diff( $asm, "src/asmfun.s" );
        $conf->data->set( asmfun_o => 'src/asmfun$(O)' );
    }
    else {
        $conf->data->set( asmfun_o => '' );
    }

    # let developers override the default JIT capability
    $jitcapable = $conf->options->get('jitcapable')
        if defined $conf->options->get('jitcapable');

    if ($jitcapable) {
        my ( $jitcpuarch, $jitosname ) = split( /-/, $jitarchname );

        $conf->data->set(
            jitarchname => $jitarchname,
            jitcpuarch  => $jitcpuarch,
            jitcpu      => uc($jitcpuarch),
            jitosname   => uc($jitosname),
            jitcapable  => 1,
            cc_hasjit   => " -DHAS_JIT -D\U$jitcpuarch",
            TEMP_jit_o =>
'$(SRC_DIR)/jit$(O) $(SRC_DIR)/jit_cpu$(O) $(SRC_DIR)/jit_debug$(O) $(SRC_DIR)/jit_debug_xcoff$(O)'
        );

        my $execcapable = 0;
        if (   ( $jitcpuarch eq 'i386' )
            || ( $jitcpuarch eq 'ppc' )
            || ( $jitcpuarch eq 'arm' ) )
        {
            $execcapable = 1;
            unless ( ( $osname eq 'openbsd' )
                || ( $osname eq 'freebsd' )
                || ( $osname eq 'netbsd' )
                || ( $osname eq 'linux' )
                || ( $osname eq 'darwin' )
                || ( $osname eq 'MSWin32' ) )
            {
                $execcapable = 0;
            }
        }
        $execcapable = $conf->options->get('execcapable')
            if defined $conf->options->get('execcapable');
        _handle_execcapable($conf, $execcapable);

        # test for executable malloced memory
        if ( -e "config/auto/jit/test_exec_$osname.in" ) {
            print " (has_exec_protect " if $verbose;
            $conf->cc_gen("config/auto/jit/test_exec_$osname.in");
            eval { $conf->cc_build(); };
            if ($@) {
                print " $@) " if $verbose;
            }
            else {
                if ( $conf->cc_run(0) !~ /ok/ && $conf->cc_run(1) =~ /ok/ ) {
                    $conf->data->set( has_exec_protect => 1 );
                    print "yes) " if $verbose;
                }
                else {
                    print "no) " if $verbose;
                }
            }
            $conf->cc_clean();
        }

        # RT#43146 use executable memory for this test if needed
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
    }
    else {
        $conf->data->set(
            jitarchname => 'nojit',
            jitcpuarch  => $cpuarch,
            jitcpu      => $cpuarch,
            jitosname   => $osname,
            jitcapable  => 0,
            execcapable => 0,
            cc_hasjit   => '',
            TEMP_jit_o  => '',
            TEMP_exec_h => '',
            TEMP_exec_o => ''
        );
    }

    return 1;
}

sub _handle_execcapable {
    my ($conf, $execcapable) = @_;
    if ($execcapable) {
        $conf->data->set(
            TEMP_exec_h =>
'$(SRC_DIR)/jit.h $(INC_DIR)/exec.h $(SRC_DIR)/exec_dep.h $(SRC_DIR)/exec_save.h',
            TEMP_exec_o =>
                '$(SRC_DIR)/exec$(O) $(SRC_DIR)/exec_cpu$(O) $(SRC_DIR)/exec_save$(O)',
            execcapable => 1
        );
    }
    else {
        $conf->data->set(
            TEMP_exec_h => '',
            TEMP_exec_o => '',
            execcapable => 0
        );
    }
    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
