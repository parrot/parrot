#
# Parrot::Jit;
# 
# $Id$
#

package Parrot::Jit;

use base qw(Parrot::Jit::alphaGeneric);

$OP_ARGUMENT_SIZE = 2;

$Call_inmediate_arg_size = 4;
$Call_address_arg_size = 4;
$Call_start = 24;
$Call_move = 0;
$Precompiled_call_position = 40;

%syscall_number = (
    "WRITE"         => 4,
    "GETTIMEOFDAY"  => 116
);

1;
