#
# OpTrans.pm
#
# $Id$
#

use strict;
#use warnings;

package Parrot::OpTrans;

sub new    { return bless { }, shift; }
sub prefix { return 'Parrot_'; }
sub suffix { return ''; }
# The type for the array of opcodes. Usually it's an array opcode_t, but the
# prederef runops core uses an array of void* to do its clever tricks.
sub opsarraytype { return 'opcode_t' };
1;

