#!perl
# Copyright (C) 2008-2010, Parrot Foundation.

# initial work by Brad Gilbert b2gills <at> gmail <dot> com

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Config;

use Parrot::Test tests => 16;
use Parrot::Config;


=head1 NAME

t/op/sysinfo.t - System Info

=head1 SYNOPSIS

        % prove t/op/sysinfo.t

=head1 DESCRIPTION

Tests for basic system information.

=over 4

=item 1 The size of a platform integer

=item 2 The size of a platform float

=item 3 The size of a platform pointer. (Largest possible data pointer)

=item 4 The OS name

=item 5 The OS version string

=item 6 The OS version number string

=item 7 The CPU architecture

=item 8 The CPU model

=item 9, 10 The min and max INTVAL values

=back

=cut


my @setup = (
    { pconfig_key => 'intvalsize',
      pasm_key    => 1,
      pir_key     => 'SYSINFO_PARROT_INTSIZE',
      desc        => 'integer size',
      reg_type    => 'I',
    },
    { pconfig_key => 'doublesize',
      pasm_key    => 2,
      pir_key     => 'SYSINFO_PARROT_FLOATSIZE',
      desc        => 'float size',
      reg_type    => 'I',
    },
    { pconfig_key => 'ptrsize',
      pasm_key    => 3,
      pir_key     => 'SYSINFO_PARROT_POINTERSIZE',
      desc        => 'pointer size',
      reg_type    => 'I',
    },
    { pconfig_key => 'osname',
      pasm_key    => 4,
      pir_key     => 'SYSINFO_PARROT_OS',
      desc        => 'osname',
      reg_type    => 'S',
    },
    { pconfig_key => 'cpuarch',
      pasm_key    => 7,
      pir_key     => 'SYSINFO_CPU_ARCH',
      desc        => 'CPU Arch Family',
      reg_type    => 'S',
    }
);

foreach ( @setup ) {
    if ( $_->{reg_type} eq 'I' ) {
        pasm_output_is( <<"CODE", "$PConfig{$_->{pconfig_key}}$PConfig{$_->{pconfig_key}}", "PASM sysinfo  $_->{desc}" );
    .pcc_sub :main main:
    .loadlib 'sys_ops'
    sysinfo_i_ic I1, $_->{pasm_key}
    print I1
    set I3, $_->{pasm_key}
    sysinfo_i_i I2, I3
    print I2
end
CODE
        pir_output_is( <<"CODE", "$PConfig{$_->{pconfig_key}}$PConfig{$_->{pconfig_key}}", "PIR sysinfo  $_->{desc}" );
.loadlib 'sys_ops'
.include 'sysinfo.pasm'
.sub main :main
    \$I0 = sysinfo .$_->{pir_key}
    print \$I0
    \$I3 = .$_->{pir_key}
    \$I2 = sysinfo \$I3
    print \$I2
.end
CODE
    }
    else {
        pasm_output_is( <<"CODE", "$PConfig{$_->{pconfig_key}}$PConfig{$_->{pconfig_key}}", "PASM sysinfo  $_->{desc}" );
    .pcc_sub :main main:
    .loadlib 'sys_ops'
    sysinfo_s_ic S1, $_->{pasm_key}
    print S1
    set I1, $_->{pasm_key}
    sysinfo_s_i S2, I1
    print S2
end
CODE
        pir_output_is( <<"CODE", "$PConfig{$_->{pconfig_key}}$PConfig{$_->{pconfig_key}}", "PIR sysinfo  $_->{desc}" );
.loadlib 'sys_ops'
.include 'sysinfo.pasm'
.sub main :main
    \$S0 = sysinfo .$_->{pir_key}
    print \$S0
    \$I1 = .$_->{pir_key}
    \$S1 = sysinfo \$I1
    print \$S1
.end
CODE
    }
}

SKIP:
{
    $PConfig{osname} eq 'MSWin32'
        or skip "Tests only meaningful on Win32", 2;
    SKIP:
    {
        eval { require Win32; } or
            skip "requires package Win32 for these tests", 2;

        my $osname = Win32::GetOSName();
        $osname = 'WinXP' if $osname =~ m/^WinXP/;
        TODO: {
            local $TODO = "Not Currently Implemented";
            pasm_output_is( <<'CODE', "$osname$osname", "sysinfo OS version string" );
    .pcc_sub :main main:
    .loadlib 'sys_ops'
    sysinfo_s_ic S1, 5
    print S1
    set I0, 5
    sysinfo_s_i S2, 5
    print S2
end
CODE

            my ( $osvername, $major, $minor, $id ) = Win32::GetOSVersion();

            pasm_output_is( <<'CODE', "$major.$minor$major.$minor", "sysinfo OS version number string" );
    .pcc_sub :main main:
    .loadlib 'sys_ops'
    sysinfo_s_ic S1, 6
    print S1
    set I0, 6
    sysinfo_s_i S2, 6
    print S2
end
CODE
        } # END todo block
    } # END inner SKIP block
} # END outer SKIP block

TODO:
{
    local $TODO = "not currently implemented in parrot";

    pasm_output_is( <<'CODE', "$PConfig{archname}$PConfig{archname}", "sysinfo CPU Model" );
   .loadlib 'sys_ops'
   .include 'sysinfo.pasm'
   sysinfo_s_ic S1, .SYSINFO_CPU_TYPE
   print S1
   set I0, .SYSINFO_CPU_TYPE
   sysinfo_s_i S1, I0
   print S1
end
CODE
}

# 9, 10

SKIP:
{
    skip 'Testing only in some known platforms', 1
        unless $PConfig{osname} eq 'linux';

    pir_output_like( <<'CODE', '/^-[1-9][0-9]*\n[1-9][0-9]*\n-[1-9][0-9]*\n[1-9][0-9]*\n$/', 'INTVAL min and max values');
.loadlib 'sys_ops'
.include 'sysinfo.pasm'
.sub main :main
    $I0 = sysinfo .SYSINFO_PARROT_INTMIN
    say $I0
    $I0 = sysinfo .SYSINFO_PARROT_INTMAX
    say $I0
    $I1 = .SYSINFO_PARROT_INTMIN
    $I0 = sysinfo $I1
    say $I0
    $I1 = .SYSINFO_PARROT_INTMAX
    $I0 = sysinfo $I1
    say $I0
.end
CODE
}

pir_output_is(<<'CODE', <<OUTPUT, 'INTVAL min and max coherence');
.loadlib 'sys_ops'
.include 'sysinfo.pasm'
.sub 'main' :main
    # assumes 2's compliment integer math
    .include 'test_more.pir'
    .local int min, max
    max = sysinfo .SYSINFO_PARROT_INTMAX
    neg max
    min = sysinfo .SYSINFO_PARROT_INTMIN
    inc min
    is(max, min)
.end
CODE
ok 1
OUTPUT

pir_output_is(<<'CODE', <<OUTPUT, 'bad sysinfo codes');
.loadlib 'sys_ops'
.sub 'main' :main
    $I0 = sysinfo -1
    say $I0

    $I1 = sysinfo $I0
    say $I1
.end
CODE
-1
-1
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
