#
# Parrot::Jit;
# 
# $Id$
#

package Parrot::Jit;

use base qw(Parrot::Jit::sun4Generic);

$OBJDUMP = "objdump -w -d";
$AS      = "as";

$OP_ARGUMENT_SIZE = 1;

$Call_inmediate_arg_size = 8;
$Call_address_arg_size = 8;
$Call_start = 0;
$Call_move = 0;
$Precompiled_call_position = 19;

%syscall_number = (
);

1;
