#!perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

# initial work by Brad Gilbert b2gills <at> gmail <dot> com

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 8;
use Parrot::Config;

use Config;

=head1 NAME

t/op/sys_ops.t - System Ops

=head1 SYNOPSIS

        % prove t/op/sys_ops.t

=head1 DESCRIPTION

Tests basic string and branching operations.

=over 4

=item 1 The size of a platform integer

=item 2 The size of a platform float

=item 3 The size of a platform pointer. (Largest possible data pointer)

=item 4 The OS name

=item 5 The OS version string

=item 6 The OS version number string

=item 7 The CPU architecture

=item 8 The CPU model

=back

=cut



pasm_output_is( <<'CODE', $PConfig{intsize}, "sysinfo integer size" );
		sysinfo_i_ic I1, 1
		print I1
		end
CODE

# XXX is 'doublesize' the right thing to use?
pasm_output_is( <<'CODE', $PConfig{doublesize}, "sysinfo float size" );
		sysinfo_i_ic I1, 2
		print I1
		end
CODE

pasm_output_is( <<'CODE', $PConfig{ptrsize}, "sysinfo pointer size" );
		sysinfo_i_ic I1, 3
		print I1
		end
CODE

pasm_output_is( <<'CODE', $PConfig{osname}, "sysinfo osname" );
		sysinfo_s_ic S1, 4
        print S1
        end
CODE

# 5
if( $PConfig{osname} eq 'MSWin32' ){
	eval{ require Win32; };
	SKIP: {
		skip "requires package Win32 for these tests", 2;
		
		# specifically don't use $Config{osvers}
		# because it probably was the system perl was compiled on
		# and we can do much better than that
		
		my $osname = Win32::GetOSName();
		$osname = 'WinXP' if $osname =~ m/^WinXP/;
		TODO: {
			local $TODO = "Not Currently Implemented";
pasm_output_is( <<'CODE', $osname, "sysinfo OS version string" );
		sysinfo_s_ic S1, 5
		print S1
		end
CODE
		
		my($osvername,$major,$minor,$id) = Win32::GetOSVersion();

pasm_output_is( <<'CODE', "$major.$minor", "sysinfo OS version number string" );
		sysinfo_s_ic S1, 6
		print S1
		end
CODE
		}
	}

}else{

# XXX I know this is wrong on Win32 but is it correct on any others?
# XXX also should it be %Config or %PConfig
TODO: {
	local $TODO = "Not Currently Implemented";
	
pasm_output_is( <<'CODE', $Config{osvers}, "sysinfo OS version string" );
		sysinfo_s_ic S1, 5
		print S1
		end
CODE

pasm_output_is( <<'CODE', $Config{osvers}, "sysinfo OS version number string" );
		sysinfo_s_ic S1, 6
		print S1
		end
CODE
	}

}

# Common

TODO: {
	local $TODO = "Not Currently Implemented";
	
pasm_output_is( <<'CODE', $PConfig{cpuarch}, "sysinfo CPU Arch Family" );
		sysinfo_s_ic S1, 7
		print S1
		end
CODE
}

SKIP: {
	skip "Requires a lot of work to find out the correct answer", 1;
	
pasm_output_is( <<'CODE', $PConfig{archname}, "sysinfo CPU Model" );
		sysinfo_s_ic S1, 8
		print S1
		end
CODE
}

