#
# Parrot::Jit;
#
# $Id$
#

package Parrot::Jit;

use base qw(Parrot::Jit::i386Generic);

$OBJDUMP = "objdump -w -d";
$AS      = "as";

$OP_ARGUMENT_SIZE = 4;

$Call_inmediate_arg_size = 5;
$Call_address_arg_size = 6;
$Call_start = 1;
$Call_move = 0;
$Precompiled_call_position = 11;

my %syscall_number = (
    "WRITE"         => 4,
    "GETTIMEOFDAY"  => 116
);

sub system_call($$$) {
    my ($class,$arg_c,$arg_v,$sys_n) = @_;

    my ($t,$sc,$k,$j);

    for($k = 0; $k < $arg_c; $k++) {
        $arg_v =~ s/([VA])([\&\*][a-zA-Z_]+\[\d+\])\s*$//; 
        $t = $1;
        $j = $2;
        if ($t eq 'V') {
            $sc .= 'pushl L';
        } else {
            $sc .= 'pushl ';
        }
        $sc .= $j . "\n";
    }

    $sc .= "push \%eax\nmov \$" . $syscall_number{$sys_n} . ",\%eax\n";
    $sc .= "int \$0x80\njb 0\n";

    return $sc;
}

1;
