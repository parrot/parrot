# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/init/miniparrot.pl - Miniparrot configuration

=head1 DESCRIPTION

Modifies settings to match miniparrot (ANSI C Parrot)'s needs.  This step primarily 
overwrites a lot of settings in the Configure database to disable JIT and match ANSI 
characteristics.

Centralizing these settings will (hopefully) allow for an eventual move away from using 
Configure at all for miniparrot builds.

=cut

package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step;

$description="Tweaking settings for miniparrot...";

@args=qw(miniparrot);

sub runstep {
    return unless $_[0];

    Configure::Data->set(
        miniparrot         => 1,
        DEVEL              => Configure::Data->get('DEVEL').'-miniparrot',
        TEMP_cg_h          => '',
        TEMP_cg_c          => '',
        TEMP_cg_o          => '',
        TEMP_cg_r          => '',
        cg_flag            => '',
        archname           => 'miniparrot',
        cpuarch            => 'unknown',
        osname             => 'ANSI',
        jitarchname        => 'nojit',
        jitcpuarch         => 'i386',
        jitcpu             => 'I386',
        jitosname          => 'nojit',
        jitcapable         => 0,
        execcapable        => 0,
        cc_hasjit          => '',
        TEMP_jit_h         => '',
        TEMP_jit_o         => '',
        TEMP_exec_h        => '',
        TEMP_exec_o        => '',
        asmfun_o           => '',
        has___sighandler_t => undef,
        has_sigatomic_t    => undef,
        has_sigaction      => undef,
        has_setitimer      => undef,
        # we can't guarantee anything about pointer alignment under ANSI C89.
        # so we will have to check every byte.
        ptr_alignment      => 1
    );
    
    #Allow ANSI headers only
    foreach (qw(assert complex ctype errno locale math setjmp signal stdarg
                stdio stdlib string time)) {
        Configure::Data->set("i_$_" => 1);
    }
}

1;
