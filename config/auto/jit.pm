# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$

=head1 NAME

config/auto/jit - JIT Capability

=head1 DESCRIPTION

Determines the CPU architecture, the operating system, and whether there is JIT
capability available.

=cut

package auto::jit;

use strict;
use warnings;

use base qw(Parrot::Configure::Step::Base);

use Config;
use Parrot::Configure::Step qw(copy_if_diff cc_gen cc_clean cc_build cc_run);

our $description = 'Determining architecture, OS and JIT capability';
our @args        = qw(jitcapable miniparrot execcapable verbose);

sub runstep
{
    my ($self, $conf) = @_;

    if ($conf->options->get('miniparrot')) {
        $self->set_result('skipped');
        return $self;
    }

    my $verbose = $conf->options->get('verbose');

    my $jitbase  = "src/jit";        # base path for jit sources
    my $archname = $Config{archname};
    my ($cpuarch, $osname) = split(/-/, $archname);

    if (!defined $osname) {
        ($osname, $cpuarch) = ($cpuarch, q{});
    }

    # This was added to convert 9000/800 to 9000_800 on HP-UX
    $cpuarch =~ s|/|_|g;

    # On OS X if you are using the Perl that shipped with the system
    # the above split fails because archname is "darwin-thread-multi-2level".
    if ($cpuarch =~ /darwin/) {
        $osname  = 'darwin';
        if ($conf->data->get('byteorder') == 1234) {
            $cpuarch = 'i386';
        } else {
            $cpuarch = 'ppc';
        }
    } elsif ($cpuarch =~ /MSWin32/) {
        $cpuarch = 'i386';
        $osname  = 'MSWin32';
    } elsif ($osname =~ /cygwin/i || $cpuarch =~ /cygwin/i) {
        $cpuarch = 'i386';
        $osname  = 'cygwin';
    }

    if ($archname =~ m/powerpc/) {
        $cpuarch = 'ppc';
    }

    $cpuarch =~ s/armv[34]l?/arm/i;
    $cpuarch =~ s/i[456]86/i386/i;

    $conf->data->set(
        archname => $archname,
        cpuarch  => $cpuarch,
        osname   => $osname
    );

    my $jitarchname = "$cpuarch-$osname";
    my ($jitcapable, $execcapable) = (0, 0);

    print(qq{-e "$jitbase/$cpuarch/core.jit" = }, -e "$jitbase/$cpuarch/core.jit" ? 'yes' : 'no', "\n")
        if $verbose;

    # XXX disable all but i386, ppc
    my %working_jit = (
	i386 => 1,
	ppc => 1,	
	# all others are seriously b0rked
    );

    if (-e "$jitbase/$cpuarch/core.jit" && $working_jit{$cpuarch}) {
        $jitcapable = 1;
    }

    if (-e "$jitbase/$cpuarch/$jitarchname.s") {
        copy_if_diff("$jitbase/$cpuarch/$jitarchname.s", "src/asmfun.s");
        $conf->data->set(asmfun_o => 'src/asmfun$(O)');
    } elsif (-e "$jitbase/$cpuarch/asm.s") {
        copy_if_diff("$jitbase/$cpuarch/asm.s", "src/asmfun.s");
        $conf->data->set(asmfun_o => 'src/asmfun$(O)');
    } else {
        $conf->data->set(asmfun_o => '');
    }

    $jitcapable = $conf->options->get('jitcapable')
        if defined $conf->options->get('jitcapable');

    if ($jitcapable) {
        my ($jitcpuarch, $jitosname) = split(/-/, $jitarchname);

        $conf->data->set(
            jitarchname => $jitarchname,
            jitcpuarch  => $jitcpuarch,
            jitcpu      => uc($jitcpuarch),
            jitosname   => uc($jitosname),
            jitcapable  => 1,
            cc_hasjit   => " -DHAS_JIT -D\U$jitcpuarch",
            TEMP_jit_h  => '$(INC_DIR)/jit.h',
            TEMP_jit_o  =>
                '$(SRC_DIR)/jit$(O) $(SRC_DIR)/jit_cpu$(O) $(SRC_DIR)/jit_debug$(O) $(SRC_DIR)/jit_debug_xcoff$(O)'
        );

        if (   ($jitcpuarch eq 'i386')
            || ($jitcpuarch eq 'ppc')
            || ($jitcpuarch eq 'arm')) {
            $execcapable = 1;
            unless (($osname eq 'openbsd')
                || ($osname eq 'freebsd')
                || ($osname eq 'netbsd')
                || ($osname eq 'linux')
                || ($osname eq 'darwin')
                || ($osname eq 'MSWin32')) {
                $execcapable = 0;
            }
        }
        $execcapable = $conf->options->get('execcapable')
            if defined $conf->options->get('execcapable');
        if ($execcapable) {
            $conf->data->set(
                TEMP_exec_h =>
                    '$(INC_DIR)/jit.h $(INC_DIR)/exec.h $(SRC_DIR)/exec_dep.h $(SRC_DIR)/exec_save.h',
                TEMP_exec_o =>
                    '$(SRC_DIR)/exec$(O) $(SRC_DIR)/exec_cpu$(O) $(SRC_DIR)/exec_save$(O)',
                execcapable => 1
            );
        } else {
            $conf->data->set(
                TEMP_exec_h => '',
                TEMP_exec_o => '',
                execcapable => 0
            );
        }

        # test for executable malloced memory
        if (-e "config/auto/jit/test_exec_$osname.in") {
            print " (has_exec_protect " if $verbose;
            cc_gen("config/auto/jit/test_exec_$osname.in");
            eval { cc_build(); };
            if ($@) {
                print " $@) " if $verbose;
            } else {
                if (cc_run(0) !~ /ok/ && cc_run(1) =~ /ok/) {
                    $conf->data->set(has_exec_protect => 1);
                    print "yes) " if $verbose;
                } else {
                    print "no) " if $verbose;
                }
            }
            cc_clean();
        }

        # TODO use executable memory for this test if needed
        #
        # test for some instructions
        if ($jitcpuarch eq 'i386') {
            cc_gen('config/auto/jit/test_c.in');
            eval { cc_build(); };
            unless ($@ || cc_run() !~ /ok/) {
                $conf->data->set(jit_i386 => 'fcomip');
            }
            cc_clean();
        }
    } else {
        $conf->data->set(
            jitarchname => 'nojit',
            jitcpuarch  => $cpuarch,
            jitcpu      => $cpuarch,
            jitosname   => $osname,
            jitcapable  => 0,
            execcapable => 0,
            cc_hasjit   => '',
            TEMP_jit_h  => '',
            TEMP_jit_o  => '',
            TEMP_exec_h => '',
            TEMP_exec_o => ''
        );
    }

    return $self;
}

1;
